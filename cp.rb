require "json"
load 'goto.rb'
load 'sym.rb'
load 'scanner.rb'
load 'crr_parser.rb'
load 'error.rb'
load 'log.rb'
load 'common.rb'
load 'cocoR/o/cparser.rb'

# overwrite for abap, which doesn't have overloading
class ModuleDef < Scope
def method_signature(method_name, arg_number)
    if IGNORECASE
        method_name = method_name.downcase
    end
    p "--->3333method_signature:#{method_name}"
    return "#{method_name}"
end
# alias_method :add_method_old, :add_method
# def add_method(method_name, head, args, src, acc="public", others=nil)
#     add_method_old(method_name.downcase, head, args, src, acc="public", others)
# end
end
$included_files = {}
def load_file(fname)
    p "load_file:#{fname}"
    fname = fname.upcase+".abap"
    # make sure include only once
    if ($included_files[fname] == 1)
        
    else
        dir = File.dirname($g_cur_parse_file)
        
        begin
            p "load file:#{dir+"/"+fname}", 30
            $included_files[fname] = 1
            parse_file(dir+"/"+fname, $preprocessor, false)
            
        rescue Exception=>e
            p "load file failed. #{dir+"/"+fname}, #{pe(e, 100)}", 20
            log_to_file("load file failed. #{dir+"/"+fname}, #{pe(e, 20)}", "missed_files")
        end
    end
end
    

def procName(name)
    ar = name.split(".")
    tail = ""
    tail = "."+ar[1..ar.size-1].join(".") if ar.size>1
    v = find_var(ar[0])
   p "find:#{name}:#{v.inspect}", 10
   if v
      name  = v.newname+tail
 
   end
   return name
end


def convertName(s)
#    if @sym == C_# s.gsub("!", "").gsub("->", ".").gsub("-", "_1_").gsub("~", "_2_")
    if s.start_with?("/")
        s = s[1..s.size-1]
    end
    s = s.gsub("!", "").gsub("->", ".")
    #s = s.gsub(/-(\w+)/){|m|
    #    "::#{to_ruby_const($1)}"
    #} 
    s = s.gsub("-", ".")
    s = s.gsub("~", "_i_").gsub("/", "::")
    s = s.gsub(/<(.*?)>/, '\1')
end

