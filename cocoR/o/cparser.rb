class CParser < CRRParser

   def Exps()
      _in_()
      Expression()
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Expression()
      end

      _out_()
   end
   def Expression()
      _in_()
      Conditional()
      while (@sym==C_EqualSym||@sym>=C_StarEqualSym&&@sym<=C_GreaterGreaterEqualSym)
         AssignmentOperator()
         Expression()
      end

      _out_()
   end
   def Name()
      _in_()
      if @sym==C_identifierSym
         Get()
      else
         if @sym==C_LparenSym
            Get()
            Expect(C_identifierSym)
            Expect(C_RparenSym)
         else
            if @sym==C_LessSym
               Get()
               Expect(C_identifierSym)
               Expect(C_GreaterSym)
            else
               GenError(705)
            end

         end

      end

      _out_()
   end
   def C()
      _in_()
      while (@sym==C_REPORTSym||@sym==C_FUNCTIONSym||@sym==C_CLASSSym)
         if @sym==C_REPORTSym
            ReportDef()
         else
            if @sym==C_FUNCTIONSym
               FunctionDef()
            else
               if @sym==C_CLASSSym
                  ClassStatement()
               else
                  GenError(706)
               end

            end

         end

      end

      _out_()
   end
   def ReportDef()
      _in_()
      Expect(C_REPORTSym)

      fn_name=curString();

      Expect(C_identifierSym)

      src("");

      while (@sym==C_NOSym||@sym>=C_LINEMinusSIZESym&&@sym<=C_DEFININGSym||@sym==C_REDUCEDSym)
         if @sym==C_NOSym
            Get()
            Expect(C_STANDARDSym)
            Expect(C_PAGESym)
            Expect(C_HEADINGSym)
         end

         if @sym==C_LINEMinusSIZESym
            Get()
            Expect(C_numberSym)
         end

         if @sym==C_LINEMinusCOUNTSym
            Get()
            Expect(C_numberSym)
            if @sym==C_LparenSym
               Get()
               Expect(C_numberSym)
               Expect(C_RparenSym)
            end

         end

         if @sym==C_MESSAGEMinusIDSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_DEFININGSym
            Get()
            Expect(C_DATABASESym)
            Expect(C_identifierSym)
         end

         if @sym==C_REDUCEDSym
            Get()
            Expect(C_FUNCTIONALITYSym)
         end

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end



      @root_class.add_method(fn_name, "()", [], src, "");

      Expect(EOF_Sym)
      _out_()
   end
   def FunctionDef()
      _in_()
      Expect(C_FUNCTIONSym)

      fn_name=curString();

      Expect(C_identifierSym)
      Expect(C_PointSym)

      src("");

      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end



      @root_class.add_method(fn_name, "()", [], src, "");

      Expect(C_ENDFUNCTIONSym)
      Expect(C_PointSym)
      _out_()
   end
   def ClassStatement()
      _in_()
      Expect(C_CLASSSym)
      Expect(C_identifierSym)


      cls = @root_class.add_class(prevString)
      in_scope(cls);

      if @sym==C_DEFINITIONSym
         Get()
         if @sym==C_DEFERREDSym
            Get()
            if @sym==C_PUBLICSym
               Get()
            end

         else
            if @sym==C_PointSym||@sym==C_FORSym||@sym==C_SHAREDSym||@sym>=C_PUBLICSym&&@sym<=C_CREATESym||@sym>=C_GLOBALSym&&@sym<=C_FRIENDSSym
               if @sym>=C_PUBLICSym&&@sym<=C_PRIVATESym
                  if @sym==C_PUBLICSym
                     Get()
                  else
                     if @sym==C_PROTECTEDSym
                        Get()
                     else
                        if @sym==C_PRIVATESym
                           Get()
                        else
                           GenError(707)
                        end

                     end

                  end

               end

               while (@sym==C_FORSym||@sym==C_SHAREDSym||@sym>=C_INHERITINGSym&&@sym<=C_CREATESym||@sym>=C_GLOBALSym&&@sym<=C_FRIENDSSym)
                  if @sym==C_INHERITINGSym
                     Get()
                     Expect(C_FROMSym)
                     Expect(C_identifierSym)

                     cls.parent = prevString;

                  end

                  if @sym==C_ABSTRACTSym
                     Get()
                  end

                  if @sym==C_FINALSym
                     Get()
                  end

                  if @sym==C_CREATESym
                     Get()
                     while (@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym)
                        if @sym==C_PUBLICSym
                           Get()
                        else
                           if @sym==C_PROTECTEDSym
                              Get()
                           else
                              if @sym==C_PRIVATESym
                                 Get()
                              else
                                 GenError(708)
                              end

                           end

                        end

                     end

                  end

                  if @sym==C_SHAREDSym
                     Get()
                     Expect(C_MEMORYSym)
                     Expect(C_ENABLEDSym)
                  end

                  if @sym==C_FORSym
                     Get()
                     Expect(C_TESTINGSym)
                     if @sym==C_RISKSym
                        Get()
                        Expect(C_LEVELSym)
                        while (@sym>=C_CRITICALSym&&@sym<=C_HARMLESSSym)
                           if @sym==C_CRITICALSym
                              Get()
                           else
                              if @sym==C_DANGEROUSSym
                                 Get()
                              else
                                 if @sym==C_HARMLESSSym
                                    Get()
                                 else
                                    GenError(709)
                                 end

                              end

                           end

                        end

                     end

                     if @sym==C_DURATIONSym
                        Get()
                        while (@sym>=C_SHORTSym&&@sym<=C_LONGSym)
                           if @sym==C_SHORTSym
                              Get()
                           else
                              if @sym==C_MEDIUMSym
                                 Get()
                              else
                                 if @sym==C_LONGSym
                                    Get()
                                 else
                                    GenError(710)
                                 end

                              end

                           end

                        end

                     end

                  end

                  if @sym>=C_GLOBALSym&&@sym<=C_FRIENDSSym
                     if @sym==C_GLOBALSym
                        Get()
                     end

                     Expect(C_FRIENDSSym)
                     Expect(C_identifierSym)
                     while (@sym==C_identifierSym)
                        Get()
                     end

                  end

               end

            else
               GenError(711)
            end

         end

      else
         if @sym==C_IMPLEMENTATIONSym
            Get()
         else
            GenError(712)
         end

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         if @sym>=C_PUBLICSym&&@sym<=C_PRIVATESym
            if @sym==C_PUBLICSym
               Get()
            else
               if @sym==C_PROTECTEDSym
                  Get()
               else
                  if @sym==C_PRIVATESym
                     Get()
                  else
                     GenError(713)
                  end

               end

            end

            Expect(C_SECTIONSym)
            Expect(C_PointSym)
         end

         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Statement()
         end

      end

      Expect(C_ENDCLASSSym)

      out_scope() if cls;

      Expect(C_PointSym)
      _out_()
   end
   def Statement()
      _in_()

      ps();

      case @sym

      when C_DATASym,
         C_STATICSSym
         VariableDefineStatement()

      when C_WRITESym
         WriteStatement()

      when C_identifierSym,
         C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_spaceD1Sym,
         C_LparenSym,
         C_LessSym,
         C_StarSym,
         C_TildeSym,
         C_INSym,
         C_PlusSym,
         C_INITIALSym,
         C_SlashSym,
         C_NOTSym,
         C_AndSym,
         C_MinusSym,
         C_PlusPlusSym,
         C_MinusMinusSym,
         C_BangSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         AssignmentStatement()

      when C_CONTINUESym
         ContinueStatement()

      when C_DOSym
         stDO()

      when C_forSym
         ForStatement()

      when C_IFSym
         IfStatement()

      when C_PointSym
         NullStatement()

      when C_returnSym
         ReturnStatement()

      when C_WHILESym
         stWHILE()

      when C_LOOPSym
         LoopStatement()

      when C_CASESym
         CaseStatement()

      when C_CALLSym
         stCALL()

      when C_CLASSSym
         ClassStatement()

      when C_METHODSym
         MethodStatement()

      when C_METHODSSym,
         C_CLASSMinusMETHODSSym
         MethodsStatement()

      when C_FUNCTIONSym
         FunctionDef()

      when C_MESSAGESym
         MessasgeStatement()

      when C_SEARCHSym
         SearchStatement()

      when C_APPENDSym
         stAPPEND()

      when C_SPLITSym
         stSPLIT()

      when C_RAISESym
         stRAISE()

      when C_CONSTANTSSym
         stCONSTANTS()

      when C_MOVESym
         stMOVE()

      when C_MOVEMinusCORRESPONDINGSym
         stMOVE_CORRESPONDING()

      when C_WITHSym
         stWITH()

      when C_TABLESSym
         stTABLES()

      when C_AUTHORITYMinusCHECKSym
         stAUTHORITY_CHECK()

      when C_DELETESym
         stDELETE()

      when C_EVENTSSym
         stEVENTS()

      when C_MODIFYSym
         stMODIFY()

      when C_ONSym
         stON()

      when C_OPENSym
         stOPEN()

      when C_FETCHSym
         stFETCH()

      when C_PROVIDESym
         stPROVIDE()

      when C_READSym
         stREAD()

      when C_SORTSym
         stSORT()

      when C_SUBMITSym
         stSUBMIT()

      when C_TRYSym
         stTRY()

      when C_ADDSym
         stADD()

      when C_ADDMinusCORRESPONDINGSym
         stADD_CORRESPONDING()

      when C_ALIASESSym
         stALIASES()

      when C_ASSERTSym
         stASSERT()

      when C_ASSIGNSym
         stASSIGN()

      when C_ATSym
         stAT()

      when C_BACKSym
         stBACK()

      when C_BREAKMinusPOINTSym
         stBREAK_POINT()

      when C_CHECKSym
         stCHECK()

      when C_CLASSMinusDATASym
         stCLASS_DATA()

      when C_CLASSMinusEVENTSSym
         stCLASS_EVENTS()

      when C_CLASSMinusPOOLSym
         stCLASS_POOL()

      when C_CLEARSym
         stCLEAR()

      when C_CLOSESym
         stCLOSE()

      when C_COLLECTSym
         stCOLLECT()

      when C_COMMITSym
         stCOMMIT()

      when C_COMPUTESym
         stCOMPUTE()

      when C_CONCATENATESym
         stCONCATENATE()

      when C_CONDENSESym
         stCONDENSE()

      when C_CONTROLSSym,
         C_TABSTRIPSym
         stCONTROLS()

      when C_CONVERTSym
         stCONVERT()

      when C_CREATESym
         stCREATE()

      when C_DEMANDSym
         stDEMAND()

      when C_DESCRIBESym
         stDESCRIBE()

      when C_DETAILSym
         stDETAIL()

      when C_DIVIDESym
         stDIVIDE()

      when C_DIVIDEMinusCORRESPONDINGSym
         stDIVIDE_CORRESPONDING()

      when C_EDITORMinusCALLSym
         stEDITOR_CALL()

      when C_ENDMinusOFMinusPAGESym
         stEND_OF_PAGE()

      when C_ENDMinusOFMinusSELECTIONSym
         stEND_OF_SELECTION()

      when C_EXITSym
         stEXIT()

      when C_EXPORTSym
         stEXPORT()

      when C_EXTRACTSym
         stEXTRACT()

      when C_FIELDMinusGROUPSSym
         stFIELD_GROUPS()

      when C_FIELDMinusSYMBOLSSym
         stFIELD_SYMBOLS()

      when C_FIELDSSym
         stFIELDS()

      when C_FINDSym,
         C_REGEXSym
         stFIND()

      when C_FORMATSym
         stFORMAT()

      when C_FREESym
         stFREE()

      when C_FUNCTIONMinusPOOLSym
         stFUNCTION_POOL()

      when C_GENERATESym
         stGENERATE()

      when C_GETSym
         stGET()

      when C_HIDESym
         stHIDE()

      when C_IMPORTSym
         stIMPORT()

      when C_INCLUDESym
         stINCLUDE()

      when C_INFOTYPESSym
         stINFOTYPES()

      when C_INITIALIZATIONSym
         stINITIALIZATION()

      when C_INPUTSym
         stINPUT()

      when C_INSERTSym
         stINSERT()

      when C_INTERFACESym
         stINTERFACE()

      when C_INTERFACEMinusPOOLSym
         stINTERFACE_POOL()

      when C_INTERFACESSym
         stINTERFACES()

      when C_LEAVESym
         stLEAVE()

      when C_LOADMinusOFMinusPROGRAMSym
         stLOAD_OF_PROGRAM()

      when C_LOCALSym
         stLOCAL()

      when C_LOGMinusPOINTSym
         stLOG_POINT()

      when C_MAXIMUMSym
         stMAXIMUM()

      when C_MINIMUMSym
         stMINIMUM()

      when C_MODULESym
         stMODULE()

      when C_MULTIPLYSym
         stMULTIPLY()

      when C_MULTIPLYMinusCORRESPONDINGSym
         stMULTIPLY_CORRESPONDING()

      when C_NEWMinusLINESym
         stNEW_LINE()

      when C_NEWMinusPAGESym
         stNEW_PAGE()

      when C_NEWMinusSECTIONSym
         stNEW_SECTION()

      when C_NODESSym
         stNODES()

      when C_OVERLAYSym
         stOVERLAY()

      when C_PACKSym
         stPACK()

      when C_PARAMETERSSym
         stPARAMETERS()

      when C_PERFORMSym
         stPERFORM()

      when C_POSITIONSym
         stPOSITION()

      when C_PRINTMinusCONTROLSym
         stPRINT_CONTROL()

      when C_PROGRAMSym
         stPROGRAM()

      when C_RANGESSym
         stRANGES()

      when C_RECEIVESym
         stRECEIVE()

      when C_REFRESHSym
         stREFRESH()

      when C_REJECTSym
         stREJECT()

      when C_REPLACESym
         stREPLACE()

      when C_RESERVESym
         stRESERVE()

      when C_RESUMESym
         stRESUME()

      when C_RETRYSym
         stRETRY()

      when C_RETURNSym
         stRETURN()

      when C_ROLLBACKSym
         stROLLBACK()

      when C_SCROLLSym
         stSCROLL()

      when C_SELECTMinusOPTIONSSym
         stSELECT_OPTIONS()

      when C_SELECTIONMinusSCREENSym
         stSELECTION_SCREEN()

      when C_SETSym
         stSET()

      when C_SHIFTSym
         stSHIFT()

      when C_SKIPSym
         stSKIP()

      when C_STOPSym
         stSTOP()

      when C_SUBTRACTSym
         stSUBTRACT()

      when C_SUBTRACTMinusCORRESPONDINGSym
         stSUBTRACT_CORRESPONDING()

      when C_SUMSym
         stSUM()

      when C_SUMMARYSym
         stSUMMARY()

      when C_SUMMINGSym
         stSUMMING()

      when C_SUPPLYSym
         stSUPPLY()

      when C_SUPPRESSSym
         stSUPPRESS()

      when C_SYNTAXMinusCHECKSym
         stSYNTAX_CHECK()

      when C_TESTMinusINJECTIONSym
         stTEST_INJECTION()

      when C_TESTMinusSEAMSym
         stTEST_SEAM()

      when C_TOPMinusOFMinusPAGESym
         stTOP_OF_PAGE()

      when C_TRANSFERSym
         stTRANSFER()

      when C_USINGSym,
         C_TRANSLATESym
         stTRANSLATE()

      when C_TRUNCATESym
         stTRUNCATE()

      when C_TYPEMinusPOOLSym
         stTYPE_POOL()

      when C_TYPEMinusPOOLSSym
         stTYPE_POOLS()

      when C_TYPESSym
         stTYPES()

      when C_ULINESym
         stULINE()

      when C_UNASSIGNSym
         stUNASSIGN()

      when C_UNPACKSym
         stUNPACK()

      when C_UPDATESym
         stUPDATE()

      when C_FORSym,
         C_WAITSym
         stWAIT()

      when C_WINDOWSym
         stWINDOW()

      when C_SELECTSym
         stSELECT()

      when C_ENDSELECTSym
         stENDSELECT()

      else
         GenError(714)

      end

      _out_()
   end
   def Type()
      _in_()
      Expect(C_identifierSym)
      _out_()
   end
   def VariableDefineStatement()
      _in_()
      if @sym==C_DATASym
         Get()
      else
         if @sym==C_STATICSSym
            Get()
         else
            GenError(715)
         end

      end

      if @sym==C_BEGINSym
         Get()
         Expect(C_OFSym)
         if @sym==C_COMMONSym
            Get()
            Expect(C_PARTSym)
            Expect(C_identifierSym)
         else
            if @sym==C_identifierSym
               Get()
               if @sym==C_READMinusONLYSym
                  Get()
               end

               if @sym==C_OCCURSSym
                  Get()
                  Expect(C_numberSym)
               end

            else
               GenError(716)
            end

         end

      else
         if @sym==C_ENDSym
            Get()
            Expect(C_OFSym)
            if @sym==C_COMMONSym
               Get()
               Expect(C_PARTSym)
               Expect(C_identifierSym)
            else
               if @sym==C_identifierSym
                  Get()
                  if @sym==C_VALIDSym
                     Get()
                     Expect(C_BETWEENSym)
                     Expression()
                     Expect(C_ANDSym)
                     Expression()
                  end

               else
                  GenError(717)
               end

            end

         else
            if @sym==C_identifierSym
               Get()
               while (@sym==C_LparenSym)
                  Get()
                  Expect(C_numberSym)
                  Expect(C_RparenSym)
               end

               if @sym==C_TYPESym
                  TypeDes()
               else
                  if @sym==C_LIKESym
                     LikeDes()
                  else
                     GenError(718)
                  end

               end

            else
               GenError(719)
            end

         end

      end

      while (@sym>=C_READMinusONLYSym&&@sym<=C_OCCURSSym||@sym==C_VALUESym)
         if @sym==C_VALUESym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_ISSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  Expression()
               else
                  if @sym==C_ISSym
                     Get()
                     Expect(C_INITIALSym)
                  else
                     GenError(720)
                  end

               end

            end

         end

         if @sym==C_READMinusONLYSym
            Get()
         end

         if @sym==C_OCCURSSym
            Get()
            Expect(C_numberSym)
            if @sym==C_WITHSym
               Get()
               Expect(C_HEADERSym)
               Expect(C_LINESym)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def WriteStatement()
      _in_()

      param_hash = {};

      Expect(C_WRITESym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_PointSym||@sym==C_StarSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_ATSym||@sym==C_DECIMALSSym||@sym==C_SlashSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_NOTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         while (@sym==C_numberSym||@sym==C_LparenSym||@sym==C_ATSym||@sym==C_SlashSym)
            if @sym==C_ATSym
               Get()
            end

            if @sym==C_SlashSym
               Get()
            end

            if @sym==C_numberSym
               Get()

               param_hash["col"] = curString().to_i;

            end

            if @sym==C_LparenSym
               Get()
               if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  Expression()
               else
                  if 1
                     Get()
                  else
                     if @sym==C_StarStarSym
                        Get()
                     else
                        GenError(721)
                     end

                  end

               end

               Expect(C_RparenSym)
            end

         end

         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
         end



         param_hash["s"] = popv;

         while (@sym>=C_ASSym&&@sym<=C_USINGSym||@sym==C_DECIMALSSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym)
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
                        GenError(722)
                     end

                  end

               end

            end

            while (@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym==C_STYLESym)
               if @sym==C_PointSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym==C_DECIMALSSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym
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
                     if @sym==C_PointSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym==C_DECIMALSSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym
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
                           GenError(723)
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
                     GenError(724)
                  end

               end

            end

            if @sym==C_USINGSym
               Get()
               while (@sym==C_NOSym||@sym==C_EDITSym)
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
                        GenError(725)
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
                  GenError(726)

               end

            end

            Format_options()
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
                  GenError(727)

               end

            end

            if @sym==C_QUICKINFOSym
               Get()
               Expect(C_stringD1Sym)
            end

         end

      else
         if 1
            if @sym==C_identifierSym
               Get()
            else
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(728)
               end

            end

            Expect(C_TOSym)
            Expect(C_identifierSym)
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
                        GenError(729)
                     end

                  end

               end

            end

            if @sym==C_PointSym||@sym==C_USINGSym||@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_UNITSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym
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

               if @sym==C_PointSym||@sym==C_USINGSym||@sym==C_DECIMALSSym||@sym==C_ROUNDSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_YYMMDDSym
                  if @sym==C_DECIMALSSym
                     Get()
                     Expect(C_numberSym)
                  end

                  if @sym==C_ROUNDSym
                     Get()
                     Expect(C_numberSym)
                  end

               else
                  if @sym==C_UNITSym
                     if @sym==C_UNITSym
                        Get()
                        Expect(C_stringD1Sym)
                     end

                  else
                     GenError(730)
                  end

               end

            else
               if @sym>=C_ENVIRONMENTSym&&@sym<=C_TIMESym||@sym==C_STYLESym
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

                  if @sym==C_STYLESym
                     Get()
                     Expect(C_stringD1Sym)
                  end

               end

            end

            if @sym==C_USINGSym
               Get()
               if @sym==C_NOSym
                  Get()
                  Expect(C_EDITSym)
                  Expect(C_MASKSym)
               else
                  if @sym==C_EDITSym
                     Get()
                     Expect(C_MASKSym)
                     Expect(C_identifierSym)
                  else
                     GenError(731)
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
                  GenError(732)

               end

            end

         end

      end

      Expect(C_PointSym)



      params = []
      param_hash.each{|k,v|
         params.push "#{k}: #{v}"
      }
      src("write(#{params.join(", ")})\n");

      _out_()
   end
   def AssignmentStatement()
      _in_()
      Expression()
      _out_()
   end
   def ContinueStatement()
      _in_()
      Expect(C_CONTINUESym)
      Expect(C_PointSym)
      _out_()
   end
   def stDO()
      _in_()
      Expect(C_DOSym)
      if @sym==C_numberSym
         Get()
         Expect(C_TIMESSym)
      end

      while (@sym==C_VARYINGSym)
         VARYING()
      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      Expect(C_ENDDOSym)
      Expect(C_PointSym)
      _out_()
   end
   def ForStatement()
      _in_()
      Expect(C_forSym)
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_RparenSym)
      Statement()
      _out_()
   end
   def IfStatement()
      _in_()


      ret = ""
      stmts = ""
      ;

      Expect(C_IFSym)
      Expression()

      exp = lus;

      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Statement()
         end


         stmts = lus;

      end


      ret += "if #{exp}\n#{stmts}\n";

      while (@sym==C_ELSEIFSym)
         Get()
         Expression()

         exp = lus;

         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Statement()
            end


            stmts = lus;

         end


         ret += "elsif #{exp}\n#{stmts}\n";

      end

      if @sym==C_ELSESym
         Get()
         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Statement()
            end


            stmts = lus;

         end


         ret += "else #{exp}\n#{stmts}\n";

      end

      Expect(C_ENDIFSym)


      ret += "\nend"
      src(ret);

      Expect(C_PointSym)
      _out_()
   end
   def NullStatement()
      _in_()
      Expect(C_PointSym)
      _out_()
   end
   def ReturnStatement()
      _in_()
      Expect(C_returnSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      _out_()
   end
   def stWHILE()
      _in_()
      Expect(C_WHILESym)
      Expression()
      while (@sym==C_VARYSym)
         Get()
         Expect(C_identifierSym)
         Expect(C_FROMSym)
         Expect(C_identifierSym)
         Expect(C_NEXTSym)
         Expect(C_identifierSym)
         if @sym==C_RANGESym
            Get()
            Expression()
         end

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      Expect(C_ENDWHILESym)
      Expect(C_PointSym)
      _out_()
   end
   def LoopStatement()
      _in_()
      Expect(C_LOOPSym)
      if @sym==C_ATSym
         Get()
         if @sym==C_identifierSym
            if @sym==C_identifierSym
               Get()
               if @sym==C_INTOSym||@sym==C_ASSIGNINGSym||@sym==C_REFERENCESym||@sym==C_TRANSPORTINGSym
                  case @sym

                  when C_INTOSym
                     Get()
                     Expect(C_identifierSym)

                  when C_ASSIGNINGSym
                     Get()
                     Expect(C_LessSym)
                     Expect(C_identifierSym)
                     Expect(C_GreaterSym)
                     if @sym==C_CASTINGSym
                        Get()
                     end


                  when C_REFERENCESym
                     Get()
                     Expect(C_INTOSym)
                     Expect(C_identifierSym)

                  when C_TRANSPORTINGSym
                     Get()
                     Expect(C_NOSym)
                     Expect(C_FIELDSSym)

                  else
                     GenError(733)

                  end

               end

               if @sym==C_USINGSym
                  Get()
                  Expect(C_KEYSym)
                  if @sym==C_identifierSym
                     Get()
                  else
                     if @sym==C_LparenSym
                        Get()
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     else
                        GenError(734)
                     end

                  end

               end

               if @sym==C_FROMSym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_TOSym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_WHERESym
                  Get()
                  Expression()
               end

               if @sym==C_GROUPSym
                  GroupBy()
               end

            else
               if 1
                  Get()
                  if @sym==C_VERSIONSym
                     Get()
                     Expect(C_stringD1Sym)
                  end

               else
                  GenError(735)
               end

            end

         else
            if @sym==C_GROUPSym
               Get()
               Expect(C_identifierSym)
               case @sym

               when C_INTOSym
                  Get()
                  Expect(C_identifierSym)

               when C_ASSIGNINGSym
                  Get()
                  Expect(C_LessSym)
                  Expect(C_identifierSym)
                  Expect(C_GreaterSym)
                  if @sym==C_CASTINGSym
                     Get()
                  end


               when C_REFERENCESym
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)

               when C_TRANSPORTINGSym
                  Get()
                  Expect(C_NOSym)
                  Expect(C_FIELDSSym)

               else
                  GenError(736)

               end

               if @sym==C_WHERESym
                  Get()
                  Expression()
               end

               if @sym==C_GROUPSym
                  GroupBy()
               end

            else
               if @sym==C_SCREENSym
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)
               else
                  GenError(737)
               end

            end

         end

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      Expect(C_ENDLOOPSym)
      Expect(C_PointSym)
      _out_()
   end
   def CaseStatement()
      _in_()
      Expect(C_CASESym)
      Expression()
      Expect(C_PointSym)
      while (@sym==C_WHENSym)
         Get()
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
            while (@sym==C_ORSym)
               Get()
               Expression()
            end

         else
            if @sym==C_OTHERSSym
               Get()
            else
               GenError(738)
            end

         end

         Expect(C_PointSym)
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Statement()
         end

      end

      Expect(C_ENDCASESym)
      Expect(C_PointSym)
      _out_()
   end
   def stCALL()
      _in_()
      Expect(C_CALLSym)
      case @sym

      when C_PointSym,
         C_FUNCTIONSym,
         C_PARAMETERMinusTABLESym,
         C_EXCEPTIONMinusTABLESym
         CallFunction()

      when C_BADISym
         CallBadi()

      when C_DIALOGSym
         CallDialog()

      when C_CUSTOMERMinusFUNCTIONSym
         CallCustomerFunction()

      when C_DATABASESym
         CallDatabaseProcedure()

      when C_METHODSym
         CallMethod()

      when C_SCREENSym
         CallScreen()

      when C_SELECTIONMinusSCREENSym
         CallSelectionScreen()

      when C_WITHOUTSym,
         C_TRANSACTIONSym
         CallTransation()

      when EOF_Sym,
         C_identifierSym,
         C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_spaceD1Sym,
         C_LparenSym,
         C_LessSym,
         C_ENDFUNCTIONSym,
         C_ENDSELECTSym,
         C_FIELDSSym,
         C_StarSym,
         C_USINGSym,
         C_TildeSym,
         C_ONSym,
         C_ORDERSym,
         C_INTOSym,
         C_APPENDINGSym,
         C_TABLESym,
         C_SELECTSym,
         C_FORSym,
         C_UPDATESym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_OFFSETSym,
         C_UPSym,
         C_BYPASSINGSym,
         C_CONNECTIONSym,
         C_PlusSym,
         C_WITHSym,
         C_TABLESSym,
         C_MOVESym,
         C_MOVEMinusCORRESPONDINGSym,
         C_APPENDSym,
         C_INITIALSym,
         C_CONCATENATESym,
         C_SEARCHSym,
         C_ATSym,
         C_RAISESym,
         C_MESSAGESym,
         C_LOOPSym,
         C_ENDLOOPSym,
         C_DATASym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_WRITESym,
         C_SlashSym,
         C_FORMATSym,
         C_CONTINUESym,
         C_CASESym,
         C_WHENSym,
         C_ENDCASESym,
         C_AUTHORITYMinusCHECKSym,
         C_DELETESym,
         C_DOSym,
         C_ENDDOSym,
         C_EVENTSSym,
         C_MODIFYSym,
         C_ENDONSym,
         C_OPENSym,
         C_INPUTSym,
         C_POSITIONSym,
         C_FETCHSym,
         C_PROVIDESym,
         C_ENDPROVIDESym,
         C_READSym,
         C_MAXIMUMSym,
         C_SORTSym,
         C_SUBMITSym,
         C_PROGRAMSym,
         C_NOTSym,
         C_FREESym,
         C_PARAMETERSSym,
         C_RETURNSym,
         C_TRYSym,
         C_CATCHSym,
         C_CLEANUPSym,
         C_ENDTRYSym,
         C_TYPESSym,
         C_forSym,
         C_SETSym,
         C_WHILESym,
         C_ENDWHILESym,
         C_IFSym,
         C_ELSEIFSym,
         C_ELSESym,
         C_ENDIFSym,
         C_returnSym,
         C_CLASSSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_CREATESym,
         C_ENDCLASSSym,
         C_ENDMETHODSym,
         C_METHODSSym,
         C_CLASSMinusMETHODSSym,
         C_ADDSym,
         C_ADDMinusCORRESPONDINGSym,
         C_ALIASESSym,
         C_ASSERTSym,
         C_ASSIGNSym,
         C_ENDATSym,
         C_BACKSym,
         C_BREAKMinusPOINTSym,
         C_CALLSym,
         C_SKIPSym,
         C_TRANSFORMATIONSym,
         C_AREASym,
         C_CHECKSym,
         C_CLASSMinusDATASym,
         C_CLASSMinusEVENTSSym,
         C_CLASSMinusPOOLSym,
         C_CLEARSym,
         C_CLOSESym,
         C_COLLECTSym,
         C_COMMITSym,
         C_WAITSym,
         C_COMPUTESym,
         C_CONDENSESym,
         C_CONTROLSSym,
         C_TABSTRIPSym,
         C_CONVERTSym,
         C_DEMANDSym,
         C_DESCRIBESym,
         C_DETAILSym,
         C_DIVIDESym,
         C_DIVIDEMinusCORRESPONDINGSym,
         C_EDITORMinusCALLSym,
         C_ENDMinusOFMinusPAGESym,
         C_ENDMinusOFMinusSELECTIONSym,
         C_EXITSym,
         C_EXPORTSym,
         C_EXTRACTSym,
         C_FIELDMinusGROUPSSym,
         C_FIELDMinusSYMBOLSSym,
         C_FINDSym,
         C_REGEXSym,
         C_FUNCTIONMinusPOOLSym,
         C_GENERATESym,
         C_INCLUDESym,
         C_GETSym,
         C_HIDESym,
         C_IMPORTSym,
         C_INFOTYPESSym,
         C_INITIALIZATIONSym,
         C_INSERTSym,
         C_INTERFACESym,
         C_INTERFACEMinusPOOLSym,
         C_INTERFACESSym,
         C_LEAVESym,
         C_LOADMinusOFMinusPROGRAMSym,
         C_LOCALSym,
         C_LOGMinusPOINTSym,
         C_MINIMUMSym,
         C_MODULESym,
         C_ENDMODULESym,
         C_MULTIPLYSym,
         C_MULTIPLYMinusCORRESPONDINGSym,
         C_NEWMinusLINESym,
         C_NEWMinusPAGESym,
         C_NEWMinusSECTIONSym,
         C_NODESSym,
         C_OVERLAYSym,
         C_PACKSym,
         C_PERFORMSym,
         C_ROLLBACKSym,
         C_PRINTMinusCONTROLSym,
         C_RANGESSym,
         C_RECEIVESym,
         C_REFRESHSym,
         C_REJECTSym,
         C_REPLACESym,
         C_RESERVESym,
         C_RESUMESym,
         C_RETRYSym,
         C_SCROLLSym,
         C_SELECTMinusOPTIONSSym,
         C_SHIFTSym,
         C_STOPSym,
         C_SUBTRACTSym,
         C_SUBTRACTMinusCORRESPONDINGSym,
         C_SUMSym,
         C_SUMMARYSym,
         C_SUMMINGSym,
         C_SUPPLYSym,
         C_SUPPRESSSym,
         C_SYNTAXMinusCHECKSym,
         C_TESTMinusINJECTIONSym,
         C_ENDMinusTESTMinusINJECTIONSym,
         C_TESTMinusSEAMSym,
         C_ENDMinusTESTMinusSEAMSym,
         C_TOPMinusOFMinusPAGESym,
         C_TRANSFERSym,
         C_TRANSLATESym,
         C_TRUNCATESym,
         C_TYPEMinusPOOLSym,
         C_TYPEMinusPOOLSSym,
         C_ULINESym,
         C_UNASSIGNSym,
         C_UNPACKSym,
         C_WINDOWSym,
         C_SPLITSym,
         C_AndSym,
         C_MinusSym,
         C_PlusPlusSym,
         C_MinusMinusSym,
         C_BangSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         CallTransformation()

      else
         GenError(739)

      end

      _out_()
   end
   def MethodStatement()
      _in_()
      Expect(C_METHODSym)
      Expect(C_identifierSym)
      if @sym==C_TildeSym
         Get()
         Expect(C_identifierSym)
      end


      fname = prevString
      if current_scope.is_a?(ClassDef)
         classdef = current_scope

      end;

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      Expect(C_ENDMETHODSym)


      p "src:#{src}"
      if classdef
         classdef.add_method(fname, "()",[], src ,"")
      end ;

      Expect(C_PointSym)
      _out_()
   end
   def MethodsStatement()
      _in_()
      if @sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym
         if @sym==C_METHODSSym
            Get()
         else
            if @sym==C_CLASSMinusMETHODSSym
               Get()
            else
               GenError(740)
            end

         end

         Expect(C_identifierSym)
         if @sym==C_TildeSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym>=C_ABSTRACTSym&&@sym<=C_FINALSym
            if @sym==C_ABSTRACTSym
               Get()
            else
               if @sym==C_FINALSym
                  Get()
               else
                  GenError(741)
               end

            end

         end

         if @sym==C_FORSym
            Get()
            Expect(C_TESTINGSym)
         else
            if @sym==C_FINALSym||@sym==C_REDEFINITIONSym
               if @sym==C_FINALSym
                  Get()
               end

               Expect(C_REDEFINITIONSym)
            else
               if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym==C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_MESSAGESym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym==C_DEFAULTSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  if @sym==C_DEFAULTSym
                     Get()
                     if @sym==C_IGNORESym
                        Get()
                     else
                        if @sym==C_FAILSym
                           Get()
                        else
                           GenError(742)
                        end

                     end

                  end

                  if @sym==C_FORSym
                     Get()
                     Expect(C_EVENTSym)
                     Expect(C_identifierSym)
                     Expect(C_OFSym)
                     Expect(C_identifierSym)
                  end

                  if @sym==C_IMPORTINGSym
                     Get()
                     while (@sym==C_identifierSym||@sym==C_REFERENCESym||@sym==C_VALUESym)
                        if @sym==C_VALUESym
                           Get()
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)
                           Expect(C_RparenSym)
                        else
                           if @sym==C_REFERENCESym
                              Get()
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                           else
                              if @sym==C_identifierSym
                                 Get()
                              else
                                 GenError(743)
                              end

                           end

                        end

                        Typing()
                        if @sym==C_DEFAULTSym||@sym==C_OPTIONALSym
                           if @sym==C_OPTIONALSym
                              Get()
                           else
                              if @sym==C_DEFAULTSym
                                 Get()
                              else
                                 GenError(744)
                              end

                           end

                           Expect(C_identifierSym)
                        end

                     end

                     if @sym==C_PREFERREDSym
                        Get()
                        Expect(C_PARAMETERSym)
                        Expect(C_identifierSym)
                     end

                  end

                  if @sym==C_EXPORTINGSym
                     Get()
                     while (@sym==C_identifierSym||@sym==C_REFERENCESym||@sym==C_TYPESym||@sym==C_LIKESym||@sym==C_VALUESym)
                        while (@sym==C_identifierSym||@sym==C_REFERENCESym||@sym==C_VALUESym)
                           if @sym==C_VALUESym
                              Get()
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                           else
                              if @sym==C_REFERENCESym
                                 Get()
                                 Expect(C_LparenSym)
                                 Expect(C_identifierSym)
                                 Expect(C_RparenSym)
                              else
                                 if @sym==C_identifierSym
                                    Get()
                                 else
                                    GenError(745)
                                 end

                              end

                           end

                        end

                        Typing()
                     end

                  end

                  if @sym==C_CHANGINGSym
                     Get()
                     while (@sym==C_identifierSym||@sym==C_REFERENCESym||@sym==C_VALUESym)
                        if @sym==C_VALUESym
                           Get()
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)
                           Expect(C_RparenSym)
                        else
                           if @sym==C_REFERENCESym
                              Get()
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                           else
                              if @sym==C_identifierSym
                                 Get()
                              else
                                 GenError(746)
                              end

                           end

                        end

                        Typing()
                        if @sym==C_DEFAULTSym||@sym==C_OPTIONALSym
                           if @sym==C_OPTIONALSym
                              Get()
                           else
                              if @sym==C_DEFAULTSym
                                 Get()
                              else
                                 GenError(747)
                              end

                           end

                           Expect(C_identifierSym)
                        end

                     end

                  end

                  if @sym==C_RETURNINGSym
                     Get()
                     while (@sym==C_VALUESym)
                        Get()
                        Expect(C_LparenSym)
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     end

                     Typing()
                  end

                  if @sym==C_RAISINGSym||@sym==C_EXCEPTIONSSym
                     if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                        while (@sym==C_RAISINGSym)
                           Get()
                           if @sym==C_RESUMABLESym
                              Get()
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                           else
                              if @sym==C_identifierSym
                                 Get()
                              else
                                 GenError(748)
                              end

                           end

                           while (@sym==C_identifierSym||@sym==C_RESUMABLESym)
                              if @sym==C_RESUMABLESym
                                 Get()
                                 Expect(C_LparenSym)
                                 Expect(C_identifierSym)
                                 Expect(C_RparenSym)
                              else
                                 if @sym==C_identifierSym
                                    Get()
                                 else
                                    GenError(749)
                                 end

                              end

                           end

                        end

                     else
                        if @sym==C_EXCEPTIONSSym
                           while (@sym==C_EXCEPTIONSSym)
                              Get()
                              Expect(C_identifierSym)
                              while (@sym==C_identifierSym)
                                 Get()
                              end

                           end

                        else
                           GenError(750)
                        end

                     end

                  end

               else
                  GenError(751)
               end

            end

         end

      else
         if @sym==C_PointSym
            Get()
         else
            GenError(752)
         end

      end

      _out_()
   end
   def MessasgeStatement()
      _in_()
      Expect(C_MESSAGESym)
      while (@sym==C_identifierSym||@sym==C_stringD1Sym||@sym==C_IDSym)
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)
            Expect(C_TYPESym)
            Expect(C_identifierSym)
            Expect(C_NUMBERSym)
            Expect(C_numberSym)
         else
            if @sym==C_stringD1Sym
               Get()
               Expect(C_TYPESym)
               Expect(C_identifierSym)
            else
               if @sym==C_identifierSym
                  Get()
                  if @sym==C_LparenSym||@sym==C_TYPESym
                     if @sym==C_LparenSym
                        Get()
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     else
                        if @sym==C_TYPESym
                           Get()
                           Expect(C_identifierSym)
                        else
                           GenError(753)
                        end

                     end

                  end

               else
                  GenError(754)
               end

            end

         end

      end

      if @sym==C_INTOSym||@sym==C_DISPLAYSym||@sym==C_RAISINGSym
         if @sym==C_PointSym||@sym==C_WITHSym||@sym==C_DISPLAYSym||@sym==C_RAISINGSym
            if @sym==C_DISPLAYSym
               Get()
               Expect(C_LIKESym)
               Expect(C_identifierSym)
            end

            if @sym==C_RAISINGSym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_INTOSym
               Get()
               Expect(C_stringD1Sym)
            else
               GenError(755)
            end

         end

      end

      if @sym==C_WITHSym
         Get()
         Expect(C_identifierSym)
         while (@sym==C_identifierSym)
            Get()
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def SearchStatement()
      _in_()
      Expect(C_SEARCHSym)
      Expect(C_identifierSym)
      Expect(C_FORSym)
      Expect(C_stringD1Sym)
      if @sym==C_INSym
         Get()
         if @sym==C_CHARACTERSym
            Get()
         else
            if @sym==C_BYTESym
               Get()
            else
               GenError(756)
            end

         end

         Expect(C_MODESym)
      end

      if @sym==C_STARTINGSym
         Get()
         Expect(C_ATSym)
         Expression()
      end

      if @sym==C_ENDINGSym
         Get()
         Expect(C_ATSym)
         Expression()
      end

      if @sym==C_ABBREVIATEDSym
         Get()
      end

      if @sym==C_ANDSym
         Get()
         Expect(C_MARKSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stAPPEND()
      _in_()
      Expect(C_APPENDSym)
      if @sym==C_INITIALSym
         Get()
         Expect(C_LINESym)
      else
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()

            #'LINES' or idf;

            if @sym==C_OFSym
               Get()
               Expect(C_identifierSym)
               if @sym==C_FROMSym
                  Get()
                  Expect(C_numberSym)
                  if @sym==C_TOSym
                     Get()
                     Expect(C_numberSym)
                  end

               end

               if @sym==C_USINGSym
                  Get()
                  Expect(C_KEYSym)
                  Expect(C_stringD1Sym)
               end

            end

         else
            GenError(757)
         end

      end

      Expect(C_TOSym)
      Expect(C_identifierSym)
      while (@sym==C_LbrackSym)
         Get()
         Expect(C_RbrackSym)
      end

      if @sym==C_SORTEDSym
         Get()
         Expect(C_BYSym)
         Expect(C_stringD1Sym)
      end

      if @sym==C_ASSIGNINGSym||@sym==C_REFERENCESym
         if @sym==C_ASSIGNINGSym
            Get()
            Expect(C_LessSym)
            Expect(C_identifierSym)
            Expect(C_GreaterSym)
            if @sym==C_CASTINGSym
               Get()
            end

         else
            if @sym==C_REFERENCESym
               Get()
               Expect(C_INTOSym)
               Expect(C_identifierSym)
            else
               GenError(758)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSPLIT()
      _in_()
      Expect(C_SPLITSym)
      Expect(C_identifierSym)
      Expect(C_ATSym)
      Expression()
      Expect(C_INTOSym)
      if @sym==C_TABLESym
         Get()
         Expect(C_identifierSym)
      else
         if @sym==C_identifierSym
            Get()
            while (@sym==C_identifierSym)
               Get()
            end

         else
            GenError(759)
         end

      end

      if @sym==C_INSym
         Get()
         while (@sym>=C_CHARACTERSym&&@sym<=C_BYTESym)
            if @sym==C_CHARACTERSym
               Get()
            else
               if @sym==C_BYTESym
                  Get()
               else
                  GenError(760)
               end

            end

         end

         Expect(C_MODESym)
      end

      _out_()
   end
   def stRAISE()
      _in_()
      Expect(C_RAISESym)
      if @sym==C_EVENTSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_EXPORTINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

      else
         if @sym>=C_RESUMABLESym&&@sym<=C_EXCEPTIONSym
            if @sym==C_RESUMABLESym
               Get()
            end

            Expect(C_EXCEPTIONSym)
            if @sym==C_identifierSym||@sym==C_TYPESym
               if @sym==C_TYPESym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_WITHSym||@sym>=C_MESSAGESym&&@sym<=C_IDSym
                     if @sym==C_MESSAGESym
                        Get()
                        Expect(C_identifierSym)
                        Expect(C_LparenSym)
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     else
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_IDSym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                           while (@sym==C_IDSym)
                              Get()
                              Expect(C_identifierSym)
                              Expect(C_TYPESym)
                              Expect(C_identifierSym)
                              Expect(C_NUMBERSym)
                              Expression()
                           end

                           if @sym==C_WITHSym
                              Get()
                              Expect(C_identifierSym)
                              while (@sym==C_identifierSym)
                                 Get()
                              end

                           end

                        else
                           GenError(761)
                        end

                     end

                  end

                  if @sym==C_EXPORTINGSym
                     Get()
                     Expression()
                     while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                        Expression()
                     end

                  end

               else
                  if @sym==C_identifierSym
                     Get()
                  else
                     GenError(762)
                  end

               end

            end

         else
            if @sym==C_identifierSym
               Get()
            else
               GenError(763)
            end

         end

      end

      _out_()
   end
   def stCONSTANTS()
      _in_()
      Expect(C_CONSTANTSSym)
      Expect(C_identifierSym)
      if @sym==C_TYPESym
         TypeDes()
      else
         if @sym==C_LIKESym
            LikeDes()
         else
            GenError(764)
         end

      end

      Expect(C_VALUESym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_ISSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
         else
            if @sym==C_ISSym
               Get()
               Expect(C_INITIALSym)
            else
               GenError(765)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stMOVE()
      _in_()
      Expect(C_MOVESym)
      if @sym==C_EXACTSym
         Get()
      end

      Expression()
      if @sym==C_TOSym||@sym==C_QueryTOSym
         if @sym==C_TOSym
            Get()
         else
            if @sym==C_QueryTOSym
               Get()
            else
               GenError(766)
            end

         end

      end

      Expression()
      if @sym==C_PERCENTAGESym
         Get()
         Expression()
         if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym
            if @sym==C_LEFTSym
               Get()
            else
               if @sym==C_RIGHTSym
                  Get()
               else
                  GenError(767)
               end

            end

         end

      end

      _out_()
   end
   def stMOVE_CORRESPONDING()
      _in_()
      Expect(C_MOVEMinusCORRESPONDINGSym)
      if @sym==C_EXACTSym
         Get()
      end

      if @sym==C_identifierSym
         Get()
         Expect(C_TOSym)
         Expect(C_identifierSym)
         if @sym==C_EXPANDINGSym
            Get()
            Expect(C_NESTEDSym)
            Expect(C_TABLESSym)
         end

      else
         if 1
            Get()
            Expect(C_TOSym)
            Expect(C_identifierSym)
            if @sym==C_EXPANDINGSym
               Get()
               Expect(C_NESTEDSym)
               Expect(C_TABLESSym)
            end

            if @sym==C_KEEPINGSym
               Get()
               Expect(C_TARGETSym)
               Expect(C_identifierSym)

               is('LINES');

            end

         else
            GenError(768)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stWITH()
      _in_()
      Expect(C_WITHSym)
      Withline()
      while (@sym==C_PlusSym)
         Withline()
      end

      Expect(C_ENDWITHSym)
      _out_()
   end
   def stTABLES()
      _in_()
      Expect(C_TABLESSym)
      if @sym==C_StarSym
         Get()
      end

      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stAUTHORITY_CHECK()
      _in_()
      Expect(C_AUTHORITYMinusCHECKSym)
      Expect(C_OBJECTSym)
      Expect(C_identifierSym)
      if @sym==C_FORSym
         Get()
         Expect(C_USERSym)
         Expect(C_stringD1Sym)
      end

      AUTHORITY_CHECK_ITEM()
      while (@sym==C_IDSym)
         AUTHORITY_CHECK_ITEM()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stDELETE()
      _in_()
      Expect(C_DELETESym)
      if @sym==C_DATASETSym
         Get()
         Expect(C_identifierSym)
      else
         if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_PointSym||@sym==C_FROMSym||@sym==C_CLIENTSym||@sym==C_ORDERSym||@sym==C_TABLESym||@sym==C_WHERESym||@sym==C_UPSym||@sym==C_CONNECTIONSym
            if @sym==C_PointSym||@sym==C_FROMSym||@sym==C_CLIENTSym||@sym==C_ORDERSym||@sym==C_WHERESym||@sym==C_UPSym||@sym==C_CONNECTIONSym
               if @sym==C_FROMSym
                  Get()
                  Expression()
                  if @sym==C_USINGSym
                     Get()
                     Expect(C_CLIENTSym)
                     Expect(C_identifierSym)
                  end

               else
                  if @sym==C_PointSym||@sym==C_CLIENTSym||@sym==C_ORDERSym||@sym==C_WHERESym||@sym==C_UPSym||@sym==C_CONNECTIONSym
                     if @sym==C_CLIENTSym
                        Get()
                        Expect(C_SPECIFIEDSym)
                     end

                     if @sym==C_CONNECTIONSym
                        Get()
                        if @sym==C_LparenSym
                           Get()
                           Expression()
                           Expect(C_RparenSym)
                        else
                           if @sym==C_identifierSym
                              Get()
                           else
                              GenError(769)
                           end

                        end

                     end

                     if @sym==C_WHERESym
                        Get()
                        Expression()
                     end

                     if @sym==C_ORDERSym
                        Get()
                        Expect(C_BYSym)
                        Expect(C_identifierSym)
                        while (@sym==C_CommaSym)
                           Get()
                           Expect(C_identifierSym)
                        end

                        if @sym==C_OFFSETSym
                           Get()
                           Expect(C_numberSym)
                        end

                     end

                     if @sym==C_UPSym
                        Get()
                        Expect(C_TOSym)
                        Expect(C_numberSym)
                        Expect(C_ROWSSym)
                     end

                  else
                     GenError(770)
                  end

               end

            else
               if @sym==C_TABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  if @sym==C_identifierSym||@sym==C_LparenSym
                     if @sym==C_identifierSym
                        Get()
                     else
                        if @sym==C_LparenSym
                           Get()
                           Expression()
                           Expect(C_RparenSym)
                        else
                           GenError(771)
                        end

                     end

                     if @sym==C_CLIENTSym
                        Get()
                        Expect(C_SPECIFIEDSym)
                     end

                     if @sym==C_CONNECTIONSym
                        Get()
                        if @sym==C_LparenSym
                           Get()
                           Expression()
                           Expect(C_RparenSym)
                        else
                           if @sym==C_identifierSym
                              Get()
                           else
                              GenError(772)
                           end

                        end

                     end

                     Expect(C_FROMSym)
                     Expect(C_identifierSym)
                  else
                     GenError(773)
                  end

               end

            end

         else
            if @sym==C_ADJACENTSym
               if @sym==C_identifierSym||@sym==C_TABLESym
                  if @sym==C_TABLESym
                     Get()
                     Expect(C_identifierSym)
                     if @sym==C_FROMSym
                        Get()
                        Expect(C_identifierSym)
                        if @sym==C_USINGSym
                           Get()
                           Expect(C_KEYSym)
                           if @sym==C_identifierSym
                              Get()
                           else
                              if @sym==C_LparenSym
                                 Get()
                                 Expect(C_identifierSym)
                                 Expect(C_RparenSym)
                              else
                                 GenError(774)
                              end

                           end

                        end

                     else
                        if @sym==C_WITHSym
                           Get()
                           Expect(C_TABLESym)
                           Expect(C_KEYSym)
                           if @sym==C_identifierSym||@sym==C_LparenSym
                              if @sym==C_identifierSym
                                 Get()
                              else
                                 if @sym==C_LparenSym
                                    Get()
                                    Expect(C_identifierSym)
                                    Expect(C_RparenSym)
                                 else
                                    GenError(775)
                                 end

                              end

                              Expect(C_COMPONENTSSym)
                           end

                           if @sym==C_LparenSym
                              Get()
                           end

                           Expect(C_identifierSym)
                           if @sym==C_RparenSym
                              Get()
                           end

                           Expect(C_EqualSym)
                           Expect(C_identifierSym)
                        else
                           GenError(776)
                        end

                     end

                  else
                     if @sym==C_identifierSym
                        Get()
                        if @sym==C_INDEXSym
                           Get()
                           Expect(C_identifierSym)
                        end

                        if @sym==C_USINGSym
                           Get()
                           Expect(C_KEYSym)
                           if @sym==C_LparenSym
                              Get()
                           end

                           Expect(C_identifierSym)
                           if @sym==C_RparenSym
                              Get()
                           end

                        end

                     else
                        GenError(777)
                     end

                  end

               else
                  if @sym==C_ADJACENTSym
                     if @sym==C_ADJACENTSym
                        Get()
                        Expect(C_DUPLICATESSym)
                        Expect(C_FROMSym)
                        Expect(C_identifierSym)
                        if @sym==C_USINGSym
                           Get()
                           Expect(C_KEYSym)
                           if @sym==C_LparenSym
                              Get()
                           end

                           Expect(C_identifierSym)
                           if @sym==C_RparenSym
                              Get()
                           end

                        end

                        if @sym==C_ALLSym||@sym==C_COMPARINGSym
                           if @sym==C_COMPARINGSym
                              Get()
                              Expect(C_identifierSym)
                           else
                              if @sym==C_ALLSym
                                 Get()
                                 Expect(C_FIELDSSym)
                              else
                                 GenError(778)
                              end

                           end

                        end

                     else
                        if @sym==C_identifierSym
                           Get()
                           if @sym==C_USINGSym
                              Get()
                              Expect(C_KEYSym)
                              if @sym==C_LparenSym
                                 Get()
                              end

                              Expect(C_identifierSym)
                              if @sym==C_RparenSym
                                 Get()
                              end

                           end

                           if @sym==C_FROMSym
                              Get()
                              Expect(C_identifierSym)
                           end

                           if @sym==C_TOSym
                              Get()
                              Expect(C_identifierSym)
                           end

                           if @sym==C_WHERESym
                              Get()
                              if @sym==C_LparenSym
                                 Get()
                              end

                              Expression()
                              if @sym==C_RparenSym
                                 Get()
                              end

                           end

                        else
                           GenError(779)
                        end

                     end

                  else
                     if @sym==C_FROMSym
                        Get()
                        if @sym==C_MEMORYSym
                           Get()
                           Expect(C_IDSym)
                           Expect(C_numberSym)
                        else
                           if @sym==C_DATABASESym
                              Get()
                              Expect(C_identifierSym)
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                              if @sym==C_CLIENTSym
                                 Get()
                                 Expect(C_identifierSym)
                              end

                              Expect(C_IDSym)
                              Expect(C_numberSym)
                           else
                              if @sym==C_SHAREDSym
                                 Get()
                                 if @sym==C_MEMORYSym
                                    Get()
                                    Expect(C_identifierSym)
                                    Expect(C_LparenSym)
                                    Expect(C_identifierSym)
                                    Expect(C_RparenSym)
                                    if @sym==C_CLIENTSym
                                       Get()
                                       Expect(C_identifierSym)
                                    end

                                    Expect(C_IDSym)
                                    Expect(C_numberSym)
                                 else
                                    if @sym==C_BUFFERSym
                                       Get()
                                       Expect(C_identifierSym)
                                       Expect(C_LparenSym)
                                       Expect(C_identifierSym)
                                       Expect(C_RparenSym)
                                       if @sym==C_CLIENTSym
                                          Get()
                                          Expect(C_identifierSym)
                                       end

                                       Expect(C_IDSym)
                                       Expect(C_numberSym)
                                    else
                                       GenError(780)
                                    end

                                 end

                              else
                                 GenError(781)
                              end

                           end

                        end

                     else
                        GenError(782)
                     end

                  end

               end

            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stEVENTS()
      _in_()
      Expect(C_EVENTSSym)
      Expect(C_identifierSym)
      if @sym==C_EXPORTINGSym
         Event_options()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stMODIFY()
      _in_()
      Expect(C_MODIFYSym)
      case @sym

      when C_identifierSym,
         C_TABLESym
         if @sym==C_identifierSym||@sym==C_TABLESym
            if @sym==C_identifierSym||@sym==C_TABLESym
               if @sym==C_TABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  if @sym==C_identifierSym
                     Get()
                     Expect(C_INDEXSym)
                     Expect(C_identifierSym)
                     if @sym==C_USINGSym
                        Get()
                        Expect(C_KEYSym)
                        if @sym==C_LparenSym
                           Get()
                        end

                        Expect(C_identifierSym)
                        if @sym==C_RparenSym
                           Get()
                        end

                     end

                  else
                     GenError(783)
                  end

               end

            else
               if 1
                  Get()
                  if @sym==C_USINGSym
                     Get()
                     Expect(C_KEYSym)
                     Expect(C_identifierSym)
                  end

                  Expect(C_FROMSym)
                  Expect(C_identifierSym)
                  if @sym==C_TRANSPORTINGSym
                     Get()
                     Expect(C_identifierSym)
                  end

                  if @sym==C_ASSIGNINGSym||@sym==C_REFERENCESym
                     if @sym==C_ASSIGNINGSym
                        Get()
                        Expect(C_LessSym)
                        Expect(C_identifierSym)
                        Expect(C_GreaterSym)
                        if @sym==C_CASTINGSym
                           Get()
                        end

                     else
                        if @sym==C_REFERENCESym
                           Get()
                           Expect(C_INTOSym)
                           Expect(C_identifierSym)
                        else
                           GenError(784)
                        end

                     end

                  end

               else
                  GenError(785)
               end

            end

         else
            if 1
               Get()
               Expect(C_FROMSym)
               Expect(C_identifierSym)
               if @sym==C_USINGSym
                  Get()
                  Expect(C_KEYSym)
                  if @sym==C_LparenSym
                     Get()
                  end

                  Expect(C_identifierSym)
                  if @sym==C_RparenSym
                     Get()
                  end

               end

               Expect(C_TRANSPORTINGSym)
               Expect(C_identifierSym)
               Expect(C_WHERESym)
               Expect(C_LparenSym)
               Expression()
               Expect(C_RparenSym)
            else
               GenError(786)
            end

         end


      when C_LINESym,
         C_CURRENTSym
         if @sym==C_LINESym
            Get()
            Expect(C_numberSym)
            if @sym==C_OFSym||@sym==C_CURRENTSym
               if @sym==C_OFSym
                  Get()
                  Expect(C_PAGESym)
                  Expect(C_numberSym)
               else
                  if @sym==C_CURRENTSym
                     Get()
                     Expect(C_PAGESym)
                  else
                     GenError(787)
                  end

               end

            end

            if @sym==C_INDEXSym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_CURRENTSym
               Get()
               Expect(C_LINESym)
            else
               GenError(788)
            end

         end

         if @sym==C_LINESym
            Get()
            Expect(C_VALUESym)
            Expect(C_FROMSym)
            Expect(C_identifierSym)
         end

         if @sym==C_FIELDSym
            Get()
            Expect(C_VALUESym)
            Expect(C_identifierSym)
            if @sym==C_FROMSym
               Get()
               Expect(C_identifierSym)
            end

            while (@sym==C_identifierSym)
               Get()
               if @sym==C_FROMSym
                  Get()
                  Expect(C_identifierSym)
               end

            end

         end

         if @sym==C_LINESym
            Get()
            Expect(C_FORMATSym)
            Format_options()
         end

         if @sym==C_FIELDSym
            Get()
            Expect(C_FORMATSym)
            Expect(C_identifierSym)
            Format_options()
            while (@sym==C_identifierSym)
               Get()
               Format_options()
            end

         end


      when C_SCREENSym
         Get()
         Expect(C_FROMSym)
         Expect(C_identifierSym)

      when C_LparenSym
         if @sym==C_identifierSym
            Get()
         else
            if @sym==C_LparenSym
               Get()
               Expression()
               Expect(C_RparenSym)
            else
               GenError(789)
            end

         end

         if @sym==C_FROMSym||@sym==C_USINGSym||@sym==C_CONNECTIONSym
            if @sym==C_USINGSym
               Get()
               Expect(C_CLIENTSym)
               Expect(C_identifierSym)
            end

         else
            if @sym==C_CLIENTSym
               if @sym==C_CLIENTSym
                  Get()
                  Expect(C_SPECIFIEDSym)
               end

            end

         end

         if @sym==C_CONNECTIONSym
            Get()
            if @sym==C_LparenSym
               Get()
               Expression()
               Expect(C_RparenSym)
            else
               if @sym==C_identifierSym
                  Get()
               else
                  GenError(790)
               end

            end

         end

         Expect(C_FROMSym)
         if @sym==C_identifierSym
            Get()
         else
            if @sym==C_TABLESym
               Get()
               Expect(C_identifierSym)
            else
               GenError(791)
            end

         end


      else
         GenError(792)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stON()
      _in_()
      Expect(C_ONSym)
      Expect(C_CHANGESym)
      Expect(C_OFSym)
      Expect(C_identifierSym)
      while (@sym==C_ORSym)
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      Statements()
      Expect(C_ENDONSym)
      Expect(C_PointSym)
      _out_()
   end
   def stOPEN()
      _in_()
      Expect(C_OPENSym)
      if @sym==C_CURSORSym
         Get()
         if @sym==C_WITHSym
            Get()
            Expect(C_HOLDSym)
         end

         Expect(C_AtSym)
         Expect(C_identifierSym)
         Expect(C_FORSym)
         if @sym==C_WITHSym
            Get()
            Expect(C_PlusSym)
            Expect(C_identifierSym)
            Expect(C_ASSym)
            Expect(C_identifierSym)
            while (@sym==C_CommaSym)
               Get()
               Expect(C_PlusSym)
               Expect(C_identifierSym)
               Expect(C_ASSym)
               Expect(C_identifierSym)
            end

         end

         Expect(C_SELECTSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
            while (@sym==C_CommaSym)
               Get()
               Expression()
            end

            Expect(C_FROMSym)
            Expect(C_identifierSym)
            while (@sym==C_CommaSym)
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_FROMSym
               Get()
               Expect(C_identifierSym)
               while (@sym==C_CommaSym)
                  Get()
                  Expect(C_identifierSym)
               end

               Expect(C_FIELDSSym)
               Expression()
               while (@sym==C_CommaSym)
                  Get()
                  Expression()
               end

            else
               GenError(793)
            end

         end

         if @sym==C_FORSym||@sym==C_WHERESym
            if @sym==C_FORSym
               Get()
               Expect(C_ALLSym)
               Expect(C_ENTRIESSym)
               Expect(C_INSym)
               Expect(C_identifierSym)
            end

            Expect(C_WHERESym)
            SQLCondition()
         end

         if @sym==C_GROUPSym
            GroupBy()
         end

         if @sym==C_HAVINGSym
            Get()
            SQLCondition()
         end

         if @sym==C_ORDERSym
            Get()
            Expect(C_BYSym)
            Expect(C_identifierSym)
            while (@sym==C_CommaSym)
               Get()
               Expect(C_identifierSym)
            end

         end

         if @sym==C_OFFSETSym
            Get()
            Expect(C_numberSym)
         end

         if @sym==C_UPSym
            Get()
            Expect(C_TOSym)
            Expect(C_numberSym)
            Expect(C_ROWSSym)
         end

         if @sym==C_BYPASSINGSym
            Get()
            Expect(C_BUFFERSym)
         end

         if @sym==C_LparenSym||@sym==C_CONNECTIONSym
            if @sym==C_CONNECTIONSym
               Get()
               Expect(C_identifierSym)
            else
               if @sym==C_LparenSym
                  Get()
                  Expression()
                  Expect(C_RparenSym)
               else
                  GenError(794)
               end

            end

         end

      else
         if @sym==C_DATASETSym
            Get()
            Expect(C_identifierSym)
            Expect(C_FORSym)
            case @sym

            when C_INPUTSym
               Get()

            when C_OUTPUTSym
               Get()

            when C_APPENDINGSym
               Get()

            when C_UPDATESym
               Get()

            else
               GenError(795)

            end

            Expect(C_INSym)
            if @sym==C_BINARYSym
               Get()
               Expect(C_MODESym)
            else
               if @sym==C_TEXTSym
                  Get()
                  Expect(C_MODESym)
                  Expect(C_ENCODINGSym)
                  if @sym==C_DEFAULTSym
                     Get()
                  else
                     if @sym==C_UTFMinusD8Sym
                        Get()
                        if @sym==C_WITHSym||@sym==C_SKIPPINGSym
                           if @sym==C_SKIPPINGSym
                              Get()
                           else
                              if @sym==C_WITHSym
                                 Get()
                                 Expect(C_BYTEMinusORDERSym)
                                 Expect(C_MARKSym)
                              else
                                 GenError(796)
                              end

                           end

                        end

                     else
                        if @sym==C_NONMinusUNICODESym
                           Get()
                        else
                           GenError(797)
                        end

                     end

                  end

                  if @sym==C_WITHSym
                     Get()
                     case @sym

                     when C_NATIVESym
                        Get()

                     when C_SMARTSym
                        Get()

                     when C_UNIXSym
                        Get()

                     when C_WINDOWSSym
                        Get()

                     else
                        GenError(798)

                     end

                     Expect(C_LINEFEEDSym)
                  end

               else
                  if @sym==C_LEGACYSym
                     Get()
                     if @sym==C_BINARYSym
                        Get()
                        Expect(C_MODESym)
                        if @sym>=C_BIGSym&&@sym<=C_LITTLESym
                           if @sym==C_BIGSym
                              Get()
                           else
                              if @sym==C_LITTLESym
                                 Get()
                              else
                                 GenError(799)
                              end

                           end

                           Expect(C_ENDIANSym)
                        end

                        if @sym==C_CODESym
                           Get()
                           Expect(C_PAGESym)
                           Expect(C_identifierSym)
                        end

                     else
                        if @sym==C_TEXTSym
                           Get()
                           Expect(C_MODESym)
                           if @sym>=C_BIGSym&&@sym<=C_LITTLESym
                              if @sym==C_BIGSym
                                 Get()
                              else
                                 if @sym==C_LITTLESym
                                    Get()
                                 else
                                    GenError(800)
                                 end

                              end

                              Expect(C_ENDIANSym)
                           end

                           if @sym==C_CODESym
                              Get()
                              Expect(C_PAGESym)
                              Expect(C_identifierSym)
                           end

                           if @sym==C_WITHSym
                              Get()
                              case @sym

                              when C_NATIVESym
                                 Get()

                              when C_SMARTSym
                                 Get()

                              when C_UNIXSym
                                 Get()

                              when C_WINDOWSSym
                                 Get()

                              else
                                 GenError(801)

                              end

                              Expect(C_LINEFEEDSym)
                           end

                        else
                           GenError(802)
                        end

                     end

                  else
                     GenError(803)
                  end

               end

            end

            if @sym==C_ATSym
               Get()
               Expect(C_POSITIONSym)
               Expect(C_numberSym)
            end

            if @sym==C_TYPESym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_FILTERSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_MESSAGESym
               Get()
               Expect(C_stringD1Sym)
            end

            if @sym==C_IGNORINGSym
               Get()
               Expect(C_CONVERSIONSym)
               Expect(C_ERRORSSym)
            end

            if @sym==C_REPLACEMENTSym
               Get()
               Expect(C_CHARACTERSym)
               Expect(C_charSym)
            end

         else
            GenError(804)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stFETCH()
      _in_()
      Expect(C_FETCHSym)
      Expect(C_NEXTSym)
      Expect(C_CURSORSym)
      Expect(C_identifierSym)
      if @sym==C_INTOSym
         Get()
         if @sym==C_identifierSym||@sym==C_CORRESPONDINGSym
            if @sym==C_CORRESPONDINGSym
               Get()
               Expect(C_FIELDSSym)
               Expect(C_OFSym)
            end

            Expect(C_identifierSym)
         else
            if 1
               Get()
               while (@sym==C_CommaSym)
                  Get()
                  Expect(C_identifierSym)
               end

            else
               GenError(805)
            end

         end

      else
         if @sym==C_APPENDINGSym
            if @sym==C_INTOSym
               Get()
            else
               if @sym==C_APPENDINGSym
                  Get()
                  if @sym==C_CORRESPONDINGSym
                     Get()
                     Expect(C_FIELDSSym)
                     Expect(C_OFSym)
                  end

                  Expect(C_TABLESym)
                  Expect(C_identifierSym)
                  if @sym==C_PACKAGESym
                     Get()
                     Expect(C_SIZESym)
                     Expect(C_numberSym)
                  end

               else
                  GenError(806)
               end

            end

         else
            GenError(807)
         end

      end

      if @sym==C_EXTENDEDSym
         Get()
         Expect(C_RESULTSym)
         Expect(C_AtSym)
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stPROVIDE()
      _in_()
      Expect(C_PROVIDESym)
      ProvideFields()
      while (@sym==C_FIELDSSym)
         ProvideFields()
      end

      Expect(C_BETWEENSym)
      Expect(C_numberSym)
      Expect(C_ANDSym)
      Expect(C_numberSym)
      if @sym==C_INCLUDINGSym
         Get()
         Expect(C_GAPSSym)
      end

      Expect(C_PointSym)
      Statements()
      Expect(C_ENDPROVIDESym)
      Expect(C_PointSym)
      _out_()
   end
   def stREAD()
      _in_()
      Expect(C_READSym)
      case @sym

      when C_DATASETSym
         Get()
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)
         if @sym==C_MAXIMUMSym
            Get()
            Expect(C_identifierSym)

            is('LENGTH');

            Expect(C_numberSym)
         end

         if @sym==C_identifierSym||@sym==C_ACTUALSym
            if @sym==C_ACTUALSym
               Get()
            end

            Expect(C_identifierSym)

            is('LENGTH');

            Expect(C_numberSym)
         end


      when C_LINESym,
         C_CURRENTSym
         if @sym==C_LINESym
            Get()
            Expect(C_numberSym)
            if @sym==C_OFSym
               if @sym==C_OFSym
                  Get()
                  Expect(C_PAGESym)
                  Expect(C_numberSym)
               else
                  if 1
                     Get()
                     Expect(C_CURRENTSym)
                     Expect(C_PAGESym)
                  else
                     GenError(808)
                  end

               end

            end

            if @sym==C_INDEXSym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_CURRENTSym
               Get()
               Expect(C_LINESym)
            else
               GenError(809)
            end

         end

         if @sym==C_LINESym
            Get()
            Expect(C_VALUESym)
            Expect(C_INTOSym)
            Expect(C_identifierSym)
         end

         if @sym==C_FIELDSym
            Get()
            Expect(C_VALUESym)
            Expect(C_identifierSym)
            if @sym==C_INTOSym
               Get()
               Expect(C_identifierSym)
            end

            while (@sym==C_identifierSym)
               Get()
               if @sym==C_INTOSym
                  Get()
                  Expect(C_identifierSym)
               end

            end

         end


      when C_REPORTSym
         Get()
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)
         if @sym==C_MAXIMUMSym
            Get()
            Expect(C_WIDTHSym)
            Expect(C_INTOSym)
            Expect(C_numberSym)
         end


      when C_TABLESym
         Get()
         Expect(C_identifierSym)
         while (@sym==C_FROMSym||@sym==C_INTOSym||@sym==C_WITHSym||@sym==C_ASSIGNINGSym||@sym==C_REFERENCESym||@sym==C_INDEXSym||@sym==C_TRANSPORTINGSym)
            if @sym==C_FROMSym||@sym==C_WITHSym||@sym==C_INDEXSym
               if @sym==C_FROMSym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_USINGSym
                     Get()
                     Expect(C_KEYSym)
                     if @sym==C_LparenSym
                        Get()
                     end

                     Expect(C_identifierSym)
                     if @sym==C_RparenSym
                        Get()
                     end

                  end

               else
                  if @sym==C_WITHSym
                     Get()
                     if @sym==C_TABLESym
                        Get()
                        Expect(C_KEYSym)
                        if @sym==C_identifierSym||@sym==C_LparenSym
                           if @sym==C_identifierSym
                              Get()
                           else
                              if @sym==C_LparenSym
                                 Get()
                                 Expect(C_identifierSym)
                                 Expect(C_RparenSym)
                                 Expect(C_COMPONENTSSym)
                              else
                                 GenError(810)
                              end

                           end

                        end

                        if @sym==C_LparenSym
                           Get()
                        end

                        Expect(C_identifierSym)
                        if @sym==C_RparenSym
                           Get()
                        end

                        Expect(C_EqualSym)
                        Expression()
                        while (@sym==C_identifierSym||@sym==C_LparenSym)
                           if @sym==C_LparenSym
                              Get()
                           end

                           Expect(C_identifierSym)
                           if @sym==C_RparenSym
                              Get()
                           end

                           Expect(C_EqualSym)
                           Expression()
                        end

                     else
                        if @sym==C_KEYSym
                           Get()
                           if @sym==C_identifierSym
                              Get()
                              Expect(C_EqualSym)
                              Expression()
                              while (@sym==C_identifierSym)
                                 Get()
                                 Expect(C_EqualSym)
                                 Expression()
                              end

                              if @sym==C_BINARYSym
                                 Get()
                                 Expect(C_SEARCHSym)
                              end

                           else
                              if @sym==C_LparenSym
                                 if @sym==C_LparenSym
                                    Get()
                                 end

                                 Expect(C_identifierSym)
                                 if @sym==C_RparenSym
                                    Get()
                                 end

                                 Expect(C_COMPONENTSSym)
                                 Expect(C_identifierSym)
                                 Expect(C_EqualSym)
                                 Expression()
                                 while (@sym==C_identifierSym)
                                    Get()
                                    Expect(C_EqualSym)
                                    Expression()
                                 end

                              else
                                 if @sym==C_EqualSym
                                    if @sym==C_EqualSym
                                       Get()
                                    end

                                    Expect(C_identifierSym)
                                    if @sym==C_BINARYSym
                                       Get()
                                       Expect(C_SEARCHSym)
                                    end

                                 else
                                    GenError(811)
                                 end

                              end

                           end

                        else
                           GenError(812)
                        end

                     end

                  else
                     if @sym==C_INDEXSym
                        Get()
                        Expect(C_numberSym)
                        if @sym==C_USINGSym
                           Get()
                           Expect(C_KEYSym)
                           if @sym==C_LparenSym
                              Get()
                           end

                           Expect(C_identifierSym)
                           if @sym==C_RparenSym
                              Get()
                           end

                        end

                     else
                        GenError(813)
                     end

                  end

               end

            end

            if @sym==C_INTOSym||@sym==C_ASSIGNINGSym||@sym==C_REFERENCESym||@sym==C_TRANSPORTINGSym
               case @sym

               when C_INTOSym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_COMPARINGSym
                     Get()
                     if @sym==C_ALLSym
                        Get()
                        Expect(C_FIELDSSym)
                     else
                        if @sym==C_NOSym
                           Get()
                           Expect(C_FIELDSSym)
                        else
                           if @sym==C_identifierSym
                              Get()
                              while (@sym==C_identifierSym)
                                 Get()
                              end

                           else
                              GenError(814)
                           end

                        end

                     end

                  end

                  if @sym==C_TRANSPORTINGSym
                     Get()
                     if @sym==C_ALLSym
                        Get()
                        Expect(C_FIELDSSym)
                     else
                        if @sym==C_identifierSym
                           Get()
                           while (@sym==C_identifierSym)
                              Get()
                           end

                        else
                           GenError(815)
                        end

                     end

                  end


               when C_ASSIGNINGSym
                  Get()
                  Expect(C_LessSym)
                  Expect(C_identifierSym)
                  Expect(C_GreaterSym)
                  if @sym==C_CASTINGSym
                     Get()
                  end


               when C_REFERENCESym
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)

               when C_TRANSPORTINGSym
                  Get()
                  Expect(C_NOSym)
                  Expect(C_FIELDSSym)

               else
                  GenError(816)

               end

            end

         end


      when C_TEXTPOOLSym
         Get()
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)
         Expect(C_LANGUAGESym)
         Expect(C_identifierSym)

      else
         GenError(817)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSORT()
      _in_()
      Expect(C_SORTSym)
      Expect(C_identifierSym)
      if @sym==C_identifierSym
         Get()

         is('STABLE');

      end

      if @sym==C_PointSym||@sym==C_ASSym||@sym==C_BYSym||@sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
         if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
            if @sym==C_ASCENDINGSym
               Get()
            else
               if @sym==C_DESCENDINGSym
                  Get()
               else
                  GenError(818)
               end

            end

         end

         if @sym==C_ASSym
            Get()
            Expect(C_TEXTSym)
         end

         if @sym==C_BYSym
            Get()
            Expect(C_identifierSym)
            if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
               if @sym==C_ASCENDINGSym
                  Get()
               else
                  if @sym==C_DESCENDINGSym
                     Get()
                  else
                     GenError(819)
                  end

               end

            end

            if @sym==C_ASSym
               Get()
               Expect(C_TEXTSym)
            end

            while (@sym==C_identifierSym)
               Get()
               if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
                  if @sym==C_ASCENDINGSym
                     Get()
                  else
                     if @sym==C_DESCENDINGSym
                        Get()
                     else
                        GenError(820)
                     end

                  end

               end

               if @sym==C_ASSym
                  Get()
                  Expect(C_TEXTSym)
               end

            end

         end

      else
         if 1
            if @sym==C_BYSym
               Get()
               Expect(C_LparenSym)
               Expect(C_identifierSym)
               Expect(C_RparenSym)
            end

         else
            if 1
               if @sym==C_BYSym
                  Get()
                  Expression()
               end

            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSUBMIT()
      _in_()
      Expect(C_SUBMITSym)
      if @sym==C_identifierSym
         Get()
      else
         if @sym==C_LparenSym
            Get()
            Expect(C_identifierSym)
            Expect(C_RparenSym)
         else
            GenError(821)
         end

      end

      if @sym==C_USINGSym
         Get()
         Expect(C_SELECTIONMinusSCREENSym)
         Expect(C_identifierSym)
      end

      if @sym==C_VIASym
         Get()
         Expect(C_SELECTIONMinusSCREENSym)
      end

      if @sym==C_USINGSym
         Get()
         Expect(C_SELECTIONMinusSETSym)
         Expect(C_identifierSym)
      end

      if @sym==C_USINGSym
         Get()
         Expect(C_SELECTIONMinusSETSSym)
         Expect(C_OFSym)
         Expect(C_PROGRAMSym)
         Expect(C_identifierSym)
      end

      if @sym==C_WITHSym
         Get()
         Expect(C_SELECTIONMinusTABLESym)
         Expect(C_identifierSym)
      end

      while (@sym==C_WITHSym)
         Get()
         Expect(C_identifierSym)
         if @sym>=C_EQSym&&@sym<=C_GTSym
            case @sym

            when C_EQSym
               Get()

            when C_NESym
               Get()

            when C_CPSym
               Get()

            when C_NPSym
               Get()

            when C_GESym
               Get()

            when C_LTSym
               Get()

            when C_LESym
               Get()

            when C_GTSym
               Get()

            else
               GenError(822)

            end

            Expect(C_identifierSym)
            if @sym==C_identifierSym
               Get()

               is('SIGN');

               Expect(C_stringD1Sym)
            end

         else
            if @sym==C_BETWEENSym||@sym==C_NOTSym
               if @sym==C_NOTSym
                  Get()
               end

               Expect(C_BETWEENSym)
               Expect(C_identifierSym)
               Expect(C_ANDSym)
               Expect(C_identifierSym)
               if @sym==C_identifierSym
                  Get()

                  is('SIGN');

                  Expect(C_stringD1Sym)
               end

            else
               if @sym==C_INSym
                  Get()
                  Expect(C_identifierSym)
               else
                  GenError(823)
               end

            end

         end

      end

      if @sym==C_WITHSym
         Get()
         Expect(C_FREESym)
         Expect(C_SELECTIONSSym)
         Expect(C_stringD1Sym)
      end

      if @sym==C_LINEMinusSIZESym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_LINEMinusCOUNTSym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_PointSym||@sym==C_ANDSym||@sym==C_EXPORTINGSym||@sym==C_USERSym||@sym==C_VIASym
         if @sym==C_EXPORTINGSym
            Get()
            Expect(C_LISTSym)
            Expect(C_TOSym)
            Expect(C_MEMORYSym)
         end

      else
         if @sym==C_TOSym
            if @sym==C_TOSym
               Get()
               Expect(C_SAPMinusSPOOLSym)
               Expect(C_SPOOLSym)
               Expect(C_PARAMETERSSym)
               Expect(C_identifierSym)
               if @sym==C_ARCHIVESym
                  Get()
                  Expect(C_PARAMETERSSym)
                  Expect(C_identifierSym)
               end

               Expect(C_WITHOUTSym)
               Expect(C_SPOOLSym)
               Expect(C_DYNPROSym)
            end

         end

      end

      if @sym==C_USERSym||@sym==C_VIASym
         if @sym==C_USERSym
            Get()
            Expect(C_stringD1Sym)
         end

         Expect(C_VIASym)
         Expect(C_JOBSym)
         Expect(C_identifierSym)
         Expect(C_NUMBERSym)
         Expect(C_numberSym)
         if @sym==C_LANGUAGESym
            Get()
            Expect(C_identifierSym)
         end

      end

      if @sym==C_ANDSym
         Get()
         Expect(C_RETURNSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stTRY()
      _in_()
      Expect(C_TRYSym)
      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      while (@sym==C_CATCHSym)
         Get()
         if @sym==C_BEFORESym
            Get()
            Expect(C_UNWINDSym)
         end

         while (@sym==C_identifierSym)
            Get()
         end

         if @sym==C_INTOSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_PointSym)
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Statement()
         end

      end

      if @sym==C_CLEANUPSym
         Get()
         if @sym==C_INTOSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_PointSym)
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Statement()
         end

      end

      Expect(C_ENDTRYSym)
      Expect(C_PointSym)
      _out_()
   end
   def stADD()
      _in_()
      Expect(C_ADDSym)
      Expect(C_identifierSym)
      if @sym==C_TOSym
         Get()
         Expect(C_identifierSym)
      else
         if @sym==C_FROMSym||@sym==C_THENSym
            if @sym==C_THENSym
               Get()
               Expect(C_identifierSym)
               Expect(C_UNTILSym)
               Expect(C_identifierSym)
               if @sym==C_TOSym
                  Get()
                  Expect(C_identifierSym)
               else
                  if @sym==C_GIVINGSym
                     Get()
                     Expect(C_identifierSym)
                     if @sym==C_ACCORDINGSym
                        Get()
                        Expect(C_TOSym)
                        Expect(C_identifierSym)
                     end

                  else
                     GenError(824)
                  end

               end

            else
               if @sym==C_FROMSym
                  Get()
                  Expect(C_numberSym)
                  Expect(C_TOSym)
                  Expect(C_numberSym)
                  Expect(C_GIVINGSym)
                  Expect(C_identifierSym)
               else
                  GenError(825)
               end

            end

            if @sym==C_RANGESym
               Get()
               Expression()
            end

         else
            GenError(826)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stADD_CORRESPONDING()
      _in_()
      Expect(C_ADDMinusCORRESPONDINGSym)
      Expect(C_identifierSym)
      Expect(C_TOSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stALIASES()
      _in_()
      Expect(C_ALIASESSym)
      Expect(C_identifierSym)
      Expect(C_FORSym)
      Expect(C_identifierSym)
      Expect(C_TildeSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stASSERT()
      _in_()
      Expect(C_ASSERTSym)
      if @sym==C_FIELDSSym||@sym==C_IDSym||@sym==C_CONDITIONSym
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_SUBKEYSym
               Get()
               Expect(C_identifierSym)
            end

         end

         if @sym==C_FIELDSSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_CONDITIONSym)
      end

      Expression()
      Expect(C_PointSym)
      _out_()
   end
   def stASSIGN()
      _in_()
      Expect(C_ASSIGNSym)
      if @sym==C_LparenSym||@sym==C_TABLESym
         if @sym==C_TABLESym
            Get()
            Expect(C_FIELDSym)
         end

         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
      else
         if @sym==C_COMPONENTSym
            Get()
            Expect(C_identifierSym)
            Expect(C_OFSym)
            Expect(C_STRUCTURESym)
            Expect(C_identifierSym)
         else
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               Expression()
               if @sym==C_LparenSym||@sym==C_PlusSym||@sym>=C_MinusGreaterSym&&@sym<=C_INCREMENTSym
                  if @sym==C_LparenSym||@sym==C_TOSym||@sym==C_PlusSym
                     if @sym==C_PlusSym
                        Get()
                        Expect(C_numberSym)
                     end

                     if @sym==C_LparenSym
                        Get()
                        Expect(C_numberSym)
                        Expect(C_RparenSym)
                     end

                  else
                     if @sym>=C_MinusGreaterSym&&@sym<=C_EqualGreaterSym
                        if @sym==C_MinusGreaterSym
                           Get()
                        else
                           if @sym==C_EqualGreaterSym
                              Get()
                           else
                              GenError(827)
                           end

                        end

                        if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_LessSym||@sym==C_StarSym
                           if @sym==C_StarSym
                              Get()
                           else
                              if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_LessSym
                                 Name()
                              else
                                 GenError(828)
                              end

                           end

                        end

                     else
                        if @sym==C_INCREMENTSym
                           Get()
                           Expect(C_numberSym)
                        else
                           GenError(829)
                        end

                     end

                  end

               end

            else
               GenError(830)
            end

         end

      end

      Expect(C_TOSym)
      Expect(C_LessSym)
      Expect(C_identifierSym)
      Expect(C_GreaterSym)
      if @sym==C_CASTINGSym||@sym==C_TYPESym||@sym==C_DECIMALSSym
         if @sym==C_CASTINGSym
            Get()
            if @sym==C_TYPESym||@sym==C_LIKESym||@sym==C_DECIMALSSym
               if @sym==C_PointSym||@sym==C_TYPESym||@sym==C_DECIMALSSym||@sym==C_RANGESym
                  if @sym==C_TYPESym
                     Get()
                     if @sym==C_HANDLESym
                        Get()
                     end

                     Name()
                  end

                  if @sym==C_DECIMALSSym
                     Get()
                     Expect(C_numberSym)
                  end

               else
                  if @sym==C_LIKESym
                     Get()
                     Expect(C_identifierSym)
                  else
                     GenError(831)
                  end

               end

            end

         else
            if @sym==C_PointSym||@sym==C_TYPESym||@sym==C_DECIMALSSym||@sym==C_RANGESym
               if @sym==C_TYPESym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_DECIMALSSym
                  Get()
                  Expect(C_numberSym)
               end

            else
               GenError(832)
            end

         end

      end

      if @sym==C_RANGESym
         Get()
         Expression()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stAT()
      _in_()
      Expect(C_ATSym)
      case @sym

      when C_NEWSym
         Get()
         Expect(C_identifierSym)

      when C_FIRSTSym
         Get()

      when C_LASTSym
         Get()

      when C_ENDSym
         Get()
         Expect(C_OFSym)
         Expect(C_identifierSym)

      else
         GenError(833)

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      Expect(C_ENDATSym)
      Expect(C_PointSym)
      _out_()
   end
   def stBACK()
      _in_()
      Expect(C_BACKSym)
      Expect(C_PointSym)
      _out_()
   end
   def stBREAK_POINT()
      _in_()
      Expect(C_BREAKMinusPOINTSym)
      if @sym==C_LparenSym||@sym==C_IDSym
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_LparenSym
               Get()
               Expect(C_stringD1Sym)
               Expect(C_RparenSym)
            else
               GenError(834)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCHECK()
      _in_()
      Expect(C_CHECKSym)
      Expression()
      Expect(C_PointSym)
      _out_()
   end
   def stCLASS_DATA()
      _in_()
      Expect(C_CLASSMinusDATASym)
      Expect(C_identifierSym)
      Event_options()
      Expect(C_PointSym)
      _out_()
   end
   def stCLASS_EVENTS()
      _in_()
      Expect(C_CLASSMinusEVENTSSym)
      Expect(C_identifierSym)
      Event_options()
      Expect(C_PointSym)
      _out_()
   end
   def stCLASS_POOL()
      _in_()
      Expect(C_CLASSMinusPOOLSym)
      if @sym==C_MESSAGEMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stCLEAR()
      _in_()
      Expect(C_CLEARSym)
      Expression()
      if @sym==C_WITHSym
         if @sym==C_WITHSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_INSym
               Get()
               if @sym==C_CHARACTERSym
                  Get()
               else
                  if @sym==C_BYTESym
                     Get()
                  else
                     GenError(835)
                  end

               end

               Expect(C_MODESym)
            end

         else
            if 1
               Get()
               Expect(C_NULLSym)
            else
               GenError(836)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCLOSE()
      _in_()
      Expect(C_CLOSESym)
      if @sym==C_CURSORSym
         Get()
         Expect(C_AtSym)
         Expect(C_identifierSym)
      else
         if @sym==C_DATASETSym
            Get()
            Expect(C_identifierSym)
         else
            GenError(837)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCOLLECT()
      _in_()
      Expect(C_COLLECTSym)
      Expect(C_identifierSym)
      Expect(C_INTOSym)
      Expect(C_identifierSym)
      if @sym==C_PointSym||@sym==C_ASSIGNINGSym
         if @sym==C_ASSIGNINGSym
            Get()
            Expect(C_LessSym)
            Expect(C_identifierSym)
            Expect(C_GreaterSym)
            if @sym==C_CASTINGSym
               Get()
            end

         end

      else
         if @sym==C_REFERENCESym
            if @sym==C_REFERENCESym
               Get()
               Expect(C_INTOSym)
               Expect(C_identifierSym)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCOMMIT()
      _in_()
      Expect(C_COMMITSym)
      if @sym==C_WORKSym
         Get()
         if @sym==C_ANDSym
            Get()
            Expect(C_WAITSym)
         end

      else
         if @sym==C_CONNECTIONSym
            Get()
            Expect(C_identifierSym)
         else
            GenError(838)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCOMPUTE()
      _in_()
      Expect(C_COMPUTESym)
      if @sym==C_EXACTSym
         Get()
      end

      Expect(C_identifierSym)
      if @sym==C_QuerySym
         Get()
      end

      Expect(C_EqualSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stCONCATENATE()
      _in_()
      Expect(C_CONCATENATESym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      else
         if 1
            Get()

            is('LINES');

            Expect(C_OFSym)
            Expect(C_identifierSym)
         else
            GenError(839)
         end

      end

      Expect(C_INTOSym)
      Expect(C_identifierSym)
      if @sym==C_INSym
         Get()
         if @sym==C_CHARACTERSym
            Get()
         else
            if @sym==C_BYTESym
               Get()
            else
               GenError(840)
            end

         end

         Expect(C_MODESym)
      end

      if @sym==C_SEPARATEDSym
         Get()
         Expect(C_BYSym)
         Expect(C_stringD1Sym)
      end

      if @sym==C_RESPECTINGSym
         Get()
         Expect(C_BLANKSSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stCONDENSE()
      _in_()
      Expect(C_CONDENSESym)
      Expression()
      if @sym==C_NOMinusGAPSSym
         Get()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stCONTROLS()
      _in_()
      if @sym==C_CONTROLSSym
         Get()
         Expect(C_identifierSym)
         Expect(C_TYPESym)
         Expect(C_TABLEVIEWSym)
         Expect(C_USINGSym)
         Expect(C_SCREENSym)
         Expect(C_identifierSym)
      else
         if @sym==C_TABSTRIPSym
            Get()
            Expect(C_PointSym)
         else
            GenError(841)
         end

      end

      _out_()
   end
   def stCONVERT()
      _in_()
      Expect(C_CONVERTSym)
      case @sym

      when C_PointSym

      when C_TEXTSym
         Get()
         Expect(C_stringD1Sym)
         Expect(C_INTOSym)
         Expect(C_SORTABLESym)
         Expect(C_CODESym)
         Expect(C_stringD1Sym)

      when C_TIMESym
         Get()
         Expect(C_STAMPSym)
         Expect(C_stringD1Sym)
         Expect(C_TIMESym)
         Expect(C_ZONESym)
         Expect(C_stringD1Sym)
         Expect(C_INTOSym)
         if @sym==C_identifierSym
            Get()

            is('DATE');

            Expect(C_stringD1Sym)
         end

         if @sym==C_TIMESym
            Get()
            Expect(C_stringD1Sym)
         end

         if @sym==C_DAYLIGHTSym
            Get()
            Expect(C_SAVINGSym)
            Expect(C_TIMESym)
            Expect(C_stringD1Sym)
         end


      when C_identifierSym
         Get()

         is('DATE');

         Expect(C_stringD1Sym)
         if @sym==C_TIMESym
            Get()
            Expect(C_stringD1Sym)
            if @sym==C_DAYLIGHTSym
               Get()
               Expect(C_SAVINGSym)
               Expect(C_TIMESym)
               Expect(C_stringD1Sym)
            end

         end

         Expect(C_INTOSym)
         Expect(C_TIMESym)
         Expect(C_STAMPSym)
         Expect(C_stringD1Sym)
         Expect(C_TIMESym)
         Expect(C_ZONESym)
         Expect(C_stringD1Sym)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCREATE()
      _in_()
      Expect(C_CREATESym)
      case @sym

      when C_DATASym
         Get()
         Expect(C_identifierSym)
         if @sym==C_AREASym
            Get()
            Expect(C_HANDLESym)
            Expect(C_identifierSym)
         end

         if @sym==C_TYPESym
            Get()
            case @sym

            when C_identifierSym,
               C_LparenSym,
               C_LessSym,
               C_LINESym
               if @sym==C_LINESym
                  Get()
                  Expect(C_OFSym)
               end

               Name()

            when C_REFSym
               Get()
               Expect(C_TOSym)
               Name()

            when C_STANDARDSym,
               C_TABLESym,
               C_SORTEDSym,
               C_HASHEDSym
               if @sym==C_STANDARDSym||@sym==C_TABLESym
                  if @sym==C_STANDARDSym
                     Get()
                  end

                  Expect(C_TABLESym)
               else
                  if @sym==C_SORTEDSym
                     Get()
                     Expect(C_TABLESym)
                  else
                     if @sym==C_HASHEDSym
                        Get()
                        Expect(C_TABLESym)
                     else
                        GenError(842)
                     end

                  end

               end

               Expect(C_OFSym)
               if @sym==C_REFSym
                  Get()
                  Expect(C_TOSym)
               end

               Name()
               if @sym==C_WITHSym||@sym==C_DEFAULTSym
                  if @sym==C_WITHSym||@sym==C_DEFAULTSym
                     if @sym==C_WITHSym
                        Get()
                        if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                           if @sym==C_UNIQUESym
                              Get()
                           else
                              if @sym==C_NONMinusUNIQUESym
                                 Get()
                              else
                                 GenError(843)
                              end

                           end

                        end

                        Expect(C_KEYSym)
                        if @sym==C_identifierSym
                           Get()
                           while (@sym==C_identifierSym)
                              Get()
                           end

                        else
                           if @sym==C_LparenSym
                              Get()
                              Expect(C_identifierSym)
                              Expect(C_RparenSym)
                           else
                              GenError(844)
                           end

                        end

                     else
                        if @sym==C_DEFAULTSym
                           Get()
                           Expect(C_KEYSym)
                        else
                           GenError(845)
                        end

                     end

                  else
                     if 1
                        Get()
                        Expect(C_EMPTYSym)
                        Expect(C_KEYSym)
                     else
                        GenError(846)
                     end

                  end

               end

               if @sym==C_INITIALSym
                  Get()
                  Expect(C_SIZESym)
                  Expect(C_numberSym)
               end


            when C_HANDLESym
               Get()
               Expect(C_identifierSym)
               Name()
               if @sym==C_identifierSym
                  Get()

                  is('LENGTH');

                  Expect(C_numberSym)
               end

               if @sym==C_DECIMALSSym
                  Get()
                  Expect(C_numberSym)
               end


            else
               GenError(847)

            end

         end


      when C_PointSym,
         C_LIKESym
         if @sym==C_LIKESym
            Get()
            if @sym==C_identifierSym||@sym==C_LINESym
               if @sym==C_LINESym
                  Get()
                  Expect(C_OFSym)
               end

               Expect(C_identifierSym)
            else
               if @sym==C_REFSym
                  Get()
                  Expect(C_TOSym)
                  Expect(C_identifierSym)
               else
                  if @sym==C_STANDARDSym||@sym==C_TABLESym||@sym==C_SORTEDSym||@sym==C_HASHEDSym
                     if @sym==C_STANDARDSym||@sym==C_TABLESym
                        if @sym==C_STANDARDSym
                           Get()
                        end

                        Expect(C_TABLESym)
                     else
                        if @sym==C_SORTEDSym
                           Get()
                           Expect(C_TABLESym)
                        else
                           if @sym==C_HASHEDSym
                              Get()
                              Expect(C_TABLESym)
                           else
                              GenError(848)
                           end

                        end

                     end

                     Expect(C_OFSym)
                     Expect(C_identifierSym)
                     if @sym==C_WITHSym||@sym==C_DEFAULTSym
                        if @sym==C_WITHSym||@sym==C_DEFAULTSym
                           if @sym==C_WITHSym
                              Get()
                              if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                                 if @sym==C_UNIQUESym
                                    Get()
                                 else
                                    if @sym==C_NONMinusUNIQUESym
                                       Get()
                                    else
                                       GenError(849)
                                    end

                                 end

                              end

                              Expect(C_KEYSym)
                              if @sym==C_identifierSym
                                 Get()
                                 while (@sym==C_identifierSym)
                                    Get()
                                 end

                              else
                                 if @sym==C_LparenSym
                                    Get()
                                    Expect(C_identifierSym)
                                    Expect(C_RparenSym)
                                 else
                                    GenError(850)
                                 end

                              end

                           else
                              if @sym==C_DEFAULTSym
                                 Get()
                                 Expect(C_KEYSym)
                              else
                                 GenError(851)
                              end

                           end

                        else
                           if 1
                              Get()
                              Expect(C_EMPTYSym)
                              Expect(C_KEYSym)
                           else
                              GenError(852)
                           end

                        end

                     end

                     if @sym==C_INITIALSym
                        Get()
                        Expect(C_SIZESym)
                        Expect(C_numberSym)
                     end

                  else
                     GenError(853)
                  end

               end

            end

         end


      when C_OBJECTSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_AREASym
            Get()
            Expect(C_HANDLESym)
            Expect(C_identifierSym)
         end

         if @sym==C_EXPORTINGSym||@sym==C_TYPESym||@sym==C_EXCEPTIONSSym
            if @sym==C_TYPESym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_EXPORTINGSym
               Get()
               Expression()
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  Expression()
               end

            end

            if @sym==C_EXCEPTIONSSym
               Get()
               Expression()
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  Expression()
               end

               if @sym==C_OTHERSSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_identifierSym)
               end

            end

         end


      when C_TYPESym,
         C_PARAMETERMinusTABLESym,
         C_EXCEPTIONMinusTABLESym
         if @sym==C_TYPESym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym
            if @sym==C_TYPESym
               Get()
               Expect(C_LparenSym)
               Expect(C_identifierSym)
               Expect(C_RparenSym)
               if @sym==C_EXPORTINGSym
                  Get()
                  Expression()
                  while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                     Expression()
                  end

               end

               if @sym==C_EXCEPTIONSSym
                  Get()
                  Expression()
                  while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                     Expression()
                  end

                  if @sym==C_OTHERSSym
                     Get()
                     Expect(C_EqualSym)
                     Expect(C_identifierSym)
                  end

               end

            else
               if @sym==C_PointSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym
                  if @sym==C_PARAMETERMinusTABLESym
                     Get()
                     Expect(C_identifierSym)
                  end

                  if @sym==C_EXCEPTIONMinusTABLESym
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  GenError(854)
               end

            end

         end


      else
         Get()
         Expect(C_identifierSym)
         Expect(C_identifierSym)
         if @sym==C_NOSym
            Get()
            Expect(C_FLUSHSym)
         end

         if @sym==C_QUEUEMinusONLYSym
            Get()
         end


      end

      Expect(C_PointSym)
      _out_()
   end
   def stDEMAND()
      _in_()
      Expect(C_DEMANDSym)
      Expression()
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Expression()
      end

      Expect(C_FROMSym)
      Expect(C_CONTEXTSym)
      Expect(C_identifierSym)
      if @sym==C_MESSAGESSym
         Get()
         Expect(C_INTOSym)
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stDESCRIBE()
      _in_()
      Expect(C_DESCRIBESym)
      case @sym

      when C_DISTANCESym
         Get()
         Expect(C_BETWEENSym)
         Expect(C_identifierSym)
         Expect(C_ANDSym)
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)
         Expect(C_INSym)
         if @sym==C_BYTESym
            Get()
         else
            if @sym==C_CHARACTERSym
               Get()
            else
               GenError(855)
            end

         end

         Expect(C_MODESym)

      when C_FIELDSym
         Get()
         Expression()
         if @sym==C_TYPESym
            Get()
            Expect(C_identifierSym)
            if @sym==C_COMPONENTSSym
               Get()
               Expect(C_identifierSym)
            end

         end

         if @sym==C_identifierSym
            Get()

            is('LENGTH');

            Expression()
            Expect(C_INSym)
            if @sym==C_BYTESym
               Get()
            else
               if @sym==C_CHARACTERSym
                  Get()
               else
                  GenError(856)
               end

            end

            Expect(C_MODESym)
         end

         if @sym==C_DECIMALSSym
            Get()
            Expression()
         end

         if @sym==C_OUTPUTMinusLENGTHSym
            Get()
            Expression()
         end

         if @sym==C_HELPMinusIDSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_EDITSym
            Get()
            Expect(C_MASKSym)
            Expect(C_identifierSym)
         end


      when C_LISTSym
         Get()
         if @sym==C_NUMBERSym
            Get()
            Expect(C_OFSym)
            if @sym==C_identifierSym
               Get()

               is('LINES');

            else
               if @sym==C_PAGESSym
                  Get()
               else
                  GenError(857)
               end

            end

            Expression()
         else
            if @sym==C_LINESym
               Get()
               Expression()
               Expect(C_PAGESym)
               Expression()
            else
               if @sym==C_PAGESym
                  Get()
                  Expression()
                  if @sym==C_LINEMinusSIZESym
                     Get()
                     Expression()
                  end

                  if @sym==C_LINEMinusCOUNTSym
                     Get()
                     Expression()
                  end

                  if @sym==C_identifierSym
                     Get()

                     is('LINES');

                     Expression()
                  end

                  if @sym==C_FIRSTMinusLINESym
                     Get()
                     Expression()
                  end

                  if @sym==C_TOPMinusLINESSym
                     Get()
                     Expression()
                  end

                  if @sym==C_TITLEMinusLINESSym
                     Get()
                     Expression()
                  end

                  if @sym==C_HEADMinusLINESSym
                     Get()
                     Expression()
                  end

                  if @sym==C_ENDMinusLINESSym
                     Get()
                     Expression()
                  end

               else
                  GenError(858)
               end

            end

         end

         if @sym==C_INDEXSym
            Get()
            Expect(C_identifierSym)
         end


      when C_TABLESym
         Get()
         Expect(C_identifierSym)
         while (@sym==C_identifierSym||@sym==C_OCCURSSym||@sym==C_KINDSym)
            if @sym==C_KINDSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_identifierSym
               Get()

               is('LINES');

               Expression()
            end

            if @sym==C_OCCURSSym
               Get()
               Expression()
            end

         end


      else
         GenError(859)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stDETAIL()
      _in_()
      Expect(C_DETAILSym)
      Expect(C_PointSym)
      _out_()
   end
   def stDIVIDE()
      _in_()
      Expect(C_DIVIDESym)
      Expect(C_identifierSym)
      Expect(C_BYSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stDIVIDE_CORRESPONDING()
      _in_()
      Expect(C_DIVIDEMinusCORRESPONDINGSym)
      Expect(C_identifierSym)
      Expect(C_BYSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stEDITOR_CALL()
      _in_()
      Expect(C_EDITORMinusCALLSym)
      Expect(C_FORSym)
      if @sym==C_REPORTSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_DISPLAYMinusMODESym
            Get()
         end

      else
         if @sym==C_identifierSym
            Get()
            if @sym==C_TITLESym
               Get()
               Expect(C_stringD1Sym)
            end

            if @sym==C_DISPLAYMinusMODESym||@sym==C_BACKUPSym
               if @sym==C_DISPLAYMinusMODESym
                  Get()
               else
                  if @sym==C_BACKUPSym
                     Get()
                     Expect(C_INTOSym)
                     Expect(C_identifierSym)
                  else
                     GenError(860)
                  end

               end

            end

         else
            GenError(861)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stEND_OF_PAGE()
      _in_()
      Expect(C_ENDMinusOFMinusPAGESym)
      Expect(C_PointSym)
      _out_()
   end
   def stEND_OF_SELECTION()
      _in_()
      Expect(C_ENDMinusOFMinusSELECTIONSym)
      Expect(C_PointSym)
      _out_()
   end
   def stEXIT()
      _in_()
      Expect(C_EXITSym)
      if @sym==C_FROMSym
         if @sym==C_FROMSym
            Get()
            Expect(C_SQLSym)
         else
            if 1
               Get()
               Expect(C_STEPMinusLOOPSym)
            else
               GenError(862)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stEXPORT()
      _in_()
      Expect(C_EXPORTSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      else
         if 1
            Get()
            Expect(C_FROMSym)
            Expect(C_identifierSym)
            while (@sym==C_identifierSym)
               Get()
               Expect(C_FROMSym)
               Expect(C_identifierSym)
            end

         else
            if 1
               Get()
               Expect(C_identifierSym)
               Expect(C_RparenSym)
            else
               GenError(863)
            end

         end

      end

      Expect(C_TOSym)
      case @sym

      when C_DATASym
         Get()
         Expect(C_BUFFERSym)
         Expect(C_identifierSym)

      when C_INTERNALSym
         Get()
         Expect(C_TABLESym)
         Expect(C_identifierSym)

      when C_MEMORYSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)

      when C_DATABASESym
         Get()
         Expect(C_identifierSym)
         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
         if @sym==C_FROMSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_identifierSym)
         Expect(C_IDSym)
         Expect(C_identifierSym)

      when C_BUFFERSym,
         C_SHAREDSym
         if @sym==C_SHAREDSym
            Get()
            Expect(C_MEMORYSym)
         else
            if @sym==C_BUFFERSym
               Get()
            else
               GenError(864)
            end

         end

         Expect(C_identifierSym)
         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
         if @sym==C_FROMSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_CLIENTSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_IDSym)
         Expect(C_identifierSym)

      else
         GenError(865)

      end

      if @sym==C_COMPRESSIONSym
         Get()
         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(866)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stEXTRACT()
      _in_()
      Expect(C_EXTRACTSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stFIELD_GROUPS()
      _in_()
      Expect(C_FIELDMinusGROUPSSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stFIELD_SYMBOLS()
      _in_()
      Expect(C_FIELDMinusSYMBOLSSym)
      Expect(C_LessSym)
      Expect(C_identifierSym)
      Expect(C_GreaterSym)
      if @sym==C_TYPESym||@sym==C_LIKESym
         Typing()
      else
         if @sym==C_STRUCTURESym
            Get()
            Expect(C_identifierSym)
            Expect(C_DEFAULTSym)
            Expect(C_identifierSym)
         else
            GenError(867)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stFIELDS()
      _in_()
      Expect(C_FIELDSSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stFIND()
      _in_()
      if @sym==C_FINDSym
         Get()
         if @sym==C_ALLSym||@sym==C_FIRSTSym
            if @sym==C_FIRSTSym
               Get()
               Expect(C_OCCURRENCESym)
            else
               if @sym==C_ALLSym
                  Get()
                  Expect(C_OCCURRENCESSym)
                  Expect(C_OFSym)
               else
                  GenError(868)
               end

            end

         end

         if @sym==C_SUBSTRINGSym
            Get()
         end

         Expect(C_stringD1Sym)
      else
         if @sym==C_REGEXSym
            Get()
            Expect(C_stringD1Sym)
            Expect(C_INSym)
            if @sym==C_identifierSym||@sym==C_SECTIONSym
               if @sym==C_SECTIONSym
                  Get()
                  if @sym==C_OFFSETSym
                     Get()
                     Expect(C_numberSym)
                  end

                  if @sym==C_identifierSym
                     Get()

                     is('LENGTH');

                     Expect(C_numberSym)
                  end

                  Expect(C_OFSym)
               end

               Expect(C_identifierSym)
            else
               if @sym==C_TABLESym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_FROMSym
                     Get()
                     Expect(C_numberSym)
                     if @sym==C_OFFSETSym
                        Get()
                        Expect(C_numberSym)
                     end

                  end

                  if @sym==C_TOSym
                     Get()
                     Expect(C_numberSym)
                     if @sym==C_OFFSETSym
                        Get()
                        Expect(C_numberSym)
                     end

                  end

               else
                  GenError(869)
               end

            end

            if @sym==C_INSym
               Get()
               if @sym==C_CHARACTERSym
                  Get()
               else
                  if @sym==C_BYTESym
                     Get()
                  else
                     GenError(870)
                  end

               end

               Expect(C_MODESym)
            end

            if @sym==C_RESPECTINGSym||@sym==C_IGNORINGSym
               if @sym==C_RESPECTINGSym
                  Get()
               else
                  if @sym==C_IGNORINGSym
                     Get()
                  else
                     GenError(871)
                  end

               end

               Expect(C_CASESym)
            end

            if @sym==C_MATCHSym
               Get()
               Expect(C_COUNTSym)
               Expect(C_numberSym)
            end

            if @sym==C_PointSym||@sym==C_MATCHSym||@sym==C_SUBMATCHESSym
               if @sym==C_MATCHSym
                  Get()
                  Expect(C_LINESym)
                  Expect(C_numberSym)
               end

               if @sym==C_MATCHSym
                  Get()
                  Expect(C_OFFSETSym)
                  Expect(C_numberSym)
               end

               if @sym==C_MATCHSym
                  Get()
                  Expect(C_identifierSym)

                  is('LENGTH');

                  Expect(C_numberSym)
               end

            else
               if @sym==C_RESULTSSym
                  if @sym==C_RESULTSSym
                     Get()
                     Expect(C_identifierSym)
                  end

               end

            end

            if @sym==C_SUBMATCHESSym
               Get()
               Expect(C_stringD1Sym)
            end

            Expect(C_PointSym)
         else
            GenError(872)
         end

      end

      _out_()
   end
   def stFORMAT()
      _in_()
      Expect(C_FORMATSym)
      Format_options()
      Expect(C_PointSym)
      _out_()
   end
   def stFREE()
      _in_()
      Expect(C_FREESym)
      if @sym==C_MEMORYSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
      else
         if @sym==C_OBJECTSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_NOSym
               Get()
               Expect(C_FLUSHSym)
            end

         else
            if @sym==C_identifierSym
               Get()
            else
               GenError(873)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stFUNCTION_POOL()
      _in_()
      Expect(C_FUNCTIONMinusPOOLSym)
      Expect(C_identifierSym)
      if @sym==C_NOSym
         Get()
         Expect(C_STANDARDSym)
         Expect(C_PAGESym)
         Expect(C_HEADINGSym)
      end

      if @sym==C_LINEMinusSIZESym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_LINEMinusCOUNTSym
         Get()
         Expect(C_numberSym)
         if @sym==C_LparenSym
            Get()
            Expect(C_numberSym)
            Expect(C_RparenSym)
         end

      end

      if @sym==C_MESSAGEMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stGENERATE()
      _in_()
      Expect(C_GENERATESym)
      Expect(C_SUBROUTINESym)
      Expect(C_POOLSym)
      Expect(C_identifierSym)
      Expect(C_identifierSym)

      is('NAME');

      Expect(C_identifierSym)
      if @sym==C_MESSAGESym
         Get()
         Expect(C_stringD1Sym)
      end

      if @sym==C_INCLUDESym
         Get()
         Expect(C_stringD1Sym)
      end

      if @sym==C_LINESym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_identifierSym
         Get()

         is('WORD');

         Expect(C_stringD1Sym)
      end

      if @sym==C_OFFSETSym
         Get()
         Expression()
      end

      if @sym==C_MESSAGEMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_SHORTDUMPMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stGET()
      _in_()
      Expect(C_GETSym)
      case @sym

      when C_BADISym
         Get()
         Expect(C_identifierSym)
         if @sym==C_FILTERSSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end


      when C_identifierSym
         Get()
         Expect(C_TYPESym)
         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
         if @sym>=C_FILTERSSym&&@sym<=C_FILTERMinusTABLESym
            if @sym==C_FILTERSSym
               Get()
               Exps()
            else
               if @sym==C_FILTERMinusTABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  GenError(874)
               end

            end

         end

         if @sym==C_CONTEXTSym
            Get()
            Expect(C_identifierSym)
         end


      when C_BITSym
         Get()
         Expect(C_numberSym)
         Expect(C_OFSym)
         Expect(C_stringD1Sym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)

      when C_CURSORSym
         Get()
         if @sym==C_FIELDSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_VALUESym
               Get()
               Expect(C_stringD1Sym)
            end

            if @sym==C_identifierSym
               Get()

               is('LENGTH');

               Expect(C_numberSym)
            end

            if @sym==C_OFFSETSym||@sym==C_DISPLAYSym||@sym==C_MEMORYSym
               if @sym==C_DISPLAYSym||@sym==C_MEMORYSym
                  if @sym==C_DISPLAYSym
                     Get()
                  else
                     if @sym==C_MEMORYSym
                        Get()
                     else
                        GenError(875)
                     end

                  end

               end

               Expect(C_OFFSETSym)
               Expect(C_numberSym)
            end

            if @sym==C_LINESym
               Get()
               Expect(C_numberSym)
            end

            if @sym==C_AREASym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_LINESym
               Get()
               Expect(C_numberSym)
               if @sym==C_VALUESym
                  Get()
                  Expect(C_stringD1Sym)
               end

               if @sym==C_identifierSym
                  Get()

                  is('LENGTH');

                  Expect(C_numberSym)
               end

               if @sym==C_OFFSETSym||@sym==C_DISPLAYSym||@sym==C_MEMORYSym
                  if @sym==C_DISPLAYSym||@sym==C_MEMORYSym
                     if @sym==C_DISPLAYSym
                        Get()
                     else
                        if @sym==C_MEMORYSym
                           Get()
                        else
                           GenError(876)
                        end

                     end

                  end

                  Expect(C_OFFSETSym)
                  Expect(C_numberSym)
               end

            else
               GenError(877)
            end

         end


      when C_DATASETSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_POSITIONSym
            Get()
            Expect(C_numberSym)
         end

         if @sym==C_ATTRIBUTESSym
            Get()
            Expect(C_identifierSym)
         end


      when C_LOCALESym
         Get()
         Expect(C_LANGUAGESym)
         Expect(C_identifierSym)
         Expect(C_COUNTRYSym)
         Expect(C_stringD1Sym)
         Expect(C_MODIFIERSym)
         Expect(C_stringD1Sym)

      when C_PARAMETERSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
         Expect(C_FIELDSym)
         Expect(C_identifierSym)

      when C_PFMinusSTATUSSym
         Get()
         Expect(C_stringD1Sym)
         if @sym==C_PROGRAMSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_EXCLUDINGSym
            Get()
            Expect(C_identifierSym)
         end


      when C_PROPERTYSym
         Get()
         Expect(C_OFSym)
         Expect(C_identifierSym)
         Expect(C_identifierSym)
         Expect(C_EqualSym)
         Expect(C_identifierSym)
         if @sym==C_NOSym
            Get()
            Expect(C_FLUSHSym)
         end

         if @sym==C_QUEUEMinusONLYSym
            Get()
         end

         if @sym==C_EXPORTINGSym
            Get()
            Exps()
         end


      when C_REFERENCESym
         Get()
         Expect(C_OFSym)
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)

      when C_RUNSym
         Get()
         Expect(C_TIMESym)
         Expect(C_FIELDSym)
         Expect(C_identifierSym)

      when C_TIMESym
         Get()
         if @sym==C_PointSym||@sym==C_FIELDSym
            if @sym==C_FIELDSym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_STAMPSym
               Get()
               Expect(C_FIELDSym)
               Expect(C_identifierSym)
            else
               GenError(878)
            end

         end


      else
         GenError(879)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stHIDE()
      _in_()
      Expect(C_HIDESym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stIMPORT()
      _in_()
      Expect(C_IMPORTSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Exps()
         else
            if 1
               Get()
               Expect(C_identifierSym)
               Expect(C_RparenSym)
            else
               if 1
                  Get()
                  Expect(C_TOSym)
                  Expect(C_identifierSym)
                  while (@sym==C_identifierSym)
                     Get()
                     Expect(C_TOSym)
                     Expect(C_identifierSym)
                  end

               else
                  GenError(880)
               end

            end

         end

         Expect(C_FROMSym)
         case @sym

         when C_DATASym
            Get()
            Expect(C_BUFFERSym)
            Expect(C_identifierSym)

         when C_INTERNALSym
            Get()
            Expect(C_TABLESym)
            Expect(C_identifierSym)

         when C_MEMORYSym
            Get()
            Expect(C_IDSym)
            Expect(C_identifierSym)

         when C_DATABASESym,
            C_MAJORMinusIDSym
            if @sym==C_DATABASESym
               Get()
               Expect(C_identifierSym)
               Expect(C_LparenSym)
               Expect(C_identifierSym)
               Expect(C_RparenSym)
               if @sym==C_TOSym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_CLIENTSym
                  Get()
                  Expect(C_identifierSym)
               end

               Expect(C_IDSym)
               Expect(C_identifierSym)
            else
               if @sym==C_MAJORMinusIDSym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_MINORMinusIDSym
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  GenError(881)
               end

            end


         when C_SHAREDSym
            Get()
            if @sym==C_BUFFERSym
               Get()
            else
               if @sym==C_MEMORYSym
                  Get()
               else
                  GenError(882)
               end

            end

            Expect(C_identifierSym)
            Expect(C_LparenSym)
            Expect(C_identifierSym)
            Expect(C_RparenSym)
            if @sym==C_TOSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_CLIENTSym
               Get()
               Expect(C_identifierSym)
            end

            Expect(C_IDSym)
            Expect(C_identifierSym)

         else
            GenError(883)

         end

         if @sym==C_INSym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym
            if @sym==C_PointSym||@sym>=C_ENDIANSym&&@sym<=C_CODESym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym
               if @sym==C_PointSym||@sym>=C_ENDIANSym&&@sym<=C_CODESym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym
                  if @sym==C_ACCEPTINGSym
                     Get()
                     Expect(C_PADDINGSym)
                  end

                  if @sym==C_ACCEPTINGSym
                     Get()
                     Expect(C_TRUNCATIONSym)
                  end

               else
                  if 1
                     if @sym==C_IGNORINGSym
                        Get()
                        Expect(C_STRUCTURESym)
                        Expect(C_BOUNDARIESSym)
                     end

                  end

               end

               if @sym==C_IGNORINGSym
                  Get()
                  Expect(C_CONVERSIONSym)
                  Expect(C_ERRORSSym)
                  if @sym==C_REPLACEMENTSym
                     Get()
                     Expect(C_CHARACTERSym)
                     Expect(C_identifierSym)
                  end

               end

            else
               if @sym==C_INSym
                  if @sym==C_INSym
                     Get()
                     Expect(C_CHARMinusTOMinusHEXSym)
                     Expect(C_MODESym)
                  end

               else
                  GenError(884)
               end

            end

         end

         if @sym==C_CODESym
            Get()
            Expect(C_PAGESym)
            Expect(C_INTOSym)
            Expect(C_identifierSym)
         end

         if @sym==C_ENDIANSym
            Get()
            Expect(C_INTOSym)
            Expect(C_identifierSym)
         end

      else
         if @sym==C_DIRECTORYSym
            Get()
            Expect(C_INTOSym)
            Expect(C_identifierSym)
            Expect(C_FROMSym)
            Expect(C_DATABASESym)
            Expect(C_identifierSym)
            Expect(C_LparenSym)
            Expect(C_identifierSym)
            Expect(C_RparenSym)
            if @sym==C_TOSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_CLIENTSym
               Get()
               Expect(C_identifierSym)
            end

            Expect(C_IDSym)
            Expect(C_identifierSym)
         else
            GenError(885)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stINCLUDE()
      _in_()
      Expect(C_INCLUDESym)
      if @sym==C_TYPESym||@sym==C_STRUCTURESym
         if @sym==C_TYPESym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_STRUCTURESym
               Get()
               Expect(C_identifierSym)
            else
               GenError(886)
            end

         end

         if @sym==C_ASSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_RENAMINGSym
               Get()
               Expect(C_WITHSym)
               Expect(C_SUFFIXSym)
               Expect(C_stringD1Sym)
            end

         end

      else
         if @sym==C_identifierSym
            Get()
            if @sym==C_IFSym
               Get()
               Expect(C_FOUNDSym)
            end

         else
            GenError(887)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stINFOTYPES()
      _in_()
      Expect(C_INFOTYPESSym)
      Expect(C_identifierSym)
      if @sym==C_identifierSym
         Get()

         is('NAME');

         Expect(C_identifierSym)
      end

      if @sym==C_OCCURSSym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_MODESym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_VALIDSym
         Get()
         Expect(C_FROMSym)
         Expression()
         Expect(C_TOSym)
         Expression()
      end

      if @sym==C_ASSym
         Get()
         Expect(C_PERSONSym)
         Expect(C_TABLESym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stINITIALIZATION()
      _in_()
      Expect(C_INITIALIZATIONSym)
      Expect(C_PointSym)
      _out_()
   end
   def stINPUT()
      _in_()
      Expect(C_INPUTSym)
      Expect(C_PointSym)
      _out_()
   end
   def stINSERT()
      _in_()
      Expect(C_INSERTSym)
      if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_PointSym||@sym==C_INTOSym||@sym==C_TABLESym||@sym==C_INITIALSym
         if @sym==C_identifierSym||@sym==C_INITIALSym
            if @sym==C_INITIALSym
               Get()
               Expect(C_LINESym)
            else
               if @sym==C_identifierSym
                  Get()

                  is('LINES');

                  Expect(C_OFSym)
                  Expect(C_identifierSym)
                  if @sym==C_FROMSym
                     Get()
                     Expect(C_identifierSym)
                  end

                  if @sym==C_TOSym
                     Get()
                     Expect(C_identifierSym)
                  end

                  if @sym==C_USINGSym
                     Get()
                     Expect(C_KEYSym)
                     Name()
                  end

               else
                  if 1
                     Get()
                  else
                     GenError(888)
                  end

               end

            end

         end

         while (@sym==C_identifierSym||@sym==C_LparenSym||@sym==C_INTOSym||@sym==C_TABLESym)
            if @sym==C_INTOSym
               Get()
            end

            if @sym==C_LparenSym
               Get()
               Expression()
               Expect(C_RparenSym)
            else
               if @sym==C_identifierSym||@sym==C_TABLESym
                  if @sym==C_TABLESym
                     Get()
                  end

                  Expect(C_identifierSym)
                  if @sym==C_INDEXSym
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  GenError(889)
               end

            end

            if @sym>=C_USINGSym&&@sym<=C_CLIENTSym
               if @sym==C_USINGSym
                  Get()
                  Expect(C_CLIENTSym)
                  Expect(C_identifierSym)
               else
                  if @sym==C_CLIENTSym
                     Get()
                     Expect(C_SPECIFIEDSym)
                  else
                     GenError(890)
                  end

               end

            end

            if @sym==C_CONNECTIONSym
               Get()
               if @sym==C_LparenSym
                  Get()
                  Expression()
                  Expect(C_RparenSym)
               else
                  if @sym==C_identifierSym
                     Get()
                  else
                     GenError(891)
                  end

               end

            end

            if @sym==C_VALUESSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_ASSIGNINGSym||@sym==C_REFERENCESym
               if @sym==C_ASSIGNINGSym
                  Get()
                  Expect(C_LessSym)
                  Expect(C_identifierSym)
                  Expect(C_GreaterSym)
                  if @sym==C_CASTINGSym
                     Get()
                  end

               else
                  if @sym==C_REFERENCESym
                     Get()
                     Expect(C_INTOSym)
                     Expect(C_identifierSym)
                  else
                     GenError(892)
                  end

               end

            end

            if @sym==C_FROMSym
               Get()
               if @sym==C_identifierSym
                  Get()
               else
                  if @sym==C_TABLESym
                     Get()
                     Expect(C_identifierSym)
                     if @sym==C_ACCEPTINGSym
                        Get()
                        Expect(C_DUPLICATESym)
                        Expect(C_KEYSSym)
                     end

                  else
                     if @sym==C_SELECTSym
                        stSELECT()
                     else
                        GenError(893)
                     end

                  end

               end

            end

         end

      else
         if @sym==C_REPORTSym
            Get()
            Expect(C_identifierSym)
            Expect(C_FROMSym)
            Expect(C_identifierSym)
            if @sym==C_MAXIMUMSym
               Get()
               Expect(C_WIDTHSym)
               Expect(C_INTOSym)
               Expect(C_identifierSym)
            end

            if @sym==C_PointSym||@sym==C_KEEPINGSym
               if @sym==C_KEEPINGSym
                  Get()
                  Expect(C_DIRECTORYSym)
                  Expect(C_ENTRYSym)
               end

            else
               if @sym==C_VERSIONSym||@sym==C_PROGRAMSym||@sym==C_FIXEDMinusPOINTSym||@sym==C_UNICODESym
                  if @sym==C_PROGRAMSym
                     Get()
                     Expect(C_TYPESym)
                     Expect(C_identifierSym)
                  end

                  if @sym==C_FIXEDMinusPOINTSym
                     Get()
                     Expect(C_ARITHMETICSym)
                     Expect(C_identifierSym)
                  end

                  if @sym==C_VERSIONSym||@sym==C_UNICODESym
                     if @sym==C_VERSIONSym
                        Get()
                     else
                        if @sym==C_UNICODESym
                           Get()
                           Expect(C_ENABLINGSym)
                           Expect(C_identifierSym)
                        else
                           GenError(894)
                        end

                     end

                  end

               else
                  if @sym==C_DIRECTORYSym
                     if @sym==C_DIRECTORYSym
                        Get()
                        Expect(C_ENTRYSym)
                        Expect(C_stringD1Sym)
                     end

                  else
                     GenError(895)
                  end

               end

            end

         else
            if @sym==C_TEXTPOOLSym
               Get()
               Expect(C_identifierSym)
               Expect(C_FROMSym)
               Expect(C_identifierSym)
               Expect(C_LANGUAGESym)
               Expect(C_identifierSym)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stINTERFACE()
      _in_()
      Expect(C_INTERFACESym)
      Expect(C_identifierSym)
      if @sym==C_PointSym
         Get()
         while (@sym==C_identifierSym)
            Get()
         end

         Expect(C_ENDINTERFACESym)
      else
         if @sym==C_DEFERREDSym||@sym==C_LOADSym
            if @sym==C_DEFERREDSym
               Get()
               if @sym==C_PUBLICSym
                  Get()
               end

            else
               if @sym==C_LOADSym
                  Get()
               else
                  GenError(896)
               end

            end

         else
            GenError(897)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stINTERFACE_POOL()
      _in_()
      Expect(C_INTERFACEMinusPOOLSym)
      Expect(C_PointSym)
      _out_()
   end
   def stINTERFACES()
      _in_()
      Expect(C_INTERFACESSym)
      Expect(C_identifierSym)
      if @sym==C_PARTIALLYSym
         Get()
         Expect(C_IMPLEMENTEDSym)
      end

      if @sym==C_PointSym||@sym==C_DATASym||@sym>=C_ABSTRACTSym&&@sym<=C_FINALSym
         if @sym==C_ABSTRACTSym
            Get()
            Expect(C_METHODSSym)
            Expect(C_identifierSym)
         end

         if @sym==C_FINALSym
            Get()
            Expect(C_METHODSSym)
            Expect(C_identifierSym)
         end

      else
         if @sym==C_ALLSym
            if @sym==C_ALLSym
               Get()
               Expect(C_METHODSSym)
               if @sym==C_ABSTRACTSym
                  Get()
               else
                  if @sym==C_FINALSym
                     Get()
                  else
                     GenError(898)
                  end

               end

            end

         end

      end

      if @sym==C_DATASym
         Get()
         Expect(C_VALUESSym)
         Exps()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stLEAVE()
      _in_()
      Expect(C_LEAVESym)
      case @sym

      when C_LISTMinusPROCESSINGSym
         Get()

      when C_PROGRAMSym
         Get()

      when C_SCREENSym
         Get()

      when C_TOSym
         Get()
         case @sym

         when C_TRANSACTIONSym
            Get()
            Expect(C_identifierSym)

         when C_CURRENTSym
            Get()
            Expect(C_TRANSACTIONSym)

         when C_LISTMinusPROCESSINGSym
            Get()
            if @sym==C_ANDSym
               Get()
               Expect(C_RETURNSym)
               Expect(C_TOSym)
               Expect(C_SCREENSym)
               Expect(C_identifierSym)
            end


         when C_SCREENSym
            Get()
            Expect(C_identifierSym)

         else
            GenError(899)

         end

         if @sym==C_ANDSym
            Get()
            Expect(C_SKIPSym)
            Expect(C_FIRSTSym)
            Expect(C_SCREENSym)
         end


      else
         GenError(900)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stLOAD_OF_PROGRAM()
      _in_()
      Expect(C_LOADMinusOFMinusPROGRAMSym)
      Expect(C_PointSym)
      _out_()
   end
   def stLOCAL()
      _in_()
      Expect(C_LOCALSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stLOG_POINT()
      _in_()
      Expect(C_LOGMinusPOINTSym)
      Expect(C_IDSym)
      Expect(C_identifierSym)
      if @sym==C_SUBKEYSym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_FIELDSSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stMAXIMUM()
      _in_()
      Expect(C_MAXIMUMSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stMINIMUM()
      _in_()
      Expect(C_MINIMUMSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stMODULE()
      _in_()
      Expect(C_MODULESym)
      Expect(C_stringD1Sym)
      if @sym==C_OUTPUTSym
         Get()
      else
         if @sym==C_PointSym||@sym==C_INPUTSym
            if @sym==C_INPUTSym
               Get()
            end

         end

      end

      Expect(C_PointSym)
      Statements()
      Expect(C_ENDMODULESym)
      Expect(C_PointSym)
      _out_()
   end
   def stMULTIPLY()
      _in_()
      Expect(C_MULTIPLYSym)
      Expect(C_identifierSym)
      Expect(C_BYSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stMULTIPLY_CORRESPONDING()
      _in_()
      Expect(C_MULTIPLYMinusCORRESPONDINGSym)
      Expect(C_identifierSym)
      Expect(C_BYSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stNEW_LINE()
      _in_()
      Expect(C_NEWMinusLINESym)
      if @sym>=C_NOMinusSCROLLINGSym&&@sym<=C_SCROLLINGSym
         if @sym==C_NOMinusSCROLLINGSym
            Get()
         else
            if @sym==C_SCROLLINGSym
               Get()
            else
               GenError(901)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stNEW_PAGE()
      _in_()
      Expect(C_NEWMinusPAGESym)
      if @sym>=C_WITHMinusTITLESym&&@sym<=C_NOMinusTITLESym
         if @sym==C_WITHMinusTITLESym
            Get()
         else
            if @sym==C_NOMinusTITLESym
               Get()
            else
               GenError(902)
            end

         end

      end

      if @sym>=C_WITHMinusHEADINGSym&&@sym<=C_NOMinusHEADINGSym
         if @sym==C_WITHMinusHEADINGSym
            Get()
         else
            if @sym==C_NOMinusHEADINGSym
               Get()
            else
               GenError(903)
            end

         end

      end

      if @sym==C_LINEMinusCOUNTSym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_LINEMinusSIZESym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_NOMinusTOPOFPAGESym
         Get()
      end

      if @sym==C_PRINTSym
         if @sym==C_PRINTSym
            Get()
            Expect(C_ONSym)
            if @sym==C_NEWMinusSECTIONSym
               Get()
            end

            Expect(C_PARAMETERSSym)
            Expect(C_identifierSym)
            if @sym==C_ARCHIVESym
               Get()
               Expect(C_PARAMETERSSym)
               Expect(C_identifierSym)
            end

            Expect(C_NOSym)
            Expect(C_DIALOGSym)
         else
            if 1
               Get()
               Expect(C_OFFSym)
            else
               GenError(904)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stNEW_SECTION()
      _in_()
      Expect(C_NEWMinusSECTIONSym)
      Expect(C_PointSym)
      _out_()
   end
   def stNODES()
      _in_()
      Expect(C_NODESSym)
      Expect(C_identifierSym)
      if @sym==C_TYPESym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stOVERLAY()
      _in_()
      Expect(C_OVERLAYSym)
      Expect(C_stringD1Sym)
      Expect(C_WITHSym)
      Expect(C_stringD1Sym)
      if @sym==C_ONLYSym
         Get()
         Expect(C_stringD1Sym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stPACK()
      _in_()
      Expect(C_PACKSym)
      Expect(C_identifierSym)
      Expect(C_TOSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stPARAMETERS()
      _in_()
      Expect(C_PARAMETERSSym)
      Expect(C_identifierSym)
      if @sym==C_identifierSym||@sym==C_LparenSym
         if @sym==C_LparenSym
            Get()
            Expect(C_numberSym)
            Expect(C_RparenSym)
         else
            if @sym==C_identifierSym
               Get()

               is('LENGTH');

               Expect(C_numberSym)
            else
               GenError(905)
            end

         end

      end

      if @sym==C_TYPESym||@sym==C_LIKESym
         if @sym==C_TYPESym
            Get()
            Expect(C_identifierSym)
            if @sym==C_DECIMALSSym
               Get()
               Expect(C_numberSym)
            end

         else
            if @sym==C_LIKESym
               Get()
               if @sym==C_LparenSym
                  Get()
               end

               Expect(C_identifierSym)
               if @sym==C_RparenSym
                  Get()
               end

            else
               GenError(906)
            end

         end

      end

      if @sym==C_ASSym||@sym>=C_OBLIGATORYSym&&@sym<=C_VISIBLESym||@sym==C_RADIOBUTTONSym
         if @sym==C_PointSym||@sym==C_FORSym||@sym==C_DEFAULTSym||@sym==C_VALUESym||@sym==C_MEMORYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_VISIBLESym||@sym>=C_MODIFSym&&@sym<=C_MATCHCODESym
            if @sym>=C_OBLIGATORYSym&&@sym<=C_NOMinusDISPLAYSym
               if @sym==C_OBLIGATORYSym
                  Get()
               else
                  if @sym==C_NOMinusDISPLAYSym
                     Get()
                  else
                     GenError(907)
                  end

               end

            end

            if @sym==C_VISIBLESym
               Get()
               Expect(C_identifierSym)

               is('LENGTH');

               Expect(C_numberSym)
            end

         else
            if @sym==C_ASSym
               Get()
               if @sym==C_CHECKBOXSym
                  Get()
                  if @sym==C_USERMinusCOMMANDSym
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  if @sym==C_LISTBOXSym
                     Get()
                     Expect(C_VISIBLESym)
                     Expect(C_identifierSym)

                     is('LENGTH');

                     Expect(C_numberSym)
                     if @sym==C_USERMinusCOMMANDSym
                        Get()
                        Expect(C_identifierSym)
                     end

                     if @sym==C_OBLIGATORYSym
                        Get()
                     end

                  else
                     GenError(908)
                  end

               end

            else
               if @sym==C_RADIOBUTTONSym
                  Get()
                  Expect(C_GROUPSym)
                  Expect(C_identifierSym)
                  if @sym==C_USERMinusCOMMANDSym
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  GenError(909)
               end

            end

         end

      end

      while (@sym==C_DEFAULTSym||@sym==C_VALUESym||@sym==C_MEMORYSym||@sym>=C_MODIFSym&&@sym<=C_MATCHCODESym)
         if @sym==C_MODIFSym
            Get()
            Expect(C_IDSym)
            Expect(C_identifierSym)
         end

         if @sym==C_LOWERSym
            Get()
            Expect(C_CASESym)
         end

         if @sym==C_DEFAULTSym
            Get()
            Expression()
         end

         if @sym==C_MATCHCODESym
            Get()
            Expect(C_OBJECTSym)
            Expect(C_identifierSym)
         end

         if @sym==C_MEMORYSym
            Get()
            Expect(C_IDSym)
            Expect(C_identifierSym)
         end

         if @sym==C_VALUESym
            Get()
            Expect(C_CHECKSym)
         end

      end

      if @sym==C_FORSym
         Get()
         if @sym==C_TABLESym
            Get()
         else
            if @sym==C_NODESym
               Get()
            else
               GenError(910)
            end

         end

         Expect(C_identifierSym)
         if @sym==C_HELPMinusREQUESTSym
            Get()
         end

         if @sym==C_VALUEMinusREQUESTSym
            Get()
         end

         if @sym==C_ASSym
            Get()
            Expect(C_SEARCHSym)
            Expect(C_PATTERNSym)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stPERFORM()
      _in_()
      Expect(C_PERFORMSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
            if @sym==C_INSym
               Get()
               Expect(C_PROGRAMSym)
               if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_LessSym
                  Name()
               end

               if @sym==C_IFSym
                  Get()
                  Expect(C_FOUNDSym)
               end

            else
               if @sym==C_PointSym||@sym==C_USINGSym||@sym==C_TABLESSym||@sym==C_CHANGINGSym||@sym==C_IFSym
                  if @sym==C_IFSym
                     Get()
                     Expect(C_FOUNDSym)
                  end

               else
                  GenError(911)
               end

            end

         else
            if 1
               Get()
               Expect(C_OFSym)
               Expect(C_identifierSym)
               while (@sym==C_identifierSym)
                  Get()
               end

            else
               if 1
                  Get()
               else
                  GenError(912)
               end

            end

         end

         if @sym==C_TABLESSym
            Get()
            Expect(C_identifierSym)
            while (@sym==C_identifierSym)
               Get()
            end

         end

         if @sym==C_USINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_CHANGINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

      else
         if @sym==C_ONSym
            Get()
            if @sym==C_COMMITSym
               Get()
               if @sym==C_LEVELSym
                  Get()
                  Expect(C_identifierSym)
               end

            else
               if @sym==C_ROLLBACKSym
                  Get()
               else
                  GenError(913)
               end

            end

         else
            GenError(914)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stPOSITION()
      _in_()
      Expect(C_POSITIONSym)
      Expect(C_numberSym)
      Expect(C_PointSym)
      _out_()
   end
   def stPRINT_CONTROL()
      _in_()
      Expect(C_PRINTMinusCONTROLSym)
      Expect(C_INDEXMinusLINESym)
      Expect(C_numberSym)
      Expect(C_PointSym)
      _out_()
   end
   def stPROGRAM()
      _in_()
      Expect(C_PROGRAMSym)
      Expect(C_identifierSym)
      if @sym==C_NOSym
         Get()
         Expect(C_STANDARDSym)
         Expect(C_PAGESym)
         Expect(C_HEADINGSym)
      end

      if @sym==C_LINEMinusSIZESym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_LINEMinusCOUNTSym
         Get()
         Expect(C_numberSym)
         if @sym==C_LparenSym
            Get()
            Expect(C_numberSym)
            Expect(C_RparenSym)
         end

      end

      if @sym==C_MESSAGEMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_REDUCEDSym
         Get()
         Expect(C_FUNCTIONALITYSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stRANGES()
      _in_()
      Expect(C_RANGESSym)
      Expect(C_identifierSym)
      Expect(C_FORSym)
      Expect(C_identifierSym)
      if @sym==C_OCCURSSym
         Get()
         Expect(C_numberSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stRECEIVE()
      _in_()
      Expect(C_RECEIVESym)
      Expect(C_RESULTSSym)
      Expect(C_FROMSym)
      Expect(C_FUNCTIONSym)
      Expect(C_identifierSym)
      if @sym==C_KEEPINGSym
         Get()
         Expect(C_TASKSym)
      end

      if @sym==C_IMPORTINGSym
         Get()
         Exps()
      end

      if @sym==C_TABLESSym
         Get()
         Exps()
      end

      if @sym==C_EXCEPTIONSSym
         Get()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

         if @sym==C_identifierSym
            Get()
            Expect(C_EqualSym)
            Expect(C_identifierSym)
            if @sym==C_MESSAGESym
               Get()
               Expect(C_stringD1Sym)
            end

         end

         if @sym==C_identifierSym
            Get()
            Expect(C_EqualSym)
            Expect(C_identifierSym)
            if @sym==C_MESSAGESym
               Get()
               Expect(C_stringD1Sym)
            end

         end

         if @sym==C_OTHERSSym
            Get()
            Expect(C_EqualSym)
            Expect(C_identifierSym)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stREFRESH()
      _in_()
      Expect(C_REFRESHSym)
      if @sym==C_CONTROLSym
         Get()
         Expect(C_identifierSym)
         Expect(C_FROMSym)
         Expect(C_SCREENSym)
         Expect(C_identifierSym)
      else
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
            if @sym==C_FROMSym
               Get()
               Expect(C_TABLESym)
               Expect(C_identifierSym)
            end

         else
            GenError(915)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stREJECT()
      _in_()
      Expect(C_REJECTSym)
      Expect(C_LbrackSym)
      Expect(C_identifierSym)
      Expect(C_RbrackSym)
      Expect(C_PointSym)
      _out_()
   end
   def stREPLACE()
      _in_()
      Expect(C_REPLACESym)
      if @sym==C_stringD1Sym||@sym==C_ALLSym||@sym==C_SECTIONSym||@sym==C_FIRSTSym||@sym>=C_SUBSTRINGSym&&@sym<=C_REGEXSym
         if @sym==C_stringD1Sym||@sym==C_ALLSym||@sym==C_FIRSTSym||@sym>=C_SUBSTRINGSym&&@sym<=C_REGEXSym
            if @sym==C_stringD1Sym||@sym==C_ALLSym||@sym==C_FIRSTSym||@sym==C_SUBSTRINGSym
               if @sym==C_ALLSym||@sym==C_FIRSTSym
                  if @sym==C_FIRSTSym
                     Get()
                     Expect(C_OCCURRENCESym)
                  else
                     if @sym==C_ALLSym
                        Get()
                        Expect(C_OCCURRENCESSym)
                        Expect(C_OFSym)
                     else
                        GenError(916)
                     end

                  end

               end

               if @sym==C_SUBSTRINGSym
                  Get()
               end

               Expect(C_stringD1Sym)
            else
               if @sym==C_REGEXSym
                  Get()
                  Expect(C_stringD1Sym)
                  Expect(C_INSym)
                  if @sym==C_identifierSym||@sym==C_SECTIONSym
                     if @sym==C_SECTIONSym
                        Get()
                        if @sym==C_OFFSETSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_identifierSym
                           Get()

                           is('LENGTH');

                           Expect(C_numberSym)
                        end

                        Expect(C_OFSym)
                     end

                     Expect(C_identifierSym)
                  else
                     if @sym==C_TABLESym
                        Get()
                        Expect(C_identifierSym)
                        if @sym==C_FROMSym
                           Get()
                           Expect(C_numberSym)
                           if @sym==C_OFFSETSym
                              Get()
                              Expect(C_numberSym)
                           end

                        end

                        if @sym==C_TOSym
                           Get()
                           Expect(C_numberSym)
                           if @sym==C_OFFSETSym
                              Get()
                              Expect(C_numberSym)
                           end

                        end

                     else
                        GenError(917)
                     end

                  end

                  Expect(C_WITHSym)
                  Expect(C_identifierSym)
                  if @sym==C_INSym
                     Get()
                     if @sym==C_CHARACTERSym
                        Get()
                     else
                        if @sym==C_BYTESym
                           Get()
                        else
                           GenError(918)
                        end

                     end

                     Expect(C_MODESym)
                  end

                  if @sym==C_RESPECTINGSym||@sym==C_IGNORINGSym
                     if @sym==C_RESPECTINGSym
                        Get()
                     else
                        if @sym==C_IGNORINGSym
                           Get()
                        else
                           GenError(919)
                        end

                     end

                     Expect(C_CASESym)
                  end

                  if @sym==C_REPLACEMENTSym
                     Get()
                     Expect(C_COUNTSym)
                     Expect(C_numberSym)
                  end

                  if @sym==C_PointSym||@sym==C_REPLACEMENTSym
                     if @sym==C_REPLACEMENTSym
                        Get()
                        Expect(C_OFFSETSym)
                        Expect(C_numberSym)
                     end

                     if @sym==C_REPLACEMENTSym
                        Get()
                        Expect(C_identifierSym)

                        is('LENGTH');

                        Expect(C_numberSym)
                     end

                     if @sym==C_REPLACEMENTSym
                        Get()
                        Expect(C_LINESym)
                        Expect(C_numberSym)
                     end

                  else
                     if @sym==C_RESULTSSym
                        if @sym==C_RESULTSSym
                           Get()
                           Expect(C_identifierSym)
                        end

                     else
                        GenError(920)
                     end

                  end

               else
                  GenError(921)
               end

            end

         else
            if @sym==C_SECTIONSym
               Get()
               if @sym==C_OFFSETSym
                  Get()
                  Expect(C_numberSym)
               end

               if @sym==C_identifierSym
                  Get()

                  is('LENGTH');

                  Expect(C_numberSym)
               end

               Expect(C_OFSym)
               Expect(C_identifierSym)
               Expect(C_WITHSym)
               Expect(C_identifierSym)
               if @sym==C_INSym
                  Get()
                  if @sym==C_CHARACTERSym
                     Get()
                  else
                     if @sym==C_BYTESym
                        Get()
                     else
                        GenError(922)
                     end

                  end

                  Expect(C_MODESym)
               end

            else
               GenError(923)
            end

         end

      else
         if 1
            Get()
            Expect(C_WITHSym)
            Expect(C_identifierSym)
            Expect(C_INTOSym)
            Expect(C_identifierSym)
            if @sym==C_INSym
               Get()
               if @sym==C_BYTESym
                  Get()
               else
                  if @sym==C_CHARACTERSym
                     Get()
                  else
                     GenError(924)
                  end

               end

               Expect(C_MODESym)
            end

            if @sym==C_identifierSym
               Get()

               is('LENGTH');

               Expect(C_numberSym)
            end

         else
            GenError(925)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stRESERVE()
      _in_()
      Expect(C_RESERVESym)
      Expect(C_numberSym)
      Expect(C_identifierSym)

      is('LINES');

      Expect(C_PointSym)
      _out_()
   end
   def stRESUME()
      _in_()
      Expect(C_RESUMESym)
      Expect(C_PointSym)
      _out_()
   end
   def stRETRY()
      _in_()
      Expect(C_RETRYSym)
      Expect(C_PointSym)
      _out_()
   end
   def stRETURN()
      _in_()
      Expect(C_RETURNSym)
      Expect(C_PointSym)
      _out_()
   end
   def stROLLBACK()
      _in_()
      Expect(C_ROLLBACKSym)
      if @sym==C_WORKSym
         Get()
      else
         if @sym==C_CONNECTIONSym
            Get()
            Expect(C_identifierSym)
         else
            GenError(926)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSCROLL()
      _in_()
      Expect(C_SCROLLSym)
      Expect(C_LISTSym)
      if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym||@sym==C_TOSym
         if @sym==C_TOSym
            Get()
            Expect(C_COLUMNSym)
            Expect(C_stringD1Sym)
         else
            if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym
               if @sym==C_LEFTSym
                  Get()
               else
                  if @sym==C_RIGHTSym
                     Get()
                  else
                     GenError(927)
                  end

               end

               if @sym==C_BYSym
                  Get()
                  Expect(C_numberSym)
                  Expect(C_PLACESSym)
               end

            else
               GenError(928)
            end

         end

      end

      if @sym==C_TOSym||@sym>=C_FORWARDSym&&@sym<=C_BACKWARDSym
         if @sym==C_TOSym
            Get()
            if @sym==C_FIRSTSym
               Get()
               Expect(C_PAGESym)
            else
               if @sym==C_LASTSym
                  Get()
                  Expect(C_PAGESym)
               else
                  if @sym==C_PAGESym
                     Get()
                     Expect(C_numberSym)
                  else
                     GenError(929)
                  end

               end

            end

            if @sym==C_LINESym
               Get()
               Expect(C_numberSym)
            end

         else
            if @sym>=C_FORWARDSym&&@sym<=C_BACKWARDSym
               if @sym==C_FORWARDSym
                  Get()
               else
                  if @sym==C_BACKWARDSym
                     Get()
                  else
                     GenError(930)
                  end

               end

               if @sym==C_numberSym
                  Get()
                  Expect(C_PAGESSym)
               end

            else
               GenError(931)
            end

         end

      end

      if @sym==C_INDEXSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stSELECT_OPTIONS()
      _in_()
      Expect(C_SELECTMinusOPTIONSSym)
      Expect(C_identifierSym)
      Expect(C_FORSym)
      Name()
      if @sym>=C_OBLIGATORYSym&&@sym<=C_NOMinusDISPLAYSym
         if @sym==C_OBLIGATORYSym
            Get()
         else
            if @sym==C_NOMinusDISPLAYSym
               Get()
            else
               GenError(932)
            end

         end

      end

      if @sym==C_VISIBLESym
         Get()
         Expect(C_identifierSym)

         is('LENGTH');

         Expect(C_numberSym)
      end

      if @sym==C_NOMinusEXTENSIONSym
         Get()
      end

      if @sym==C_NOSym
         Get()
         Expect(C_INTERVALSSym)
      end

      if @sym==C_MODIFSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
      end

      if @sym==C_DEFAULTSym
         Get()
         Expect(C_stringD1Sym)
         if @sym==C_TOSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_OPTIONSym
            Get()
            Expression()
         end

         if @sym==C_identifierSym
            Get()

            is('SIGN');

            Expect(C_identifierSym)
         end

      end

      if @sym==C_LOWERSym
         Get()
         Expect(C_CASESym)
      end

      if @sym==C_MATCHCODESym
         Get()
         Expect(C_OBJECTSym)
         Expect(C_identifierSym)
      end

      if @sym==C_MEMORYSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
      end

      if @sym==C_NOSym
         Get()
         Expect(C_DATABASESym)
         Expect(C_SELECTIONSym)
      end

      if @sym==C_HELPMinusREQUESTSym
         Get()
         if @sym==C_FORSym
            Get()
            if @sym==C_LOWSym
               Get()
            else
               if @sym==C_HIGHSym
                  Get()
               else
                  GenError(933)
               end

            end

         end

      end

      if @sym==C_VALUEMinusREQUESTSym
         Get()
         if @sym==C_FORSym
            Get()
            if @sym==C_LOWSym
               Get()
            else
               if @sym==C_HIGHSym
                  Get()
               else
                  GenError(934)
               end

            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSELECTION_SCREEN()
      _in_()
      Expect(C_SELECTIONMinusSCREENSym)
      Expect(C_TABSym)
      Expect(C_numberSym)
      Expect(C_identifierSym)
      Expect(C_USERMinusCOMMANDSym)
      Expect(C_identifierSym)
      if @sym==C_DEFAULTSym
         Get()
         if @sym==C_PROGRAMSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_SCREENSym)
         Expect(C_identifierSym)
      end

      if @sym==C_MODIFSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
      end

      if @sym==C_FORSym
         Get()
         if @sym==C_TABLESym
            Get()
         else
            if @sym==C_NODESym
               Get()
            else
               GenError(935)
            end

         end

         Expect(C_identifierSym)
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSET()
      _in_()
      Expect(C_SETSym)
      case @sym

      when C_ASSOCIATIONSym
         Get()
         Expect(C_identifierSym)
         Expect(C_EqualSym)
         Expect(C_identifierSym)

      when C_LIKESym
         Get()
         Expect(C_identifierSym)

      when C_INITIALSym
         Get()

      when C_BITSym
         Get()
         Expect(C_numberSym)
         Expect(C_OFSym)
         Expect(C_stringD1Sym)
         if @sym==C_TOSym
            Get()
            Expect(C_identifierSym)
         end


      when C_BLANKSym
         Get()
         Expect(C_identifierSym)

         is('LINES');

         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(936)
            end

         end


      when C_COUNTRYSym
         Get()
         Expect(C_stringD1Sym)

      when C_CURSORSym
         Get()
         if @sym==C_FIELDSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_LINESym
               Get()
               Expect(C_numberSym)
            end

            if @sym==C_OFFSETSym||@sym==C_DISPLAYSym||@sym==C_MEMORYSym
               if @sym==C_DISPLAYSym||@sym==C_MEMORYSym
                  if @sym==C_DISPLAYSym
                     Get()
                  else
                     if @sym==C_MEMORYSym
                        Get()
                     else
                        GenError(937)
                     end

                  end

               end

               Expect(C_OFFSETSym)
               Expect(C_identifierSym)
            end

         else
            if @sym==C_LINESym
               Get()
               Expect(C_numberSym)
               if @sym==C_OFFSETSym||@sym==C_DISPLAYSym||@sym==C_MEMORYSym
                  if @sym==C_DISPLAYSym||@sym==C_MEMORYSym
                     if @sym==C_DISPLAYSym
                        Get()
                     else
                        if @sym==C_MEMORYSym
                           Get()
                        else
                           GenError(938)
                        end

                     end

                  end

                  Expect(C_OFFSETSym)
                  Expect(C_identifierSym)
               end

            else
               if @sym==C_stringD1Sym
                  Get()
                  Expect(C_numberSym)
               else
                  GenError(939)
               end

            end

         end


      when C_DATASETSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_POSITIONSym
            Get()
            if @sym==C_numberSym
               Get()
            else
               if @sym==C_ENDSym
                  Get()
                  Expect(C_OFSym)
                  Expect(C_FILESym)
               else
                  GenError(940)
               end

            end

         end

         if @sym==C_ATTRIBUTESSym
            Get()
            Expect(C_identifierSym)
         end


      when C_EXTENDEDSym
         Get()
         Expect(C_CHECKSym)
         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(941)
            end

         end


      when C_HANDLERSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_FORSym||@sym==C_ALLSym
            if @sym==C_FORSym
               Get()
               Expect(C_identifierSym)
            else
               if @sym==C_ALLSym
                  Get()
                  Expect(C_INSTANCESSym)
               else
                  GenError(942)
               end

            end

         end

         if @sym==C_ACTIVATIONSym
            Get()
            Expect(C_identifierSym)
         end


      when C_HOLDSym
         Get()
         Expect(C_DATASym)
         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(943)
            end

         end


      when C_LANGUAGESym
         Get()
         Expect(C_identifierSym)

      when C_LEFTSym
         Get()
         Expect(C_SCROLLMinusBOUNDARYSym)
         if @sym==C_COLUMNSym
            Get()
            Expression()
         end


      when C_LOCALESym
         Get()
         Expect(C_LANGUAGESym)
         Expect(C_identifierSym)
         if @sym==C_COUNTRYSym
            Get()
            Expect(C_stringD1Sym)
         end

         if @sym==C_MODIFIERSym
            Get()
            Expect(C_stringD1Sym)
         end


      when C_MARGINSym
         Get()
         Expect(C_numberSym)
         if @sym==C_numberSym
            Get()
         end


      when C_PARAMETERSym
         Get()
         Expect(C_IDSym)
         Expect(C_identifierSym)
         Expect(C_FIELDSym)
         Expect(C_identifierSym)

      when C_PFMinusSTATUSSym
         Get()
         Expect(C_stringD1Sym)
         if @sym==C_OFSym
            Get()
            Expect(C_PROGRAMSym)
            Expect(C_identifierSym)
         end

         if @sym==C_EXCLUDINGSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_IMMEDIATELYSym
            Get()
         end


      when C_PROPERTYSym
         Get()
         Expect(C_OFSym)
         Expect(C_identifierSym)
         Expect(C_identifierSym)
         Expect(C_EqualSym)
         Expect(C_identifierSym)
         if @sym==C_NOSym
            Get()
            Expect(C_FLUSHSym)
         end

         if @sym==C_EXPORTINGSym
            Get()
            Exps()
         end


      when C_RUNSym
         Get()
         Expect(C_TIMESym)
         if @sym==C_ANALYZERSym
            Get()
            if @sym==C_ONSym
               Get()
            else
               if @sym==C_OFFSym
                  Get()
               else
                  GenError(944)
               end

            end

         else
            if @sym==C_CLOCKSym
               Get()
               Expect(C_RESOLUTIONSym)
               if @sym==C_HIGHSym
                  Get()
               else
                  if @sym==C_LOWSym
                     Get()
                  else
                     GenError(945)
                  end

               end

            else
               GenError(946)
            end

         end


      when C_SCREENSym
         Get()
         Expect(C_identifierSym)

      when C_TITLEBARSym
         Get()
         Expect(C_stringD1Sym)
         if @sym==C_OFSym
            Get()
            Expect(C_PROGRAMSym)
            Expect(C_identifierSym)
         end

         if @sym==C_WITHSym
            Get()
            Expect(C_stringD1Sym)
            Expect(C_stringD1Sym)
         end


      when C_UPDATESym
         Get()
         Expect(C_TASKSym)
         Expect(C_LOCALSym)

      when C_USERMinusCOMMANDSym
         Get()
         Expect(C_identifierSym)

      else
         GenError(947)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSHIFT()
      _in_()
      Expect(C_SHIFTSym)
      Expect(C_identifierSym)
      if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym||@sym==C_BYSym||@sym==C_UPSym||@sym==C_CIRCULARSym
         if @sym==C_PointSym||@sym>=C_LEFTSym&&@sym<=C_RIGHTSym||@sym==C_BYSym||@sym==C_INSym||@sym==C_UPSym||@sym==C_CIRCULARSym
            if @sym==C_BYSym||@sym==C_UPSym
               if @sym==C_BYSym
                  Get()
                  Expect(C_numberSym)
                  Expect(C_PLACESSym)
               else
                  if @sym==C_UPSym
                     Get()
                     Expect(C_TOSym)
                     Expect(C_stringD1Sym)
                  else
                     GenError(948)
                  end

               end

            end

            if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym
               if @sym==C_LEFTSym
                  Get()
               else
                  if @sym==C_RIGHTSym
                     Get()
                  else
                     GenError(949)
                  end

               end

            end

            if @sym==C_CIRCULARSym
               Get()
            end

         else
            if 1
               if @sym==C_LEFTSym
                  Get()
                  Expect(C_DELETINGSym)
                  Expect(C_LEADINGSym)
               else
                  if @sym==C_RIGHTSym
                     Get()
                     Expect(C_DELETINGSym)
                     Expect(C_TRAILINGSym)
                     Expect(C_stringD1Sym)
                  else
                     GenError(950)
                  end

               end

            else
               GenError(951)
            end

         end

      end

      if @sym==C_INSym
         Get()
         if @sym==C_CHARACTERSym
            Get()
         else
            if @sym==C_BYTESym
               Get()
            else
               GenError(952)
            end

         end

         Expect(C_MODESym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stSKIP()
      _in_()
      Expect(C_SKIPSym)
      if @sym==C_numberSym||@sym==C_PointSym
         if @sym==C_numberSym
            Get()
         end

      else
         if @sym==C_TOSym
            Get()
            Expect(C_LINESym)
            Expect(C_numberSym)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSTOP()
      _in_()
      Expect(C_STOPSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUBTRACT()
      _in_()
      Expect(C_SUBTRACTSym)
      Expect(C_identifierSym)
      Expect(C_FROMSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUBTRACT_CORRESPONDING()
      _in_()
      Expect(C_SUBTRACTMinusCORRESPONDINGSym)
      Expect(C_identifierSym)
      Expect(C_FROMSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUM()
      _in_()
      Expect(C_SUMSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUMMARY()
      _in_()
      Expect(C_SUMMARYSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUMMING()
      _in_()
      Expect(C_SUMMINGSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUPPLY()
      _in_()
      Expect(C_SUPPLYSym)
      Exps()
      Expect(C_TOSym)
      Expect(C_CONTEXTSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSUPPRESS()
      _in_()
      Expect(C_SUPPRESSSym)
      Expect(C_DIALOGSym)
      Expect(C_PointSym)
      _out_()
   end
   def stSYNTAX_CHECK()
      _in_()
      Expect(C_SYNTAXMinusCHECKSym)
      Expect(C_FORSym)
      Expect(C_identifierSym)
      Expect(C_MESSAGESym)
      Expect(C_stringD1Sym)
      Expect(C_LINESym)
      Expect(C_numberSym)
      Expect(C_identifierSym)

      is('WORD');

      Expect(C_stringD1Sym)
      if @sym==C_PROGRAMSym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_DIRECTORYSym
         Get()
         Expect(C_ENTRYSym)
         Expect(C_stringD1Sym)
      end

      if @sym==C_WITHSym
         Get()
         Expect(C_CURRENTSym)
         Expect(C_SWITCHSTATESSym)
      end

      if @sym==C_INCLUDESym
         Get()
         Expect(C_stringD1Sym)
      end

      if @sym==C_OFFSETSym
         Get()
         Expect(C_numberSym)
      end

      if @sym==C_MESSAGEMinusIDSym
         Get()
         Expect(C_identifierSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stTEST_INJECTION()
      _in_()
      Expect(C_TESTMinusINJECTIONSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Statements()
      end

      Expect(C_ENDMinusTESTMinusINJECTIONSym)
      Expect(C_PointSym)
      _out_()
   end
   def stTEST_SEAM()
      _in_()
      Expect(C_TESTMinusSEAMSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Statements()
      end

      Expect(C_ENDMinusTESTMinusSEAMSym)
      Expect(C_PointSym)
      _out_()
   end
   def stTOP_OF_PAGE()
      _in_()
      Expect(C_TOPMinusOFMinusPAGESym)
      if @sym==C_DURINGSym
         Get()
         Expect(C_LINEMinusSELECTIONSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stTRANSFER()
      _in_()
      Expect(C_TRANSFERSym)
      Expect(C_identifierSym)
      Expect(C_TOSym)
      Expect(C_identifierSym)
      if @sym==C_identifierSym
         Get()

         is('LENGTH');

         Expect(C_numberSym)
      end

      if @sym==C_NOSym
         Get()
         Expect(C_ENDSym)
         Expect(C_OFSym)
         Expect(C_LINESym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stTRANSLATE()
      _in_()
      if @sym==C_TRANSLATESym
         Get()
         Expect(C_identifierSym)
         Expect(C_TOSym)
         if @sym==C_UPPERSym
            Get()
         else
            if @sym==C_LOWERSym
               Get()
            else
               GenError(953)
            end

         end

         Expect(C_CASESym)
      else
         if @sym==C_USINGSym
            Get()
            Expect(C_stringD1Sym)
            Expect(C_PointSym)
         else
            GenError(954)
         end

      end

      _out_()
   end
   def stTRUNCATE()
      _in_()
      if @sym==C_TRUNCATESym
         Get()
         Expect(C_DATASETSym)
         Expect(C_identifierSym)
         Expect(C_ATSym)
         Expect(C_CURRENTSym)
         Expect(C_POSITIONSym)
      else
         if @sym==C_POSITIONSym
            Get()
            Expect(C_numberSym)
            Expect(C_PointSym)
         else
            GenError(955)
         end

      end

      _out_()
   end
   def stTYPE_POOL()
      _in_()
      Expect(C_TYPEMinusPOOLSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stTYPE_POOLS()
      _in_()
      Expect(C_TYPEMinusPOOLSSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stTYPES()
      _in_()
      Expect(C_TYPESSym)
      if @sym==C_BEGINSym
         Get()
         Expect(C_OFSym)
         if @sym==C_ENUMSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_STRUCTURESym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_BASESym
               Get()
               Expect(C_TYPESym)
               Expect(C_identifierSym)
            end

            Expect(C_PointSym)
            Expect(C_TYPESSym)
            Expect(C_identifierSym)
            Expect(C_VALUESym)
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               Expression()
            else
               if @sym==C_ISSym
                  Get()
                  Expect(C_INITIALSym)
               else
                  GenError(956)
               end

            end

            while (@sym==C_CommaSym)
               Get()
               Expect(C_TYPESSym)
               Expect(C_identifierSym)
               Expect(C_VALUESym)
               if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  Expression()
               else
                  if @sym==C_ISSym
                     Get()
                     Expect(C_INITIALSym)
                  else
                     GenError(957)
                  end

               end

            end

            Expect(C_TYPESSym)
            Expect(C_ENDSym)
            Expect(C_OFSym)
            Expect(C_ENUMSym)
            Expect(C_identifierSym)
            if @sym==C_STRUCTURESym
               Get()
               Expect(C_identifierSym)
            end

         else
            if @sym==C_MESHSym
               Get()
               Expect(C_identifierSym)
               Expect(C_PointSym)
               while (@sym==C_TYPESSym)
                  Types_mesh_stmt()
               end

               Expect(C_DATASym)
               Expect(C_ENDSym)
               Expect(C_OFSym)
               Expect(C_MESHSym)
               Expect(C_identifierSym)
            else
               if @sym==C_identifierSym
                  Get()
                  Expect(C_PointSym)
                  TypeOfStuct()
               else
                  GenError(958)
               end

            end

         end

      else
         if @sym==C_identifierSym
            Get()
            if @sym==C_LparenSym
               Get()
               Expect(C_numberSym)
               Expect(C_RparenSym)
            end

            if @sym==C_TYPESym
               TypeDes()
            else
               if @sym==C_LIKESym
                  LikeDes()
               else
                  GenError(959)
               end

            end

         else
            GenError(960)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stULINE()
      _in_()
      Expect(C_ULINESym)
      if @sym==C_ATSym
         Get()
      end

      if @sym==C_SlashSym
         Get()
      end

      if @sym==C_numberSym
         Get()
      end

      if @sym==C_LparenSym
         Get()
         Expect(C_numberSym)
         Expect(C_RparenSym)
      end

      if @sym==C_NOMinusGAPSym
         Get()
      end

      Expect(C_PointSym)
      _out_()
   end
   def stUNASSIGN()
      _in_()
      Expect(C_UNASSIGNSym)
      Expect(C_PointSym)
      _out_()
   end
   def stUNPACK()
      _in_()
      Expect(C_UNPACKSym)
      Expect(C_identifierSym)
      Expect(C_TOSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      _out_()
   end
   def stUPDATE()
      _in_()
      Expect(C_UPDATESym)
      Expression()
      if @sym>=C_USINGSym&&@sym<=C_CLIENTSym
         if @sym==C_USINGSym
            Get()
            Expect(C_CLIENTSym)
            Expect(C_identifierSym)
         else
            if @sym==C_CLIENTSym
               Get()
               Expect(C_SPECIFIEDSym)
            else
               GenError(961)
            end

         end

      end

      if @sym==C_CONNECTIONSym
         Get()
         Expression()
      end

      if @sym==C_SETSym
         Get()
         Expect(C_identifierSym)
         Expect(C_EqualSym)
         Expression()
         while (@sym==C_CommaSym)
            Get()
            Expect(C_identifierSym)
            Expect(C_EqualSym)
            Expression()
         end

         if @sym==C_WHERESym
            Get()
            Expression()
         end

      else
         if @sym==C_FROMSym||@sym==C_TABLESym
            if @sym==C_FROMSym
               Get()
               Expect(C_identifierSym)
            else
               if @sym==C_TABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  GenError(962)
               end

            end

         else
            GenError(963)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stWAIT()
      _in_()
      if @sym==C_WAITSym
         Get()
         Expect(C_UPSym)
         Expect(C_TOSym)
         Expect(C_numberSym)
         Expect(C_SECONDSSym)
      else
         if @sym==C_FORSym
            Get()
            if @sym==C_ASYNCHRONOUSSym
               Get()
               Expect(C_TASKSSym)
               Expect(C_UNTILSym)
               Expression()
               if @sym==C_UPSym
                  Get()
                  Expect(C_TOSym)
                  Expect(C_numberSym)
                  Expect(C_SECONDSSym)
               end

            end

            if @sym==C_MESSAGINGSym
               Get()
               Expect(C_CHANNELSSym)
               Expect(C_UNTILSym)
               Expression()
               if @sym==C_UPSym
                  Get()
                  Expect(C_TOSym)
                  Expect(C_numberSym)
                  Expect(C_SECONDSSym)
               end

            end

            if @sym==C_PUSHSym
               Get()
               Expect(C_CHANNELSSym)
               Expect(C_UNTILSym)
               Expression()
               if @sym==C_UPSym
                  Get()
                  Expect(C_TOSym)
                  Expect(C_numberSym)
                  Expect(C_SECONDSSym)
               end

            end

            Expect(C_PointSym)
         else
            GenError(964)
         end

      end

      _out_()
   end
   def stWINDOW()
      _in_()
      Expect(C_WINDOWSym)
      Expect(C_STARTINGSym)
      Expect(C_ATSym)
      Expect(C_stringD1Sym)
      Expect(C_numberSym)
      if @sym==C_ENDINGSym
         Get()
         Expect(C_ATSym)
         Expect(C_stringD1Sym)
         Expect(C_numberSym)
      end

      Expect(C_PointSym)
      _out_()
   end
   def stSELECT()
      _in_()
      Expect(C_SELECTSym)
      if @sym==C_SINGLESym
         Get()
         if @sym==C_FORSym
            Get()
            Expect(C_UPDATESym)
         end

      end

      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_FIELDSSym&&@sym<=C_StarSym||@sym==C_FROMSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         sqlFields()
         sqlFrom()
      else
         if 1
            sqlFrom()
            sqlFields()
         else
            GenError(965)
         end

      end

      while (@sym==C_LparenSym||@sym==C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_FORSym||@sym>=C_WHERESym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym==C_CONNECTIONSym)
         if @sym==C_FORSym||@sym==C_WHERESym
            if @sym==C_FORSym
               Get()
               Expect(C_ALLSym)
               Expect(C_ENTRIESSym)
               Expect(C_INSym)
               Expect(C_identifierSym)
            end

            if @sym==C_WHERESym
               Get()
               SQLCondition()
            end

         end

         if @sym==C_LparenSym||@sym==C_GROUPSym
            if @sym==C_GROUPSym
               Get()
               Expect(C_BYSym)
               if @sym==C_identifierSym
                  Get()
               else
                  if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                     Expression()
                  else
                     GenError(966)
                  end

               end

               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_StarSym&&@sym<=C_CommaSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  if @sym==C_CommaSym
                     Get()
                     Expect(C_identifierSym)
                  else
                     if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                        Expression()
                     else
                        GenError(967)
                     end

                  end

               end

            else
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(968)
               end

            end

         end

         if @sym==C_HAVINGSym
            Get()
            SQLCondition()
         end

         if @sym==C_UNIONSym
            Get()
            if @sym==C_ALLSym
               Get()
            else
               if @sym==C_DISTINCTSym
                  Get()
               else
                  GenError(969)
               end

            end

            stSELECT()
         end

         if @sym==C_ORDERSym
            sqlOrderBy()
         end

         if @sym>=C_INTOSym&&@sym<=C_APPENDINGSym
            sqlInto()
         end

         if @sym==C_EXTENDEDSym
            Get()
            Expect(C_RESULTSym)
            Expect(C_AtSym)
            Expect(C_identifierSym)
         end

         if @sym==C_CREATINGSym
            Get()
            if @sym>=C_READERSym&&@sym<=C_LOCATORSym
               if @sym==C_READERSym
                  Get()
               else
                  if @sym==C_LOCATORSym
                     Get()
                  else
                     GenError(970)
                  end

               end

               Expect(C_FORSym)
               if @sym==C_COLUMNSSym
                  Get()
                  Expect(C_identifierSym)
                  while (@sym==C_identifierSym)
                     Get()
                  end

               else
                  if @sym==C_ALLSym
                     Get()
                     if @sym==C_OTHERSym
                        Get()
                     end

                     if @sym>=C_BLOBSym&&@sym<=C_CLOBSym
                        if @sym==C_BLOBSym
                           Get()
                        else
                           if @sym==C_CLOBSym
                              Get()
                           else
                              GenError(971)
                           end

                        end

                     end

                     Expect(C_COLUMNSSym)
                  else
                     GenError(972)
                  end

               end

            else
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(973)
               end

            end

         end

         if @sym==C_OFFSETSym
            Get()
            Expression()
         end

         if @sym==C_UPSym
            Get()
            Expect(C_TOSym)
            Expression()
            Expect(C_ROWSSym)
         end

         if @sym==C_BYPASSINGSym
            Get()
            Expect(C_BUFFERSym)
         end

         if @sym==C_CONNECTIONSym
            Get()
            Expression()
         end

      end

      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      if @sym==C_ENDSELECTSym
         Get()
         Expect(C_PointSym)
      end

      _out_()
   end
   def stENDSELECT()
      _in_()
      Expect(C_ENDSELECTSym)
      Expect(C_PointSym)
      _out_()
   end
   def sqlFields()
      _in_()
      if @sym==C_FIELDSSym
         Get()
      end

      if @sym==C_DISTINCTSym
         Get()
      end

      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         if @sym==C_StarSym
            Get()
         else
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               sqlColumn()
               while (@sym==C_CommaSym)
                  Get()
                  sqlColumn()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(974)
               end

            end

         end

      end

      _out_()
   end
   def sqlColumn()
      _in_()
      if @sym==C_identifierSym
         Get()
         if @sym==C_TildeStarSym
            Get()
            while (@sym==C_CommaSym)
               Get()
               Expect(C_identifierSym)
               Expect(C_TildeStarSym)
            end

         end

      else
         if @sym==C_aggregateSym
            Get()
            Expect(C_LparenSym)
            if @sym==C_DISTINCTSym
               Get()
            end

            Expect(C_identifierSym)
            Expect(C_RparenSym)
         else
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               Expression()
            else
               GenError(975)
            end

         end

      end

      if @sym==C_ASSym
         Get()
         Expect(C_identifierSym)
      end

      _out_()
   end
   def sqlFrom()
      _in_()
      Expect(C_FROMSym)
      if @sym==C_identifierSym
         Get()
         if @sym==C_ASSym
            Get()
            Expect(C_identifierSym)
         end

      else
         if @sym==C_LparenSym||@sym>=C_INNERSym&&@sym<=C_RIGHTSym||@sym>=C_CROSSSym&&@sym<=C_JOINSym
            if @sym==C_LparenSym
               Get()
            end

            if @sym==C_identifierSym
               Get()
               if @sym==C_ASSym
                  Get()
                  Expect(C_identifierSym)
               end

            else
               if @sym>=C_INNERSym&&@sym<=C_RIGHTSym||@sym>=C_CROSSSym&&@sym<=C_JOINSym
                  sqlJoin()
               else
                  GenError(976)
               end

            end

            if @sym==C_RparenSym
               Get()
            end

         else
            if 1
               Get()
               Expect(C_identifierSym)
               Expect(C_RparenSym)
               if @sym==C_ASSym
                  Get()
                  Expect(C_identifierSym)
               end

            else
               GenError(977)
            end

         end

      end

      if @sym>=C_USINGSym&&@sym<=C_CLIENTSym
         if @sym==C_USINGSym
            Get()
            Expect(C_CLIENTSym)
            Expect(C_identifierSym)
         else
            if @sym==C_CLIENTSym
               Get()
               Expect(C_SPECIFIEDSym)
               if @sym==C_identifierSym
                  Get()
                  Expect(C_TildeSym)
                  Expect(C_identifierSym)
                  while (@sym==C_CommaSym)
                     Get()
                     Expect(C_identifierSym)
                     Expect(C_TildeSym)
                     Expect(C_identifierSym)
                  end

               end

            else
               GenError(978)
            end

         end

      end

      _out_()
   end
   def sqlJoin()
      _in_()
      if @sym==C_INNERSym||@sym==C_JOINSym
         if @sym==C_INNERSym
            Get()
         end

      else
         if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym
            if @sym==C_LEFTSym
               Get()
            else
               if @sym==C_RIGHTSym
                  Get()
               else
                  GenError(979)
               end

            end

            if @sym==C_OUTERSym
               Get()
            end

         else
            if @sym==C_CROSSSym
               Get()
            end

         end

      end

      Expect(C_JOINSym)
      Expect(C_identifierSym)
      if @sym==C_ASSym
         Get()
         Expect(C_identifierSym)
      end

      if @sym==C_ONSym
         Get()
         Expression()
      end

      _out_()
   end
   def sqlOrderBy()
      _in_()
      Expect(C_ORDERSym)
      Expect(C_BYSym)
      if @sym==C_PRIMARYSym
         Get()
         Expect(C_KEYSym)
      else
         if @sym==C_identifierSym
            Get()
            if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
               if @sym==C_ASCENDINGSym
                  Get()
               else
                  if @sym==C_DESCENDINGSym
                     Get()
                  else
                     GenError(980)
                  end

               end

            end

            while (@sym==C_CommaSym)
               Get()
               Expect(C_identifierSym)
               if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
                  if @sym==C_ASCENDINGSym
                     Get()
                  else
                     if @sym==C_DESCENDINGSym
                        Get()
                     else
                        GenError(981)
                     end

                  end

               end

            end

         else
            if @sym==C_LparenSym
               Get()
               Expect(C_identifierSym)
               Expect(C_RparenSym)
            else
               GenError(982)
            end

         end

      end

      _out_()
   end
   def sqlInto()
      _in_()
      if @sym==C_INTOSym
         Get()
      else
         if @sym==C_APPENDINGSym
            Get()
         else
            GenError(983)
         end

      end

      if @sym==C_identifierSym||@sym==C_LparenSym||@sym==C_CORRESPONDINGSym||@sym==C_TABLESym
         if @sym==C_identifierSym||@sym==C_CORRESPONDINGSym||@sym==C_TABLESym
            if @sym==C_CORRESPONDINGSym
               Get()
               Expect(C_FIELDSSym)
               Expect(C_OFSym)
            end

            if @sym==C_TABLESym
               Get()
            end

            Expect(C_identifierSym)
            if @sym==C_PACKAGESym
               Get()
               Expect(C_SIZESym)
               Expression()
            end

         else
            if @sym==C_LparenSym
               Get()
               Expect(C_identifierSym)
               while (@sym==C_CommaSym)
                  Get()
                  Expect(C_identifierSym)
               end

               Expect(C_RparenSym)
            else
               GenError(984)
            end

         end

      else
         if @sym==C_AtDATASym
            Get()
            Expect(C_LparenSym)
            Expect(C_identifierSym)
            Expect(C_RparenSym)
         else
            if 1
               Get()
               Expect(C_AtDATASym)
               Expect(C_LparenSym)
               Expect(C_identifierSym)
               Expect(C_RparenSym)
               if @sym==C_PACKAGESym
                  Get()
                  Expect(C_SIZESym)
                  Expression()
               end

            else
               GenError(985)
            end

         end

      end

      _out_()
   end
   def SQLCondition()
      _in_()
      Expression()
      _out_()
   end
   def Withline()
      _in_()
      Expect(C_PlusSym)
      Expect(C_identifierSym)
      if @sym==C_identifierSym
         Get()
         while (@sym==C_CommaSym)
            Get()
            Expect(C_identifierSym)
         end

      end

      Expect(C_ASSym)
      Expect(C_identifierSym)
      while (@sym==C_CommaSym)
         Get()
         Expect(C_PlusSym)
         Expect(C_identifierSym)
         if @sym==C_identifierSym
            Get()
            while (@sym==C_CommaSym)
               Get()
               Expect(C_identifierSym)
            end

         end

         Expect(C_ASSym)
         Expect(C_identifierSym)
      end

      stSELECT()
      Expect(C_PointSym)
      _out_()
   end
   def GroupBy()
      _in_()
      Expect(C_GROUPSym)
      Expect(C_BYSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

         if @sym==C_identifierSym
            Get()
            Expect(C_EqualSym)
            Expect(C_GROUPSym)
            Expect(C_SIZESym)
         end

         if @sym==C_identifierSym
            Get()
            Expect(C_EqualSym)
            Expect(C_GROUPSym)
            Expect(C_INDEXSym)
         end

      else
         if 1
            Get()
         else
            GenError(986)
         end

      end

      if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
         if @sym==C_ASCENDINGSym
            Get()
         else
            if @sym==C_DESCENDINGSym
               Get()
            else
               GenError(987)
            end

         end

         if @sym==C_ASSym
            Get()
            Expect(C_TEXTSym)
         end

      end

      if @sym==C_WITHOUTSym
         Get()
         Expect(C_MEMBERSSym)
      end

      if @sym==C_INTOSym||@sym==C_ASSIGNINGSym||@sym==C_REFERENCESym
         if @sym==C_INTOSym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_ASSIGNINGSym
               Get()
               Expect(C_LessSym)
               Expect(C_identifierSym)
               Expect(C_GreaterSym)
            else
               if @sym==C_REFERENCESym
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)
               else
                  GenError(988)
               end

            end

         end

      end

      _out_()
   end
   def TypeDes()
      _in_()
      Expect(C_TYPESym)
      case @sym

      when C_identifierSym,
         C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_spaceD1Sym,
         C_LparenSym,
         C_LessSym,
         C_StarSym,
         C_TildeSym,
         C_INSym,
         C_PlusSym,
         C_INITIALSym,
         C_SlashSym,
         C_NOTSym,
         C_AndSym,
         C_MinusSym,
         C_PlusPlusSym,
         C_MinusMinusSym,
         C_BangSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         Expression()
         if @sym==C_identifierSym||@sym==C_PointSym||@sym==C_DECIMALSSym||@sym==C_BOXEDSym||@sym>=C_READMinusONLYSym&&@sym<=C_OCCURSSym||@sym==C_VALUESym
            if @sym==C_identifierSym
               Get()

               is('LENGTH');

               Expect(C_numberSym)
            end

            if @sym==C_DECIMALSSym
               Get()
               Expect(C_numberSym)
            end

         else
            if @sym>=C_READERSym&&@sym<=C_LOCATORSym||@sym==C_LOBSym
               if @sym==C_READERSym
                  Get()
               else
                  if @sym==C_LOCATORSym
                     Get()
                  else
                     if @sym==C_LOBSym
                        Get()
                        Expect(C_HANDLESym)
                     else
                        GenError(989)
                     end

                  end

               end

            else
               if @sym==C_FORSym
                  Get()
                  Expect(C_COLUMNSSym)
                  Expect(C_identifierSym)
                  while (@sym==C_identifierSym)
                     Get()
                  end

               else
                  GenError(990)
               end

            end

         end


      when C_LINESym
         if @sym==C_LINESym
            Get()
            Expect(C_OFSym)
         end

         Expect(C_identifierSym)
         if @sym==C_BOXEDSym
            Get()
         end


      when C_REFSym
         Get()
         Expect(C_TOSym)
         Expression()

      when C_STANDARDSym,
         C_TABLESym,
         C_SORTEDSym
         if @sym==C_STANDARDSym||@sym==C_SORTEDSym
            if @sym==C_STANDARDSym
               Get()
            else
               if @sym==C_SORTEDSym
                  Get()
               else
                  if 1
                     Get()
                  else
                     GenError(991)
                  end

               end

            end

         end

         Expect(C_TABLESym)
         Expect(C_OFSym)
         if @sym==C_REFSym
            Get()
            Expect(C_TOSym)
         end

         Expect(C_identifierSym)
         while (@sym==C_WITHSym)
            Get()
            case @sym

            when C_EMPTYSym
               Get()
               Expect(C_KEYSym)

            when C_HEADERSym
               Get()
               Expect(C_LINESym)

            when C_KEYSym,
               C_UNIQUESym,
               C_NONMinusUNIQUESym,
               C_DEFAULTSym
               if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                  if @sym==C_UNIQUESym
                     Get()
                  else
                     if @sym==C_NONMinusUNIQUESym
                        Get()
                     else
                        GenError(992)
                     end

                  end

               end

               if @sym==C_KEYSym
                  Get()
                  if @sym==C_primaryUnderscorekeySym
                     Get()
                     if @sym==C_ALIASSym
                        Get()
                        Expect(C_identifierSym)
                     end

                     Expect(C_COMPONENTSSym)
                  end

                  Expect(C_identifierSym)
                  while (@sym==C_identifierSym)
                     Get()
                  end

               else
                  if @sym==C_DEFAULTSym
                     Get()
                     Expect(C_KEYSym)
                  else
                     GenError(993)
                  end

               end


            when C_SORTEDSym
               if @sym==C_UNIQUESym
                  Get()
                  Expect(C_HASHEDSym)
               else
                  if @sym==C_SORTEDSym||@sym==C_NONMinusUNIQUESym
                     if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(994)
                           end

                        end

                     end

                     Expect(C_SORTEDSym)
                  else
                     GenError(995)
                  end

               end

               Expect(C_KEYSym)
               Expect(C_identifierSym)
               Expect(C_COMPONENTSSym)
               while (@sym==C_identifierSym)
                  Get()
               end


            else
               GenError(996)

            end

         end

         if @sym==C_INITIALSym
            Get()
            Expect(C_SIZESym)
            Expect(C_numberSym)
         end


      when C_RANGESym
         Get()
         Expect(C_OFSym)
         Type()
         if @sym==C_INITIALSym
            Get()
            Expect(C_SIZESym)
            Expect(C_numberSym)
         end

         if @sym==C_WITHSym
            Get()
            Expect(C_HEADERSym)
            Expect(C_LINESym)
         end


      when C_ALLSym
         Get()
         if @sym==C_OTHERSym
            Get()
         end

         if @sym>=C_BLOBSym&&@sym<=C_CLOBSym
            if @sym==C_BLOBSym
               Get()
            else
               if @sym==C_CLOBSym
                  Get()
               else
                  GenError(997)
               end

            end

         end

         Expect(C_COLUMNSSym)

      else
         GenError(998)

      end

      _out_()
   end
   def LikeDes()
      _in_()
      Expect(C_LIKESym)
      case @sym

      when C_identifierSym,
         C_LINESym
         if @sym==C_LINESym
            Get()
            Expect(C_OFSym)
         end

         Expect(C_identifierSym)

      when C_REFSym
         Get()
         Expect(C_TOSym)
         Expect(C_identifierSym)

      when C_STANDARDSym,
         C_OFSym,
         C_TABLESym,
         C_SORTEDSym,
         C_HASHEDSym
         while (@sym==C_STANDARDSym||@sym==C_TABLESym||@sym==C_SORTEDSym||@sym==C_HASHEDSym)
            if @sym==C_STANDARDSym||@sym==C_TABLESym
               if @sym==C_STANDARDSym
                  Get()
               end

               Expect(C_TABLESym)
            else
               if @sym==C_SORTEDSym
                  Get()
                  Expect(C_TABLESym)
               else
                  if @sym==C_HASHEDSym
                     Get()
                     Expect(C_TABLESym)
                  else
                     GenError(999)
                  end

               end

            end

         end

         Expect(C_OFSym)
         if @sym==C_REFSym
            Get()
            Expect(C_TOSym)
         end

         Expect(C_identifierSym)
         if @sym==C_WITHSym
            if @sym==C_WITHSym
               Get()
               if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                  if @sym==C_UNIQUESym
                     Get()
                  else
                     if @sym==C_NONMinusUNIQUESym
                        Get()
                     else
                        GenError(1000)
                     end

                  end

               end

               while (@sym==C_KEYSym||@sym==C_DEFAULTSym)
                  if @sym==C_KEYSym
                     Get()
                     if @sym==C_primaryUnderscorekeySym
                        Get()
                        if @sym==C_ALIASSym
                           Get()
                           Expect(C_identifierSym)
                        end

                        Expect(C_COMPONENTSSym)
                     end

                     while (@sym==C_identifierSym)
                        Get()
                     end

                  else
                     if @sym==C_DEFAULTSym
                        Get()
                        Expect(C_KEYSym)
                     else
                        GenError(1001)
                     end

                  end

               end

            else
               if 1
                  Get()
                  Expect(C_EMPTYSym)
                  Expect(C_KEYSym)
               else
                  GenError(1002)
               end

            end

         end

         while (@sym==C_KEYSym||@sym==C_WITHSym||@sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
            if @sym==C_WITHSym
               Get()
               while (@sym==C_UNIQUESym)
                  Get()
                  Expect(C_HASHEDSym)
               end

            else
               if @sym==C_KEYSym||@sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                  while (@sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                     while (@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(1003)
                           end

                        end

                     end

                     Expect(C_SORTEDSym)
                  end

                  Expect(C_KEYSym)
                  Expect(C_identifierSym)
                  Expect(C_COMPONENTSSym)
                  while (@sym==C_identifierSym)
                     Get()
                  end

               else
                  GenError(1004)
               end

            end

         end

         if @sym==C_INITIALSym
            Get()
            Expect(C_SIZESym)
            Expect(C_numberSym)
         end

         if @sym==C_WITHSym
            Get()
            Expect(C_HEADERSym)
            Expect(C_LINESym)
         end


      when C_RANGESym
         Get()
         Expect(C_OFSym)
         Expect(C_identifierSym)
         if @sym==C_INITIALSym
            Get()
            Expect(C_SIZESym)
            Expect(C_numberSym)
         end

         if @sym==C_WITHSym
            Get()
            Expect(C_HEADERSym)
            Expect(C_LINESym)
         end


      else
         GenError(1005)

      end

      _out_()
   end
   def Format_options()
      _in_()
      while (@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym)
         if @sym==C_COLORSym
            Get()
            if @sym==C_numberSym||@sym==C_EqualSym||@sym==C_OFFSym||@sym==C_COLUnderscoreBACKGROUNDSym||@sym>=C_COLUnderscoreNORMALSym&&@sym<=C_COLUnderscoreGROUPSym
               if @sym==C_numberSym||@sym==C_EqualSym||@sym==C_COLUnderscoreBACKGROUNDSym||@sym>=C_COLUnderscoreNORMALSym&&@sym<=C_COLUnderscoreGROUPSym
                  if @sym==C_EqualSym
                     Get()
                  end

                  case @sym

                  when C_COLUnderscoreBACKGROUNDSym
                     Get()
                     Expect(C_COLUnderscoreHEADINGSym)

                  when C_COLUnderscoreNORMALSym
                     Get()

                  when C_COLUnderscoreTOTALSym
                     Get()

                  when C_COLUnderscoreKEYSym
                     Get()

                  when C_COLUnderscorePOSITIVESym
                     Get()

                  when C_COLUnderscoreNEGATIVESym
                     Get()

                  when C_COLUnderscoreGROUPSym
                     Get()

                  when C_numberSym
                     Get()

                  else
                     GenError(1006)

                  end

                  if @sym==C_ONSym
                     Get()
                  end

               else
                  if @sym==C_OFFSym
                     Get()
                  else
                     GenError(1007)
                  end

               end

            else
               if 1
                  Get()
                  Expect(C_stringD1Sym)
               else
                  GenError(1008)
               end

            end

         end

         if @sym==C_INTENSIFIEDSym
            Get()
            if @sym==C_ONSym||@sym==C_EqualSym||@sym==C_OFFSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1009)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1010)
                  end

               end

            end

         end

         if @sym==C_INVERSESym
            Get()
            if @sym==C_ONSym||@sym==C_EqualSym||@sym==C_OFFSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1011)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1012)
                  end

               end

            end

         end

         if @sym==C_HOTSPOTSym
            Get()
            if @sym==C_ONSym||@sym==C_EqualSym||@sym==C_OFFSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1013)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1014)
                  end

               end

            end

         end

         if @sym==C_INPUTSym
            Get()
            if @sym==C_ONSym||@sym==C_EqualSym||@sym==C_OFFSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1015)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1016)
                  end

               end

            end

         end

         if @sym==C_FRAMESSym
            Get()
            if @sym==C_ONSym||@sym==C_EqualSym||@sym==C_OFFSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1017)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1018)
                  end

               end

            end

         end

         if @sym==C_RESETSym
            Get()
         end

      end

      _out_()
   end
   def Statements()
      _in_()
      Statement()
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym==C_INSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym==C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_READSym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_TRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_IFSym||@sym>=C_returnSym&&@sym<=C_CLASSSym||@sym==C_CREATESym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_BACKSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym==C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         Statement()
      end

      _out_()
   end
   def AUTHORITY_CHECK_ITEM()
      _in_()
      Expect(C_IDSym)
      Expect(C_identifierSym)
      if @sym==C_FIELDSym
         Get()
         Expression()
      else
         if @sym==C_DUMMYSym
            Get()
         else
            GenError(1019)
         end

      end

      _out_()
   end
   def VARYING()
      _in_()
      Expect(C_VARYINGSym)
      Expect(C_identifierSym)
      Expect(C_FROMSym)
      Expect(C_identifierSym)
      Expect(C_NEXTSym)
      Expect(C_identifierSym)
      if @sym==C_RANGESym
         Get()
         Expression()
      end

      _out_()
   end
   def Event_exp_item()
      _in_()
      Expect(C_VALUESym)
      Expression()
      Typing()
      if @sym==C_DEFAULTSym||@sym==C_OPTIONALSym
         if @sym==C_OPTIONALSym
            Get()
         else
            if @sym==C_DEFAULTSym
               Get()
               Expression()
            else
               GenError(1020)
            end

         end

      end

      _out_()
   end
   def Typing()
      _in_()
      if @sym==C_TYPESym
         Get()
         if @sym==C_LINESym||@sym==C_REFSym
            if @sym==C_LINESym
               Get()
               Expect(C_OFSym)
            else
               if @sym==C_REFSym
                  Get()
                  Expect(C_TOSym)
               else
                  GenError(1021)
               end

            end

         end

         Expression()
      else
         if @sym==C_LIKESym
            Get()
            if @sym==C_LINESym||@sym==C_REFSym
               if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym>=C_INITIALSym&&@sym<=C_LINESym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  if @sym==C_LINESym
                     Get()
                     Expect(C_OFSym)
                  end

               else
                  if @sym==C_REFSym
                     Get()
                     Expect(C_TOSym)
                  else
                     GenError(1022)
                  end

               end

            end

            Expression()
         else
            GenError(1023)
         end

      end

      _out_()
   end
   def Event_options()
      _in_()
      Expect(C_EXPORTINGSym)
      Event_exp_item()
      while (@sym==C_VALUESym)
         Event_exp_item()
      end

      _out_()
   end
   def ProvideFields()
      _in_()
      Expect(C_FIELDSSym)
      if @sym==C_StarSym
         Get()
      else
         if @sym==C_identifierSym
            Get()
            while (@sym==C_identifierSym)
               Get()
            end

         else
            GenError(1024)
         end

      end

      Expect(C_FROMSym)
      Expect(C_identifierSym)
      Expect(C_INTOSym)
      Expect(C_identifierSym)
      Expect(C_VALIDSym)
      Expect(C_identifierSym)
      Expect(C_BOUNDSSym)
      Expect(C_numberSym)
      Expect(C_ANDSym)
      Expect(C_numberSym)
      if @sym==C_WHERESym
         Get()
         Expression()
      end

      _out_()
   end
   def Association()
      _in_()
      Expect(C_ASSOCIATIONSym)
      Expect(C_identifierSym)
      Expect(C_TOSym)
      Expect(C_identifierSym)
      Expect(C_ONSym)
      Expect(C_identifierSym)
      Expect(C_EqualSym)
      Expect(C_identifierSym)
      while (@sym==C_ANDSym)
         Get()
         Expect(C_identifierSym)
         Expect(C_EqualSym)
         Expect(C_identifierSym)
      end

      if @sym==C_USINGSym
         Get()
         Expect(C_KEYSym)
         Expect(C_identifierSym)
      end

      _out_()
   end
   def Types_mesh_stmt()
      _in_()
      Expect(C_TYPESSym)
      Expect(C_identifierSym)
      if @sym==C_TYPESym
         Get()
         if @sym==C_REFSym
            Get()
            Expect(C_TOSym)
         end

         Expect(C_identifierSym)
      else
         if @sym==C_LIKESym
            Get()
            if @sym==C_REFSym
               Get()
               Expect(C_TOSym)
            end

            Expect(C_identifierSym)
         else
            GenError(1025)
         end

      end

      while (@sym==C_ASSOCIATIONSym)
         Association()
      end

      Expect(C_PointSym)
      _out_()
   end
   def TypeOfStuct()
      _in_()
      while (@sym==C_TYPESSym)
         Get()
         Expect(C_identifierSym)
         if @sym==C_LparenSym
            Get()
            Expect(C_numberSym)
            Expect(C_RparenSym)
         end

         if @sym==C_TYPESym
            TypeDes()
         else
            if @sym==C_LIKESym
               LikeDes()
            else
               GenError(1026)
            end

         end

         if @sym==C_BOXEDSym
            Get()
         end

         Expect(C_PointSym)
      end

      while (@sym==C_INCLUDESym)
         stINCLUDE()
      end

      Expect(C_TYPESSym)
      Expect(C_ENDSym)
      Expect(C_OFSym)
      Expect(C_identifierSym)
      _out_()
   end
   def CallFunction()
      _in_()
      if @sym==C_FUNCTIONSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_CALLINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym==C_INSym)
                  Get()
                  Expect(C_UPDATESym)
                  Expect(C_TASKSym)
               end

            else
               if @sym==C_STARTINGSym||@sym==C_DESTINATIONSym
                  while (@sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym)
                     if @sym==C_INSym||@sym==C_STARTINGSym
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym>=C_SEARCHSym&&@sym<=C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_DESTINATIONSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                           while (@sym==C_STARTINGSym)
                              Get()
                              Expect(C_NEWSym)
                              Expect(C_TASKSym)
                              Expect(C_identifierSym)
                           end

                        else
                           if 1
                              while (@sym==C_INSym)
                                 Get()
                                 Expect(C_BACKGROUNDSym)
                                 Expect(C_TASKSym)
                                 if @sym==C_ASSym
                                    Get()
                                    Expect(C_SEPARATESym)
                                    Expect(C_UNITSym)
                                 end

                              end

                           else
                              GenError(1027)
                           end

                        end

                     end

                     if @sym==C_DESTINATIONSym
                        Get()
                        Expect(C_identifierSym)
                     end

                  end

               else
                  if 1
                     while (@sym==C_INSym)
                        Get()
                        Expect(C_BACKGROUNDSym)
                        Expect(C_UNITSym)
                     end

                  else
                     GenError(1028)
                  end

               end

            end

         end

         if @sym==C_ONSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym==C_CALLINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym==C_CALLINGSym)
                  Get()
                  Expect(C_identifierSym)
               end

            else
               if @sym==C_PERFORMINGSym
                  while (@sym==C_PERFORMINGSym)
                     Get()
                     Expect(C_identifierSym)
                  end

                  Expect(C_ONSym)
                  Expect(C_ENDSym)
                  Expect(C_OFSym)
                  Expect(C_TASKSym)
               else
                  GenError(1029)
               end

            end

         end

         while (@sym==C_TABLESSym||@sym==C_EXPORTINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym)
            if @sym==C_EXPORTINGSym
               Get()
               while (@sym==C_identifierSym)
                  Get()
                  Expect(C_EqualSym)
                  Expression()
               end

            end

            if @sym==C_IMPORTINGSym
               Get()
               while (@sym==C_identifierSym)
                  Get()
                  Expect(C_EqualSym)
                  Expression()
               end

            end

            if @sym==C_TABLESSym
               Get()
               while (@sym==C_identifierSym)
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_identifierSym)
               end

            end

            if @sym==C_CHANGINGSym
               Get()
               while (@sym==C_identifierSym)
                  Get()
                  Expect(C_EqualSym)
                  Expression()
               end

            end

            if @sym==C_EXCEPTIONSSym
               Get()
               while (@sym==C_identifierSym)
                  Get()
                  Expect(C_EqualSym)
                  Expression()
               end

               if @sym==C_errorUnderscoremessageSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_stringD1Sym)
               end

               if @sym==C_systemUnderscorefailureSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_stringD1Sym)
                  if @sym==C_MESSAGESym
                     Get()
                     Expect(C_stringD1Sym)
                  end

               end

               if @sym==C_communicationUnderscorefaiSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_stringD1Sym)
                  if @sym==C_MESSAGESym
                     Get()
                     Expect(C_stringD1Sym)
                  end

               end

               if @sym==C_resourceUnderscorefailureSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_stringD1Sym)
               end

               if @sym==C_OTHERSSym
                  Get()
                  Expect(C_EqualSym)
                  Expect(C_stringD1Sym)
               end

            end

         end

      else
         if @sym==C_PointSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym
            while (@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym)
               if @sym==C_PARAMETERMinusTABLESym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_EXCEPTIONMinusTABLESym
                  Get()
                  Expect(C_identifierSym)
               end

            end

            Expect(C_PointSym)
         else
            GenError(1030)
         end

      end

      _out_()
   end
   def CallBadi()
      _in_()
      if @sym==C_BADISym
         Get()
         Expect(C_identifierSym)
         Expect(C_MinusGreaterSym)
         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
         if @sym==C_EXPORTINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_IMPORTINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_CHANGINGSym
            Get()
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_RECEIVINGSym
            Get()
            Expression()
         end

         if @sym==C_EXCEPTIONSSym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

            if @sym==C_OTHERSSym
               Get()
               Expect(C_EqualSym)
               Expression()
            end

         end

      else
         if @sym==C_PointSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym
            if @sym==C_PARAMETERMinusTABLESym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_EXCEPTIONMinusTABLESym
               Get()
               Expect(C_identifierSym)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def CallDialog()
      _in_()
      Expect(C_DIALOGSym)
      Expect(C_identifierSym)
      if @sym==C_USINGSym||@sym==C_ANDSym
         if @sym==C_ANDSym
            Get()
            Expect(C_SKIPSym)
            Expect(C_FIRSTSym)
            Expect(C_SCREENSym)
         else
            if @sym==C_USINGSym
               Get()
               Expect(C_identifierSym)
               if @sym==C_MODESym
                  Get()
                  Expect(C_identifierSym)
               end

            else
               GenError(1031)
            end

         end

      end

      if @sym==C_EXPORTINGSym
         Get()
         Expect(C_identifierSym)
         Expect(C_FROMSym)
         Expect(C_identifierSym)
         while (@sym==C_identifierSym)
            Get()
            Expect(C_FROMSym)
            Expect(C_identifierSym)
         end

      end

      if @sym==C_IMPORTINGSym
         Get()
         Expect(C_identifierSym)
         Expect(C_TOSym)
         Expect(C_identifierSym)
         while (@sym==C_identifierSym)
            Get()
            Expect(C_TOSym)
            Expect(C_identifierSym)
         end

      end

      _out_()
   end
   def CallCustomerFunction()
      _in_()
      Expect(C_CUSTOMERMinusFUNCTIONSym)
      Expect(C_identifierSym)
      if @sym==C_EXPORTINGSym
         Get()
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      end

      if @sym==C_IMPORTINGSym
         Get()
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      end

      if @sym==C_CHANGINGSym
         Get()
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      end

      if @sym==C_TABLESSym
         Get()
         Expression()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      end

      if @sym==C_EXCEPTIONSSym
         Get()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

         if @sym==C_stringD1Sym
            Get()
            Expect(C_EqualSym)
            Expect(C_identifierSym)
         end

         if @sym==C_OTHERSSym
            Get()
            Expect(C_EqualSym)
            Expression()
         end

      end

      _out_()
   end
   def CallDatabaseProcedure()
      _in_()
      Expect(C_DATABASESym)
      Expect(C_PROCEDURESym)
      Expect(C_LparenSym)
      Expect(C_identifierSym)
      Expect(C_RparenSym)
      if @sym==C_CONNECTIONSym
         Get()
         if @sym==C_LparenSym
            Get()
            Expression()
            Expect(C_RparenSym)
         else
            if @sym==C_identifierSym
               Get()
            else
               GenError(1032)
            end

         end

      end

      if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym==C_IMPORTINGSym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         if @sym==C_EXPORTINGSym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_IMPORTINGSym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

      else
         if @sym==C_PARAMETERMinusTABLESym
            if @sym==C_PARAMETERMinusTABLESym
               Get()
               Expect(C_identifierSym)
            end

         else
            GenError(1033)
         end

      end

      _out_()
   end
   def CallMethod()
      _in_()
      Expect(C_METHODSym)
      if @sym==C_identifierSym||@sym==C_stringD1Sym||@sym==C_LparenSym
         if @sym==C_LparenSym
            Get()
         end

         if @sym==C_stringD1Sym
            Get()
         else
            if @sym==C_identifierSym
               Get()
            else
               GenError(1034)
            end

         end

         if @sym==C_RparenSym
            Get()
         end

         if @sym>=C_MinusGreaterSym&&@sym<=C_EqualGreaterSym
            if @sym==C_MinusGreaterSym
               Get()
            else
               if @sym==C_EqualGreaterSym
                  Get()
               else
                  GenError(1035)
               end

            end

            if @sym==C_LparenSym
               Get()
            end

            if @sym==C_stringD1Sym
               Get()
            else
               if @sym==C_identifierSym
                  Get()
                  while (@sym==C_TildeSym)
                     Get()
                     Expect(C_identifierSym)
                  end

               else
                  GenError(1036)
               end

            end

            if @sym==C_RparenSym
               Get()
            end

         end

      else
         if @sym==C_OFSym
            Get()
            Expect(C_identifierSym)
            Expect(C_identifierSym)
            if @sym==C_EqualSym
               Get()
               Expect(C_identifierSym)
            end

         else
            GenError(1037)
         end

      end

      while (@sym==C_NOSym||@sym==C_EXPORTINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_CHANGINGSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym||@sym==C_RECEIVINGSym||@sym==C_QUEUEMinusONLYSym)
         if @sym==C_PARAMETERMinusTABLESym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_EXCEPTIONMinusTABLESym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_EXPORTINGSym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         if @sym==C_IMPORTINGSym
            Get()
            while (@sym==C_identifierSym)
               Get()
               Expect(C_EqualSym)
               Expression()
            end

         end

         if @sym==C_CHANGINGSym
            Get()
            while (@sym==C_identifierSym)
               Get()
               Expect(C_EqualSym)
               Expression()
            end

         end

         if @sym==C_RECEIVINGSym
            Get()
            Expression()
         end

         if @sym==C_NOSym
            Get()
            Expect(C_FLUSHSym)
         end

         if @sym==C_QUEUEMinusONLYSym
            Get()
         end

      end

      _out_()
   end
   def CallScreen()
      _in_()
      Expect(C_SCREENSym)
      Expect(C_identifierSym)
      if @sym==C_STARTINGSym
         Get()
         Expect(C_ATSym)
         Expect(C_stringD1Sym)
         Expect(C_numberSym)
         if @sym==C_ENDINGSym
            Get()
            Expect(C_ATSym)
            Expect(C_stringD1Sym)
            Expect(C_numberSym)
         end

      end

      _out_()
   end
   def CallSelectionScreen()
      _in_()
      Expect(C_SELECTIONMinusSCREENSym)
      Expect(C_identifierSym)
      if @sym==C_STARTINGSym
         Get()
         Expect(C_ATSym)
         Expect(C_stringD1Sym)
         Expect(C_numberSym)
         if @sym==C_ENDINGSym
            Get()
            Expect(C_ATSym)
            Expect(C_stringD1Sym)
            Expect(C_numberSym)
         end

      end

      if @sym==C_USINGSym
         Get()
         Expect(C_SELECTIONMinusSETSym)
         Expect(C_identifierSym)
      end

      _out_()
   end
   def CallTransation()
      _in_()
      if @sym==C_TRANSACTIONSym
         Get()
         Expect(C_identifierSym)
         Expect(C_WITHSym)
      else
         if @sym==C_WITHOUTSym
            Get()
            Expect(C_AUTHORITYMinusCHECKSym)
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_ANDSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               if @sym==C_ANDSym
                  Get()
                  Expect(C_SKIPSym)
                  Expect(C_FIRSTSym)
                  Expect(C_SCREENSym)
               end

            else
               if 1
                  if @sym==C_USINGSym
                     Get()
                     Expect(C_identifierSym)
                     if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_MODESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym==C_MESSAGESSym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                        if @sym==C_MODESym
                           Get()
                           Expect(C_stringD1Sym)
                        end

                        if @sym==C_UPDATESym
                           Get()
                           Expect(C_identifierSym)
                        end

                     else
                        if @sym==C_OPTIONSSym
                           if @sym==C_OPTIONSSym
                              Get()
                              Expect(C_FROMSym)
                              Expect(C_identifierSym)
                           end

                        end

                     end

                     if @sym==C_MESSAGESSym
                        Get()
                        Expect(C_INTOSym)
                        Expect(C_identifierSym)
                     end

                  end

               else
                  GenError(1038)
               end

            end

         else
            GenError(1039)
         end

      end

      _out_()
   end
   def CallTransformation()
      _in_()
      if @sym==C_TRANSFORMATIONSym
         Get()
         Name()
         if @sym==C_PARAMETERSSym
            Get()
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_OPTIONSSym||@sym>=C_OBJECTSSym&&@sym<=C_SOURCESym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  Expression()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(1040)
               end

            end

         end

         if @sym==C_OBJECTSSym
            Get()
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_OPTIONSSym||@sym==C_SOURCESym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  Expression()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(1041)
               end

            end

         end

         if @sym==C_OPTIONSSym
            Get()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
               Expression()
            end

         end

         Expect(C_SOURCESym)
         Expect(C_XMLSym)
         Expect(C_identifierSym)
      else
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_RESULTSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_RESULTSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  Expression()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               end

            end

            Expect(C_RESULTSym)
            Expect(C_XMLSym)
            Expect(C_identifierSym)
         else
            if @sym==EOF_Sym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_USINGSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_WHERESym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym==C_CONNECTIONSym||@sym==C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_APPENDSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_WRITESym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym==C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym==C_AREASym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym
               if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym>=C_PointSym&&@sym<=C_FIELDSSym||@sym==C_StarSym||@sym==C_USINGSym||@sym==C_TildeSym||@sym>=C_ONSym&&@sym<=C_ORDERSym||@sym>=C_INTOSym&&@sym<=C_APPENDINGSym||@sym==C_TABLESym||@sym==C_SELECTSym||@sym>=C_FORSym&&@sym<=C_UPDATESym||@sym>=C_INSym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym>=C_CONNECTIONSym&&@sym<=C_WITHSym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_MESSAGESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym>=C_DATASym&&@sym<=C_STATICSSym||@sym>=C_CONSTANTSSym&&@sym<=C_SlashSym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_WHENSym||@sym==C_ENDCASESym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_DELETESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SELECTIONMinusSCREENSym||@sym==C_PROGRAMSym||@sym>=C_NOTSym&&@sym<=C_FREESym||@sym==C_PARAMETERSSym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym>=C_CLEANUPSym&&@sym<=C_ENDTRYSym||@sym==C_TYPESSym||@sym==C_forSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_CLASSSym||@sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_CREATESym||@sym>=C_ENDCLASSSym&&@sym<=C_CLASSMinusMETHODSSym||@sym==C_ADDSym||@sym>=C_ADDMinusCORRESPONDINGSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym==C_AREASym||@sym>=C_CHECKSym&&@sym<=C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_COMPUTESym||@sym==C_CONDENSESym||@sym==C_CONTROLSSym||@sym>=C_TABSTRIPSym&&@sym<=C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_REGEXSym||@sym>=C_FUNCTIONMinusPOOLSym&&@sym<=C_GENERATESym||@sym==C_INCLUDESym||@sym==C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym==C_INTERFACESym||@sym>=C_INTERFACEMinusPOOLSym&&@sym<=C_INTERFACESSym||@sym==C_LEAVESym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym>=C_NEWMinusSECTIONSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_PRINTMinusCONTROLSym||@sym>=C_RANGESSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SELECTMinusOPTIONSSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SYNTAXMinusCHECKSym||@sym>=C_TESTMinusINJECTIONSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                  while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                     Expression()
                  end

               else
                  if 1
                     Get()
                     Expect(C_identifierSym)
                     Expect(C_RparenSym)
                  end

               end

               if @sym==C_AREASym
                  Get()
                  Expect(C_HANDLESym)
                  Expect(C_identifierSym)
               end

            else
               GenError(1042)
            end

         end

      end

      _out_()
   end
   def Conditional()
      _in_()
      LogORExp()
      _out_()
   end
   def AssignmentOperator()
      _in_()
      case @sym

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
         GenError(1043)

      end

      _out_()
   end
   def LogORExp()
      _in_()
      LogANDExp()
      while (@sym==C_ORSym||@sym>=C_BarBarSym&&@sym<=C_EQUIVSym)
         if @sym==C_BarBarSym
            Get()
         else
            if @sym==C_ORSym
               Get()
            else
               if @sym==C_EQUIVSym
                  Get()
               else
                  GenError(1044)
               end

            end

         end

         LogANDExp()
      end

      _out_()
   end
   def LogANDExp()
      _in_()
      InclORExp()
      while (@sym==C_ANDSym||@sym==C_AndAndSym)
         if @sym==C_AndAndSym
            Get()
         else
            if @sym==C_ANDSym
               Get()
            else
               GenError(1045)
            end

         end

         InclORExp()
      end

      _out_()
   end
   def InclORExp()
      _in_()
      ExclORExp()
      while (@sym==C_BarSym)
         Get()
         ExclORExp()
      end

      _out_()
   end
   def ExclORExp()
      _in_()
      ANDExp()
      while (@sym==C_UparrowSym)
         Get()
         ANDExp()
      end

      _out_()
   end
   def ANDExp()
      _in_()
      EqualExp()
      while (@sym==C_AndSym)
         Get()
         EqualExp()
      end

      _out_()
   end
   def EqualExp()
      _in_()
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         RelationExp()
         while (@sym==C_LIKESym||@sym==C_EqualSym||@sym==C_ISSym||@sym>=C_EQSym&&@sym<=C_NESym||@sym==C_LessGreaterSym)
            case @sym

            when C_EqualSym
               Get()

            when C_EQSym
               Get()

            when C_LessGreaterSym
               Get()

            when C_NESym
               Get()

            when C_ISSym
               Get()
               if @sym==C_NOTSym
                  Get()
               end


            when C_LIKESym
               Get()

            else
               GenError(1046)

            end

            RelationExp()
         end

      else
         if 1
            RelationExp()
            if @sym==C_NOTSym
               Get()
            end

            Expect(C_BETWEENSym)
            RelationExp()
            Expect(C_ANDSym)
            RelationExp()
         else
            GenError(1047)
         end

      end

      _out_()
   end
   def RelationExp()
      _in_()
      ShiftExp()
      while (@sym>=C_LessSym&&@sym<=C_GreaterSym||@sym>=C_CPSym&&@sym<=C_GTSym||@sym>=C_LessEqualSym&&@sym<=C_BYTEMinusNSSym)
         case @sym

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
            GenError(1048)

         end

         ShiftExp()
      end

      _out_()
   end
   def ShiftExp()
      _in_()
      AddExp()
      while (@sym>=C_LessLessSym&&@sym<=C_GreaterGreaterSym)
         if @sym==C_LessLessSym
            Get()
         else
            if @sym==C_GreaterGreaterSym
               Get()
            else
               GenError(1049)
            end

         end

         AddExp()
      end

      _out_()
   end
   def AddExp()
      _in_()
      MultExp()
      while (@sym==C_PlusSym||@sym==C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               GenError(1050)
            end

         end

         MultExp()
      end

      _out_()
   end
   def MultExp()
      _in_()
      CastExp()
      while (@sym==C_StarSym||@sym>=C_SlashSym&&@sym<=C_StarStarSym||@sym>=C_DIVSym&&@sym<=C_MODSym)
         case @sym

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
            GenError(1051)

         end

         CastExp()
      end

      _out_()
   end
   def CastExp()
      _in_()
      UnaryExp()
      _out_()
   end
   def UnaryExp()
      _in_()
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym||@sym==C_LessSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym
         PostFixExp()
      else
         if @sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym
            if @sym==C_PlusPlusSym
               Get()
            else
               if @sym==C_MinusMinusSym
                  Get()
               else
                  GenError(1052)
               end

            end

            UnaryExp()
         else
            if @sym==C_spaceD1Sym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_BangSym&&@sym<=C_INSTANCESym
               UnaryOperator()
               CastExp()
            else
               GenError(1053)
            end

         end

      end

      _out_()
   end
   def PostFixExp()
      _in_()
      Primary()
      while (@sym==C_LparenSym||@sym==C_TildeSym||@sym==C_LbrackSym||@sym>=C_MinusGreaterSym&&@sym<=C_EqualGreaterSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym)
         case @sym

         when C_LbrackSym
            Get()
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               Expression()
            end

            Expect(C_RbrackSym)

         when C_LparenSym
            FunctionCall()

         when C_TildeSym
            Get()
            Expect(C_identifierSym)

         when C_MinusGreaterSym
            Get()
            Expect(C_identifierSym)

         when C_EqualGreaterSym
            Get()
            Expect(C_identifierSym)

         when C_MinusSym
            Get()
            Expect(C_identifierSym)

         when C_PlusPlusSym
            Get()

         when C_MinusMinusSym
            Get()

         else
            GenError(1054)

         end

      end

      _out_()
   end
   def UnaryOperator()
      _in_()
      case @sym

      when C_PlusSym
         Get()

      when C_spaceD1Sym,
         C_MinusSym
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

      when C_INSTANCESym
         Get()
         Expect(C_OFSym)

      when C_INSym
         Get()

      else
         GenError(1055)

      end

      _out_()
   end
   def Primary()
      _in_()
      case @sym

      when C_stringD1Sym
         Get()
         while (@sym==C_stringD1Sym)
            Get()
         end


      when C_charSym
         Get()

      when C_numberSym
         Get()

      when C_LparenSym
         Get()
         Expression()
         Expect(C_RparenSym)

      when C_INITIALSym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         PredefinedConstant()

      when C_identifierSym
         Get()

      when C_LessSym
         if @sym==C_LessSym
            Get()
         end

         Expect(C_identifierSym)
         if @sym==C_GreaterSym
            Get()
         end


      when C_SlashSym
         Get()
         Expect(C_identifierSym)
         while (@sym==C_SlashSym)
            Get()
            Expect(C_identifierSym)
         end


      else
         GenError(1056)

      end

      _out_()
   end
   def FunctionCall()
      _in_()
      Expect(C_LparenSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_EXPORTINGSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_IMPORTINGSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         if @sym==C_EXPORTINGSym||@sym==C_IMPORTINGSym
            if @sym==C_EXPORTINGSym
               Get()
            else
               if @sym==C_IMPORTINGSym
                  Get()
               else
                  GenError(1057)
               end

            end

         end

         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym>=C_spaceD1Sym&&@sym<=C_LparenSym||@sym==C_LessSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_INSym||@sym==C_PlusSym||@sym==C_INITIALSym||@sym==C_SlashSym||@sym==C_NOTSym||@sym==C_AndSym||@sym==C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
            Expression()
         end

      end

      Expect(C_RparenSym)
      _out_()
   end
   def PredefinedConstant()
      _in_()
      case @sym

      when C_INITIALSym
         Get()

      when C_BOUNDSym
         Get()

      when C_ASSIGNEDSym
         Get()

      when C_SUPPLIEDSym
         Get()

      when C_REQUESTEDSym
         Get()

      else
         GenError(1058)

      end

      _out_()
   end
   def MinusOperator()
      _in_()
      if @sym==C_spaceD1Sym
         Get()
         Expect(C_MinusSym)
      else
         if @sym==C_MinusSym
            Get()
            Expect(C_spaceD1Sym)
         else
            GenError(1059)
         end

      end

      _out_()
   end


end
