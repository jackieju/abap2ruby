require "json"
load 'goto.rb'
load 'sym.rb'
load 'scanner.rb'
load 'crr_parser.rb'
load 'error.rb'
load 'log.rb'
load 'common.rb'
load 'cocoR/o/cparser.rb'
def convertName(s)
#    if @sym == C_# s.gsub("!", "").gsub("->", ".").gsub("-", "_1_").gsub("~", "_2_")
    if s.start_with?("/")
        s = s[1..s.size-1]
    end
    s = s.gsub("!", "").gsub("->", ".").gsub("-", ".").gsub("~", "_i_").gsub("/", "::")
end

def fixName(s)
    s = s.gsub(/[<>\(\)]/, "")
end
    
def hash_to_params(hash)
    ar = []
    hash.each{|k,v|
         if v != nil
             if v.is_a?(Array)
                 v = "[#{v.join(",")}]"
             end
             ar.push("#{k}:#{v}")
         end
    }
    #return "{"+ar.join(",\n")+"}"
    return ar.join(", ")
end
def strInQuote(s)
    s[1..s.size-2]
end
def pdebug(s, stack=0)
    depth = 0
    sp = ""
    begin
        raise Exception.new
    rescue Exception=>e
        e.backtrace.each{|b|
            if b =~ /in `C'/
                # p "====got botoom====total #{e.backtrace.size}"
                break
            else
                depth += 1
                sp += "-+"
            end
        }
        
    end
    
    m = "{#{sp}#{depth}}#{s}"
    if stack>0
        m = format_msg(m, "", stack)
    end
    
    debug(m)
    
end


# when translate multiple file, will share one class tree
$g_classdefs = {} if $g_classdefs == nil
$g_root_moddef = ModuleDef.new("::")
$g_classdefs["::"] = $g_root_moddef

if $ar_classdefs
    $ar_classdefs.each{|cls|
        $g_root_moddef.add_class(cls)
    }
    p "===>$ar_classdefs:#{$ar_classdefs.inspect}"
end

p "===>$pre_classlist:#{$pre_classlist.inspect}"

# $g_classlist is just for type check
$g_classlist = {} if !$g_classlist

allclasses = read_file("allclasses")
if allclasses
allclasses.each_line{|line|
    cls = line.strip
    if cls != ""
        $g_classlist[cls] =1
    end
}
end

# stack for parsing
# every function for unterminator will have on _in() and out()
class ParseStack
    attr_accessor :cur
    def initialize()
        _in
        @last_pop_v = "" # last popuped value
    end
    
    def _in
        @last_unterminator_src = nil        
        n = {:src=>[], :parent=>@cur, :auto_append=>true, :stack=>[], :no_space=>false, :no_comments=>false}
        if @cur
           n[:no_comments] = @cur[:no_comments]
        end
        @cur = n
    end
    
    def out
        
        r = @cur
        @cur = @cur[:parent]
        @last_pop_v  = r[:src]
        @last_unterminator_src = r[:src]
        if @cur[:auto_append]
             @cur[:src].concat(@last_pop_v)
        end

        return r
    end
    
    def lus
        if @last_unterminator_src
           return @last_unterminator_src.join(" ")
        end
        return ""
    end

    # pop stack value
    def popv
        r = @last_pop_v 
        @last_pop_v  = ""
        return r
    end

end

class Parser < CParser
    attr_accessor :classdefs, :parse_stack, :sym
    def initialize(scanner, error, classdefs={})
        
   
        super(scanner, error)
        #@addClassForUnregcognizedName = false
        #@included_files = {}
        
        @macros = {}
        @classdefs = $g_classdefs
        @root_class = $g_root_moddef
        
        @output_src = ""
        @parse_stack = ParseStack.new
        
        
        p "init end"
        pclass
    end
    # skip comments, because sometimes comment will break ruby syntax
    # e.g. if a = true # comment
    #         &&
    # here && must be in the above line and before the comments, which is to complicated
    def no_comments(nc = true)
        @parse_stack.cur[:no_comments] = nc
    end
    
    # for auto source generating
    # tell parser not to insert space between token
    def no_space(ns=true)
       @parse_stack.cur[:no_space] = ns
    end
    # stack_pos is the pos of trace stack, for the function name you want to print
    # set it to 0 will show "trc" as function name
    def trc(stack_pos=1) 
        fn = ""
        begin
            raise Exception.new
        rescue Exception=>e
            e.backtrace[stack_pos].scan(/in `(.*?)'/){|m|
            fn = m[0]
        }
        end
        pdebug("===>#{fn}:#{@sym}(#{SYMS[@sym]}), #{curString()}")
    end
    def trco(stack_pos=1) 
        fn = ""
        begin
            raise Exception.new
        rescue Exception=>e
            e.backtrace[stack_pos].scan(/in `(.*?)'/){|m|
            fn = m[0]
        }
        end
        pdebug("<===#{fn}0:#{@sym}(#{SYMS[@sym]}), #{curString()}, src=#{@parse_stack.cur[:src].inspect}")
    end
    def _in_()
        trc(2)
        @parse_stack._in
        pre()
    end
    def _out_()
        trco(2)
        r = @parse_stack.out
        return r[:src]
    end
    def lus
        @parse_stack.lus
    end
    def Get(ignore_crlf=true)

        if @parse_stack.cur[:auto_append]          
            if @sym == C_PointSym
                @parse_stack.cur[:src].push("\n")
            elsif @sym != 0.6 
                @parse_stack.cur[:src].push(curString())
                @parse_stack.cur[:stack].push({:sym=>@sym, :val=>curString()})
            end
        end
        
        super
        
        if @sym == 0.6 # comment
            if @parse_stack.cur[:auto_append]
              #  p "cmt:#{curString()}", 10
                 @parse_stack.cur[:src].push("#"+curString()+"\n") if @parse_stack.cur[:no_comments]  == false
                 Get(ignore_crlf)
             end
         end

    end
    # if stop auto append source, you cannot use method like back(), re() to manipulate the source generating processs
    def stop_autosrc
        @parse_stack.cur[:auto_append] = false
    end
    
    def start_autosrc
        @parse_stack.cur[:auto_append] = true
    end
    
    def src(r=nil)
        if r
            @parse_stack.cur[:src] = [r]
        end
        
        if @parse_stack.cur[:no_space]
            return @parse_stack.cur[:src].join()
        end
    
        return  @parse_stack.cur[:src].join(" ")
    end
    
    def add_src(r)
        @parse_stack.cur[:src].push(r)
    end
    
    # remove last token content from src content
    def back_src()
       # p "33322222#{@parse_stack.cur[:src]}"
     #   p "33322222#{prevString()}"
      #  print "33322222#{@parse_stack.cur.to_json}"
      #  str = @parse_stack.cur[:stack].pop()[:val]
        #str = prevString()
        #i = @parse_stack.cur[:src].rindex(str)
        #if i <= 0 
        #    @parse_stack.cur[:src] = ""
        #else
        #     @parse_stack.cur[:src] =  @parse_stack.cur[:src][0..i-1]
        #end
        while @parse_stack.cur[:src].pop == "\n"
        end
        return  @parse_stack.cur[:src] 
    end
    
    # replace last element of src
    def replace_src(*s)
        s.each{|str|
            back_src
        }
        s.each{|str|
            add_src(str)
        }
       
        
    end
    
    alias_method "re", "replace_src"
    alias_method "back", "back_src"
    def popv
        @parse_stack.popv
    end
    
    # prepare
    def pre()
        @parse_stack.cur[:params] = {}
        @parse_stack.cur[:keyword] = curString()
    end
    
    ## current keyword
    #def ck()
    #    @parse_stack.cur[:keyword]
    #end
    ## current params
    def cp
        parse_stack.cur[:params]
    end
    # current params
    def make
     #   params = @parse_stack.cur[:params]
        fn = @parse_stack.cur[:keyword].downcase.gsub("-", "_")
        src("#{fn}(#{hash_to_params(cp)})\n")
    end
    
    def add_method(classdef, fname, head, args, source, deco)
        before = <<HERE
        ###################################
        # setup importing parameter
        _i.each{|k,v| eval("\#{k} = \#{v}")} if _i
        ###################################
        
        
HERE
        after = <<HERE
        
        
        
        
        ###################################
        # setup exporting 
        _exp = {}
        _e.each{|k,v| eval("_exp['\#{v}'] = \#{k}")} if _e
        
        return {:exp=>_exp}
        ###################################

HERE
         _src = "#{before}\n#{src}\n#{after}"       
        classdef.add_method(fname, head, args, _src ,deco)
    end
    
    
    def curString() # current string means value of nextsym
        r = super
        r = convertName(r) if @sym == C_identifierSym
        return r
    end
    def prevString() # previous string means value of currsym
        r = super
        r = convertName(r) if @scanner.currSym.sym == C_identifierSym
        return r
    end
    
    #############################
    #                           #
    #    copy/override start    #
    #                           #
    #############################
    
    #/* Because 'END' can be identifier(so LL(1) cannot parse it), so this rule has to be single rule and modifier it in subclass
    def TypeOfStuct()
       _in_()
       while (@sym==C_TYPESSym)
          Get()
          Expect(C_identifierSym)
          p ("===>333:#{prevString()}, #{curString()}, #{SYMS[GetNextSym(1).sym]}")
          if prevString() == "END" && @sym == C_OFSym
              p "===>1"
              break
          end
          if @sym==C_LparenSym
             Get()
             Expect(C_numberSym)
             Expect(C_RparenSym)
          end

          if @sym==C_identifierSym||@sym==C_STANDARDSym||@sym==C_LINESym||@sym==C_OFSym||@sym==C_SORTEDSym||@sym==C_FORSym||@sym==C_TYPESym||@sym==C_LOCATORSym||@sym>=C_REFSym&&@sym<=C_HASHEDSym||@sym>=C_RANGESym&&@sym<=C_WRITERSym||@sym==C_ALLSym
             TypeDes()
          else
             if @sym==C_LIKESym
                LikeDes()
             else
                GenError(975)
             end

          end

          if @sym==C_BOXEDSym
             Get()
          end

          Expect(C_PointSym)
       end
       p "===>2"

       while (@sym==C_INCLUDESym)
          stINCLUDE()
       end

      # Expect(C_TYPESSym)
      # Expect(C_ENDSym)
       Expect(C_OFSym)
       Expect(C_identifierSym)
       _out_()
    end
   #def C()
   #   Expect(C_REPORTSym)
   #   fn_name = curString()
   #   Expect(C_identifierSym)
   #   Expect(C_PointSym)
   #   s = ""
   #   while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_doSym||@sym==C_LparenSym||@sym>=C_forSym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
   #      s += Statements()
   #   end
   #   
   #   Expect(EOF_Sym)
   #   
   #   @root_class.add_method(fn_name, "()", [], s, "")
   #end
    
  
    def stMODIFY()
       _in_()
       no_comments
       Expect(C_MODIFYSym)
       while (@sym != C_PointSym && @sym != EOF_Sym )
           Get()
       end
       no_comments(false)
         src("abap(\"#{src()}\")")
       _out_()
   end
   
   def stSELECT()
      _in_()
      no_comments
      
      Expect(C_SELECTSym)
      while (@sym != C_PointSym && @sym != EOF_Sym)
          Get()
      end
      no_comments(false)
      
        src("abap(\"#{src()}\")")
      p "src1:#(src())"
     s =  _out_()
     p "src2:#{s}"
     p "src3:#{src()}"
  end
  def stUPDATE()
     _in_()
     no_comments
     
     Expect(C_UPDATETSym)
     while (@sym != C_PointSym && @sym != EOF_Sym)
         Get()
     end
     no_comments(false)
     
       src("abap(\"#{src()}\")")
     _out_()
  end
  def stINSERT()
     _in_()
     no_comments
     
     Expect(C_INSERTSym)
     while (@sym != C_PointSym && @sym != EOF_Sym)
         Get()
     end
     no_comments(false)
     
     src("abap(\"#{src()}\")")
     
     _out_()
     
  end
  def stDELETE()
     _in_()
     no_comments
     
     Expect(C_DELETESym)
     while (@sym != C_PointSym && @sym != EOF_Sym)
         Get()
     end
     no_comments(false)
     
     src("abap(\"#{src()}\")")
     
     _out_()
     
  end
  
  
    #### copy/override end ####

end  # class Parser

load "cocoR/o/cparser.rb"

load 'cptest.rb'
