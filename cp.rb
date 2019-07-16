load 'goto.rb'
load 'sym.rb'
load 'scanner.rb'
load 'crr_parser.rb'
load 'error.rb'
load 'log.rb'
load 'common.rb'
load 'cocoR/o/cparser.rb'

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


class Parser < CParser
    attr_accessor :classdefs
    def initialize(scanner, error, classdefs={})
        
   
        super(scanner, error)
        #@addClassForUnregcognizedName = false
        #@included_files = {}
        
        @macros = {}
        @classdefs = $g_classdefs
        @root_class = $g_root_moddef
        
        p "init end"
        pclass
    end

    #### copy/override start ####
    def C()
       Expect(C_REPORTSym)
       fn_name = curString()
       Expect(C_identifierSym)
       Expect(C_PointSym)
       s = ""
       while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_doSym||@sym==C_LparenSym||@sym>=C_forSym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
          s += Statements()
       end
       
       Expect(EOF_Sym)
       
       @root_class.add_method(fn_name, "()", [], s, "")
    end
    
    def Statements()
        s = ""
       while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_doSym||@sym==C_LparenSym||@sym>=C_forSym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
           r = Statement()
           p r
          s +=r
       end
       return s

    end
    def Statement()
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
    def WriteStatement()
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
    #### copy/override end ####

end  # class Parser

load "cocoR/o/cparser.rb"

load 'cptest.rb'
