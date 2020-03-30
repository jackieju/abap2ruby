class CScanner < CRScanner

   def initialize(srcFile,ignoreCase)

   end
   def GetName()
      szName[0]=0
      CRScanner.GetName(@currSym,szName,64-1)
      return szName
   end
   def CheckLiteral(id)
      :c=CurrentCh(@nextSym.Pos)
      if @ignoreCase
         :c=Upcase(:c)
      end

      case :c

      when 'A'
         if EqualStr("ALIAS")
            return C_ALIASSym
         end

         if EqualStr("ALL")
            return C_ALLSym
         end

         if EqualStr("AT")
            return C_ATSym
         end

         if EqualStr("AS")
            return C_ASSym
         end

         if EqualStr("ABSTRACT")
            return C_ABSTRACTSym
         end

         if EqualStr("AND")
            return C_ANDSym
         end


      when 'B'
         if EqualStr("BOXED")
            return C_BOXEDSym
         end

         if EqualStr("BLOB")
            return C_BLOBSym
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


      when 'C'
         if EqualStr("COMPONENTS")
            return C_COMPONENTSSym
         end

         if EqualStr("COLUMNS")
            return C_COLUMNSSym
         end

         if EqualStr("CLOB")
            return C_CLOBSym
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
         if EqualStr("DATA")
            return C_DATASym
         end

         if EqualStr("DECIMALS")
            return C_DECIMALSSym
         end

         if EqualStr("DEFAULT")
            return C_DEFAULTSym
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
         if EqualStr("ENDLOOP")
            return C_ENDLOOPSym
         end

         if EqualStr("EMPTY")
            return C_EMPTYSym
         end

         if EqualStr("EXPONENT")
            return C_EXPONENTSym
         end

         if EqualStr("ENVIRONMENT")
            return C_ENVIRONMENTSym
         end

         if EqualStr("EDIT")
            return C_EDITSym
         end

         if EqualStr("ENDDO")
            return C_ENDDOSym
         end

         if EqualStr("ENDCASE")
            return C_ENDCASESym
         end

         if EqualStr("END")
            return C_ENDSym
         end

         if EqualStr("EXPORTING")
            return C_EXPORTINGSym
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

         if EqualStr("EVENT")
            return C_EVENTSym
         end

         if EqualStr("EQUIV")
            return C_EQUIVSym
         end

         if EqualStr("EQ")
            return C_EQSym
         end


      when 'F'
         if EqualStr("FOR")
            return C_FORSym
         end

         if EqualStr("FORMAT")
            return C_FORMATSym
         end

         if EqualStr("FRAMES")
            return C_FRAMESSym
         end

         if EqualStr("FROM")
            return C_FROMSym
         end

         if EqualStr("FUNCTION")
            return C_FUNCTIONSym
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

         if EqualStr("IN")
            return C_INSym
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


      when 'K'
         if EqualStr("KEY")
            return C_KEYSym
         end


      when 'L'
         if EqualStr("LOOP")
            return C_LOOPSym
         end

         if EqualStr("LENGTH")
            return C_LENGTHSym
         end

         if EqualStr("LOCATOR")
            return C_LOCATORSym
         end

         if EqualStr("LOB")
            return C_LOBSym
         end

         if EqualStr("LINE")
            return C_LINESym
         end

         if EqualStr("LIKE")
            return C_LIKESym
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
         if EqualStr("MASK")
            return C_MASKSym
         end

         if EqualStr("MMDDYY")
            return C_MMDDYYSym
         end

         if EqualStr("MESSAGE")
            return C_MESSAGESym
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

         if EqualStr("NO")
            return C_NOSym
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

         if EqualStr("NA")
            return C_NASym
         end

         if EqualStr("NS")
            return C_NSSym
         end

         if EqualStr("NP")
            return C_NPSym
         end

         if EqualStr("NOT")
            return C_NOTSym
         end


      when 'O'
         if EqualStr("OF")
            return C_OFSym
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

         if EqualStr("REFERENCE")
            return C_REFERENCESym
         end

         if EqualStr("RETURNING")
            return C_RETURNINGSym
         end

         if EqualStr("RAISING")
            return C_RAISINGSym
         end

         if EqualStr("RESUMABLE")
            return C_RESUMABLESym
         end


      when 'S'
         if EqualStr("STANDARD")
            return C_STANDARDSym
         end

         if EqualStr("SORTED")
            return C_SORTEDSym
         end

         if EqualStr("SIZE")
            return C_SIZESym
         end

         if EqualStr("STYLE")
            return C_STYLESym
         end

         if EqualStr("SYMBOL")
            return C_SYMBOLSym
         end

         if EqualStr("STARTING")
            return C_STARTINGSym
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


      when 'T'
         if EqualStr("TYPE")
            return C_TYPESym
         end

         if EqualStr("TO")
            return C_TOSym
         end

         if EqualStr("TABLE")
            return C_TABLESym
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
         if EqualStr("UNIQUE")
            return C_UNIQUESym
         end

         if EqualStr("UNDER")
            return C_UNDERSym
         end

         if EqualStr("UNIT")
            return C_UNITSym
         end

         if EqualStr("USING")
            return C_USINGSym
         end

         if EqualStr("UPDATE")
            return C_UPDATESym
         end


      when 'V'
         if EqualStr("VALUE")
            return C_VALUESym
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
   def Get()

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

         state=@sTATE0[@ch]
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
                  state=5
               else
                  if @ch=='u'
                     state=6
                  else
                     if @ch=='L'
                        state=7
                     else
                        if @ch=='l'
                           state=8
                        else
                           if @ch=='.'
                              state=4
                           else
                              if @ch>='0'&&@ch<='9'

                              else
                                 return C_numberSym
                              end

                           end

                        end

                     end

                  end

               end


            when 4
               if @ch=='U'
                  state=13
               else
                  if @ch=='u'
                     state=14
                  else
                     if @ch=='L'
                        state=15
                     else
                        if @ch=='l'
                           state=16
                        else
                           if @ch>='0'&&@ch<='9'

                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end


            when 5
               return C_numberSym
            when 6
               return C_numberSym
            when 7
               return C_numberSym
            when 8
               return C_numberSym
            when 13
               return C_numberSym
            when 14
               return C_numberSym
            when 15
               return C_numberSym
            when 16
               return C_numberSym
            when 18
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
                  state=19
               else
                  return No_Sym
               end


            when 19
               if @ch=='U'
                  state=20
               else
                  if @ch=='u'
                     state=21
                  else
                     if @ch=='L'
                        state=22
                     else
                        if @ch=='l'
                           state=23
                        else
                           if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                           else
                              return C_hexnumberSym
                           end

                        end

                     end

                  end

               end


            when 20
               return C_hexnumberSym
            when 21
               return C_hexnumberSym
            when 22
               return C_hexnumberSym
            when 23
               return C_hexnumberSym
            when 24
               if @ch==39
                  state=25
               else
                  if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

                  else
                     return No_Sym
                  end

               end


            when 25
               return C_stringD1Sym
            when 26
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
                  state=28
               else
                  if @ch==92
                     state=35
                  else
                     return No_Sym
                  end

               end


            when 28
               if @ch=='"'
                  state=29
               else
                  return No_Sym
               end


            when 29
               return C_charSym
            when 30
               return C_ColonSym
            when 31
               return C_spaceD1Sym
            when 32
               if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
                  state=33
               else
                  return No_Sym
               end


            when 33
               return C_PreProcessorSym
            when 34
               if @ch=='U'
                  state=5
               else
                  if @ch=='u'
                     state=6
                  else
                     if @ch=='L'
                        state=7
                     else
                        if @ch=='l'
                           state=8
                        else
                           if @ch=='.'
                              state=4
                           else
                              if @ch>='0'&&@ch<='9'
                                 state=2
                              else
                                 if @ch=='X'||@ch=='x'
                                    state=18
                                 else
                                    return C_numberSym
                                 end

                              end

                           end

                        end

                     end

                  end

               end


            when 35
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
                  state=28
               else
                  if @ch=='"'
                     state=29
                  else
                     return No_Sym
                  end

               end


            when 36
               return C_PointSym
            when 37
               if @ch=='='
                  state=102
               else
                  return C_SlashSym
               end


            when 38
               return C_LparenSym
            when 39
               if @ch=='*'
                  state=40
               else
                  if @ch=='='
                     state=101
                  else
                     return C_StarSym
                  end

               end


            when 40
               return C_StarStarSym
            when 41
               return C_RparenSym
            when 66
               if @ch=='Y'
                  state=67
               else
                  return No_Sym
               end


            when 67
               return C_DDSlashMMSlashYYYYSym
            when 76
               if @ch=='Y'
                  state=77
               else
                  return No_Sym
               end


            when 77
               return C_MMSlashDDSlashYYYYSym
            when 78
               return C_EqualSym
            when 79
               return C_SemicolonSym
            when 80
               if @ch=='|'
                  state=81
               else
                  if @ch=='='
                     state=108
                  else
                     return C_BarSym
                  end

               end


            when 81
               return C_BarBarSym
            when 82
               if @ch=='&'
                  state=83
               else
                  if @ch=='='
                     state=106
                  else
                     return C_AndSym
                  end

               end


            when 83
               return C_AndAndSym
            when 84
               if @ch=='='
                  state=107
               else
                  return C_UparrowSym
               end


            when 85
               if @ch=='>'
                  state=86
               else
                  if @ch=='='
                     state=88
                  else
                     if @ch=='<'
                        state=90
                     else
                        return C_LessSym
                     end

                  end

               end


            when 86
               return C_LessGreaterSym
            when 87
               if @ch=='='
                  state=89
               else
                  if @ch=='>'
                     state=91
                  else
                     return C_GreaterSym
                  end

               end


            when 88
               return C_LessEqualSym
            when 89
               return C_GreaterEqualSym
            when 90
               if @ch=='='
                  state=109
               else
                  return C_LessLessSym
               end


            when 91
               if @ch=='='
                  state=110
               else
                  return C_GreaterGreaterSym
               end


            when 92
               if @ch=='+'
                  state=95
               else
                  if @ch=='='
                     state=104
                  else
                     return C_PlusSym
                  end

               end


            when 93
               if @ch=='-'
                  state=96
               else
                  if @ch=='>'
                     state=99
                  else
                     if @ch=='='
                        state=105
                     else
                        return C_MinusSym
                     end

                  end

               end


            when 94
               if @ch=='='
                  state=103
               else
                  return C_PercentSym
               end


            when 95
               return C_PlusPlusSym
            when 96
               return C_MinusMinusSym
            when 97
               return C_LbrackSym
            when 98
               return C_RbrackSym
            when 99
               return C_MinusGreaterSym
            when 100
               return C_CommaSym
            when 101
               return C_StarEqualSym
            when 102
               return C_SlashEqualSym
            when 103
               return C_PercentEqualSym
            when 104
               return C_PlusEqualSym
            when 105
               return C_MinusEqualSym
            when 106
               return C_AndEqualSym
            when 107
               return C_UparrowEqualSym
            when 108
               return C_BarEqualSym
            when 109
               return C_LessLessEqualSym
            when 110
               return C_GreaterGreaterEqualSym
            when 111
               return C_BangSym
            when 112
               return C_TildeSym
            when 113
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='D'
                     state=115
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 114
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='M'
                     state=116
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 115
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='/'
                     state=117
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 116
               if @ch=='-'||@ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=1
               else
                  if @ch=='/'
                     state=118
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 117
               if @ch=='M'
                  state=119
               else
                  return No_Sym
               end


            when 118
               if @ch=='D'
                  state=120
               else
                  return No_Sym
               end


            when 119
               if @ch=='M'
                  state=121
               else
                  return No_Sym
               end


            when 120
               if @ch=='D'
                  state=122
               else
                  return No_Sym
               end


            when 121
               if @ch=='/'
                  state=123
               else
                  return No_Sym
               end


            when 122
               if @ch=='/'
                  state=124
               else
                  return No_Sym
               end


            when 123
               if @ch=='Y'
                  state=125
               else
                  return No_Sym
               end


            when 124
               if @ch=='Y'
                  state=126
               else
                  return No_Sym
               end


            when 125
               if @ch=='Y'
                  state=127
               else
                  return No_Sym
               end


            when 126
               if @ch=='Y'
                  state=128
               else
                  return No_Sym
               end


            when 127
               if @ch=='Y'
                  state=66
               else
                  return C_DDSlashMMSlashYYSym
               end


            when 128
               if @ch=='Y'
                  state=76
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

   @sTATE0 = []









   @szName = []

end
