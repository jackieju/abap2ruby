class CParser < CRRParser

   def C()
      Expect(C_REPORTSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
         Statements()
      end

      Expect(EOF_Sym)
   end
   def Statements()
      s=""
      while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
         s+=
         Statement()
      end

      return s
   end
   def Type()
      Expect(C_identifierSym)
   end
   def Statement()
      ret=""
      case @sym

      when C_DATASym
         ret+=
         VariableDefineStatement()

      when C_WRITESym
         ret+=
         WriteStatement()

      when C_identifierSym
      when C_numberSym
      when C_stringD1Sym
      when C_charSym
      when C_spaceD1Sym
      when C_LparenSym
      when C_StarSym
      when C_AndSym
      when C_PlusSym
      when C_MinusSym
      when C_PlusPlusSym
      when C_MinusMinusSym
      when C_BangSym
      when C_TildeSym
      when C_NOTSym
         ret+=
         AssignmentStatement()

      when C_breakSym
         ret+=
         BreakStatement()

      when C_CONTINUESym
         ret+=
         ContinueStatement()

      when C_DOSym
         ret+=
         DoStatement()

      when C_forSym
         ret+=
         ForStatement()

      when C_IFSym
         ret+=
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

      when C_CALLSym
      when C_PARAMETERMinusTABLESym
      when C_EXCEPTIONMinusTABLESym
         ret+=
         CallFunctionStatement()

      when C_CLASSSym
         if @sym==C_CLASSSym
            ClassStatement()
         else
            if 1
               ClassImplStatement()
            else
               GenError(250)
            end

         end


      when C_METHODSym
         MethodStatement()

      when C_DEFAULTSym
      when C_FORSym
      when C_EXPORTINGSym
      when C_IMPORTINGSym
      when C_CHANGINGSym
      when C_EXCEPTIONSSym
      when C_METHODSSym
      when C_RETURNINGSym
      when C_RAISINGSym
         MethodsStatement()

      else
         GenError(251)

      end

      return ret
   end
   def VariableDefineStatement()
      Expect(C_DATASym)
      Expect(C_identifierSym)
      if @sym==C_numberSym
         Get()
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
                              GenError(252)
                           end

                        end

                     end

                  end

               else
                  GenError(253)
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

         when C_OFSym
         when C_STANDARDSym
         when C_TABLESym
         when C_SORTEDSym
         when C_HASHEDSym
            while (@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym)
               if @sym==C_OFSym||@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym
                  while (@sym>=C_STANDARDSym&&@sym<=C_TABLESym)
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
                        GenError(254)
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
               if @sym==C_PointSym||@sym==C_SORTEDSym||@sym>=C_WITHSym&&@sym<=C_KEYSym||@sym==C_INITIALSym
                  while (@sym==C_WITHSym)
                     Get()
                     if @sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(255)
                           end

                        end

                     end

                     while (@sym==C_KEYSym||@sym==C_DEFAULTSym)
                        if @sym==C_PointSym||@sym==C_SORTEDSym||@sym>=C_WITHSym&&@sym<=C_KEYSym||@sym==C_DEFAULTSym||@sym==C_INITIALSym
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
                              GenError(256)
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
                     GenError(257)
                  end

               end

            end

            while (@sym==C_SORTEDSym||@sym>=C_WITHSym&&@sym<=C_KEYSym)
               if @sym==C_WITHSym
                  Get()
                  while (@sym==C_UNIQUESym)
                     Get()
                     Expect(C_HASHEDSym)
                  end

               else
                  if @sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_KEYSym
                     while (@sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                        while (@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                           if @sym==C_UNIQUESym
                              Get()
                           else
                              if @sym==C_NONMinusUNIQUESym
                                 Get()
                              else
                                 GenError(258)
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
                     GenError(259)
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


         when C_LOCATORSym
         when C_WRITERSym
         when C_FORSym
            while (@sym==C_LOCATORSym||@sym==C_WRITERSym)
               if @sym==C_WRITERSym
                  Get()
               else
                  if @sym==C_LOCATORSym
                     Get()
                  else
                     GenError(260)
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
                     GenError(261)
                  end

               end

            end

            Expect(C_COLUMNSSym)

         else
            GenError(262)

         end

      else
         if @sym==C_PointSym||@sym>=C_LIKESym&&@sym<=C_VALUESym||@sym==C_READMinusONLYSym
            if @sym==C_LIKESym
               Get()
               while (@sym==C_identifierSym||@sym>=C_LINESym&&@sym<=C_OFSym||@sym==C_REFSym||@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym||@sym==C_RANGESym)
                  case @sym

                  when C_identifierSym
                  when C_LINESym
                     if @sym==C_LINESym
                        Get()
                        Expect(C_OFSym)
                     end

                     Expect(C_identifierSym)

                  when C_REFSym
                     Get()
                     Expect(C_TOSym)
                     Expect(C_identifierSym)

                  when C_OFSym
                  when C_STANDARDSym
                  when C_TABLESym
                  when C_SORTEDSym
                  when C_HASHEDSym
                     while (@sym>=C_STANDARDSym&&@sym<=C_HASHEDSym)
                        if @sym>=C_STANDARDSym&&@sym<=C_TABLESym
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
                                 GenError(263)
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
                                    GenError(264)
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
                                    GenError(265)
                                 end

                              end

                           end

                        else
                           if 1
                              Get()
                              Expect(C_EMPTYSym)
                              Expect(C_KEYSym)
                           else
                              GenError(266)
                           end

                        end

                     end

                     while (@sym==C_SORTEDSym||@sym>=C_WITHSym&&@sym<=C_KEYSym)
                        if @sym==C_WITHSym
                           Get()
                           while (@sym==C_UNIQUESym)
                              Get()
                              Expect(C_HASHEDSym)
                           end

                        else
                           if @sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_KEYSym
                              while (@sym==C_SORTEDSym||@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                                 while (@sym>=C_UNIQUESym&&@sym<=C_NONMinusUNIQUESym)
                                    if @sym==C_UNIQUESym
                                       Get()
                                    else
                                       if @sym==C_NONMinusUNIQUESym
                                          Get()
                                       else
                                          GenError(267)
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
                              GenError(268)
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
                     GenError(269)

                  end

               end

            end

            if @sym==C_VALUESym
               Get()
               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_ISSym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym)
                  if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
                     Expression()
                  else
                     if @sym==C_ISSym
                        Get()
                        Expect(C_INITIALSym)
                     else
                        GenError(270)
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
   end
   def WriteStatement()
      Expect(C_WRITESym)
      while (@sym==C_numberSym||@sym>=C_ATSym&&@sym<=C_LparenSym)
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
                     GenError(271)
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
                  GenError(272)
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
                     GenError(273)
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
               GenError(274)
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
                  GenError(275)
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
            GenError(276)

         end

      end

      if @sym==C_COLORSym
         Get()
         while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym||@sym>=C_EqualSym&&@sym<=C_OFFSym)
            if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_PointSym||@sym==C_LparenSym||@sym>=C_EqualSym&&@sym<=C_ASSym||@sym==C_QUICKINFOSym
               if @sym==C_EqualSym
                  Get()
               end

               while (@sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym||@sym==C_ONSym)
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
                     GenError(277)
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
                        GenError(278)
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
                  GenError(279)
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
                        GenError(280)
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
                  GenError(281)
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
                        GenError(282)
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
                  GenError(283)
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
                        GenError(284)
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
                  GenError(285)
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
                        GenError(286)
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
                  GenError(287)
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
            GenError(288)

         end

      end

      if @sym==C_QUICKINFOSym
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
   end
   def ForStatement()
      Expect(C_forSym)
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Expression()
      end

      Expect(C_RparenSym)
      Statement()
   end
   def IfStatement()
      Expect(C_IFSym)
      Expression()
      Expect(C_PointSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Statements()
      end

      while (@sym==C_ELSEIFSym)
         Get()
         Expression()
         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
            Statements()
         end

      end

      if @sym==C_ELSESym
         Get()
         Expect(C_PointSym)
         if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
            Statements()
         end

      end

      Expect(C_ENDIFSym)
      Expect(C_PointSym)
   end
   def NullStatement()
      Expect(C_PointSym)
   end
   def ReturnStatement()
      Expect(C_returnSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Expression()
      end

      Expect(C_SemicolonSym)
   end
   def WhileStatement()
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
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_LOOPSym||@sym==C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym>=C_forSym&&@sym<=C_CALLSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         Statements()
      end

      Expect(C_ENDWHILESym)
      Expect(C_PointSym)
   end
   def LoopStatement()
      Expect(C_LOOPSym)
      Expect(C_PointSym)
      Statements()
      Expect(C_ENDLOOPSym)
      Expect(C_PointSym)
   end
   def CaseStatement()
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
   end
   def CallFunctionStatement()
      if @sym==C_CALLSym
         Get()
         Expect(C_FUNCTIONSym)
         Expect(C_identifierSym)
         if @sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_ONSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_CALLSym||@sym==C_INSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym||@sym>=C_EXPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
               while (@sym==C_INSym)
                  Get()
                  Expect(C_UPDATESym)
                  Expect(C_TASKSym)
               end

            else
               if @sym==C_STARTINGSym||@sym==C_DESTINATIONSym
                  while (@sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym)
                     if @sym==C_INSym||@sym==C_STARTINGSym
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_ONSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_CALLSym||@sym==C_INSym||@sym==C_STARTINGSym||@sym>=C_DESTINATIONSym&&@sym<=C_PERFORMINGSym||@sym>=C_EXPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
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
                              GenError(289)
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
                     GenError(290)
                  end

               end

            end

         end

         if @sym==C_ONSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_DATASym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_WRITESym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym>=C_ENDDOSym&&@sym<=C_WHENSym||@sym>=C_ENDCASESym&&@sym<=C_CALLSym||@sym==C_CALLINGSym||@sym>=C_EXPORTINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_WHILESym||@sym>=C_ENDWHILESym&&@sym<=C_CLASSSym||@sym>=C_PROTECTEDSym&&@sym<=C_PRIVATESym||@sym==C_ENDCLASSSym||@sym>=C_METHODSym&&@sym<=C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
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
                  GenError(291)
               end

            end

         end

         while (@sym>=C_EXPORTINGSym&&@sym<=C_EXCEPTIONSSym)
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
            GenError(292)
         end

      end

   end
   def ClassStatement()
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
                     GenError(293)
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
                        GenError(294)
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
                        GenError(295)
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
   end
   def ClassImplStatement()
      Expect(C_CLASSSym)
      Expect(C_identifierSym)
      Expect(C_IMPLEMENTATIONSym)
      Expect(C_PointSym)
      Statements()
      Expect(C_ENDCLASSSym)
      Expect(C_PointSym)
   end
   def MethodStatement()
      Expect(C_METHODSym)
      Expect(C_identifierSym)
      Expect(C_PointSym)
      Statements()
      Expect(C_ENDMETHODSym)
      Expect(C_PointSym)
   end
   def MethodsStatement()
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
                  GenError(296)
               end

            end

         end

      else
         if @sym==C_PointSym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym>=C_EXPORTINGSym&&@sym<=C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_RETURNINGSym&&@sym<=C_RAISINGSym
            if @sym==C_DEFAULTSym
               Get()
               if @sym==C_IGNORESym
                  Get()
               else
                  if @sym==C_FAILSym
                     Get()
                  else
                     GenError(297)
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
               while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_REFERENCESym)
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
                           GenError(298)
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
                           GenError(299)
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
               while (@sym==C_identifierSym||@sym==C_TYPESym||@sym>=C_LIKESym&&@sym<=C_VALUESym||@sym==C_REFERENCESym)
                  while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_REFERENCESym)
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
                              GenError(300)
                           end

                        end

                     end

                  end

                  Typing()
               end

            end

            if @sym==C_CHANGINGSym
               Get()
               while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_REFERENCESym)
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
                           GenError(301)
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
                           GenError(302)
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

            if @sym==C_EXCEPTIONSSym||@sym==C_RAISINGSym
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
                           GenError(303)
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
                     GenError(304)
                  end

               end

            end

            Expect(C_PointSym)
         else
            GenError(305)
         end

      end

   end
   def Expression()
      Conditional()
      while (@sym==C_EqualSym||@sym>=C_StarEqualSym&&@sym<=C_GreaterGreaterEqualSym)
         AssignmentOperator()
         Expression()
      end

   end
   def Primary()
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

      else
         GenError(306)

      end

   end
   def Typing()
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
                  GenError(307)
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
                     GenError(308)
                  end

               end

            end

            Expect(C_identifierSym)
         else
            GenError(309)
         end

      end

      Expect(C_PointSym)
   end
   def Conditional()
      LogORExp()
   end
   def AssignmentOperator()
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
         GenError(310)

      end

   end
   def LogORExp()
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
                  GenError(311)
               end

            end

         end

         LogANDExp()
      end

   end
   def LogANDExp()
      InclORExp()
      while (@sym>=C_AndAndSym&&@sym<=C_ANDSym)
         if @sym==C_AndAndSym
            Get()
         else
            if @sym==C_ANDSym
               Get()
            else
               GenError(312)
            end

         end

         InclORExp()
      end

   end
   def InclORExp()
      ExclORExp()
      while (@sym==C_BarSym)
         Get()
         ExclORExp()
      end

   end
   def ExclORExp()
      ANDExp()
      while (@sym==C_UparrowSym)
         Get()
         ANDExp()
      end

   end
   def ANDExp()
      EqualExp()
      while (@sym==C_AndSym)
         Get()
         EqualExp()
      end

   end
   def EqualExp()
      RelationExp()
      while (@sym==C_EqualSym||@sym>=C_EQSym&&@sym<=C_NESym)
         case @sym

         when C_EqualSym
            Get()

         when C_EQSym
            Get()

         when C_LessGreaterSym
            Get()

         when C_NESym
            Get()

         else
            GenError(313)

         end

         RelationExp()
      end

   end
   def RelationExp()
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
            GenError(314)

         end

         ShiftExp()
      end

   end
   def ShiftExp()
      AddExp()
      while (@sym>=C_LessLessSym&&@sym<=C_GreaterGreaterSym)
         if @sym==C_LessLessSym
            Get()
         else
            if @sym==C_GreaterGreaterSym
               Get()
            else
               GenError(315)
            end

         end

         AddExp()
      end

   end
   def AddExp()
      MultExp()
      while (@sym>=C_PlusSym&&@sym<=C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               GenError(316)
            end

         end

         MultExp()
      end

   end
   def MultExp()
      CastExp()
      while (@sym==C_SlashSym||@sym>=C_StarSym&&@sym<=C_StarStarSym||@sym>=C_DIVSym&&@sym<=C_MODSym)
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
            GenError(317)

         end

         CastExp()
      end

   end
   def CastExp()
      UnaryExp()
   end
   def UnaryExp()
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym
         PostFixExp()
      else
         if @sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym
            if @sym==C_PlusPlusSym
               Get()
            else
               if @sym==C_MinusMinusSym
                  Get()
               else
                  GenError(318)
               end

            end

            UnaryExp()
         else
            if @sym==C_spaceD1Sym||@sym==C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
               UnaryOperator()
               CastExp()
            else
               GenError(319)
            end

         end

      end

   end
   def PostFixExp()
      Primary()
      while (@sym==C_LparenSym||@sym>=C_PlusPlusSym&&@sym<=C_LbrackSym||@sym==C_MinusGreaterSym)
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

         when C_PlusPlusSym
            Get()

         when C_MinusMinusSym
            Get()

         else
            GenError(320)

         end

      end

   end
   def UnaryOperator()
      case @sym

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
         GenError(321)

      end

   end
   def FunctionCall()
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_LparenSym&&@sym<=C_StarSym||@sym==C_AndSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_NOTSym
         ActualParameters()
      end

      Expect(C_RparenSym)
   end
   def ActualParameters()
      Expression()
      while (@sym==C_CommaSym)
         Get()
         Expression()
      end

   end
   def MinusOperator()
      if @sym==C_spaceD1Sym
         Get()
         Expect(C_MinusSym)
      else
         if @sym==C_MinusSym
            Get()
            Expect(C_spaceD1Sym)
         else
            GenError(322)
         end

      end

   end


end