# remove enclosing <> and ()
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
    s= s.strip()
    return s[1..s.size-2]
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
    attr_accessor :cur, :last_unterminator_src
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
        
        @included_files = {}
        
        p "init end"
        pclass
    end
    
    def instant_parse(s)
        p "instant_parse:#{s}"
        s += " "
        _scanner = Scanner.new(s)
        # backup 
        sc = @scanner
        sy = @sym
        _ps = @parse_stack
        
        # parse
        @scanner = _scanner
        @parse_stack = ParseStack.new
        Get()
        Expression()
        str = lus
        
        # restore
        @scanner = sc
        @sym = sy
         @parse_stack = _ps
        return str
    end
    def convert_regex(s)
          p "===>convert_regex:#{s}"
        s = s.sub("|", "/")
        s = s.sub(/.*\K\|/, "/")
        p "===>convert_regex2:#{s}"
        s.gsub!(/\$\{(.*?)\}/) {|m| 
            p m.class
            str = nil
            m.scan(/\$\{(.*?)\}/){|m2|
                p m2[0]
               str = instant_parse( m2[0])
                
            }
           
            p "==>2:#{str}"
            str = m if !str
            "\#{#{str}}"
         }
         p "===>regex:#{s}"
         return s
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
        @parse_stack.cur[:pos] = @scanner.nextSym.pos
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
    def lut
        @parse_stack.last_unterminator_src
    end
    def origin_src
        @scanner.buffer[@parse_stack.cur[:pos]..@scanner.nextSym.pos-1]
    end
    
    def parse_abap_method_signature(cmt)
        cmt.scan(/<SIGNATURE>(.*?)<\/SIGNATURE>/mi){|m|
            p m.inspect
            method_name = nil
            exporting = []
            importing = []
            
            dec = ""
            
            m[0].each_line{|l|
                if l.start_with?("* |")
                    def_val = ""
                    p "line:#{l}"
                    if method_name == nil && l.downcase.index("method")
                        l.scan(/Method\s+(.*?)$/i){|mm|
                            p mm.inspect
                            method_name = mm[0].strip
                            p "method name:#{method_name}"
                        }
                    end
                    l.scan(/\(\s*default\s*=(.*?)\s*\)/){|m2|
                        s = m2[0]
                        def_val = "="+instant_parse(m2[0]) if m2[0] && m2[0].strip != ""
                    }
                    l.scan(/\[(.*?)\]\s+(\w+)/){|mmm|
                        p "arg name:#{mmm[1]}, #{mmm[0]}"
                        n = mmm[1].strip.downcase
                        if mmm[0].end_with?("-->")
                            importing.push(n+def_val)
                        elsif mmm[0].start_with?("<--")
                            exporting.push(n+def_val)
                        end
                    }
                end
            }
            if current_scope.is_a?(ModuleDef)
                classdef = current_scope
                
                args = nil
                if importing.size > 0
                     args = importing.clone
                    for i in 0..importing.size-1
                        if importing[i].index("=")
                            importing[i].sub!("=",":")
                        else
                         importing[i] += ":nil"
                         end
                    end
     
                end
                import = importing.clone
                import.push("_i:nil")
                import.push("_e:nil")
                import.push("_b:nil")
                pars = import.join(",")
                
                if method_name
                    p "add_method33:#{method_name}"
                    method_name.scan(/[\-\>|\=\>](.*?)$/i){|m|
                        method_name = m[0]
                    }
                    method_name = fixName(convertName(method_name))
                     p "add_method34:#{method_name}"
                    add_method(classdef, method_name.downcase, "(*_a,#{pars})", [], nil , dec, {:import=>importing, :export=>exporting})
                end
            end

            
        }
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
            # keep current sym, in case for call for prevString()
           sy = @scanner.currSym.clone
        
           comments = ""
           while @sym == 0.6
               ps("sym:#{@sym}, #{@scanner.nextSym.sym}")
               comments += curString
               super

           end
              @scanner.currSym = sy
             p "cmt:#{comments}"
             
             parse_abap_method_signature(comments)
            if @parse_stack.cur[:auto_append]
                 #p "cmt:#{curString()}", 10
                 #p "#"+curString()+"|||\n"
                 #p @parse_stack.cur[:src].size
                 #p @parse_stack.cur[:src]
                 
                 _cmt = ""
                 comments.each_line(){|l| _cmt += "#"+l}
                  @parse_stack.cur[:src].push(_cmt+"\n") if @parse_stack.cur[:no_comments]  == false
                 
              #    sy = @scanner.currSym.clone
              #   Get(ignore_crlf)
             #    @scanner.currSym = sy
             end
         end
          p @parse_stack.cur[:src]
    end
    # if stop auto append source, you cannot use method like back(), re() to manipulate the source generating processs
    def stop_autosrc
        @parse_stack.cur[:auto_append] = false
    end
    
    def ignore_this_rule()
        stop_autosrc
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
    
    def in_method
        s ="var(_i) if _i;var(_e) if _e;_i.each{|k,v|eval(\"\#{k}=v\");varset(k, v)} if _i
        _e.each{|k,v|v=_b.local_variable_get(v.to_sym);eval(\"\#{k}=v\");varset(k, v)} if _e"
    end
    def out_method
        "_e.each{|k,v|_b.local_variable_set(v.to_sym, eval(\"\#{k}\"))} if _e && _b"
    end
    def add_method(classdef, fname, head, args, source, deco, others=nil)
        pre = ""
        if others and others[:pre]
            pre = others[:pre]
        end
        before = <<HERE
        #{pre}
        ###################################
        # setup importing parameter
     #   _i.each{|k,v| eval("\#{k} = \#{v}")} if _i  
      #  _i.each{|k,v| v = "\\\"\#{v}\\\"" if v.is_a?(String);eval("\#{k} = \#{v}")} if _i    
      #var(_i) if _i
        #{in_method}
        ###################################
        
        
HERE
        after = <<HERE
        
        
        
        
        ###################################
        # setup exporting 
        #_exp = {}
       # _e.each{|k,v| eval("_exp['\#{v}'] = \#{k}")} if _e
        
        #return {:exp=>_exp}
        #{out_method}
        ###################################

HERE
         _src = "#{before}\n#{source}\n#{after}"       
        classdef.add_method(fname, head, args, _src ,deco, others)
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
    def TypeOfStuct1()
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

       Expect(C_TYPESSym)
       Expect(C_ENDSym)
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
    
   def currSym()
       @scanner.currSym
   end
   def nextSym()
       @scanner.nextSym
   end
   def put_src_abap()
       start = nextSym.pos
       no_comments
       #Expect(C_MODIFYSym)
       Get()
       while (@sym != C_PointSym && @sym != EOF_Sym )
           Get()
       end
       pend = nextSym.pos
       no_comments(false)
       src("abap(\"#{src()}\")")
         #src("abap(\"#{@scanner.buffer[start..pend-1]}\")")
   end
   
    def stMODIFY()
       _in_()
      # Expect(C_MODIFYSym)
       put_src_abap
       _out_()
   end
   
   def stSELECT()
      _in_()
      
      
   #   Expect(C_SELECTSym)
      put_src_abap
      p "src1:#(src())"
     s =  _out_()
     p "src2:#{s}"
     p "src3:#{src()}"
  end
  def stUPDATE()
     _in_()
     
   #  Expect(C_UPDATETSym)
    put_src_abap
     _out_()
  end
  def stINSERT()
     _in_()
     
    # Expect(C_INSERTSym)
     put_src_abap
     
     _out_()
     
  end
  def stDELETE()
     _in_()
     
    # Expect(C_DELETESym)
     put_src_abap
     
     _out_()
     
  end
  
  
    #### copy/override end ####

end  # class Parser

load "cocoR/o/cparser.rb"

load 'cptest.rb'
