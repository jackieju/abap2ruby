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
         if EqualStr("AA")
            return C_AASym
         end

         if EqualStr("APPEND")
            return C_APPENDSym
         end

         if EqualStr("ASSIGNING")
            return C_ASSIGNINGSym
         end

         if EqualStr("AT")
            return C_ATSym
         end

         if EqualStr("ABBREVIATED")
            return C_ABBREVIATEDSym
         end

         if EqualStr("AND")
            return C_ANDSym
         end

         if EqualStr("ASCENDING")
            return C_ASCENDINGSym
         end

         if EqualStr("AS")
            return C_ASSym
         end

         if EqualStr("ALIAS")
            return C_ALIASSym
         end

         if EqualStr("ALL")
            return C_ALLSym
         end

         if EqualStr("ABSTRACT")
            return C_ABSTRACTSym
         end

         if EqualStr("ASSIGNED")
            return C_ASSIGNEDSym
         end


      when 'B'
         if EqualStr("BY")
            return C_BYSym
         end

         if EqualStr("BYTE")
            return C_BYTESym
         end

         if EqualStr("BLANKS")
            return C_BLANKSSym
         end

         if EqualStr("BETWEEN")
            return C_BETWEENSym
         end

         if EqualStr("BOXED")
            return C_BOXEDSym
         end

         if EqualStr("BLOB")
            return C_BLOBSym
         end

         if EqualStr("BEGIN")
            return C_BEGINSym
         end

         if EqualStr("BACKGROUND")
            return C_BACKGROUNDSym
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
         if EqualStr("CENTER")
            return C_CENTERSym
         end

         if EqualStr("CASTING")
            return C_CASTINGSym
         end

         if EqualStr("CONCATENATE")
            return C_CONCATENATESym
         end

         if EqualStr("CHARACTER")
            return C_CHARACTERSym
         end

         if EqualStr("CONTROL")
            return C_CONTROLSym
         end

         if EqualStr("COMPONENTS")
            return C_COMPONENTSSym
         end

         if EqualStr("COLUMNS")
            return C_COLUMNSSym
         end

         if EqualStr("CLOB")
            return C_CLOBSym
         end

         if EqualStr("COMMON")
            return C_COMMONSym
         end

         if EqualStr("CONSTANTS")
            return C_CONSTANTSSym
         end

         if EqualStr("CENTERED")
            return C_CENTEREDSym
         end

         if EqualStr("CURRENCY")
            return C_CURRENCYSym
         end

         if EqualStr("COLOR")
            return C_COLORSym
         end

         if EqualStr("CHECKBOX")
            return C_CHECKBOXSym
         end

         if EqualStr("CONTINUE")
            return C_CONTINUESym
         end

         if EqualStr("CASE")
            return C_CASESym
         end

         if EqualStr("CALL")
            return C_CALLSym
         end

         if EqualStr("CALLING")
            return C_CALLINGSym
         end

         if EqualStr("CHANGING")
            return C_CHANGINGSym
         end

         if EqualStr("CLASS")
            return C_CLASSSym
         end

         if EqualStr("CREATE")
            return C_CREATESym
         end

         if EqualStr("CRITICAL")
            return C_CRITICALSym
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
         if EqualStr("DESCRIBE")
            return C_DESCRIBESym
         end

         if EqualStr("DECIMALS")
            return C_DECIMALSSym
         end

         if EqualStr("DISTANCE")
            return C_DISTANCESym
         end

         if EqualStr("DISPLAY")
            return C_DISPLAYSym
         end

         if EqualStr("DESCENDING")
            return C_DESCENDINGSym
         end

         if EqualStr("DEFAULT")
            return C_DEFAULTSym
         end

         if EqualStr("DATA")
            return C_DATASym
         end

         if EqualStr("DDMMYY")
            return C_DDMMYYSym
         end

         if EqualStr("DO")
            return C_DOSym
         end

         if EqualStr("DESTINATION")
            return C_DESTINATIONSym
         end

         if EqualStr("DEFINITION")
            return C_DEFINITIONSym
         end

         if EqualStr("DANGEROUS")
            return C_DANGEROUSSym
         end

         if EqualStr("DURATION")
            return C_DURATIONSym
         end

         if EqualStr("DIV")
            return C_DIVSym
         end


      when 'E'
         if EqualStr("ENDFUNCTION")
            return C_ENDFUNCTIONSym
         end

         if EqualStr("EXACT")
            return C_EXACTSym
         end

         if EqualStr("ENDING")
            return C_ENDINGSym
         end

         if EqualStr("EDIT")
            return C_EDITSym
         end

         if EqualStr("END-LINES")
            return C_ENDMinusLINESSym
         end

         if EqualStr("EVENT")
            return C_EVENTSym
         end

         if EqualStr("EXPORTING")
            return C_EXPORTINGSym
         end

         if EqualStr("EXCEPTION")
            return C_EXCEPTIONSym
         end

         if EqualStr("ENDLOOP")
            return C_ENDLOOPSym
         end

         if EqualStr("EMPTY")
            return C_EMPTYSym
         end

         if EqualStr("END")
            return C_ENDSym
         end

         if EqualStr("EXPONENT")
            return C_EXPONENTSym
         end

         if EqualStr("ENVIRONMENT")
            return C_ENVIRONMENTSym
         end

         if EqualStr("ENDDO")
            return C_ENDDOSym
         end

         if EqualStr("ENDCASE")
            return C_ENDCASESym
         end

         if EqualStr("EXCEPTIONS")
            return C_EXCEPTIONSSym
         end

         if EqualStr("EXCEPTION-TABLE")
            return C_EXCEPTIONMinusTABLESym
         end

         if EqualStr("ELSEIF")
            return C_ELSEIFSym
         end

         if EqualStr("ELSE")
            return C_ELSESym
         end

         if EqualStr("ENDIF")
            return C_ENDIFSym
         end

         if EqualStr("ENDWHILE")
            return C_ENDWHILESym
         end

         if EqualStr("ENABLED")
            return C_ENABLEDSym
         end

         if EqualStr("ENDCLASS")
            return C_ENDCLASSSym
         end

         if EqualStr("ENDMETHOD")
            return C_ENDMETHODSym
         end

         if EqualStr("EQUIV")
            return C_EQUIVSym
         end

         if EqualStr("EQ")
            return C_EQSym
         end


      when 'F'
         if EqualStr("FUNCTION")
            return C_FUNCTIONSym
         end

         if EqualStr("FROM")
            return C_FROMSym
         end

         if EqualStr("FOR")
            return C_FORSym
         end

         if EqualStr("FIELD")
            return C_FIELDSym
         end

         if EqualStr("FIRST-LINE")
            return C_FIRSTMinusLINESym
         end

         if EqualStr("FIELDS")
            return C_FIELDSSym
         end

         if EqualStr("FORMAT")
            return C_FORMATSym
         end

         if EqualStr("FRAMES")
            return C_FRAMESSym
         end

         if EqualStr("FINAL")
            return C_FINALSym
         end

         if EqualStr("FRIENDS")
            return C_FRIENDSSym
         end

         if EqualStr("FAIL")
            return C_FAILSym
         end


      when 'G'
         if EqualStr("GROUP")
            return C_GROUPSym
         end

         if EqualStr("GLOBAL")
            return C_GLOBALSym
         end

         if EqualStr("GT")
            return C_GTSym
         end

         if EqualStr("GE")
            return C_GESym
         end


      when 'H'
         if EqualStr("HELP-ID")
            return C_HELPMinusIDSym
         end

         if EqualStr("HEAD-LINES")
            return C_HEADMinusLINESSym
         end

         if EqualStr("HANDLE")
            return C_HANDLESym
         end

         if EqualStr("HASHED")
            return C_HASHEDSym
         end

         if EqualStr("HEADER")
            return C_HEADERSym
         end

         if EqualStr("HOTSPOT")
            return C_HOTSPOTSym
         end

         if EqualStr("HARMLESS")
            return C_HARMLESSSym
         end


      when 'I'
         if EqualStr("INITIAL")
            return C_INITIALSym
         end

         if EqualStr("INTO")
            return C_INTOSym
         end

         if EqualStr("IN")
            return C_INSym
         end

         if EqualStr("INDEX")
            return C_INDEXSym
         end

         if EqualStr("ID")
            return C_IDSym
         end

         if EqualStr("IS")
            return C_ISSym
         end

         if EqualStr("INTENSIFIED")
            return C_INTENSIFIEDSym
         end

         if EqualStr("INVERSE")
            return C_INVERSESym
         end

         if EqualStr("INPUT")
            return C_INPUTSym
         end

         if EqualStr("ICON")
            return C_ICONSym
         end

         if EqualStr("IMPORTING")
            return C_IMPORTINGSym
         end

         if EqualStr("IF")
            return C_IFSym
         end

         if EqualStr("INHERITING")
            return C_INHERITINGSym
         end

         if EqualStr("IMPLEMENTATION")
            return C_IMPLEMENTATIONSym
         end

         if EqualStr("IGNORE")
            return C_IGNORESym
         end

         if EqualStr("INSTANCE")
            return C_INSTANCESym
         end


      when 'K'
         if EqualStr("KEY")
            return C_KEYSym
         end

         if EqualStr("KIND")
            return C_KINDSym
         end


      when 'L'
         if EqualStr("LEFT")
            return C_LEFTSym
         end

         if EqualStr("LINE")
            return C_LINESym
         end

         if EqualStr("LINES")
            return C_LINESSym
         end

         if EqualStr("LENGTH")
            return C_LENGTHSym
         end

         if EqualStr("LIST")
            return C_LISTSym
         end

         if EqualStr("LINE-SIZE")
            return C_LINEMinusSIZESym
         end

         if EqualStr("LINE-COUNT")
            return C_LINEMinusCOUNTSym
         end

         if EqualStr("LIKE")
            return C_LIKESym
         end

         if EqualStr("LOOP")
            return C_LOOPSym
         end

         if EqualStr("LOCATOR")
            return C_LOCATORSym
         end

         if EqualStr("LOB")
            return C_LOBSym
         end

         if EqualStr("LEFT-JUSTIFIED")
            return C_LEFTMinusJUSTIFIEDSym
         end

         if EqualStr("LEVEL")
            return C_LEVELSym
         end

         if EqualStr("LONG")
            return C_LONGSym
         end

         if EqualStr("LT")
            return C_LTSym
         end

         if EqualStr("LE")
            return C_LESym
         end


      when 'M'
         if EqualStr("MOVE")
            return C_MOVESym
         end

         if EqualStr("MODE")
            return C_MODESym
         end

         if EqualStr("MARK")
            return C_MARKSym
         end

         if EqualStr("MASK")
            return C_MASKSym
         end

         if EqualStr("MESSAGE")
            return C_MESSAGESym
         end

         if EqualStr("MEMBERS")
            return C_MEMBERSSym
         end

         if EqualStr("MMDDYY")
            return C_MMDDYYSym
         end

         if EqualStr("MEMORY")
            return C_MEMORYSym
         end

         if EqualStr("MEDIUM")
            return C_MEDIUMSym
         end

         if EqualStr("METHOD")
            return C_METHODSym
         end

         if EqualStr("METHODS")
            return C_METHODSSym
         end

         if EqualStr("MOD")
            return C_MODSym
         end


      when 'N'
         if EqualStr("NUMBER")
            return C_NUMBERSym
         end

         if EqualStr("NO")
            return C_NOSym
         end

         if EqualStr("NON-UNIQUE")
            return C_NONMinusUNIQUESym
         end

         if EqualStr("NO-GAP")
            return C_NOMinusGAPSym
         end

         if EqualStr("NO-GROUPING")
            return C_NOMinusGROUPINGSym
         end

         if EqualStr("NO-SIGN")
            return C_NOMinusSIGNSym
         end

         if EqualStr("NO-ZERO")
            return C_NOMinusZEROSym
         end

         if EqualStr("NEXT")
            return C_NEXTSym
         end

         if EqualStr("NEW")
            return C_NEWSym
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
         if EqualStr("OF")
            return C_OFSym
         end

         if EqualStr("OUTPUT-LENGTH")
            return C_OUTPUTMinusLENGTHSym
         end

         if EqualStr("OCCURS")
            return C_OCCURSSym
         end

         if EqualStr("OTHER")
            return C_OTHERSym
         end

         if EqualStr("ON")
            return C_ONSym
         end

         if EqualStr("OFF")
            return C_OFFSym
         end

         if EqualStr("OR")
            return C_ORSym
         end

         if EqualStr("OTHERS")
            return C_OTHERSSym
         end

         if EqualStr("OPTIONAL")
            return C_OPTIONALSym
         end


      when 'P'
         if EqualStr("PERCENTAGE")
            return C_PERCENTAGESym
         end

         if EqualStr("PPP")
            return C_PPPSym
         end

         if EqualStr("PAGES")
            return C_PAGESSym
         end

         if EqualStr("PAGE")
            return C_PAGESym
         end

         if EqualStr("PART")
            return C_PARTSym
         end

         if EqualStr("PERFORMING")
            return C_PERFORMINGSym
         end

         if EqualStr("PARAMETER-TABLE")
            return C_PARAMETERMinusTABLESym
         end

         if EqualStr("PUBLIC")
            return C_PUBLICSym
         end

         if EqualStr("PROTECTED")
            return C_PROTECTEDSym
         end

         if EqualStr("PRIVATE")
            return C_PRIVATESym
         end

         if EqualStr("PREFERRED")
            return C_PREFERREDSym
         end

         if EqualStr("PARAMETER")
            return C_PARAMETERSym
         end


      when 'Q'
         if EqualStr("QUICKINFO")
            return C_QUICKINFOSym
         end


      when 'R'
         if EqualStr("REPORT")
            return C_REPORTSym
         end

         if EqualStr("RIGHT")
            return C_RIGHTSym
         end

         if EqualStr("REFERENCE")
            return C_REFERENCESym
         end

         if EqualStr("RESPECTING")
            return C_RESPECTINGSym
         end

         if EqualStr("REFRESH")
            return C_REFRESHSym
         end

         if EqualStr("RAISE")
            return C_RAISESym
         end

         if EqualStr("RESUMABLE")
            return C_RESUMABLESym
         end

         if EqualStr("RAISING")
            return C_RAISINGSym
         end

         if EqualStr("READER")
            return C_READERSym
         end

         if EqualStr("REF")
            return C_REFSym
         end

         if EqualStr("RANGE")
            return C_RANGESym
         end

         if EqualStr("READ-ONLY")
            return C_READMinusONLYSym
         end

         if EqualStr("RIGHT-JUSTIFIED")
            return C_RIGHTMinusJUSTIFIEDSym
         end

         if EqualStr("ROUND")
            return C_ROUNDSym
         end

         if EqualStr("RESET")
            return C_RESETSym
         end

         if EqualStr("RISK")
            return C_RISKSym
         end

         if EqualStr("RETURNING")
            return C_RETURNINGSym
         end

         if EqualStr("REQUESTED")
            return C_REQUESTEDSym
         end


      when 'S'
         if EqualStr("SORTED")
            return C_SORTEDSym
         end

         if EqualStr("SEPARATED")
            return C_SEPARATEDSym
         end

         if EqualStr("SEARCH")
            return C_SEARCHSym
         end

         if EqualStr("STARTING")
            return C_STARTINGSym
         end

         if EqualStr("SCREEN")
            return C_SCREENSym
         end

         if EqualStr("SIZE")
            return C_SIZESym
         end

         if EqualStr("STANDARD")
            return C_STANDARDSym
         end

         if EqualStr("STYLE")
            return C_STYLESym
         end

         if EqualStr("SYMBOL")
            return C_SYMBOLSym
         end

         if EqualStr("SEPARATE")
            return C_SEPARATESym
         end

         if EqualStr("SHARED")
            return C_SHAREDSym
         end

         if EqualStr("SHORT")
            return C_SHORTSym
         end

         if EqualStr("SECTION")
            return C_SECTIONSym
         end

         if EqualStr("SPLIT")
            return C_SPLITSym
         end

         if EqualStr("SUPPLIED")
            return C_SUPPLIEDSym
         end


      when 'T'
         if EqualStr("TO")
            return C_TOSym
         end

         if EqualStr("TABLE")
            return C_TABLESym
         end

         if EqualStr("TYPE")
            return C_TYPESym
         end

         if EqualStr("TOP-LINES")
            return C_TOPMinusLINESSym
         end

         if EqualStr("TITLE-LINES")
            return C_TITLEMinusLINESSym
         end

         if EqualStr("TEXT")
            return C_TEXTSym
         end

         if EqualStr("TRANSPORTING")
            return C_TRANSPORTINGSym
         end

         if EqualStr("TIME")
            return C_TIMESym
         end

         if EqualStr("TIMES")
            return C_TIMESSym
         end

         if EqualStr("TASK")
            return C_TASKSym
         end

         if EqualStr("TABLES")
            return C_TABLESSym
         end

         if EqualStr("TESTING")
            return C_TESTINGSym
         end


      when 'U'
         if EqualStr("USING")
            return C_USINGSym
         end

         if EqualStr("UNIQUE")
            return C_UNIQUESym
         end

         if EqualStr("UNDER")
            return C_UNDERSym
         end

         if EqualStr("UNIT")
            return C_UNITSym
         end

         if EqualStr("UPDATE")
            return C_UPDATESym
         end


      when 'V'
         if EqualStr("VERSION")
            return C_VERSIONSym
         end

         if EqualStr("VALUE")
            return C_VALUESym
         end

         if EqualStr("VALID")
            return C_VALIDSym
         end

         if EqualStr("VARYING")
            return C_VARYINGSym
         end

         if EqualStr("VARY")
            return C_VARYSym
         end


      when 'W'
         if EqualStr("WITH")
            return C_WITHSym
         end

         if EqualStr("WITHOUT")
            return C_WITHOUTSym
         end

         if EqualStr("WHERE")
            return C_WHERESym
         end

         if EqualStr("WRITER")
            return C_WRITERSym
         end

         if EqualStr("WRITE")
            return C_WRITESym
         end

         if EqualStr("WHEN")
            return C_WHENSym
         end

         if EqualStr("WHILE")
            return C_WHILESym
         end


      when 'Y'
         if EqualStr("YYMMDD")
            return C_YYMMDDSym
         end


      when 'Z'
         if EqualStr("ZONE")
            return C_ZONESym
         end


      when 'a'
         if EqualStr("at")
            return C_atSym
         end


      when 'b'
         if EqualStr("break")
            return C_breakSym
         end


      when 'c'
         if EqualStr("communication_failure")
            return C_communicationUnderscorefaiSym
         end


      when 'e'
         if EqualStr("error_message")
            return C_errorUnderscoremessageSym
         end


      when 'f'
         if EqualStr("for")
            return C_forSym
         end


      when 'r'
         if EqualStr("resource_failure")
            return C_resourceUnderscorefailureSym
         end

         if EqualStr("return")
            return C_returnSym
         end


      when 's'
         if EqualStr("system_failure")
            return C_systemUnderscorefailureSym
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
            return C_PointSym
         when 27
            if @ch=='T'
               state=28
            else
               return No_Sym
            end


         when 28
            if @ch=='O'
               state=29
            else
               return No_Sym
            end


         when 29
            return C_QueryTOSym
         when 30
            return C_LbrackSym
         when 31
            return C_RbrackSym
         when 32
            return C_LparenSym
         when 33
            return C_RparenSym
         when 34
            if @ch=='>'
               state=93
            else
               return C_EqualSym
            end


         when 35
            if @ch=='='
               state=96
            else
               return C_SlashSym
            end


         when 36
            if @ch=='*'
               state=37
            else
               if @ch=='='
                  state=95
               else
                  return C_StarSym
               end

            end


         when 37
            return C_StarStarSym
         when 62
            if @ch=='Y'
               state=63
            else
               return No_Sym
            end


         when 63
            return C_DDSlashMMSlashYYYYSym
         when 72
            if @ch=='Y'
               state=73
            else
               return No_Sym
            end


         when 73
            return C_MMSlashDDSlashYYYYSym
         when 74
            return C_SemicolonSym
         when 75
            if @ch=='|'
               state=76
            else
               if @ch=='='
                  state=102
               else
                  return C_BarSym
               end

            end


         when 76
            return C_BarBarSym
         when 77
            if @ch=='&'
               state=78
            else
               if @ch=='='
                  state=100
               else
                  return C_AndSym
               end

            end


         when 78
            return C_AndAndSym
         when 79
            if @ch=='='
               state=101
            else
               return C_UparrowSym
            end


         when 80
            if @ch=='>'
               state=81
            else
               if @ch=='='
                  state=83
               else
                  if @ch=='<'
                     state=85
                  else
                     return C_LessSym
                  end

               end

            end


         when 81
            return C_LessGreaterSym
         when 82
            if @ch=='='
               state=84
            else
               if @ch=='>'
                  state=86
               else
                  return C_GreaterSym
               end

            end


         when 83
            return C_LessEqualSym
         when 84
            return C_GreaterEqualSym
         when 85
            if @ch=='='
               state=103
            else
               return C_LessLessSym
            end


         when 86
            if @ch=='='
               state=104
            else
               return C_GreaterGreaterSym
            end


         when 87
            if @ch=='+'
               state=90
            else
               if @ch=='='
                  state=98
               else
                  return C_PlusSym
               end

            end


         when 88
            if @ch=='-'
               state=91
            else
               if @ch=='>'
                  state=92
               else
                  if @ch=='='
                     state=99
                  else
                     return C_MinusSym
                  end

               end

            end


         when 89
            if @ch=='='
               state=97
            else
               return C_PercentSym
            end


         when 90
            return C_PlusPlusSym
         when 91
            return C_MinusMinusSym
         when 92
            return C_MinusGreaterSym
         when 93
            return C_EqualGreaterSym
         when 94
            return C_CommaSym
         when 95
            return C_StarEqualSym
         when 96
            return C_SlashEqualSym
         when 97
            return C_PercentEqualSym
         when 98
            return C_PlusEqualSym
         when 99
            return C_MinusEqualSym
         when 100
            return C_AndEqualSym
         when 101
            return C_UparrowEqualSym
         when 102
            return C_BarEqualSym
         when 103
            return C_LessLessEqualSym
         when 104
            return C_GreaterGreaterEqualSym
         when 105
            return C_BangSym
         when 106
            return C_TildeSym
         when 107
            if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=1
            else
               if @ch=='D'
                  state=109
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 108
            if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=1
            else
               if @ch=='M'
                  state=110
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 109
            if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=1
            else
               if @ch=='/'
                  state=111
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 110
            if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=1
            else
               if @ch=='/'
                  state=112
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 111
            if @ch=='M'
               state=113
            else
               return No_Sym
            end


         when 112
            if @ch=='D'
               state=114
            else
               return No_Sym
            end


         when 113
            if @ch=='M'
               state=115
            else
               return No_Sym
            end


         when 114
            if @ch=='D'
               state=116
            else
               return No_Sym
            end


         when 115
            if @ch=='/'
               state=117
            else
               return No_Sym
            end


         when 116
            if @ch=='/'
               state=118
            else
               return No_Sym
            end


         when 117
            if @ch=='Y'
               state=119
            else
               return No_Sym
            end


         when 118
            if @ch=='Y'
               state=120
            else
               return No_Sym
            end


         when 119
            if @ch=='Y'
               state=121
            else
               return No_Sym
            end


         when 120
            if @ch=='Y'
               state=122
            else
               return No_Sym
            end


         when 121
            if @ch=='Y'
               state=62
            else
               return C_DDSlashMMSlashYYSym
            end


         when 122
            if @ch=='Y'
               state=72
            else
               return C_MMSlashDDSlashYYSym
            end


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
               return C_PointSym
            when 27
               if @ch=='T'
                  state=28
               else
                  return No_Sym
               end


            when 28
               if @ch=='O'
                  state=29
               else
                  return No_Sym
               end


            when 29
               return C_QueryTOSym
            when 30
               return C_LbrackSym
            when 31
               return C_RbrackSym
            when 32
               return C_LparenSym
            when 33
               return C_RparenSym
            when 34
               if @ch=='>'
                  state=93
               else
                  return C_EqualSym
               end


            when 35
               if @ch=='='
                  state=96
               else
                  return C_SlashSym
               end


            when 36
               if @ch=='*'
                  state=37
               else
                  if @ch=='='
                     state=95
                  else
                     return C_StarSym
                  end

               end


            when 37
               return C_StarStarSym
            when 62
               if @ch=='Y'
                  state=63
               else
                  return No_Sym
               end


            when 63
               return C_DDSlashMMSlashYYYYSym
            when 72
               if @ch=='Y'
                  state=73
               else
                  return No_Sym
               end


            when 73
               return C_MMSlashDDSlashYYYYSym
            when 74
               return C_SemicolonSym
            when 75
               if @ch=='|'
                  state=76
               else
                  if @ch=='='
                     state=102
                  else
                     return C_BarSym
                  end

               end


            when 76
               return C_BarBarSym
            when 77
               if @ch=='&'
                  state=78
               else
                  if @ch=='='
                     state=100
                  else
                     return C_AndSym
                  end

               end


            when 78
               return C_AndAndSym
            when 79
               if @ch=='='
                  state=101
               else
                  return C_UparrowSym
               end


            when 80
               if @ch=='>'
                  state=81
               else
                  if @ch=='='
                     state=83
                  else
                     if @ch=='<'
                        state=85
                     else
                        return C_LessSym
                     end

                  end

               end


            when 81
               return C_LessGreaterSym
            when 82
               if @ch=='='
                  state=84
               else
                  if @ch=='>'
                     state=86
                  else
                     return C_GreaterSym
                  end

               end


            when 83
               return C_LessEqualSym
            when 84
               return C_GreaterEqualSym
            when 85
               if @ch=='='
                  state=103
               else
                  return C_LessLessSym
               end


            when 86
               if @ch=='='
                  state=104
               else
                  return C_GreaterGreaterSym
               end


            when 87
               if @ch=='+'
                  state=90
               else
                  if @ch=='='
                     state=98
                  else
                     return C_PlusSym
                  end

               end


            when 88
               if @ch=='-'
                  state=91
               else
                  if @ch=='>'
                     state=92
                  else
                     if @ch=='='
                        state=99
                     else
                        return C_MinusSym
                     end

                  end

               end


            when 89
               if @ch=='='
                  state=97
               else
                  return C_PercentSym
               end


            when 90
               return C_PlusPlusSym
            when 91
               return C_MinusMinusSym
            when 92
               return C_MinusGreaterSym
            when 93
               return C_EqualGreaterSym
            when 94
               return C_CommaSym
            when 95
               return C_StarEqualSym
            when 96
               return C_SlashEqualSym
            when 97
               return C_PercentEqualSym
            when 98
               return C_PlusEqualSym
            when 99
               return C_MinusEqualSym
            when 100
               return C_AndEqualSym
            when 101
               return C_UparrowEqualSym
            when 102
               return C_BarEqualSym
            when 103
               return C_LessLessEqualSym
            when 104
               return C_GreaterGreaterEqualSym
            when 105
               return C_BangSym
            when 106
               return C_TildeSym
            when 107
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='D'
                     state=109
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 108
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='M'
                     state=110
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 109
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='/'
                     state=111
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 110
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='/'
                     state=112
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 111
               if @ch=='M'
                  state=113
               else
                  return No_Sym
               end


            when 112
               if @ch=='D'
                  state=114
               else
                  return No_Sym
               end


            when 113
               if @ch=='M'
                  state=115
               else
                  return No_Sym
               end


            when 114
               if @ch=='D'
                  state=116
               else
                  return No_Sym
               end


            when 115
               if @ch=='/'
                  state=117
               else
                  return No_Sym
               end


            when 116
               if @ch=='/'
                  state=118
               else
                  return No_Sym
               end


            when 117
               if @ch=='Y'
                  state=119
               else
                  return No_Sym
               end


            when 118
               if @ch=='Y'
                  state=120
               else
                  return No_Sym
               end


            when 119
               if @ch=='Y'
                  state=121
               else
                  return No_Sym
               end


            when 120
               if @ch=='Y'
                  state=122
               else
                  return No_Sym
               end


            when 121
               if @ch=='Y'
                  state=62
               else
                  return C_DDSlashMMSlashYYSym
               end


            when 122
               if @ch=='Y'
                  state=72
               else
                  return C_MMSlashDDSlashYYSym
               end


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
