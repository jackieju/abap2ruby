require "json"
load 'goto.rb'
load 'sym.rb'
load 'scanner.rb'
load 'crr_parser.rb'
load 'error.rb'
load 'log.rb'
load 'common.rb'
load 'cocoR/o/cparser.rb'

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
        n = {:src=>[], :parent=>@cur, :auto_append=>true, :stack=>[]}
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
        if  @sym == C_PointSym
                @parse_stack.cur[:src].push("\n")
        else
            @parse_stack.cur[:src].push(curString())
            @parse_stack.cur[:stack].push({:sym=>@sym, :val=>curString()})
        end
        
        super

    end
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
        return  @parse_stack.cur[:src].join(" ")
    end
    
    def add_src(r)
        @parse_stack.cur[:src].push(r)
    end
    
    # remove last token content from src content
    def back_src()
        p "33322222#{@parse_stack.cur[:src]}"
        p "33322222#{prevString()}"
        print "33322222#{@parse_stack.cur.to_json}"
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
    #### copy/override start ####
    
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
    
   def ReportDef1()
      Expect(C_REPORTSym)
      fn_name=curString()
      
      Expect(C_identifierSym)
      Expect(C_PointSym)
      s=""
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
         
         Statements()
         s+= popv
      end

      Expect(EOF_Sym)
      @root_class.add_method(fn_name, "()", [], s, "")
      
   end
   def FunctionDef1()
      Expect(C_FUNCTIONSym)
      fn_name=curString()
      
      Expect(C_identifierSym)
      Expect(C_PointSym)
      s=""
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym==C_RETURNINGSym||@sym==C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statements()
         s+= popv
         
      end

      Expect(C_ENDFUNCTIONSym)
      Expect(C_PointSym)
      @root_class.add_method(fn_name, "()", [], s, "")
      
   end 

   
    def Statement1()
        p "==>:#{@sym}, #{curString()}, #{@scanner.buffPos}"
        
        ret = ""
       case @sym

       when C_DATASym
          ret += VariableDefineStatement()

       when C_WRITESym
          ret += WriteStatement()

       when C_identifierSym
       when C_numberSym
       when C_stringD1Sym
       when C_charSym
       when C_spaceD1Sym
       when C_StarSym
       when C_LparenSym
       when C_AndSym
       when C_PlusSym
       when C_MinusSym
       when C_PlusPlusSym
       when C_MinusMinusSym
       when C_BangSym
       when C_TildeSym
       when C_NOTSym
          ret += AssignmentStatement()

       when C_breakSym
          ret += BreakStatement()

       when C_CONTINUESym
          ret += ContinueStatement()

       when C_doSym
          ret += DoStatement()

       when C_forSym
          ret += ForStatement()

       when C_IFSym
         ret +=  IfStatement()

       when C_PointSym
          NullStatement()

       when C_returnSym
          ret += ReturnStatement()

       when C_WHILESym
          ret += WhileStatement()

       else
          GenError(177)

       end
       return ret
    end
    def WriteStatement1()
       Expect(C_WRITESym)
       param_hash = {}
       while (@sym==C_numberSym||@sym>=C_ATSym&&@sym<=C_StarStarSym)
          if @sym==C_ATSym
             Get()
          end

          if @sym==C_SlashSym
             Get()
          end

          if @sym==C_numberSym
             param_hash[:col] = curString().to_i
             Get()
 
          end

          if @sym==C_numberSym||@sym>=C_StarSym&&@sym<=C_StarStarSym
             if @sym==C_numberSym
                Get()
             else
                if @sym==C_StarSym
                   Get()
                else
                   if @sym==C_StarStarSym
                      Get()
                   else
                      GenError(197)
                   end

                end

             end

          end

       end

       # Not very sure about ebnf of abap expression, so here just take one sym
     #  s = Expression()
        s = curString
        Get()
        param_hash[:s] = s
       
       if @sym==C_UNDERSym
          Get()
          Expect(C_identifierSym)
       end

       if @sym==C_NOMinusGAPSym
          Get()
       end

       if @sym>=C_LEFTMinusJUSTIFIEDSym&&@sym<=C_RIGHTMinusJUSTIFIEDSym
          if @sym==C_LEFTMinusJUSTIFIEDSym
             Get()
          else
             if @sym==C_CENTEREDSym
                Get()
             else
                if @sym==C_RIGHTMinusJUSTIFIEDSym
                   Get()
                else
                   GenError(198)
                end

             end

          end

       end

       while (@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym==C_STYLESym)
          if @sym==C_PointSym||@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym>=C_STYLESym&&@sym<=C_USINGSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
             if @sym==C_EXPONENTSym
                Get()
                Expression()
             end

             if @sym==C_NOMinusGROUPINGSym
                Get()
             end

             if @sym==C_NOMinusSIGNSym
                Get()
             end

             if @sym==C_NOMinusZEROSym
                Get()
             end

             if @sym==C_CURRENCYSym
                Get()
                Expect(C_stringD1Sym)
             end

             while (@sym==C_DECIMALSSym||@sym>=C_ROUNDSym&&@sym<=C_UNITSym)
                if @sym==C_PointSym||@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym>=C_STYLESym&&@sym<=C_USINGSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                   if @sym==C_DECIMALSSym
                      Get()
                      Expect(C_stringD1Sym)
                   end

                   if @sym==C_ROUNDSym
                      Get()
                      Expect(C_numberSym)
                   end

                else
                   if 1
                      if @sym==C_UNITSym
                         Get()
                         Expect(C_stringD1Sym)
                      end

                   else
                      GenError(199)
                   end

                end

             end

          else
             if 1
                while (@sym>=C_ENVIRONMENTSym&&@sym<=C_TIMESym)
                   if @sym==C_ENVIRONMENTSym
                      Get()
                      Expect(C_TIMESym)
                      Expect(C_FORMATSym)
                   end

                   if @sym==C_TIMESym
                      Get()
                      Expect(C_ZONESym)
                      Expect(C_stringD1Sym)
                   end

                end

                if @sym==C_STYLESym
                   Get()
                   Expect(C_stringD1Sym)
                end

             else
                GenError(200)
             end

          end

       end

       if @sym==C_USINGSym
          Get()
          while (@sym>=C_NOSym&&@sym<=C_EDITSym)
             if @sym==C_NOSym
                Get()
                Expect(C_EDITSym)
                Expect(C_MASKSym)
             else
                if @sym==C_EDITSym
                   Get()
                   Expect(C_MASKSym)
                   Expect(C_stringD1Sym)
                else
                   GenError(201)
                end

             end

          end

       end

       if @sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym
          case @sym

          when C_DDSlashMMSlashYYSym
             Get()

          when C_MMSlashDDSlashYYSym
             Get()

          when C_DDSlashMMSlashYYYYSym
             Get()

          when C_MMSlashDDSlashYYYYSym
             Get()

          when C_DDMMYYSym
             Get()

          when C_MMDDYYSym
             Get()

          when C_YYMMDDSym
             Get()

          else
             GenError(202)

          end

       end

       if @sym==C_COLORSym
          Get()
          while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_EqualSym&&@sym<=C_OFFSym||@sym==C_LparenSym)
             if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_PointSym||@sym>=C_EqualSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym||@sym==C_LparenSym
                if @sym==C_EqualSym
                   Get()
                end

                while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_ONSym||@sym==C_LparenSym)
                   while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym)
                      Primary()
                   end

                   if @sym==C_ONSym
                      Get()
                   end

                end

             else
                if 1
                   Get()
                else
                   if 1
                      Get()
                      Expect(C_numberSym)
                   else
                      GenError(203)
                   end

                end

             end

          end

       end

       if @sym==C_INTENSIFIEDSym
          Get()
          if @sym>=C_EqualSym&&@sym<=C_OFFSym
             if @sym==C_PointSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_INVERSESym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                   if @sym==C_ONSym
                      Get()
                   else
                      if @sym==C_OFFSym
                         Get()
                      else
                         GenError(204)
                      end

                   end

                end

             else
                if @sym==C_EqualSym
                   while (@sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(205)
                end

             end

          end

       end

       if @sym==C_INVERSESym
          Get()
          if @sym>=C_EqualSym&&@sym<=C_OFFSym
             if @sym==C_PointSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_HOTSPOTSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                   if @sym==C_ONSym
                      Get()
                   else
                      if @sym==C_OFFSym
                         Get()
                      else
                         GenError(206)
                      end

                   end

                end

             else
                if @sym==C_EqualSym
                   while (@sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(207)
                end

             end

          end

       end

       if @sym==C_HOTSPOTSym
          Get()
          if @sym>=C_EqualSym&&@sym<=C_OFFSym
             if @sym==C_PointSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_INPUTSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                   if @sym==C_ONSym
                      Get()
                   else
                      if @sym==C_OFFSym
                         Get()
                      else
                         GenError(208)
                      end

                   end

                end

             else
                if @sym==C_EqualSym
                   while (@sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(209)
                end

             end

          end

       end

       if @sym==C_INPUTSym
          Get()
          if @sym>=C_EqualSym&&@sym<=C_OFFSym
             if @sym==C_PointSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_FRAMESSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                   if @sym==C_ONSym
                      Get()
                   else
                      if @sym==C_OFFSym
                         Get()
                      else
                         GenError(210)
                      end

                   end

                end

             else
                if @sym==C_EqualSym
                   while (@sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(211)
                end

             end

          end

       end

       if @sym==C_FRAMESSym
          Get()
          if @sym>=C_EqualSym&&@sym<=C_OFFSym
             if @sym==C_PointSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_RESETSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
                while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                   if @sym==C_ONSym
                      Get()
                   else
                      if @sym==C_OFFSym
                         Get()
                      else
                         GenError(212)
                      end

                   end

                end

             else
                if @sym==C_EqualSym
                   while (@sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(213)
                end

             end

          end

       end

       if @sym==C_RESETSym
          Get()
       end

       while (@sym==C_ASSym)
          Get()
          case @sym

          when C_CHECKBOXSym
             Get()

          when C_ICONSym
             Get()

          when C_SYMBOLSym
             Get()

          when C_LINESym
             Get()

          else
             GenError(214)

          end

       end

       if @sym==C_QUICKINFOSym
          Get()
          Expect(C_stringD1Sym)
       end

       Expect(C_PointSym)
       
       params = []
       param_hash.each{|k,v|
           params.push "#{k}: #{v}"
       }
       ret = "write(#{params.join(", ")})\n"
       return ret
    end
    
    
    def stMODIFY()
       _in_()
       Expect(C_MODIFYSym)
       while (@sym != C_PointSym && @sym != EOF_Sym)
           Get()
       end
       _out_()
   end
   
   def stSELECT()
      _in_()
      Expect(C_SELECTSym)
      while (@sym != C_PointSym && @sym != EOF_Sym)
          Get()
      end
      p "src1:#(src())"
     s =  _out_()
     p "src2:#{s}"
     p "src3:#{src()}"
  end
  def stUPDATE()
     _in_()
     Expect(C_UPDATETSym)
     while (@sym != C_PointSym && @sym != EOF_Sym)
         Get()
     end
     _out_()
  end
  def stINSERT()
     _in_()
     Expect(C_INSERTSym)
     while (@sym != C_PointSym && @sym != EOF_Sym)
         Get()
     end
     _out_()
  end
  
  
  
    #### copy/override end ####

end  # class Parser

load "cocoR/o/cparser.rb"

load 'cptest.rb'
