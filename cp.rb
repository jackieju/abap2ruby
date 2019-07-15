load 'goto.rb'
load 'sym.rb'
load 'scanner.rb'
load 'crr_parser.rb'
load 'error.rb'
load 'log.rb'
load 'common.rb'


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


class Parser < CRRParser
    attr_accessor :classdefs


    #### copy start ####
    
    def C()
       Expect(C_REPORTSym)
       Expect(C_identifierSym)
       Expect(C_PointSym)
       while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym)
          Statements()
       end

       Expect(EOF_Sym)
    end
    def Statements()
       while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym)
          Statement()
       end

    end
    def Type()
       case Sym

       when C_varSym
       when C_mixedSym
          if Sym==C_varSym
             Get()
          else
             if Sym==C_mixedSym
                Get()
             else
                GenError(155)
             end

          end


       when C_shortSym
          Get()
          if Sym==C_intSym
             Get()
          end


       when C_longSym
          Get()
          if Sym==C_intSym||Sym==C_floatSym
             if Sym==C_intSym
                Get()
             else
                if Sym==C_floatSym
                   Get()
                else
                   GenError(156)
                end

             end

          end


       when C_unsignedSym
          Get()
          if Sym>=C_intSym&&Sym<=C_longSym||Sym==C_charSym
             if Sym==C_charSym
                Get()
             else
                if Sym==C_intSym
                   Get()
                else
                   if Sym==C_longSym
                      Get()
                   else
                      GenError(157)
                   end

                end

             end

          end


       when C_charSym
          Get()

       when C_intSym
          Get()

       when C_floatSym
          Get()

       when C_doubleSym
          Get()

       when C_voidSym
          Get()

       when C_stringSym
          Get()

       else
          GenError(158)

       end

    end
    def Statement()
       case Sym

       when C_DATASym
          VariableDefineStatement()

       when C_WRITESym
          WriteStatement()

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
          AssignmentStatement()

       when C_breakSym
          BreakStatement()

       when C_CONTINUESym
          ContinueStatement()

       when C_doSym
          DoStatement()

       when C_forSym
          ForStatement()

       when C_IFSym
          IfStatement()

       when C_SemicolonSym
          NullStatement()

       when C_returnSym
          ReturnStatement()

       when C_WHILESym
          WhileStatement()

       else
          GenError(159)

       end

    end
    def VariableDefineStatement()
       Expect(C_DATASym)
       Expect(C_identifierSym)
       if Sym==C_TYPESym
          Get()
          Type()
          Expect(C_VALUESym)
          Expression()
       else
          if Sym==C_LIKESym
             Get()
             Expression()
          else
             GenError(160)
          end

       end

       Expect(C_PointSym)
    end
    def WriteStatement()
       Expect(C_WRITESym)
       while (Sym==C_numberSym||Sym>=C_ATSym&&Sym<=C_StarStarSym)
          if Sym==C_ATSym
             Get()
          end

          if Sym==C_SlashSym
             Get()
          end

          if Sym==C_numberSym
             Get()
          end

          if Sym==C_numberSym||Sym>=C_StarSym&&Sym<=C_StarStarSym
             if Sym==C_numberSym
                Get()
             else
                if Sym==C_StarSym
                   Get()
                else
                   if Sym==C_StarStarSym
                      Get()
                   else
                      GenError(161)
                   end

                end

             end

          end

       end

       Expect(C_identifierSym)
       if Sym==C_UNDERSym
          Get()
          Expect(C_identifierSym)
       end

       if Sym==C_NOMinusGAPSym
          Get()
       end

       if Sym>=C_LEFTMinusJUSTIFIEDSym&&Sym<=C_RIGHTMinusJUSTIFIEDSym
          if Sym==C_LEFTMinusJUSTIFIEDSym
             Get()
          else
             if Sym==C_CENTEREDSym
                Get()
             else
                if Sym==C_RIGHTMinusJUSTIFIEDSym
                   Get()
                else
                   GenError(162)
                end

             end

          end

       end

       while (Sym>=C_EXPONENTSym&&Sym<=C_TIMESym||Sym==C_STYLESym)
          if Sym==C_PointSym||Sym>=C_EXPONENTSym&&Sym<=C_TIMESym||Sym>=C_STYLESym&&Sym<=C_USINGSym||Sym>=C_DDSlashMMSlashYYSym&&Sym<=C_COLORSym||Sym>=C_INTENSIFIEDSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
             while (Sym>=C_EXPONENTSym&&Sym<=C_UNITSym)
                if Sym==C_EXPONENTSym
                   Get()
                   Expression()
                end

                if Sym==C_NOMinusGROUPINGSym
                   Get()
                end

                if Sym==C_NOMinusSIGNSym
                   Get()
                end

                if Sym==C_NOMinusZEROSym
                   Get()
                end

                if Sym==C_CURRENCYSym
                   Get()
                   Expect(C_stringD1Sym)
                end

                while (Sym>=C_DECIMALSSym&&Sym<=C_UNITSym)
                   if Sym==C_PointSym||Sym>=C_EXPONENTSym&&Sym<=C_TIMESym||Sym>=C_STYLESym&&Sym<=C_USINGSym||Sym>=C_DDSlashMMSlashYYSym&&Sym<=C_COLORSym||Sym>=C_INTENSIFIEDSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                      while (Sym>=C_DECIMALSSym&&Sym<=C_ROUNDSym)
                         if Sym==C_DECIMALSSym
                            Get()
                            Expect(C_stringD1Sym)
                         end

                         if Sym==C_ROUNDSym
                            Get()
                            Expect(C_numberSym)
                         end

                      end

                   else
                      if 1
                         if Sym==C_UNITSym
                            Get()
                            Expect(C_stringD1Sym)
                         end

                      else
                         GenError(163)
                      end

                   end

                end

             end

          else
             if 1
                while (Sym>=C_ENVIRONMENTSym&&Sym<=C_TIMESym)
                   if Sym==C_ENVIRONMENTSym
                      Get()
                      Expect(C_TIMESym)
                      Expect(C_FORMATSym)
                   end

                   if Sym==C_TIMESym
                      Get()
                      Expect(C_ZONESym)
                      Expect(C_stringD1Sym)
                   end

                end

                if Sym==C_STYLESym
                   Get()
                   Expect(C_stringD1Sym)
                end

             else
                GenError(164)
             end

          end

       end

       if Sym==C_USINGSym
          Get()
          while (Sym>=C_NOSym&&Sym<=C_EDITSym)
             if Sym==C_NOSym
                Get()
                Expect(C_EDITSym)
                Expect(C_MASKSym)
             else
                if Sym==C_EDITSym
                   Get()
                   Expect(C_MASKSym)
                   Expect(C_stringD1Sym)
                else
                   GenError(165)
                end

             end

          end

       end

       if Sym>=C_DDSlashMMSlashYYSym&&Sym<=C_YYMMDDSym
          case Sym

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
             GenError(166)

          end

       end

       if Sym==C_COLORSym
          Get()
          while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym>=C_EqualSym&&Sym<=C_OFFSym||Sym==C_LparenSym)
             if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_PointSym||Sym>=C_EqualSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym||Sym==C_LparenSym
                while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym>=C_EqualSym&&Sym<=C_OFFSym||Sym==C_LparenSym)
                   if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_PointSym||Sym>=C_EqualSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym||Sym==C_LparenSym
                      if Sym==C_EqualSym
                         Get()
                      end

                      while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_ONSym||Sym==C_LparenSym)
                         while (Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_LparenSym)
                            Primary()
                         end

                         if Sym==C_ONSym
                            Get()
                         end

                      end

                   else
                      if 1
                         Get()
                      else
                         GenError(167)
                      end

                   end

                end

             else
                if 1
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_numberSym)
                   end

                else
                   GenError(168)
                end

             end

          end

       end

       if Sym==C_INTENSIFIEDSym
          Get()
          if Sym>=C_EqualSym&&Sym<=C_OFFSym
             if Sym==C_PointSym||Sym>=C_ONSym&&Sym<=C_OFFSym||Sym>=C_INVERSESym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                while (Sym>=C_ONSym&&Sym<=C_OFFSym)
                   if Sym==C_ONSym
                      Get()
                   else
                      if Sym==C_OFFSym
                         Get()
                      else
                         GenError(169)
                      end

                   end

                end

             else
                if Sym==C_EqualSym
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(170)
                end

             end

          end

       end

       if Sym==C_INVERSESym
          Get()
          if Sym>=C_EqualSym&&Sym<=C_OFFSym
             if Sym==C_PointSym||Sym>=C_ONSym&&Sym<=C_OFFSym||Sym>=C_HOTSPOTSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                while (Sym>=C_ONSym&&Sym<=C_OFFSym)
                   if Sym==C_ONSym
                      Get()
                   else
                      if Sym==C_OFFSym
                         Get()
                      else
                         GenError(171)
                      end

                   end

                end

             else
                if Sym==C_EqualSym
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(172)
                end

             end

          end

       end

       if Sym==C_HOTSPOTSym
          Get()
          if Sym>=C_EqualSym&&Sym<=C_OFFSym
             if Sym==C_PointSym||Sym>=C_ONSym&&Sym<=C_OFFSym||Sym>=C_INPUTSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                while (Sym>=C_ONSym&&Sym<=C_OFFSym)
                   if Sym==C_ONSym
                      Get()
                   else
                      if Sym==C_OFFSym
                         Get()
                      else
                         GenError(173)
                      end

                   end

                end

             else
                if Sym==C_EqualSym
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(174)
                end

             end

          end

       end

       if Sym==C_INPUTSym
          Get()
          if Sym>=C_EqualSym&&Sym<=C_OFFSym
             if Sym==C_PointSym||Sym>=C_ONSym&&Sym<=C_OFFSym||Sym>=C_FRAMESSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                while (Sym>=C_ONSym&&Sym<=C_OFFSym)
                   if Sym==C_ONSym
                      Get()
                   else
                      if Sym==C_OFFSym
                         Get()
                      else
                         GenError(175)
                      end

                   end

                end

             else
                if Sym==C_EqualSym
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(176)
                end

             end

          end

       end

       if Sym==C_FRAMESSym
          Get()
          if Sym>=C_EqualSym&&Sym<=C_OFFSym
             if Sym==C_PointSym||Sym>=C_ONSym&&Sym<=C_OFFSym||Sym>=C_RESETSym&&Sym<=C_ASSym||Sym==C_QUICKINFOSym
                while (Sym>=C_ONSym&&Sym<=C_OFFSym)
                   if Sym==C_ONSym
                      Get()
                   else
                      if Sym==C_OFFSym
                         Get()
                      else
                         GenError(177)
                      end

                   end

                end

             else
                if Sym==C_EqualSym
                   while (Sym==C_EqualSym)
                      Get()
                      Expect(C_stringD1Sym)
                   end

                else
                   GenError(178)
                end

             end

          end

       end

       if Sym==C_RESETSym
          Get()
       end

       while (Sym==C_ASSym)
          case Sym

          when C_PointSym
          when C_ASSym
          
          else
             GenError(179)

          end

       end

       if Sym==C_QUICKINFOSym
          Get()
          Expect(C_stringD1Sym)
       end

       Expect(C_PointSym)
    end
    def AssignmentStatement()
       Expression()
       Expect(C_SemicolonSym)
    end
    def BreakStatement()
       Expect(C_breakSym)
       Expect(C_SemicolonSym)
    end
    def ContinueStatement()
       Expect(C_CONTINUESym)
       Expect(C_PointSym)
    end
    def DoStatement()
       Expect(C_doSym)
       Statement()
       Expect(C_whileSym)
       Expect(C_LparenSym)
       Expression()
       Expect(C_RparenSym)
       Expect(C_SemicolonSym)
    end
    def ForStatement()
       Expect(C_forSym)
       Expect(C_LparenSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_LparenSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Expression()
       end

       Expect(C_SemicolonSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_LparenSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Expression()
       end

       Expect(C_SemicolonSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_LparenSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Expression()
       end

       Expect(C_RparenSym)
       Statement()
    end
    def IfStatement()
       Expect(C_IFSym)
       Expression()
       Expect(C_PointSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Statements()
       end

       while (Sym==C_ELSEIFSym)
          Get()
          Expression()
          Expect(C_PointSym)
          if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
             Statements()
          end

       end

       if Sym==C_ELSESym
          Get()
          Expect(C_PointSym)
          if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
             Statements()
          end

       end

       Expect(C_ENDIFSym)
       Expect(C_PointSym)
    end
    def NullStatement()
       Expect(C_SemicolonSym)
    end
    def ReturnStatement()
       Expect(C_returnSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_LparenSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Expression()
       end

       Expect(C_SemicolonSym)
    end
    def WhileStatement()
       Expect(C_WHILESym)
       Expression()
       while (Sym==C_VARYSym)
          Get()
          Expect(C_identifierSym)
          Expect(C_FROMSym)
          Expect(C_identifierSym)
          Expect(C_NEXTSym)
          Expect(C_identifierSym)
          if Sym==C_RANGESym
             Get()
             Expect(C_identifierSym)
          end

       end

       Expect(C_PointSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_DATASym||Sym==C_WRITESym||Sym==C_StarSym||Sym>=C_SemicolonSym&&Sym<=C_doSym||Sym==C_LparenSym||Sym>=C_forSym&&Sym<=C_IFSym||Sym>=C_returnSym&&Sym<=C_WHILESym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          Statements()
       end

       Expect(C_ENDWHILESym)
       Expect(C_PointSym)
    end
    def Expression()
       Conditional()
       while (Sym==C_EqualSym||Sym>=C_StarEqualSym&&Sym<=C_GreaterGreaterEqualSym)
          AssignmentOperator()
          Expression()
       end

    end
    def Primary()
       case Sym

       when C_identifierSym
          Get()

       when C_stringD1Sym
          Get()

       when C_charSym
          Get()

       when C_numberSym
          Get()

       when C_LparenSym
          Get()
          Expression()
          Expect(C_RparenSym)

       else
          GenError(180)

       end

    end
    def Conditional()
       LogORExp()
    end
    def AssignmentOperator()
       case Sym

       when C_EqualSym
          Get()

       when C_StarEqualSym
          Get()

       when C_SlashEqualSym
          Get()

       when C_PercentEqualSym
          Get()

       when C_PlusEqualSym
          Get()

       when C_MinusEqualSym
          Get()

       when C_AndEqualSym
          Get()

       when C_UparrowEqualSym
          Get()

       when C_BarEqualSym
          Get()

       when C_LessLessEqualSym
          Get()

       when C_GreaterGreaterEqualSym
          Get()

       else
          GenError(181)

       end

    end
    def LogORExp()
       LogANDExp()
       while (Sym>=C_BarBarSym&&Sym<=C_EQUIVSym)
          if Sym==C_BarBarSym
             Get()
          else
             if Sym==C_ORSym
                Get()
             else
                if Sym==C_EQUIVSym
                   Get()
                else
                   GenError(182)
                end

             end

          end

          LogANDExp()
       end

    end
    def LogANDExp()
       InclORExp()
       while (Sym>=C_AndAndSym&&Sym<=C_ANDSym)
          if Sym==C_AndAndSym
             Get()
          else
             if Sym==C_ANDSym
                Get()
             else
                GenError(183)
             end

          end

          InclORExp()
       end

    end
    def InclORExp()
       ExclORExp()
       while (Sym==C_BarSym)
          Get()
          ExclORExp()
       end

    end
    def ExclORExp()
       ANDExp()
       while (Sym==C_UparrowSym)
          Get()
          ANDExp()
       end

    end
    def ANDExp()
       EqualExp()
       while (Sym==C_AndSym)
          Get()
          EqualExp()
       end

    end
    def EqualExp()
       RelationExp()
       while (Sym==C_EqualSym||Sym>=C_EQSym&&Sym<=C_NESym)
          case Sym

          when C_EqualSym
             Get()

          when C_EQSym
             Get()

          when C_LessGreaterSym
             Get()

          when C_NESym
             Get()

          else
             GenError(184)

          end

          RelationExp()
       end

    end
    def RelationExp()
       ShiftExp()
       while (Sym>=C_LessSym&&Sym<=C_BYTEMinusNSSym)
          case Sym

          when C_LessSym
             Get()

          when C_LTSym
             Get()

          when C_GreaterSym
             Get()

          when C_GTSym
             Get()

          when C_LessEqualSym
             Get()

          when C_LESym
             Get()

          when C_GreaterEqualSym
             Get()

          when C_GESym
             Get()

          when C_COSym
             Get()

          when C_CNSym
             Get()

          when C_CASym
             Get()

          when C_NASym
             Get()

          when C_CSSym
             Get()

          when C_NSSym
             Get()

          when C_CPSym
             Get()

          when C_NPSym
             Get()

          when C_BYTEMinusCOSym
             Get()

          when C_BYTEMinusCNSym
             Get()

          when C_BYTEMinusCASym
             Get()

          when C_BYTEMinusNASym
             Get()

          when C_BYTEMinusCSSym
             Get()

          when C_BYTEMinusNSSym
             Get()

          else
             GenError(185)

          end

          ShiftExp()
       end

    end
    def ShiftExp()
       AddExp()
       while (Sym>=C_LessLessSym&&Sym<=C_GreaterGreaterSym)
          if Sym==C_LessLessSym
             Get()
          else
             if Sym==C_GreaterGreaterSym
                Get()
             else
                GenError(186)
             end

          end

          AddExp()
       end

    end
    def AddExp()
       MultExp()
       while (Sym>=C_PlusSym&&Sym<=C_MinusSym)
          if Sym==C_PlusSym
             Get()
          else
             if Sym==C_MinusSym
                Get()
             else
                GenError(187)
             end

          end

          MultExp()
       end

    end
    def MultExp()
       CastExp()
       while (Sym>=C_SlashSym&&Sym<=C_StarStarSym||Sym>=C_DIVSym&&Sym<=C_MODSym)
          case Sym

          when C_StarSym
             Get()

          when C_SlashSym
             Get()

          when C_DIVSym
             Get()

          when C_PercentSym
             Get()

          when C_MODSym
             Get()

          when C_StarStarSym
             Get()

          else
             GenError(188)

          end

          CastExp()
       end

    end
    def CastExp()
       UnaryExp()
    end
    def UnaryExp()
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_LparenSym
          PostFixExp()
       else
          if Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym
             if Sym==C_PlusPlusSym
                Get()
             else
                if Sym==C_MinusMinusSym
                   Get()
                else
                   GenError(189)
                end

             end

             UnaryExp()
          else
             if Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
                UnaryOperator()
                CastExp()
             else
                GenError(190)
             end

          end

       end

    end
    def PostFixExp()
       Primary()
       while (Sym==C_PointSym||Sym==C_LparenSym||Sym>=C_PlusPlusSym&&Sym<=C_LbrackSym||Sym==C_MinusGreaterSym)
          case Sym

          when C_LbrackSym
             Get()
             Expression()
             Expect(C_RbrackSym)

          when C_LparenSym
             FunctionCall()

          when C_PointSym
             Get()
             Expect(C_identifierSym)

          when C_MinusGreaterSym
             Get()
             Expect(C_identifierSym)

          when C_PlusPlusSym
             Get()

          when C_MinusMinusSym
             Get()

          else
             GenError(191)

          end

       end

    end
    def UnaryOperator()
       case Sym

       when C_PlusSym
          Get()

       when C_spaceD1Sym
       when C_MinusSym
          MinusOperator()

       when C_StarSym
          Get()

       when C_BangSym
          Get()

       when C_AndSym
          Get()

       when C_TildeSym
          Get()

       when C_NOTSym
          Get()

       else
          GenError(192)

       end

    end
    def FunctionCall()
       Expect(C_LparenSym)
       if Sym>=C_identifierSym&&Sym<=C_numberSym||Sym>=C_stringD1Sym&&Sym<=C_charSym||Sym==C_spaceD1Sym||Sym==C_StarSym||Sym==C_LparenSym||Sym==C_AndSym||Sym>=C_PlusSym&&Sym<=C_MinusSym||Sym>=C_PlusPlusSym&&Sym<=C_MinusMinusSym||Sym>=C_BangSym&&Sym<=C_NOTSym
          ActualParameters()
       end

       Expect(C_RparenSym)
    end
    def ActualParameters()
       Expression()
       while (Sym==C_CommaSym)
          Get()
          Expression()
       end

    end
    def MinusOperator()
       if Sym==C_spaceD1Sym
          Get()
          Expect(C_MinusSym)
       else
          if Sym==C_MinusSym
             Get()
             Expect(C_spaceD1Sym)
          else
             GenError(193)
          end

       end

    end

    #### copy end ####
end  # class Parser


#load 'cptest.rb'
