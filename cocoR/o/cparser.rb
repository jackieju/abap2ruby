class CParser < CRRParser

   def C()
      in()
      if @sym==C_REPORTSym
         ReportDef()
      else
         if @sym==C_FUNCTIONSym
            FunctionDef()
         else
            GenError(312)
         end

      end

      out()
   end
   def ReportDef()
      in()
      Expect(C_REPORTSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      s=""
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         s+=
         Statements()
      end

      Expect(EOF_Sym)
      out()
   end
   def FunctionDef()
      in()
      Expect(C_FUNCTIONSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      s=""
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         s+=
         Statements()
      end

      Expect(C_ENDFUNCTIONSym)
      Expect(C_PointSym)
      out()
   end
   def Statements()
      in()
      s=""
      s+=
      Statement()
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
         s+=
         Statement()
      end

      return s
      out()
   end
   def Type()
      in()
      Expect(C_identifierSym)
      out()
   end
   def Statement()
      in()
      ret=""
      ps()
      case @sym

      when C_DATASym
         VariableDefineStatement()

      when C_WRITESym
         ret+=
         WriteStatement()

      when C_identifierSym,
         C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_spaceD1Sym,
         C_INITIALSym,
         C_INSym,
         C_LparenSym,
         C_StarSym,
         C_AndSym,
         C_NOTSym,
         C_PlusSym,
         C_MinusSym,
         C_PlusPlusSym,
         C_MinusMinusSym,
         C_BangSym,
         C_TildeSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         AssignmentStatement()

      when C_breakSym
         BreakStatement()

      when C_CONTINUESym
         ContinueStatement()

      when C_DOSym
         DoStatement()

      when C_forSym
         ForStatement()

      when C_IFSym
         IfStatement()

      when C_PointSym
         NullStatement()

      when C_returnSym
         ret+=
         ReturnStatement()

      when C_WHILESym
         ret+=
         WhileStatement()

      when C_LOOPSym
         ret+=
         LoopStatement()

      when C_CASESym
         ret+=
         CaseStatement()

      when C_CALLSym,
         C_PARAMETERMinusTABLESym,
         C_EXCEPTIONMinusTABLESym
         ret+=
         CallFunctionStatement()

      when C_CLASSSym
         if @sym==C_CLASSSym
            ClassStatement()
         else
            if 1
               ClassImplStatement()
            else
               GenError(313)
            end

         end


      when C_METHODSym
         MethodStatement()

      when C_FORSym,
         C_EXPORTINGSym,
         C_RAISINGSym,
         C_DEFAULTSym,
         C_IMPORTINGSym,
         C_CHANGINGSym,
         C_EXCEPTIONSSym,
         C_METHODSSym,
         C_RETURNINGSym
         MethodsStatement()

      when C_FUNCTIONSym
         FunctionDef()

      when C_DESCRIBESym
         DescribeStatement()

      when C_MESSAGESym
         MessasgeStatement()

      when C_REFRESHSym
         RefreshStatement()

      when C_SEARCHSym
         SearchStatement()

      when C_CONCATENATESym
         CONCATENATE()

      when C_APPENDSym
         APPEND()

      when C_SPLITSym
         SPLIT()

      when C_RAISESym
         RAISE()

      else
         GenError(314)

      end

      return ret
      out()
   end
   def VariableDefineStatement()
      in()
      Expect(C_DATASym)
      Expect(C_identifierSym)
      while (@sym==C_LparenSym)
         Get()
         Expect(C_numberSym)
         Expect(C_RparenSym)
      end

      if @sym==C_TYPESym
         Get()
         case @sym

         when C_identifierSym
            Get()
            if @sym==C_PointSym||@sym>=C_LENGTHSym&&@sym<=C_DECIMALSSym
               if @sym==C_LENGTHSym
                  Get()
                  Expect(C_numberSym)
               end

               if @sym==C_DECIMALSSym
                  Get()
                  Expect(C_stringD1Sym)
               end

            else
               if @sym>=C_READERSym&&@sym<=C_LOBSym
                  while (@sym>=C_READERSym&&@sym<=C_LOBSym)
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
                              GenError(315)
                           end

                        end

                     end

                  end

               else
                  GenError(316)
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
            Expect(C_identifierSym)

         when C_OFSym,
            C_SORTEDSym,
            C_TABLESym,
            C_STANDARDSym,
            C_HASHEDSym
            while (@sym==C_SORTEDSym||@sym==C_TABLESym||@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym)
               if @sym==C_OFSym||@sym==C_SORTEDSym||@sym==C_TABLESym||@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym
                  while (@sym==C_TABLESym||@sym==C_STANDARDSym)
                     if @sym==C_STANDARDSym
                        Get()
                     end

                     Expect(C_TABLESym)
                  end

               else
                  if 1
                     while (@sym==C_SORTEDSym)
                        Get()
                        Expect(C_TABLESym)
                     end

                  else
                     if 1
                        while (@sym==C_HASHEDSym)
                           Get()
                           Expect(C_TABLESym)
                        end

                     else
                        GenError(317)
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
               if @sym==C_PointSym||@sym==C_INITIALSym||@sym==C_KEYSym||@sym==C_SORTEDSym||@sym==C_WITHSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                  while (@sym==C_WITHSym)
                     Get()
                     if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(318)
                           end

                        end

                     end

                     while (@sym==C_KEYSym||@sym==C_DEFAULTSym)
                        if @sym==C_PointSym||@sym==C_INITIALSym||@sym==C_KEYSym||@sym==C_SORTEDSym||@sym==C_WITHSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym||@sym==C_DEFAULTSym
                           while (@sym==C_KEYSym)
                              Get()
                              if @sym==C_identifierSym
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

                           end

                        else
                           if 1
                              while (@sym==C_DEFAULTSym)
                                 Get()
                                 Expect(C_KEYSym)
                              end

                           else
                              GenError(319)
                           end

                        end

                     end

                  end

               else
                  if 1
                     while (@sym==C_WITHSym)
                        Get()
                        Expect(C_EMPTYSym)
                        Expect(C_KEYSym)
                     end

                  else
                     GenError(320)
                  end

               end

            end

            while (@sym==C_KEYSym||@sym==C_SORTEDSym||@sym==C_WITHSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
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
                                 GenError(321)
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
                     GenError(322)
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


         when C_FORSym,
            C_LOCATORSym,
            C_WRITERSym
            while (@sym==C_LOCATORSym||@sym==C_WRITERSym)
               if @sym==C_WRITERSym
                  Get()
               else
                  if @sym==C_LOCATORSym
                     Get()
                  else
                     GenError(323)
                  end

               end

            end

            Expect(C_FORSym)
            while (@sym==C_COLUMNSSym)
               Get()
               while (@sym==C_identifierSym)
                  Get()
               end

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
                     GenError(324)
                  end

               end

            end

            Expect(C_COLUMNSSym)

         else
            GenError(325)

         end

      else
         if @sym==C_PointSym||@sym==C_LIKESym||@sym==C_VALUESym||@sym==C_READMinusONLYSym
            if @sym==C_LIKESym
               Get()
               while (@sym==C_identifierSym||@sym==C_LINESym||@sym==C_OFSym||@sym==C_SORTEDSym||@sym==C_TABLESym||@sym>=C_REFSym&&@sym<=C_HASHEDSym||@sym==C_RANGESym)
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

                  when C_OFSym,
                     C_SORTEDSym,
                     C_TABLESym,
                     C_STANDARDSym,
                     C_HASHEDSym
                     while (@sym==C_SORTEDSym||@sym==C_TABLESym||@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym)
                        if @sym==C_TABLESym||@sym==C_STANDARDSym
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
                                 GenError(326)
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
                                    GenError(327)
                                 end

                              end

                           end

                           while (@sym==C_KEYSym||@sym==C_DEFAULTSym)
                              if @sym==C_KEYSym
                                 Get()
                                 if @sym==C_identifierSym
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
                                    GenError(328)
                                 end

                              end

                           end

                        else
                           if 1
                              Get()
                              Expect(C_EMPTYSym)
                              Expect(C_KEYSym)
                           else
                              GenError(329)
                           end

                        end

                     end

                     while (@sym==C_KEYSym||@sym==C_SORTEDSym||@sym==C_WITHSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
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
                                          GenError(330)
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
                              GenError(331)
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
                     GenError(332)

                  end

               end

            end

            if @sym==C_VALUESym
               Get()
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_ISSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                  if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
                     Expression()
                  else
                     if @sym==C_ISSym
                        Get()
                        Expect(C_INITIALSym)
                     else
                        GenError(333)
                     end

                  end

               end

            end

            if @sym==C_READMinusONLYSym
               Get()
            end

         end

      end

      Expect(C_PointSym)
      out()
   end
   def WriteStatement()
      in()
      Expect(C_WRITESym)
      while (@sym==C_numberSym||@sym==C_ATSym||@sym==C_LparenSym||@sym==C_SlashSym)
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
            if @sym==C_numberSym
               Get()
            else
               if @sym==C_StarSym
                  Get()
               else
                  if @sym==C_StarStarSym
                     Get()
                  else
                     GenError(334)
                  end

               end

            end

            Expect(C_RparenSym)
         end

      end

      Expression()
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
                  GenError(335)
               end

            end

         end

      end

      while (@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym==C_STYLESym)
         if @sym==C_PointSym||@sym==C_USINGSym||@sym==C_DECIMALSSym||@sym==C_ASSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym>=C_STYLESym&&@sym<=C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
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
               if @sym==C_PointSym||@sym==C_USINGSym||@sym==C_DECIMALSSym||@sym==C_ASSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym>=C_STYLESym&&@sym<=C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
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
                     GenError(336)
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
               GenError(337)
            end

         end

      end

      if @sym==C_USINGSym
         Get()
         while (@sym==C_EDITSym||@sym==C_NOSym)
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
                  GenError(338)
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
            GenError(339)

         end

      end

      if @sym==C_COLORSym
         Get()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_INITIALSym||@sym==C_LparenSym||@sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym)
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_PointSym||@sym==C_INITIALSym||@sym==C_LparenSym||@sym==C_EqualSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym
               if @sym==C_EqualSym
                  Get()
               end

               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_INITIALSym||@sym==C_LparenSym||@sym==C_ONSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym)
                  while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_INITIALSym||@sym==C_LparenSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym)
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
                     GenError(340)
                  end

               end

            end

         end

      end

      if @sym==C_INTENSIFIEDSym
         Get()
         if @sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym
            if @sym==C_PointSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_INVERSESym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
               while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(341)
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
                  GenError(342)
               end

            end

         end

      end

      if @sym==C_INVERSESym
         Get()
         if @sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym
            if @sym==C_PointSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_HOTSPOTSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
               while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(343)
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
                  GenError(344)
               end

            end

         end

      end

      if @sym==C_HOTSPOTSym
         Get()
         if @sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym
            if @sym==C_PointSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_INPUTSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
               while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(345)
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
                  GenError(346)
               end

            end

         end

      end

      if @sym==C_INPUTSym
         Get()
         if @sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym
            if @sym==C_PointSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym>=C_FRAMESSym&&@sym<=C_RESETSym||@sym==C_QUICKINFOSym
               while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(347)
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
                  GenError(348)
               end

            end

         end

      end

      if @sym==C_FRAMESSym
         Get()
         if @sym==C_EqualSym||@sym>=C_ONSym&&@sym<=C_OFFSym
            if @sym==C_PointSym||@sym==C_ASSym||@sym>=C_ONSym&&@sym<=C_OFFSym||@sym==C_RESETSym||@sym==C_QUICKINFOSym
               while (@sym>=C_ONSym&&@sym<=C_OFFSym)
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(349)
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
                  GenError(350)
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
            GenError(351)

         end

      end

      if @sym==C_QUICKINFOSym
         Get()
         Expect(C_stringD1Sym)
      end

      Expect(C_PointSym)
      out()
   end
   def AssignmentStatement()
      in()
      Expression()
      out()
   end
   def BreakStatement()
      in()
      Expect(C_breakSym)
      out()
   end
   def ContinueStatement()
      in()
      Expect(C_CONTINUESym)
      Expect(C_PointSym)
      out()
   end
   def DoStatement()
      in()
      Expect(C_DOSym)
      if @sym==C_numberSym
         Get()
         Expect(C_TIMESSym)
      end

      while (@sym==C_VARYINGSym)
         Get()
         Expect(C_identifierSym)
         Expect(C_FROMSym)
         Expect(C_identifierSym)
         Expect(C_NEXTSym)
         Expect(C_identifierSym)
         if @sym==C_RANGESym
            Get()
            Expect(C_numberSym)
         end

      end

      Expect(C_PointSym)
      Statements()
      Expect(C_ENDDOSym)
      Expect(C_PointSym)
      out()
   end
   def ForStatement()
      in()
      Expect(C_forSym)
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_RparenSym)
      Statement()
      out()
   end
   def IfStatement()
      in()
      Expect(C_IFSym)
      Expression()
      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Statements()
      end

      while (@sym==C_ELSEIFSym)
         Get()
         Expression()
         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Statements()
         end

      end

      if @sym==C_ELSESym
         Get()
         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Statements()
         end

      end

      Expect(C_ENDIFSym)
      Expect(C_PointSym)
      out()
   end
   def NullStatement()
      in()
      Expect(C_PointSym)
      out()
   end
   def ReturnStatement()
      in()
      Expect(C_returnSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Expression()
      end

      Expect(C_SemicolonSym)
      out()
   end
   def WhileStatement()
      in()
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
            Expect(C_identifierSym)
         end

      end

      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_FUNCTIONSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         Statements()
      end

      Expect(C_ENDWHILESym)
      Expect(C_PointSym)
      out()
   end
   def LoopStatement()
      in()
      Expect(C_LOOPSym)
      if @sym==C_ATSym
         Get()
         if @sym==C_identifierSym
            if @sym==C_identifierSym
               Get()
               if @sym==C_VERSIONSym
                  Get()
                  Expect(C_stringD1Sym)
               end

            else
               if 1
                  Get()
                  case @sym

                  when C_INTOSym
                     Get()
                     Expect(C_identifierSym)

                  when C_ASSIGNINGSym
                     Get()
                     Expect(C_identifierSym)
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
                     GenError(352)

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
                           GenError(353)
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
                  GenError(354)
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
                  Expect(C_identifierSym)
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
                  GenError(355)

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
                  GenError(356)
               end

            end

         end

      end

      Expect(C_PointSym)
      Statements()
      Expect(C_ENDLOOPSym)
      Expect(C_PointSym)
      out()
   end
   def CaseStatement()
      in()
      Expect(C_CASESym)
      Expression()
      Expect(C_PointSym)
      while (@sym==C_WHENSym)
         Get()
         Expression()
         while (@sym==C_ORSym)
            Get()
            Expression()
         end

         Expect(C_PointSym)
         Statements()
      end

      if @sym==C_WHENSym
         Get()
         Expect(C_OTHERSSym)
         Expect(C_PointSym)
         Statements()
      end

      Expect(C_ENDCASESym)
      Expect(C_PointSym)
      out()
   end
   def CallFunctionStatement()
      in()
      if @sym==C_CALLSym
         Get()
         Expect(C_FUNCTIONSym)
         Expect(C_identifierSym)
         if @sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym>=C_FUNCTIONSym&&@sym<=C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym>=C_ENDLOOPSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym==C_ONSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_forSym||@sym==C_CALLSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym==C_INSym)
                  Get()
                  Expect(C_UPDATESym)
                  Expect(C_TASKSym)
               end

            else
               if @sym==C_STARTINGSym||@sym==C_DESTINATIONSym
                  while (@sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym)
                     if @sym==C_INSym||@sym==C_STARTINGSym
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_STARTINGSym||@sym==C_REFRESHSym||@sym>=C_FUNCTIONSym&&@sym<=C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym>=C_ENDLOOPSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym==C_ONSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_forSym||@sym==C_CALLSym||@sym>=C_DESTINATIONSym&&@sym<=C_PERFORMINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
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
                              GenError(357)
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
                     GenError(358)
                  end

               end

            end

         end

         if @sym==C_ONSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym>=C_FUNCTIONSym&&@sym<=C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym>=C_ENDLOOPSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_forSym||@sym==C_CALLSym||@sym==C_CALLINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
               while (@sym==C_CALLINGSym)
                  Get()
                  Expect(C_identifierSym)
               end

            else
               if @sym==C_ONSym||@sym==C_PERFORMINGSym
                  while (@sym==C_PERFORMINGSym)
                     Get()
                     Expect(C_identifierSym)
                  end

                  Expect(C_ONSym)
                  Expect(C_ENDSym)
                  Expect(C_OFSym)
                  Expect(C_TASKSym)
               else
                  GenError(359)
               end

            end

         end

         while (@sym==C_EXPORTINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_EXCEPTIONSSym)
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
            GenError(360)
         end

      end

      out()
   end
   def ClassStatement()
      in()
      Expect(C_CLASSSym)
      Expect(C_identifierSym)
      Expect(C_DEFINITIONSym)
      if @sym==C_INHERITINGSym
         Get()
         Expect(C_FROMSym)
         Expect(C_identifierSym)
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
                     GenError(361)
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
                        GenError(362)
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
                        GenError(363)
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

      Expect(C_PointSym)
      if @sym==C_PUBLICSym
         Get()
         Expect(C_SECTIONSym)
         Expect(C_PointSym)
         Statements()
      end

      if @sym==C_PROTECTEDSym
         Get()
         Expect(C_SECTIONSym)
         Expect(C_PointSym)
         Statements()
      end

      if @sym==C_PRIVATESym
         Get()
         Expect(C_SECTIONSym)
         Expect(C_PointSym)
         Statements()
      end

      Expect(C_ENDCLASSSym)
      Expect(C_PointSym)
      out()
   end
   def ClassImplStatement()
      in()
      Expect(C_CLASSSym)
      Expect(C_identifierSym)
      Expect(C_IMPLEMENTATIONSym)
      Expect(C_PointSym)
      Statements()
      Expect(C_ENDCLASSSym)
      Expect(C_PointSym)
      out()
   end
   def MethodStatement()
      in()
      Expect(C_METHODSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      Statements()
      Expect(C_ENDMETHODSym)
      Expect(C_PointSym)
      out()
   end
   def MethodsStatement()
      in()
      if @sym==C_METHODSSym
         Get()
         Expect(C_identifierSym)
         if @sym>=C_ABSTRACTSym&&@sym<=C_FINALSym
            if @sym==C_ABSTRACTSym
               Get()
            else
               if @sym==C_FINALSym
                  Get()
               else
                  GenError(364)
               end

            end

         end

      else
         if @sym==C_PointSym||@sym==C_FORSym||@sym==C_EXPORTINGSym||@sym==C_RAISINGSym||@sym==C_DEFAULTSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym==C_RETURNINGSym
            if @sym==C_DEFAULTSym
               Get()
               if @sym==C_IGNORESym
                  Get()
               else
                  if @sym==C_FAILSym
                     Get()
                  else
                     GenError(365)
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
                           GenError(366)
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
                           GenError(367)
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
                        Expect(C_identifierSym)
                     else
                        if @sym==C_REFERENCESym
                           Get()
                           Expect(C_identifierSym)
                        else
                           if @sym==C_identifierSym
                              Get()
                           else
                              GenError(368)
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
                           GenError(369)
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
                           GenError(370)
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
                  Expect(C_identifierSym)
               end

               Typing()
            end

            if @sym==C_RAISINGSym||@sym==C_EXCEPTIONSSym
               if @sym==C_PointSym||@sym==C_RAISINGSym
                  while (@sym==C_RAISINGSym)
                     Get()
                     if @sym==C_identifierSym
                        Get()
                     else
                        if @sym==C_RESUMABLESym
                           Get()
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)
                           Expect(C_RparenSym)
                        else
                           GenError(371)
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
                     GenError(372)
                  end

               end

            end

            Expect(C_PointSym)
         else
            GenError(373)
         end

      end

      out()
   end
   def DescribeStatement()
      in()
      Expect(C_DESCRIBESym)
      case @sym

      when C_FIELDSym
         Get()
         Expect(C_identifierSym)
         if @sym==C_TYPESym
            Get()
            Expect(C_identifierSym)
            if @sym==C_COMPONENTSSym
               Get()
               Expect(C_identifierSym)
            end

         end

         if @sym==C_LENGTHSym
            Get()
            Expression()
            Expect(C_INSym)
            while (@sym>=C_CHARACTERSym&&@sym<=C_BYTESym)
               if @sym==C_BYTESym
                  Get()
               else
                  if @sym==C_CHARACTERSym
                     Get()
                  else
                     GenError(374)
                  end

               end

            end

            Expect(C_MODESym)
         end

         if @sym==C_DECIMALSSym
            Get()
            Expect(C_stringD1Sym)
         end

         if @sym==C_OUTPUTMinusLENGTHSym
            Get()
            Expect(C_numberSym)
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


      when C_DISTANCESym
         Get()
         Expect(C_BETWEENSym)
         Expect(C_identifierSym)
         Expect(C_ANDSym)
         Expect(C_identifierSym)
         Expect(C_INTOSym)
         Expect(C_identifierSym)
         Expect(C_INSym)
         while (@sym>=C_CHARACTERSym&&@sym<=C_BYTESym)
            if @sym==C_BYTESym
               Get()
            else
               if @sym==C_CHARACTERSym
                  Get()
               else
                  GenError(375)
               end

            end

         end

         Expect(C_MODESym)

      when C_LISTSym
         Get()
         while (@sym==C_LINESym||@sym==C_NUMBERSym||@sym==C_PAGESym)
            if @sym==C_PointSym||@sym==C_LINESym||@sym==C_NUMBERSym||@sym==C_PAGESym||@sym==C_INDEXSym
               while (@sym==C_NUMBERSym)
                  Get()
                  Expect(C_OFSym)
                  while (@sym==C_LINESSym||@sym==C_PAGESSym)
                     if @sym==C_LINESSym
                        Get()
                     else
                        if @sym==C_PAGESSym
                           Get()
                        else
                           GenError(376)
                        end

                     end

                  end

                  Expect(C_numberSym)
               end

            else
               if 1
                  while (@sym==C_LINESym)
                     Get()
                     Expect(C_numberSym)
                     Expect(C_PAGESym)
                     Expect(C_numberSym)
                  end

               else
                  if 1
                     while (@sym==C_PAGESym)
                        Get()
                        Expect(C_numberSym)
                        if @sym==C_LINEMinusSIZESym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_LINEMinusCOUNTSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_LINESSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_FIRSTMinusLINESym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_TOPMinusLINESSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_TITLEMinusLINESSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_HEADMinusLINESSym
                           Get()
                           Expect(C_numberSym)
                        end

                        if @sym==C_ENDMinusLINESSym
                           Get()
                           Expect(C_numberSym)
                        end

                     end

                  else
                     GenError(377)
                  end

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
         if @sym==C_KINDSym
            Get()
            Expect(C_identifierSym)
         end

         if @sym==C_LINESSym
            Get()
            Expect(C_numberSym)
         end

         if @sym==C_OCCURSSym
            Get()
            Expect(C_numberSym)
         end


      else
         GenError(378)

      end

      Expect(C_PointSym)
      out()
   end
   def MessasgeStatement()
      in()
      Expect(C_MESSAGESym)
      while (@sym==C_identifierSym||@sym==C_stringD1Sym||@sym==C_IDSym)
         if @sym==C_identifierSym
            Get()
            if @sym==C_TYPESym||@sym==C_LparenSym
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  if @sym==C_TYPESym
                     Get()
                     Expect(C_identifierSym)
                  else
                     GenError(379)
                  end

               end

            end

         else
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
                  GenError(380)
               end

            end

         end

      end

      if @sym==C_INTOSym||@sym==C_DISPLAYSym||@sym==C_RAISINGSym
         if @sym==C_PointSym||@sym>=C_WITHSym&&@sym<=C_DISPLAYSym||@sym==C_RAISINGSym
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
               GenError(381)
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
      out()
   end
   def RefreshStatement()
      in()
      Expect(C_REFRESHSym)
      if @sym==C_CONTROLSym
         Get()
         Expect(C_identifierSym)
         Expect(C_FROMSym)
         Expect(C_SCREENSym)
         Expect(C_identifierSym)
      else
         if @sym==C_identifierSym
            Get()
            if @sym==C_LbrackSym
               Get()
               Expect(C_RbrackSym)
            end

            if @sym==C_FROMSym
               Get()
               Expect(C_TABLESym)
               Expect(C_identifierSym)
            end

         else
            GenError(382)
         end

      end

      out()
   end
   def SearchStatement()
      in()
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
               GenError(383)
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
      out()
   end
   def CONCATENATE()
      in()
      Expect(C_CONCATENATESym)
      if @sym==C_identifierSym
         Get()
         while (@sym==C_identifierSym)
            Get()
         end

      else
         if @sym==C_LINESSym
            Get()
            Expect(C_OFSym)
            Expect(C_identifierSym)
         else
            GenError(384)
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
               GenError(385)
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
      out()
   end
   def APPEND()
      in()
      Expect(C_APPENDSym)
      if @sym==C_identifierSym
         Get()
      else
         if @sym==C_INITIALSym||@sym==C_TOSym
            while (@sym==C_INITIALSym)
               Get()
               Expect(C_LINESym)
            end

         else
            if @sym==C_LINESSym
               while (@sym==C_LINESSym)
                  Get()
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
                     Expect(C_stringD1Sym)
                  end

               end

            end

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
            Expect(C_stringD1Sym)
            if @sym==C_CASTINGSym
               Get()
            end

         else
            if @sym==C_REFERENCESym
               Get()
               Expect(C_INTOSym)
               Expect(C_identifierSym)
            else
               GenError(386)
            end

         end

      end

      Expect(C_PointSym)
      out()
   end
   def SPLIT()
      in()
      Expect(C_SPLITSym)
      Expect(C_identifierSym)
      Expect(C_ATSym)
      Expression()
      Expect(C_INTOSym)
      if @sym==C_identifierSym
         Get()
         while (@sym==C_identifierSym)
            Get()
         end

      else
         if @sym==C_TABLESym
            Get()
            Expect(C_identifierSym)
         else
            GenError(387)
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
                  GenError(388)
               end

            end

         end

         Expect(C_MODESym)
      end

      out()
   end
   def RAISE()
      in()
      Expect(C_RAISESym)
      if @sym==C_identifierSym
         Get()
      else
         if @sym==C_EVENTSym
            Get()
            Expect(C_identifierSym)
            if @sym==C_EXPORTINGSym
               Get()
               Expression()
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
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
                     if @sym==C_MESSAGESym||@sym>=C_IDSym&&@sym<=C_WITHSym
                        if @sym==C_MESSAGESym
                           Get()
                           Expect(C_identifierSym)
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)
                           Expect(C_RparenSym)
                        else
                           if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym>=C_FUNCTIONSym&&@sym<=C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym==C_LparenSym||@sym>=C_IDSym&&@sym<=C_WITHSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym>=C_ENDLOOPSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
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
                              GenError(389)
                           end

                        end

                     end

                     if @sym==C_EXPORTINGSym
                        Get()
                        Expression()
                        while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
                           Expression()
                        end

                     end

                  else
                     if @sym==C_identifierSym
                        Get()
                     else
                        GenError(390)
                     end

                  end

               end

            else
               GenError(391)
            end

         end

      end

      out()
   end
   def Expression()
      in()
      trc()
      Conditional()
      while (@sym==C_EqualSym||@sym>=C_StarEqualSym&&@sym<=C_GreaterGreaterEqualSym)
         AssignmentOperator()
         Expression()
      end

      trco()
      out()
   end
   def GroupBy()
      in()
      Expect(C_GROUPSym)
      Expect(C_BYSym)
      if @sym==C_identifierSym
         Get()
      else
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
            Expression()
            while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym)
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
            GenError(392)
         end

      end

      if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
         if @sym==C_ASCENDINGSym
            Get()
         else
            if @sym==C_DESCENDINGSym
               Get()
            else
               GenError(393)
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

      if @sym==C_ASSIGNINGSym||@sym>=C_REFERENCESym&&@sym<=C_INTOSym
         if @sym==C_INTOSym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_ASSIGNINGSym
               Get()
               Expect(C_identifierSym)
            else
               if @sym==C_REFERENCESym
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)
               else
                  GenError(394)
               end

            end

         end

      end

      out()
   end
   def Primary()
      in()
      trc()
      case @sym

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

      when C_INITIALSym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         PredefinedConstant()

      else
         GenError(395)

      end

      trco()
      out()
   end
   def Typing()
      in()
      if @sym==C_TYPESym
         Get()
         if @sym==C_identifierSym
            Get()
         else
            if @sym==C_LINESym
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
                  GenError(396)
               end

            end

         end

      else
         if @sym==C_LIKESym
            Get()
            if @sym==C_LINESym||@sym==C_REFSym
               if @sym==C_identifierSym||@sym==C_LINESym
                  if @sym==C_LINESym
                     Get()
                     Expect(C_OFSym)
                  end

               else
                  if @sym==C_REFSym
                     Get()
                     Expect(C_TOSym)
                  else
                     GenError(397)
                  end

               end

            end

            Expect(C_identifierSym)
         else
            GenError(398)
         end

      end

      Expect(C_PointSym)
      out()
   end
   def Conditional()
      in()
      trc()
      LogORExp()
      trco()
      out()
   end
   def AssignmentOperator()
      in()
      trc()
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
         trco()

      else
         GenError(399)

      end

      out()
   end
   def LogORExp()
      in()
      trc()
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
                  GenError(400)
               end

            end

         end

         LogANDExp()
      end

      trco()
      out()
   end
   def LogANDExp()
      in()
      trc()
      InclORExp()
      while (@sym==C_ANDSym||@sym==C_AndAndSym)
         if @sym==C_AndAndSym
            Get()
         else
            if @sym==C_ANDSym
               Get()
            else
               GenError(401)
            end

         end

         InclORExp()
      end

      trco()
      out()
   end
   def InclORExp()
      in()
      trc()
      ExclORExp()
      while (@sym==C_BarSym)
         Get()
         ExclORExp()
      end

      trco()
      out()
   end
   def ExclORExp()
      in()
      trc()
      ANDExp()
      while (@sym==C_UparrowSym)
         Get()
         ANDExp()
      end

      trco()
      out()
   end
   def ANDExp()
      in()
      trc()
      EqualExp()
      while (@sym==C_AndSym)
         Get()
         EqualExp()
      end

      trco()
      out()
   end
   def EqualExp()
      in()
      trc()
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         RelationExp()
         while (@sym==C_EqualSym||@sym==C_ISSym||@sym>=C_EQSym&&@sym<=C_NESym)
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


            else
               GenError(402)

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
            GenError(403)
         end

      end

      out()
   end
   def RelationExp()
      in()
      trc()
      ShiftExp()
      while (@sym>=C_LessSym&&@sym<=C_BYTEMinusNSSym)
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
            GenError(404)

         end

         ShiftExp()
      end

      trco()
      out()
   end
   def ShiftExp()
      in()
      trc()
      AddExp()
      while (@sym>=C_LessLessSym&&@sym<=C_GreaterGreaterSym)
         if @sym==C_LessLessSym
            Get()
         else
            if @sym==C_GreaterGreaterSym
               Get()
            else
               GenError(405)
            end

         end

         AddExp()
      end

      trco()
      trco()
      out()
   end
   def AddExp()
      in()
      trc()
      MultExp()
      while (@sym>=C_PlusSym&&@sym<=C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               GenError(406)
            end

         end

         MultExp()
      end

      trco()
      out()
   end
   def MultExp()
      in()
      CastExp()
      while (@sym>=C_SlashSym&&@sym<=C_StarStarSym||@sym>=C_DIVSym&&@sym<=C_MODSym)
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
            GenError(407)

         end

         CastExp()
      end

      trco()
      out()
   end
   def CastExp()
      in()
      trc()
      UnaryExp()
      trco()
      out()
   end
   def UnaryExp()
      in()
      trc()
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_INITIALSym||@sym==C_LparenSym||@sym>=C_BOUNDSym&&@sym<=C_REQUESTEDSym
         PostFixExp()
      else
         if @sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym
            if @sym==C_PlusPlusSym
               Get()
            else
               if @sym==C_MinusMinusSym
                  Get()
               else
                  GenError(408)
               end

            end

            UnaryExp()
         else
            if @sym==C_spaceD1Sym||@sym==C_INSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_BangSym&&@sym<=C_INSTANCESym
               UnaryOperator()
               CastExp()
               trco()
            else
               GenError(409)
            end

         end

      end

      out()
   end
   def PostFixExp()
      in()
      trc()
      Primary()
      while (@sym==C_LbrackSym||@sym==C_LparenSym||@sym>=C_PlusPlusSym&&@sym<=C_EqualGreaterSym)
         case @sym

         when C_LbrackSym
            Get()
            Expression()
            Expect(C_RbrackSym)

         when C_LparenSym
            FunctionCall()

         when C_MinusGreaterSym
            Get()
            Expect(C_identifierSym)

         when C_EqualGreaterSym
            Get()
            Expect(C_identifierSym)

         when C_PlusPlusSym
            Get()

         when C_MinusMinusSym
            Get()

         else
            GenError(410)

         end

      end

      trco()
      out()
   end
   def UnaryOperator()
      in()
      trc()
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
         trco()

      else
         GenError(411)

      end

      out()
   end
   def FunctionCall()
      in()
      trc()
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_INITIALSym||@sym==C_INSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
         ActualParameters()
      end

      Expect(C_RparenSym)
      trco()
      out()
   end
   def PredefinedConstant()
      in()
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
         GenError(412)

      end

      out()
   end
   def ActualParameters()
      in()
      trc()
      Expression()
      while (@sym==C_CommaSym)
         Get()
         Expression()
      end

      trco()
      out()
   end
   def MinusOperator()
      in()
      if @sym==C_spaceD1Sym
         Get()
         Expect(C_MinusSym)
      else
         if @sym==C_MinusSym
            Get()
            Expect(C_spaceD1Sym)
         else
            GenError(413)
         end

      end

      out()
   end


end
