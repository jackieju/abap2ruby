class CScanner < CRScanner

   def self.STATE0
      @@STATE0

   end
   def self.STATE0=(v)
      @@STATE0=v

   end
   def CheckLiteral(id)
      c=CurrentCh(@nextSym.Pos)
      if @ignoreCase
         c=Upcase(c)
      end

      case c

      when 'A'
         if EqualStr("APPEND")
            return C_APPENDSym
         end

         if EqualStr("AUTHORITY-CHECK")
            return C_AUTHORITYMinusCHECKSym
         end

         if EqualStr("ADD")
            return C_ADDSym
         end

         if EqualStr("ADD-CORRESPONDING")
            return C_ADDMinusCORRESPONDINGSym
         end

         if EqualStr("ALIASES")
            return C_ALIASESSym
         end

         if EqualStr("ASSERT")
            return C_ASSERTSym
         end

         if EqualStr("ASSIGN")
            return C_ASSIGNSym
         end

         if EqualStr("AND")
            return C_ANDSym
         end

         if EqualStr("ASSIGNED")
            return C_ASSIGNEDSym
         end


      when 'B'
         if EqualStr("BACK")
            return C_BACKSym
         end

         if EqualStr("BREAK-POINT")
            return C_BREAKMinusPOINTSym
         end

         if EqualStr("BETWEEN")
            return C_BETWEENSym
         end

         if EqualStr("BYTE-CO")
            return C_BYTEMinusCOSym
         end

         if EqualStr("BYTE-CN")
            return C_BYTEMinusCNSym
         end

         if EqualStr("BYTE-CA")
            return C_BYTEMinusCASym
         end

         if EqualStr("BYTE-NA")
            return C_BYTEMinusNASym
         end

         if EqualStr("BYTE-CS")
            return C_BYTEMinusCSSym
         end

         if EqualStr("BYTE-NS")
            return C_BYTEMinusNSSym
         end

         if EqualStr("BOUND")
            return C_BOUNDSym
         end


      when 'C'
         if EqualStr("CONCATENATE")
            return C_CONCATENATESym
         end

         if EqualStr("CONSTANTS")
            return C_CONSTANTSSym
         end

         if EqualStr("CONTINUE")
            return C_CONTINUESym
         end

         if EqualStr("CASE")
            return C_CASESym
         end

         if EqualStr("CLASS")
            return C_CLASSSym
         end

         if EqualStr("CALL")
            return C_CALLSym
         end

         if EqualStr("CATCH")
            return C_CATCHSym
         end

         if EqualStr("CHECK")
            return C_CHECKSym
         end

         if EqualStr("CLASS-DATA")
            return C_CLASSMinusDATASym
         end

         if EqualStr("CLASS-EVENTS")
            return C_CLASSMinusEVENTSSym
         end

         if EqualStr("CLASS-POOL")
            return C_CLASSMinusPOOLSym
         end

         if EqualStr("CLEAR")
            return C_CLEARSym
         end

         if EqualStr("CLOSE")
            return C_CLOSESym
         end

         if EqualStr("COLLECT")
            return C_COLLECTSym
         end

         if EqualStr("COMMIT")
            return C_COMMITSym
         end

         if EqualStr("COMPUTE")
            return C_COMPUTESym
         end

         if EqualStr("CONDENSE")
            return C_CONDENSESym
         end

         if EqualStr("CONTROLS")
            return C_CONTROLSSym
         end

         if EqualStr("CONVERT")
            return C_CONVERTSym
         end

         if EqualStr("CREATE")
            return C_CREATESym
         end

         if EqualStr("CO")
            return C_COSym
         end

         if EqualStr("CN")
            return C_CNSym
         end

         if EqualStr("CA")
            return C_CASym
         end

         if EqualStr("CS")
            return C_CSSym
         end

         if EqualStr("CP")
            return C_CPSym
         end


      when 'D'
         if EqualStr("DEFINING")
            return C_DEFININGSym
         end

         if EqualStr("DATABASE")
            return C_DATABASESym
         end

         if EqualStr("DATA")
            return C_DATASym
         end

         if EqualStr("DELETE")
            return C_DELETESym
         end

         if EqualStr("DO")
            return C_DOSym
         end

         if EqualStr("DEMAND")
            return C_DEMANDSym
         end

         if EqualStr("DESCRIBE")
            return C_DESCRIBESym
         end

         if EqualStr("DETAIL")
            return C_DETAILSym
         end

         if EqualStr("DIVIDE")
            return C_DIVIDESym
         end

         if EqualStr("DIVIDE-CORRESPONDING")
            return C_DIVIDEMinusCORRESPONDINGSym
         end

         if EqualStr("DIV")
            return C_DIVSym
         end


      when 'E'
         if EqualStr("EVENTS")
            return C_EVENTSSym
         end

         if EqualStr("EDITOR-CALL")
            return C_EDITORMinusCALLSym
         end

         if EqualStr("END-OF-PAGE")
            return C_ENDMinusOFMinusPAGESym
         end

         if EqualStr("END-OF-SELECTION")
            return C_ENDMinusOFMinusSELECTIONSym
         end

         if EqualStr("EXIT")
            return C_EXITSym
         end

         if EqualStr("EXPORT")
            return C_EXPORTSym
         end

         if EqualStr("EXTRACT")
            return C_EXTRACTSym
         end

         if EqualStr("EQUIV")
            return C_EQUIVSym
         end

         if EqualStr("EQ")
            return C_EQSym
         end


      when 'F'
         if EqualStr("FUNCTIONALITY")
            return C_FUNCTIONALITYSym
         end

         if EqualStr("FUNCTION")
            return C_FUNCTIONSym
         end

         if EqualStr("FETCH")
            return C_FETCHSym
         end

         if EqualStr("FIELD-GROUPS")
            return C_FIELDMinusGROUPSSym
         end

         if EqualStr("FIELD-SYMBOLS")
            return C_FIELDMinusSYMBOLSSym
         end

         if EqualStr("FIELDS")
            return C_FIELDSSym
         end

         if EqualStr("FIND")
            return C_FINDSym
         end

         if EqualStr("FORMAT")
            return C_FORMATSym
         end

         if EqualStr("FREE")
            return C_FREESym
         end

         if EqualStr("FUNCTION-POOL")
            return C_FUNCTIONMinusPOOLSym
         end


      when 'G'
         if EqualStr("GENERATE")
            return C_GENERATESym
         end

         if EqualStr("GET")
            return C_GETSym
         end

         if EqualStr("GT")
            return C_GTSym
         end

         if EqualStr("GE")
            return C_GESym
         end


      when 'H'
         if EqualStr("HEADING")
            return C_HEADINGSym
         end

         if EqualStr("HIDE")
            return C_HIDESym
         end


      when 'I'
         if EqualStr("IF")
            return C_IFSym
         end

         if EqualStr("IMPORT")
            return C_IMPORTSym
         end

         if EqualStr("INCLUDE")
            return C_INCLUDESym
         end

         if EqualStr("INFOTYPES")
            return C_INFOTYPESSym
         end

         if EqualStr("INITIALIZATION")
            return C_INITIALIZATIONSym
         end

         if EqualStr("INPUT")
            return C_INPUTSym
         end

         if EqualStr("INSERT")
            return C_INSERTSym
         end

         if EqualStr("INTERFACE")
            return C_INTERFACESym
         end

         if EqualStr("INTERFACE-POOL")
            return C_INTERFACEMinusPOOLSym
         end

         if EqualStr("INTERFACES")
            return C_INTERFACESSym
         end

         if EqualStr("IS")
            return C_ISSym
         end

         if EqualStr("INSTANCE")
            return C_INSTANCESym
         end

         if EqualStr("IN")
            return C_INSym
         end

         if EqualStr("INITIAL")
            return C_INITIALSym
         end


      when 'L'
         if EqualStr("LINE-SIZE")
            return C_LINEMinusSIZESym
         end

         if EqualStr("LINE-COUNT")
            return C_LINEMinusCOUNTSym
         end

         if EqualStr("LOOP")
            return C_LOOPSym
         end

         if EqualStr("LEAVE")
            return C_LEAVESym
         end

         if EqualStr("LOAD-OF-PROGRAM")
            return C_LOADMinusOFMinusPROGRAMSym
         end

         if EqualStr("LOCAL")
            return C_LOCALSym
         end

         if EqualStr("LOG-POINT")
            return C_LOGMinusPOINTSym
         end

         if EqualStr("LT")
            return C_LTSym
         end

         if EqualStr("LE")
            return C_LESym
         end


      when 'M'
         if EqualStr("MESSAGE-ID")
            return C_MESSAGEMinusIDSym
         end

         if EqualStr("Message")
            return C_MessageSym
         end

         if EqualStr("MOVE")
            return C_MOVESym
         end

         if EqualStr("METHOD")
            return C_METHODSym
         end

         if EqualStr("METHODS")
            return C_METHODSSym
         end

         if EqualStr("MAXIMUM")
            return C_MAXIMUMSym
         end

         if EqualStr("MINIMUM")
            return C_MINIMUMSym
         end

         if EqualStr("MODULE")
            return C_MODULESym
         end

         if EqualStr("MULTIPLY")
            return C_MULTIPLYSym
         end

         if EqualStr("MULTIPLY-CORRESPONDING")
            return C_MULTIPLYMinusCORRESPONDINGSym
         end

         if EqualStr("MOD")
            return C_MODSym
         end


      when 'N'
         if EqualStr("NO")
            return C_NOSym
         end

         if EqualStr("NEW-LINE")
            return C_NEWMinusLINESym
         end

         if EqualStr("NEW-PAGE")
            return C_NEWMinusPAGESym
         end

         if EqualStr("NEW-SECTION")
            return C_NEWMinusSECTIONSym
         end

         if EqualStr("NODES")
            return C_NODESSym
         end

         if EqualStr("NE")
            return C_NESym
         end

         if EqualStr("NOT")
            return C_NOTSym
         end

         if EqualStr("NA")
            return C_NASym
         end

         if EqualStr("NS")
            return C_NSSym
         end

         if EqualStr("NP")
            return C_NPSym
         end


      when 'O'
         if EqualStr("ON")
            return C_ONSym
         end

         if EqualStr("OPEN")
            return C_OPENSym
         end

         if EqualStr("OVERLAY")
            return C_OVERLAYSym
         end

         if EqualStr("OR")
            return C_ORSym
         end

         if EqualStr("OF")
            return C_OFSym
         end


      when 'P'
         if EqualStr("PAGE")
            return C_PAGESym
         end

         if EqualStr("PROVIDE")
            return C_PROVIDESym
         end

         if EqualStr("PACK")
            return C_PACKSym
         end

         if EqualStr("PARAMETERS")
            return C_PARAMETERSSym
         end

         if EqualStr("PERFORM")
            return C_PERFORMSym
         end

         if EqualStr("POSITION")
            return C_POSITIONSym
         end

         if EqualStr("PRINT-CONTROL")
            return C_PRINTMinusCONTROLSym
         end

         if EqualStr("PROGRAM")
            return C_PROGRAMSym
         end


      when 'R'
         if EqualStr("REPORT")
            return C_REPORTSym
         end

         if EqualStr("REDUCED")
            return C_REDUCEDSym
         end

         if EqualStr("RAISE")
            return C_RAISESym
         end

         if EqualStr("READ")
            return C_READSym
         end

         if EqualStr("RANGES")
            return C_RANGESSym
         end

         if EqualStr("RECEIVE")
            return C_RECEIVESym
         end

         if EqualStr("REFRESH")
            return C_REFRESHSym
         end

         if EqualStr("REJECT")
            return C_REJECTSym
         end

         if EqualStr("REPLACE")
            return C_REPLACESym
         end

         if EqualStr("RESERVE")
            return C_RESERVESym
         end

         if EqualStr("RESUME")
            return C_RESUMESym
         end

         if EqualStr("RETRY")
            return C_RETRYSym
         end

         if EqualStr("RETURN")
            return C_RETURNSym
         end

         if EqualStr("ROLLBACK")
            return C_ROLLBACKSym
         end

         if EqualStr("REQUESTED")
            return C_REQUESTEDSym
         end


      when 'S'
         if EqualStr("STANDARD")
            return C_STANDARDSym
         end

         if EqualStr("SELECT")
            return C_SELECTSym
         end

         if EqualStr("SEARCH")
            return C_SEARCHSym
         end

         if EqualStr("SORT")
            return C_SORTSym
         end

         if EqualStr("SUBMIT")
            return C_SUBMITSym
         end

         if EqualStr("SCROLL")
            return C_SCROLLSym
         end

         if EqualStr("SELECT-OPTIONS")
            return C_SELECTMinusOPTIONSSym
         end

         if EqualStr("SELECTION-SCREEN")
            return C_SELECTIONMinusSCREENSym
         end

         if EqualStr("SET")
            return C_SETSym
         end

         if EqualStr("SHIFT")
            return C_SHIFTSym
         end

         if EqualStr("SKIP")
            return C_SKIPSym
         end

         if EqualStr("STOP")
            return C_STOPSym
         end

         if EqualStr("SUBTRACT")
            return C_SUBTRACTSym
         end

         if EqualStr("SUBTRACT-CORRESPONDING")
            return C_SUBTRACTMinusCORRESPONDINGSym
         end

         if EqualStr("SUM")
            return C_SUMSym
         end

         if EqualStr("SUMMARY")
            return C_SUMMARYSym
         end

         if EqualStr("SUMMING")
            return C_SUMMINGSym
         end

         if EqualStr("SUPPLY")
            return C_SUPPLYSym
         end

         if EqualStr("SUPPRESS")
            return C_SUPPRESSSym
         end

         if EqualStr("SYNTAX-CHECK")
            return C_SYNTAXMinusCHECKSym
         end

         if EqualStr("SPLIT")
            return C_SPLITSym
         end

         if EqualStr("SUPPLIED")
            return C_SUPPLIEDSym
         end


      when 'T'
         if EqualStr("TABLES")
            return C_TABLESSym
         end

         if EqualStr("TRY")
            return C_TRYSym
         end

         if EqualStr("TYPES")
            return C_TYPESSym
         end

         if EqualStr("TEST-INJECTION")
            return C_TESTMinusINJECTIONSym
         end

         if EqualStr("TEST-SEAM")
            return C_TESTMinusSEAMSym
         end

         if EqualStr("TOP-OF-PAGE")
            return C_TOPMinusOFMinusPAGESym
         end

         if EqualStr("TRANSFER")
            return C_TRANSFERSym
         end

         if EqualStr("TRANSLATE")
            return C_TRANSLATESym
         end

         if EqualStr("TRUNCATE")
            return C_TRUNCATESym
         end

         if EqualStr("TYPE-POOL")
            return C_TYPEMinusPOOLSym
         end

         if EqualStr("TYPE-POOLS")
            return C_TYPEMinusPOOLSSym
         end


      when 'U'
         if EqualStr("UPDATE")
            return C_UPDATESym
         end

         if EqualStr("ULINE")
            return C_ULINESym
         end

         if EqualStr("UNASSIGN")
            return C_UNASSIGNSym
         end

         if EqualStr("UNPACK")
            return C_UNPACKSym
         end


      when 'W'
         if EqualStr("WITH")
            return C_WITHSym
         end

         if EqualStr("WRITE")
            return C_WRITESym
         end

         if EqualStr("WHILE")
            return C_WHILESym
         end

         if EqualStr("WAIT")
            return C_WAITSym
         end

         if EqualStr("WINDOW")
            return C_WINDOWSym
         end


      when 'f'
         if EqualStr("for")
            return C_forSym
         end


      when 'r'
         if EqualStr("return")
            return C_returnSym
         end


      end

      return id
   end
   def Comment()

      level=1
      startLine=@currLine
      oldLineStart=@lineStart
      oldCol=@currCol
      if @ch=='/'
         NextCh()
         if @ch=='*'
            NextCh()
            while (1)
               if @ch=='*'
                  NextCh()
                  if @ch=='/'
                     (level-=1;level+2)
                     NextCh()
                     @comEols=@currLine-startLine
                     if level==0
                        return 1
                     end

                  end

               else
                  if @ch==EOF_CHAR
                     return 0
                  else
                     NextCh()
                  end

               end

            end

         else
            if @ch==LF_CHAR
               (@currLine-=1;@currLine+2)
               @lineStart=oldLineStart
            end

            @buffPos-=2
            @currCol=oldCol-1
            NextCh()
         end

      end

      if @ch=='"'
         NextCh()
         while (1)
            if @ch==10
               (level-=1;level+2)
               NextCh()
               @comEols=@currLine-startLine
               if level==0
                  return 1
               end

            else
               if @ch==EOF_CHAR
                  return 0
               else
                  NextCh()
               end

            end

         end

      end

      return 0
   end
   def UpdateState()
      state=@@STATE0[@ch.to_byte()]
      while (1)
         NextCh()
         (@nextSym.Len+=1;@nextSym.Len-2)
         case state

         when 1
            if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

            else
               return CheckLiteral(C_identifierSym)
            end


         when 2
            if @ch=='U'
               state=3
            else
               if @ch=='u'
                  state=4
               else
                  if @ch=='L'
                     state=5
                  else
                     if @ch=='l'
                        state=6
                     else
                        if @ch>='0'&&@ch<='9'

                        else
                           return C_numberSym
                        end

                     end

                  end

               end

            end


         when 3
            return C_numberSym
         when 4
            return C_numberSym
         when 5
            return C_numberSym
         when 6
            return C_numberSym
         when 8
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
               state=9
            else
               return No_Sym
            end


         when 9
            if @ch=='U'
               state=10
            else
               if @ch=='u'
                  state=11
               else
                  if @ch=='L'
                     state=12
                  else
                     if @ch=='l'
                        state=13
                     else
                        if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                        else
                           return C_hexnumberSym
                        end

                     end

                  end

               end

            end


         when 10
            return C_hexnumberSym
         when 11
            return C_hexnumberSym
         when 12
            return C_hexnumberSym
         when 13
            return C_hexnumberSym
         when 14
            if @ch==39
               state=15
            else
               if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

               else
                  return No_Sym
               end

            end


         when 15
            return C_stringD1Sym
         when 16
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
               state=18
            else
               if @ch==92
                  state=25
               else
                  return No_Sym
               end

            end


         when 18
            if @ch=='"'
               state=19
            else
               return No_Sym
            end


         when 19
            return C_charSym
         when 20
            return C_ColonSym
         when 21
            return C_spaceD1Sym
         when 22
            if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
               state=23
            else
               return No_Sym
            end


         when 23
            return C_PreProcessorSym
         when 24
            if @ch=='U'
               state=3
            else
               if @ch=='u'
                  state=4
               else
                  if @ch=='L'
                     state=5
                  else
                     if @ch=='l'
                        state=6
                     else
                        if @ch>='0'&&@ch<='9'
                           state=2
                        else
                           if @ch=='X'||@ch=='x'
                              state=8
                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end

            end


         when 25
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
               state=18
            else
               if @ch=='"'
                  state=19
               else
                  return No_Sym
               end

            end


         when 26
            return C_LparenSym
         when 27
            return C_RparenSym
         when 28
            return C_PointSym
         when 29
            if @ch=='|'
               state=30
            else
               if @ch=='='
                  state=62
               else
                  return C_BarSym
               end

            end


         when 30
            return C_BarBarSym
         when 31
            if @ch=='&'
               state=32
            else
               if @ch=='='
                  state=60
               else
                  return C_AndSym
               end

            end


         when 32
            return C_AndAndSym
         when 33
            if @ch=='='
               state=61
            else
               return C_UparrowSym
            end


         when 34
            if @ch=='>'
               state=53
            else
               return C_EqualSym
            end


         when 35
            if @ch=='>'
               state=36
            else
               if @ch=='='
                  state=38
               else
                  if @ch=='<'
                     state=40
                  else
                     return C_LessSym
                  end

               end

            end


         when 36
            return C_LessGreaterSym
         when 37
            if @ch=='='
               state=39
            else
               if @ch=='>'
                  state=41
               else
                  return C_GreaterSym
               end

            end


         when 38
            return C_LessEqualSym
         when 39
            return C_GreaterEqualSym
         when 40
            if @ch=='='
               state=63
            else
               return C_LessLessSym
            end


         when 41
            if @ch=='='
               state=64
            else
               return C_GreaterGreaterSym
            end


         when 42
            if @ch=='+'
               state=48
            else
               if @ch=='='
                  state=58
               else
                  return C_PlusSym
               end

            end


         when 43
            if @ch=='-'
               state=49
            else
               if @ch=='>'
                  state=52
               else
                  if @ch=='='
                     state=59
                  else
                     return C_MinusSym
                  end

               end

            end


         when 44
            if @ch=='*'
               state=47
            else
               if @ch=='='
                  state=55
               else
                  return C_StarSym
               end

            end


         when 45
            if @ch=='='
               state=56
            else
               return C_SlashSym
            end


         when 46
            if @ch=='='
               state=57
            else
               return C_PercentSym
            end


         when 47
            return C_StarStarSym
         when 48
            return C_PlusPlusSym
         when 49
            return C_MinusMinusSym
         when 50
            return C_LbrackSym
         when 51
            return C_RbrackSym
         when 52
            return C_MinusGreaterSym
         when 53
            return C_EqualGreaterSym
         when 54
            return C_CommaSym
         when 55
            return C_StarEqualSym
         when 56
            return C_SlashEqualSym
         when 57
            return C_PercentEqualSym
         when 58
            return C_PlusEqualSym
         when 59
            return C_MinusEqualSym
         when 60
            return C_AndEqualSym
         when 61
            return C_UparrowEqualSym
         when 62
            return C_BarEqualSym
         when 63
            return C_LessLessEqualSym
         when 64
            return C_GreaterGreaterEqualSym
         when 65
            return C_BangSym
         when 66
            return C_TildeSym
         else
            return No_Sym
         end

      end

   end
   def Get1()

      frame_start


      label(:start){
         while (@ch>=9&&@ch<=10||@ch==13||@ch==' ')
            NextCh()
         end

         if (@ch=='"'||@ch=='/')&&Comment()
            goto :start
         end

         @currSym=@nextSym
         @nextSym.Init(0,@currLine,@currCol-1,@buffPos,0)
         @nextSym.Len=0
         ctx=0
         if @ch==EOF_CHAR
            return EOF_Sym
         end

         state=@@STATE0[@ch]
         while (1)
            NextCh()
            (@nextSym.Len+=1;@nextSym.Len-2)
            case state

            when 1
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

               else
                  return CheckLiteral(C_identifierSym)
               end


            when 2
               if @ch=='U'
                  state=3
               else
                  if @ch=='u'
                     state=4
                  else
                     if @ch=='L'
                        state=5
                     else
                        if @ch=='l'
                           state=6
                        else
                           if @ch>='0'&&@ch<='9'

                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end


            when 3
               return C_numberSym
            when 4
               return C_numberSym
            when 5
               return C_numberSym
            when 6
               return C_numberSym
            when 8
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
                  state=9
               else
                  return No_Sym
               end


            when 9
               if @ch=='U'
                  state=10
               else
                  if @ch=='u'
                     state=11
                  else
                     if @ch=='L'
                        state=12
                     else
                        if @ch=='l'
                           state=13
                        else
                           if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                           else
                              return C_hexnumberSym
                           end

                        end

                     end

                  end

               end


            when 10
               return C_hexnumberSym
            when 11
               return C_hexnumberSym
            when 12
               return C_hexnumberSym
            when 13
               return C_hexnumberSym
            when 14
               if @ch==39
                  state=15
               else
                  if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

                  else
                     return No_Sym
                  end

               end


            when 15
               return C_stringD1Sym
            when 16
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
                  state=18
               else
                  if @ch==92
                     state=25
                  else
                     return No_Sym
                  end

               end


            when 18
               if @ch=='"'
                  state=19
               else
                  return No_Sym
               end


            when 19
               return C_charSym
            when 20
               return C_ColonSym
            when 21
               return C_spaceD1Sym
            when 22
               if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
                  state=23
               else
                  return No_Sym
               end


            when 23
               return C_PreProcessorSym
            when 24
               if @ch=='U'
                  state=3
               else
                  if @ch=='u'
                     state=4
                  else
                     if @ch=='L'
                        state=5
                     else
                        if @ch=='l'
                           state=6
                        else
                           if @ch>='0'&&@ch<='9'
                              state=2
                           else
                              if @ch=='X'||@ch=='x'
                                 state=8
                              else
                                 return C_numberSym
                              end

                           end

                        end

                     end

                  end

               end


            when 25
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
                  state=18
               else
                  if @ch=='"'
                     state=19
                  else
                     return No_Sym
                  end

               end


            when 26
               return C_LparenSym
            when 27
               return C_RparenSym
            when 28
               return C_PointSym
            when 29
               if @ch=='|'
                  state=30
               else
                  if @ch=='='
                     state=62
                  else
                     return C_BarSym
                  end

               end


            when 30
               return C_BarBarSym
            when 31
               if @ch=='&'
                  state=32
               else
                  if @ch=='='
                     state=60
                  else
                     return C_AndSym
                  end

               end


            when 32
               return C_AndAndSym
            when 33
               if @ch=='='
                  state=61
               else
                  return C_UparrowSym
               end


            when 34
               if @ch=='>'
                  state=53
               else
                  return C_EqualSym
               end


            when 35
               if @ch=='>'
                  state=36
               else
                  if @ch=='='
                     state=38
                  else
                     if @ch=='<'
                        state=40
                     else
                        return C_LessSym
                     end

                  end

               end


            when 36
               return C_LessGreaterSym
            when 37
               if @ch=='='
                  state=39
               else
                  if @ch=='>'
                     state=41
                  else
                     return C_GreaterSym
                  end

               end


            when 38
               return C_LessEqualSym
            when 39
               return C_GreaterEqualSym
            when 40
               if @ch=='='
                  state=63
               else
                  return C_LessLessSym
               end


            when 41
               if @ch=='='
                  state=64
               else
                  return C_GreaterGreaterSym
               end


            when 42
               if @ch=='+'
                  state=48
               else
                  if @ch=='='
                     state=58
                  else
                     return C_PlusSym
                  end

               end


            when 43
               if @ch=='-'
                  state=49
               else
                  if @ch=='>'
                     state=52
                  else
                     if @ch=='='
                        state=59
                     else
                        return C_MinusSym
                     end

                  end

               end


            when 44
               if @ch=='*'
                  state=47
               else
                  if @ch=='='
                     state=55
                  else
                     return C_StarSym
                  end

               end


            when 45
               if @ch=='='
                  state=56
               else
                  return C_SlashSym
               end


            when 46
               if @ch=='='
                  state=57
               else
                  return C_PercentSym
               end


            when 47
               return C_StarStarSym
            when 48
               return C_PlusPlusSym
            when 49
               return C_MinusMinusSym
            when 50
               return C_LbrackSym
            when 51
               return C_RbrackSym
            when 52
               return C_MinusGreaterSym
            when 53
               return C_EqualGreaterSym
            when 54
               return C_CommaSym
            when 55
               return C_StarEqualSym
            when 56
               return C_SlashEqualSym
            when 57
               return C_PercentEqualSym
            when 58
               return C_PlusEqualSym
            when 59
               return C_MinusEqualSym
            when 60
               return C_AndEqualSym
            when 61
               return C_UparrowEqualSym
            when 62
               return C_BarEqualSym
            when 63
               return C_LessLessEqualSym
            when 64
               return C_GreaterGreaterEqualSym
            when 65
               return C_BangSym
            when 66
               return C_TildeSym
            else
               return No_Sym
            end

         end

      }

      frame_end

   end

   @@STATE0








   @szName
end
