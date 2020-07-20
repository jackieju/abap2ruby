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
         if EqualStr("ACTIVATION")
            return C_ACTIVATIONSym
         end

         if EqualStr("AS")
            return C_ASSym
         end

         if EqualStr("ASCENDING")
            return C_ASCENDINGSym
         end

         if EqualStr("APPENDING")
            return C_APPENDINGSym
         end

         if EqualStr("APPEND")
            return C_APPENDSym
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

         if EqualStr("ALIAS")
            return C_ALIASSym
         end

         if EqualStr("ADJACENT")
            return C_ADJACENTSym
         end

         if EqualStr("ACTUAL")
            return C_ACTUALSym
         end

         if EqualStr("ARCHIVE")
            return C_ARCHIVESym
         end

         if EqualStr("ASSOCIATION")
            return C_ASSOCIATIONSym
         end

         if EqualStr("ABSTRACT")
            return C_ABSTRACTSym
         end

         if EqualStr("ANY")
            return C_ANYSym
         end

         if EqualStr("ADD")
            return C_ADDSym
         end

         if EqualStr("ACCORDING")
            return C_ACCORDINGSym
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

         if EqualStr("AREA")
            return C_AREASym
         end

         if EqualStr("ATTRIBUTES")
            return C_ATTRIBUTESSym
         end

         if EqualStr("ACCEPTING")
            return C_ACCEPTINGSym
         end

         if EqualStr("ARITHMETIC")
            return C_ARITHMETICSym
         end

         if EqualStr("ANALYZER")
            return C_ANALYZERSym
         end

         if EqualStr("ASYNCHRONOUS")
            return C_ASYNCHRONOUSSym
         end

         if EqualStr("ASSIGNED")
            return C_ASSIGNEDSym
         end

         if EqualStr("ALL")
            return C_ALLSym
         end

         if EqualStr("ASSIGNING")
            return C_ASSIGNINGSym
         end

         if EqualStr("AUTHORITY-CHECK")
            return C_AUTHORITYMinusCHECKSym
         end

         if EqualStr("ADD-CORRESPONDING")
            return C_ADDMinusCORRESPONDINGSym
         end


      when 'B'
         if EqualStr("BOXED")
            return C_BOXEDSym
         end

         if EqualStr("BY")
            return C_BYSym
         end

         if EqualStr("BLOB")
            return C_BLOBSym
         end

         if EqualStr("BYPASSING")
            return C_BYPASSINGSym
         end

         if EqualStr("BUFFER")
            return C_BUFFERSym
         end

         if EqualStr("BYTE")
            return C_BYTESym
         end

         if EqualStr("BLANKS")
            return C_BLANKSSym
         end

         if EqualStr("BEGIN")
            return C_BEGINSym
         end

         if EqualStr("BETWEEN")
            return C_BETWEENSym
         end

         if EqualStr("BIG")
            return C_BIGSym
         end

         if EqualStr("BOUNDS")
            return C_BOUNDSSym
         end

         if EqualStr("BEFORE")
            return C_BEFORESym
         end

         if EqualStr("BASE")
            return C_BASESym
         end

         if EqualStr("BACKGROUND")
            return C_BACKGROUNDSym
         end

         if EqualStr("BACK")
            return C_BACKSym
         end

         if EqualStr("BADI")
            return C_BADISym
         end

         if EqualStr("BACKUP")
            return C_BACKUPSym
         end

         if EqualStr("BIT")
            return C_BITSym
         end

         if EqualStr("BOUNDARIES")
            return C_BOUNDARIESSym
         end

         if EqualStr("BACKWARD")
            return C_BACKWARDSym
         end

         if EqualStr("BLANK")
            return C_BLANKSym
         end

         if EqualStr("BOUND")
            return C_BOUNDSym
         end

         if EqualStr("BINARY")
            return C_BINARYSym
         end

         if EqualStr("BYTE-ORDER")
            return C_BYTEMinusORDERSym
         end

         if EqualStr("BREAK-POINT")
            return C_BREAKMinusPOINTSym
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
         if EqualStr("CREATE")
            return C_CREATESym
         end

         if EqualStr("COMPONENTS")
            return C_COMPONENTSSym
         end

         if EqualStr("CLIENT")
            return C_CLIENTSym
         end

         if EqualStr("CROSS")
            return C_CROSSSym
         end

         if EqualStr("CORRESPONDING")
            return C_CORRESPONDINGSym
         end

         if EqualStr("CREATING")
            return C_CREATINGSym
         end

         if EqualStr("COLUMNS")
            return C_COLUMNSSym
         end

         if EqualStr("CLOB")
            return C_CLOBSym
         end

         if EqualStr("CONNECTION")
            return C_CONNECTIONSym
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

         if EqualStr("CONSTANTS")
            return C_CONSTANTSSym
         end

         if EqualStr("COMMON")
            return C_COMMONSym
         end

         if EqualStr("CENTERED")
            return C_CENTEREDSym
         end

         if EqualStr("CURRENCY")
            return C_CURRENCYSym
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

         if EqualStr("COMPARING")
            return C_COMPARINGSym
         end

         if EqualStr("CURRENT")
            return C_CURRENTSym
         end

         if EqualStr("CHANGE")
            return C_CHANGESym
         end

         if EqualStr("CURSOR")
            return C_CURSORSym
         end

         if EqualStr("CODE")
            return C_CODESym
         end

         if EqualStr("CONVERSION")
            return C_CONVERSIONSym
         end

         if EqualStr("CP")
            return C_CPSym
         end

         if EqualStr("CATCH")
            return C_CATCHSym
         end

         if EqualStr("CLEANUP")
            return C_CLEANUPSym
         end

         if EqualStr("CALLING")
            return C_CALLINGSym
         end

         if EqualStr("CLASS")
            return C_CLASSSym
         end

         if EqualStr("CRITICAL")
            return C_CRITICALSym
         end

         if EqualStr("CONDITION")
            return C_CONDITIONSym
         end

         if EqualStr("COMPONENT")
            return C_COMPONENTSym
         end

         if EqualStr("CALL")
            return C_CALLSym
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

         if EqualStr("CONTEXT")
            return C_CONTEXTSym
         end

         if EqualStr("COMPRESSION")
            return C_COMPRESSIONSym
         end

         if EqualStr("COUNT")
            return C_COUNTSym
         end

         if EqualStr("COLOR")
            return C_COLORSym
         end

         if EqualStr("COL_BACKGROUND")
            return C_COLUnderscoreBACKGROUNDSym
         end

         if EqualStr("COL_HEADING")
            return C_COLUnderscoreHEADINGSym
         end

         if EqualStr("COL_NORMAL")
            return C_COLUnderscoreNORMALSym
         end

         if EqualStr("COL_TOTAL")
            return C_COLUnderscoreTOTALSym
         end

         if EqualStr("COL_KEY")
            return C_COLUnderscoreKEYSym
         end

         if EqualStr("COL_POSITIVE")
            return C_COLUnderscorePOSITIVESym
         end

         if EqualStr("COL_NEGATIVE")
            return C_COLUnderscoreNEGATIVESym
         end

         if EqualStr("COL_GROUP")
            return C_COLUnderscoreGROUPSym
         end

         if EqualStr("COUNTRY")
            return C_COUNTRYSym
         end

         if EqualStr("CONTROL")
            return C_CONTROLSym
         end

         if EqualStr("COLUMN")
            return C_COLUMNSym
         end

         if EqualStr("CLOCK")
            return C_CLOCKSym
         end

         if EqualStr("CIRCULAR")
            return C_CIRCULARSym
         end

         if EqualStr("CHANNELS")
            return C_CHANNELSSym
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

         if EqualStr("CHECK")
            return C_CHECKSym
         end

         if EqualStr("CLASS-DATA")
            return C_CLASSMinusDATASym
         end

         if EqualStr("CHANGING")
            return C_CHANGINGSym
         end

         if EqualStr("CLASS-METHODS")
            return C_CLASSMinusMETHODSSym
         end

         if EqualStr("CUSTOMER-FUNCTION")
            return C_CUSTOMERMinusFUNCTIONSym
         end

         if EqualStr("CLASS-EVENTS")
            return C_CLASSMinusEVENTSSym
         end

         if EqualStr("CLASS-POOL")
            return C_CLASSMinusPOOLSym
         end

         if EqualStr("CHAR-TO-HEX")
            return C_CHARMinusTOMinusHEXSym
         end


      when 'D'
         if EqualStr("DATA")
            return C_DATASym
         end

         if EqualStr("DEFAULT")
            return C_DEFAULTSym
         end

         if EqualStr("DECIMALS")
            return C_DECIMALSSym
         end

         if EqualStr("DELETE")
            return C_DELETESym
         end

         if EqualStr("DEFINING")
            return C_DEFININGSym
         end

         if EqualStr("DATABASE")
            return C_DATABASESym
         end

         if EqualStr("DISTINCT")
            return C_DISTINCTSym
         end

         if EqualStr("DESCENDING")
            return C_DESCENDINGSym
         end

         if EqualStr("DISPLAY")
            return C_DISPLAYSym
         end

         if EqualStr("DDMMYY")
            return C_DDMMYYSym
         end

         if EqualStr("DUMMY")
            return C_DUMMYSym
         end

         if EqualStr("DATASET")
            return C_DATASETSym
         end

         if EqualStr("DUPLICATES")
            return C_DUPLICATESSym
         end

         if EqualStr("DO")
            return C_DOSym
         end

         if EqualStr("DYNPRO")
            return C_DYNPROSym
         end

         if EqualStr("DESTINATION")
            return C_DESTINATIONSym
         end

         if EqualStr("DEFINITION")
            return C_DEFINITIONSym
         end

         if EqualStr("DEFERRED")
            return C_DEFERREDSym
         end

         if EqualStr("DANGEROUS")
            return C_DANGEROUSSym
         end

         if EqualStr("DURATION")
            return C_DURATIONSym
         end

         if EqualStr("DIALOG")
            return C_DIALOGSym
         end

         if EqualStr("DAYLIGHT")
            return C_DAYLIGHTSym
         end

         if EqualStr("DEMAND")
            return C_DEMANDSym
         end

         if EqualStr("DESCRIBE")
            return C_DESCRIBESym
         end

         if EqualStr("DISTANCE")
            return C_DISTANCESym
         end

         if EqualStr("DETAIL")
            return C_DETAILSym
         end

         if EqualStr("DIVIDE")
            return C_DIVIDESym
         end

         if EqualStr("DIRECTORY")
            return C_DIRECTORYSym
         end

         if EqualStr("DUPLICATE")
            return C_DUPLICATESym
         end

         if EqualStr("DELETING")
            return C_DELETINGSym
         end

         if EqualStr("DURING")
            return C_DURINGSym
         end

         if EqualStr("DIV")
            return C_DIVSym
         end

         if EqualStr("DD/MM/YY")
            return C_DDSlashMMSlashYYSym
         end

         if EqualStr("DD/MM/YYYY")
            return C_DDSlashMMSlashYYYYSym
         end

         if EqualStr("DIVIDE-CORRESPONDING")
            return C_DIVIDEMinusCORRESPONDINGSym
         end

         if EqualStr("DISPLAY-MODE")
            return C_DISPLAYMinusMODESym
         end


      when 'E'
         if EqualStr("END")
            return C_ENDSym
         end

         if EqualStr("EXCEPTIONS")
            return C_EXCEPTIONSSym
         end

         if EqualStr("EOF")
            return C_EOFSym
         end

         if EqualStr("ENDFUNCTION")
            return C_ENDFUNCTIONSym
         end

         if EqualStr("ENDSELECT")
            return C_ENDSELECTSym
         end

         if EqualStr("ENTRIES")
            return C_ENTRIESSym
         end

         if EqualStr("EXTENDED")
            return C_EXTENDEDSym
         end

         if EqualStr("ENDWITH")
            return C_ENDWITHSym
         end

         if EqualStr("EXACT")
            return C_EXACTSym
         end

         if EqualStr("EXPANDING")
            return C_EXPANDINGSym
         end

         if EqualStr("ENDING")
            return C_ENDINGSym
         end

         if EqualStr("EVENT")
            return C_EVENTSym
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

         if EqualStr("EXPONENT")
            return C_EXPONENTSym
         end

         if EqualStr("ENVIRONMENT")
            return C_ENVIRONMENTSym
         end

         if EqualStr("ENDCASE")
            return C_ENDCASESym
         end

         if EqualStr("ENDDO")
            return C_ENDDOSym
         end

         if EqualStr("EVENTS")
            return C_EVENTSSym
         end

         if EqualStr("ENDON")
            return C_ENDONSym
         end

         if EqualStr("ENCODING")
            return C_ENCODINGSym
         end

         if EqualStr("ENDIAN")
            return C_ENDIANSym
         end

         if EqualStr("ERRORS")
            return C_ERRORSSym
         end

         if EqualStr("ENDPROVIDE")
            return C_ENDPROVIDESym
         end

         if EqualStr("EQ")
            return C_EQSym
         end

         if EqualStr("ENDTRY")
            return C_ENDTRYSym
         end

         if EqualStr("ENUM")
            return C_ENUMSym
         end

         if EqualStr("ENDWHILE")
            return C_ENDWHILESym
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

         if EqualStr("ENABLED")
            return C_ENABLEDSym
         end

         if EqualStr("ENDCLASS")
            return C_ENDCLASSSym
         end

         if EqualStr("ENDMETHOD")
            return C_ENDMETHODSym
         end

         if EqualStr("ENDAT")
            return C_ENDATSym
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

         if EqualStr("EXCLUDING")
            return C_EXCLUDINGSym
         end

         if EqualStr("ENTRY")
            return C_ENTRYSym
         end

         if EqualStr("ENABLING")
            return C_ENABLINGSym
         end

         if EqualStr("ENDINTERFACE")
            return C_ENDINTERFACESym
         end

         if EqualStr("ENDMODULE")
            return C_ENDMODULESym
         end

         if EqualStr("EQUIV")
            return C_EQUIVSym
         end

         if EqualStr("EDIT")
            return C_EDITSym
         end

         if EqualStr("EXPORTING")
            return C_EXPORTINGSym
         end

         if EqualStr("EXCEPTION-TABLE")
            return C_EXCEPTIONMinusTABLESym
         end

         if EqualStr("END-LINES")
            return C_ENDMinusLINESSym
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

         if EqualStr("END-TEST-INJECTION")
            return C_ENDMinusTESTMinusINJECTIONSym
         end

         if EqualStr("END-TEST-SEAM")
            return C_ENDMinusTESTMinusSEAMSym
         end


      when 'F'
         if EqualStr("FUNCTIONALITY")
            return C_FUNCTIONALITYSym
         end

         if EqualStr("FUNCTION")
            return C_FUNCTIONSym
         end

         if EqualStr("FIELDS")
            return C_FIELDSSym
         end

         if EqualStr("FROM")
            return C_FROMSym
         end

         if EqualStr("FOR")
            return C_FORSym
         end

         if EqualStr("FORMAT")
            return C_FORMATSym
         end

         if EqualStr("FIELD")
            return C_FIELDSym
         end

         if EqualStr("FILTER")
            return C_FILTERSym
         end

         if EqualStr("FETCH")
            return C_FETCHSym
         end

         if EqualStr("FREE")
            return C_FREESym
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

         if EqualStr("FIRST")
            return C_FIRSTSym
         end

         if EqualStr("FLUSH")
            return C_FLUSHSym
         end

         if EqualStr("FIND")
            return C_FINDSym
         end

         if EqualStr("FRAMES")
            return C_FRAMESSym
         end

         if EqualStr("FILTERS")
            return C_FILTERSSym
         end

         if EqualStr("FOUND")
            return C_FOUNDSym
         end

         if EqualStr("FORWARD")
            return C_FORWARDSym
         end

         if EqualStr("FILE")
            return C_FILESym
         end

         if EqualStr("FIRST-LINE")
            return C_FIRSTMinusLINESym
         end

         if EqualStr("FIELD-GROUPS")
            return C_FIELDMinusGROUPSSym
         end

         if EqualStr("FIELD-SYMBOLS")
            return C_FIELDMinusSYMBOLSSym
         end

         if EqualStr("FUNCTION-POOL")
            return C_FUNCTIONMinusPOOLSym
         end

         if EqualStr("FILTER-TABLE")
            return C_FILTERMinusTABLESym
         end

         if EqualStr("FIXED-POINT")
            return C_FIXEDMinusPOINTSym
         end


      when 'G'
         if EqualStr("GROUP")
            return C_GROUPSym
         end

         if EqualStr("GAPS")
            return C_GAPSSym
         end

         if EqualStr("GE")
            return C_GESym
         end

         if EqualStr("GT")
            return C_GTSym
         end

         if EqualStr("GLOBAL")
            return C_GLOBALSym
         end

         if EqualStr("GIVING")
            return C_GIVINGSym
         end

         if EqualStr("GENERATE")
            return C_GENERATESym
         end

         if EqualStr("GET")
            return C_GETSym
         end


      when 'H'
         if EqualStr("HEADING")
            return C_HEADINGSym
         end

         if EqualStr("HAVING")
            return C_HAVINGSym
         end

         if EqualStr("HANDLE")
            return C_HANDLESym
         end

         if EqualStr("HEADER")
            return C_HEADERSym
         end

         if EqualStr("HOLD")
            return C_HOLDSym
         end

         if EqualStr("HARMLESS")
            return C_HARMLESSSym
         end

         if EqualStr("HOTSPOT")
            return C_HOTSPOTSym
         end

         if EqualStr("HIDE")
            return C_HIDESym
         end

         if EqualStr("HIGH")
            return C_HIGHSym
         end

         if EqualStr("HANDLER")
            return C_HANDLERSym
         end

         if EqualStr("HASHED")
            return C_HASHEDSym
         end

         if EqualStr("HELP-ID")
            return C_HELPMinusIDSym
         end

         if EqualStr("HEAD-LINES")
            return C_HEADMinusLINESSym
         end

         if EqualStr("HELP-REQUEST")
            return C_HELPMinusREQUESTSym
         end


      when 'I'
         if EqualStr("ID")
            return C_IDSym
         end

         if EqualStr("INNER")
            return C_INNERSym
         end

         if EqualStr("IN")
            return C_INSym
         end

         if EqualStr("INDEX")
            return C_INDEXSym
         end

         if EqualStr("IS")
            return C_ISSym
         end

         if EqualStr("ICON")
            return C_ICONSym
         end

         if EqualStr("INPUT")
            return C_INPUTSym
         end

         if EqualStr("IGNORING")
            return C_IGNORINGSym
         end

         if EqualStr("INCLUDING")
            return C_INCLUDINGSym
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

         if EqualStr("INCREMENT")
            return C_INCREMENTSym
         end

         if EqualStr("INTERNAL")
            return C_INTERNALSym
         end

         if EqualStr("INTENSIFIED")
            return C_INTENSIFIEDSym
         end

         if EqualStr("INVERSE")
            return C_INVERSESym
         end

         if EqualStr("INCLUDE")
            return C_INCLUDESym
         end

         if EqualStr("IMPORT")
            return C_IMPORTSym
         end

         if EqualStr("INFOTYPES")
            return C_INFOTYPESSym
         end

         if EqualStr("INITIALIZATION")
            return C_INITIALIZATIONSym
         end

         if EqualStr("INSERT")
            return C_INSERTSym
         end

         if EqualStr("INTERFACE")
            return C_INTERFACESym
         end

         if EqualStr("INTERFACES")
            return C_INTERFACESSym
         end

         if EqualStr("IMPLEMENTED")
            return C_IMPLEMENTEDSym
         end

         if EqualStr("INTERVALS")
            return C_INTERVALSSym
         end

         if EqualStr("INSTANCES")
            return C_INSTANCESSym
         end

         if EqualStr("IMMEDIATELY")
            return C_IMMEDIATELYSym
         end

         if EqualStr("INSTANCE")
            return C_INSTANCESym
         end

         if EqualStr("INITIAL")
            return C_INITIALSym
         end

         if EqualStr("IMPORTING")
            return C_IMPORTINGSym
         end

         if EqualStr("INTO")
            return C_INTOSym
         end

         if EqualStr("INTERFACE-POOL")
            return C_INTERFACEMinusPOOLSym
         end

         if EqualStr("INDEX-LINE")
            return C_INDEXMinusLINESym
         end


      when 'J'
         if EqualStr("JOIN")
            return C_JOINSym
         end

         if EqualStr("JOB")
            return C_JOBSym
         end


      when 'K'
         if EqualStr("KEY")
            return C_KEYSym
         end

         if EqualStr("KIND")
            return C_KINDSym
         end

         if EqualStr("KEEPING")
            return C_KEEPINGSym
         end

         if EqualStr("KEYS")
            return C_KEYSSym
         end


      when 'L'
         if EqualStr("LENGTH")
            return C_LENGTHSym
         end

         if EqualStr("LEFT")
            return C_LEFTSym
         end

         if EqualStr("LOCATOR")
            return C_LOCATORSym
         end

         if EqualStr("LINE")
            return C_LINESym
         end

         if EqualStr("LIKE")
            return C_LIKESym
         end

         if EqualStr("LOOP")
            return C_LOOPSym
         end

         if EqualStr("LOB")
            return C_LOBSym
         end

         if EqualStr("LINEFEED")
            return C_LINEFEEDSym
         end

         if EqualStr("LEGACY")
            return C_LEGACYSym
         end

         if EqualStr("LITTLE")
            return C_LITTLESym
         end

         if EqualStr("LANGUAGE")
            return C_LANGUAGESym
         end

         if EqualStr("LT")
            return C_LTSym
         end

         if EqualStr("LE")
            return C_LESym
         end

         if EqualStr("LIST")
            return C_LISTSym
         end

         if EqualStr("LEVEL")
            return C_LEVELSym
         end

         if EqualStr("LONG")
            return C_LONGSym
         end

         if EqualStr("LOAD")
            return C_LOADSym
         end

         if EqualStr("LAST")
            return C_LASTSym
         end

         if EqualStr("LOCALE")
            return C_LOCALESym
         end

         if EqualStr("LEAVE")
            return C_LEAVESym
         end

         if EqualStr("LOCAL")
            return C_LOCALSym
         end

         if EqualStr("LISTBOX")
            return C_LISTBOXSym
         end

         if EqualStr("LOWER")
            return C_LOWERSym
         end

         if EqualStr("LOW")
            return C_LOWSym
         end

         if EqualStr("LEADING")
            return C_LEADINGSym
         end

         if EqualStr("LINES")
            return C_LINESSym
         end

         if EqualStr("LINE-SIZE")
            return C_LINEMinusSIZESym
         end

         if EqualStr("LINE-COUNT")
            return C_LINEMinusCOUNTSym
         end

         if EqualStr("LEFT-JUSTIFIED")
            return C_LEFTMinusJUSTIFIEDSym
         end

         if EqualStr("LIST-PROCESSING")
            return C_LISTMinusPROCESSINGSym
         end

         if EqualStr("LOAD-OF-PROGRAM")
            return C_LOADMinusOFMinusPROGRAMSym
         end

         if EqualStr("LOG-POINT")
            return C_LOGMinusPOINTSym
         end

         if EqualStr("LINE-SELECTION")
            return C_LINEMinusSELECTIONSym
         end


      when 'M'
         if EqualStr("MESSAGE")
            return C_MESSAGESym
         end

         if EqualStr("MOVE")
            return C_MOVESym
         end

         if EqualStr("MODE")
            return C_MODESym
         end

         if EqualStr("MARK")
            return C_MARKSym
         end

         if EqualStr("MEMBERS")
            return C_MEMBERSSym
         end

         if EqualStr("MASK")
            return C_MASKSym
         end

         if EqualStr("MMDDYY")
            return C_MMDDYYSym
         end

         if EqualStr("MEMORY")
            return C_MEMORYSym
         end

         if EqualStr("MODIFY")
            return C_MODIFYSym
         end

         if EqualStr("MAXIMUM")
            return C_MAXIMUMSym
         end

         if EqualStr("MESH")
            return C_MESHSym
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

         if EqualStr("MESSAGES")
            return C_MESSAGESSym
         end

         if EqualStr("MATCH")
            return C_MATCHSym
         end

         if EqualStr("MODIFIER")
            return C_MODIFIERSym
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

         if EqualStr("MODIF")
            return C_MODIFSym
         end

         if EqualStr("MATCHCODE")
            return C_MATCHCODESym
         end

         if EqualStr("MARGIN")
            return C_MARGINSym
         end

         if EqualStr("MESSAGING")
            return C_MESSAGINGSym
         end

         if EqualStr("MOD")
            return C_MODSym
         end

         if EqualStr("MESSAGE-ID")
            return C_MESSAGEMinusIDSym
         end

         if EqualStr("MOVE-CORRESPONDING")
            return C_MOVEMinusCORRESPONDINGSym
         end

         if EqualStr("MM/DD/YY")
            return C_MMSlashDDSlashYYSym
         end

         if EqualStr("MM/DD/YYYY")
            return C_MMSlashDDSlashYYYYSym
         end

         if EqualStr("MAJOR-ID")
            return C_MAJORMinusIDSym
         end

         if EqualStr("MINOR-ID")
            return C_MINORMinusIDSym
         end

         if EqualStr("MULTIPLY-CORRESPONDING")
            return C_MULTIPLYMinusCORRESPONDINGSym
         end


      when 'N'
         if EqualStr("NO")
            return C_NOSym
         end

         if EqualStr("NESTED")
            return C_NESTEDSym
         end

         if EqualStr("NUMBER")
            return C_NUMBERSym
         end

         if EqualStr("NEXT")
            return C_NEXTSym
         end

         if EqualStr("NATIVE")
            return C_NATIVESym
         end

         if EqualStr("NE")
            return C_NESym
         end

         if EqualStr("NP")
            return C_NPSym
         end

         if EqualStr("NOT")
            return C_NOTSym
         end

         if EqualStr("NEW")
            return C_NEWSym
         end

         if EqualStr("NULL")
            return C_NULLSym
         end

         if EqualStr("NODES")
            return C_NODESSym
         end

         if EqualStr("NA")
            return C_NASym
         end

         if EqualStr("NS")
            return C_NSSym
         end

         if EqualStr("NODE")
            return C_NODESym
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

         if EqualStr("NON-UNICODE")
            return C_NONMinusUNICODESym
         end

         if EqualStr("NO-GAPS")
            return C_NOMinusGAPSSym
         end

         if EqualStr("NEW-LINE")
            return C_NEWMinusLINESym
         end

         if EqualStr("NO-SCROLLING")
            return C_NOMinusSCROLLINGSym
         end

         if EqualStr("NEW-PAGE")
            return C_NEWMinusPAGESym
         end

         if EqualStr("NO-TITLE")
            return C_NOMinusTITLESym
         end

         if EqualStr("NO-HEADING")
            return C_NOMinusHEADINGSym
         end

         if EqualStr("NO-TOPOFPAGE")
            return C_NOMinusTOPOFPAGESym
         end

         if EqualStr("NEW-SECTION")
            return C_NEWMinusSECTIONSym
         end

         if EqualStr("NO-DISPLAY")
            return C_NOMinusDISPLAYSym
         end

         if EqualStr("NO-EXTENSION")
            return C_NOMinusEXTENSIONSym
         end


      when 'O'
         if EqualStr("OF")
            return C_OFSym
         end

         if EqualStr("OUTER")
            return C_OUTERSym
         end

         if EqualStr("ON")
            return C_ONSym
         end

         if EqualStr("ORDER")
            return C_ORDERSym
         end

         if EqualStr("OFFSET")
            return C_OFFSETSym
         end

         if EqualStr("OCCURS")
            return C_OCCURSSym
         end

         if EqualStr("OR")
            return C_ORSym
         end

         if EqualStr("OTHERS")
            return C_OTHERSSym
         end

         if EqualStr("OBJECT")
            return C_OBJECTSym
         end

         if EqualStr("OPTIONAL")
            return C_OPTIONALSym
         end

         if EqualStr("OPEN")
            return C_OPENSym
         end

         if EqualStr("OUTPUT")
            return C_OUTPUTSym
         end

         if EqualStr("OPTIONS")
            return C_OPTIONSSym
         end

         if EqualStr("OBJECTS")
            return C_OBJECTSSym
         end

         if EqualStr("OFF")
            return C_OFFSym
         end

         if EqualStr("OCCURRENCE")
            return C_OCCURRENCESym
         end

         if EqualStr("OCCURRENCES")
            return C_OCCURRENCESSym
         end

         if EqualStr("OVERLAY")
            return C_OVERLAYSym
         end

         if EqualStr("ONLY")
            return C_ONLYSym
         end

         if EqualStr("OBLIGATORY")
            return C_OBLIGATORYSym
         end

         if EqualStr("OPTION")
            return C_OPTIONSym
         end

         if EqualStr("OTHER")
            return C_OTHERSym
         end

         if EqualStr("OUTPUT-LENGTH")
            return C_OUTPUTMinusLENGTHSym
         end


      when 'P'
         if EqualStr("PARAMETER")
            return C_PARAMETERSym
         end

         if EqualStr("PARAMETERS")
            return C_PARAMETERSSym
         end

         if EqualStr("PAGE")
            return C_PAGESym
         end

         if EqualStr("PRIMARY")
            return C_PRIMARYSym
         end

         if EqualStr("PACKAGE")
            return C_PACKAGESym
         end

         if EqualStr("PERCENTAGE")
            return C_PERCENTAGESym
         end

         if EqualStr("PRIMARY_KEY")
            return C_PRIMARYUnderscoreKEYSym
         end

         if EqualStr("PART")
            return C_PARTSym
         end

         if EqualStr("POSITION")
            return C_POSITIONSym
         end

         if EqualStr("PROVIDE")
            return C_PROVIDESym
         end

         if EqualStr("PROGRAM")
            return C_PROGRAMSym
         end

         if EqualStr("PERFORMING")
            return C_PERFORMINGSym
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

         if EqualStr("PROCEDURE")
            return C_PROCEDURESym
         end

         if EqualStr("PAGES")
            return C_PAGESSym
         end

         if EqualStr("POOL")
            return C_POOLSym
         end

         if EqualStr("PROPERTY")
            return C_PROPERTYSym
         end

         if EqualStr("PADDING")
            return C_PADDINGSym
         end

         if EqualStr("PERSON")
            return C_PERSONSym
         end

         if EqualStr("PARTIALLY")
            return C_PARTIALLYSym
         end

         if EqualStr("PRINT")
            return C_PRINTSym
         end

         if EqualStr("PACK")
            return C_PACKSym
         end

         if EqualStr("PATTERN")
            return C_PATTERNSym
         end

         if EqualStr("PERFORM")
            return C_PERFORMSym
         end

         if EqualStr("PLACES")
            return C_PLACESSym
         end

         if EqualStr("PUSH")
            return C_PUSHSym
         end

         if EqualStr("PARAMETER-TABLE")
            return C_PARAMETERMinusTABLESym
         end

         if EqualStr("PF-STATUS")
            return C_PFMinusSTATUSSym
         end

         if EqualStr("PRINT-CONTROL")
            return C_PRINTMinusCONTROLSym
         end


      when 'Q'
         if EqualStr("QUICKINFO")
            return C_QUICKINFOSym
         end

         if EqualStr("QUEUE-ONLY")
            return C_QUEUEMinusONLYSym
         end


      when 'R'
         if EqualStr("REPORT")
            return C_REPORTSym
         end

         if EqualStr("REDUCED")
            return C_REDUCEDSym
         end

         if EqualStr("RIGHT")
            return C_RIGHTSym
         end

         if EqualStr("RESULT")
            return C_RESULTSym
         end

         if EqualStr("READER")
            return C_READERSym
         end

         if EqualStr("ROWS")
            return C_ROWSSym
         end

         if EqualStr("RESPECTING")
            return C_RESPECTINGSym
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

         if EqualStr("ROUND")
            return C_ROUNDSym
         end

         if EqualStr("REPLACEMENT")
            return C_REPLACEMENTSym
         end

         if EqualStr("READ")
            return C_READSym
         end

         if EqualStr("RETURN")
            return C_RETURNSym
         end

         if EqualStr("RISK")
            return C_RISKSym
         end

         if EqualStr("REDEFINITION")
            return C_REDEFINITIONSym
         end

         if EqualStr("REGEX")
            return C_REGEXSym
         end

         if EqualStr("RESULTS")
            return C_RESULTSSym
         end

         if EqualStr("RESET")
            return C_RESETSym
         end

         if EqualStr("RUN")
            return C_RUNSym
         end

         if EqualStr("RENAMING")
            return C_RENAMINGSym
         end

         if EqualStr("RADIOBUTTON")
            return C_RADIOBUTTONSym
         end

         if EqualStr("ROLLBACK")
            return C_ROLLBACKSym
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

         if EqualStr("RESOLUTION")
            return C_RESOLUTIONSym
         end

         if EqualStr("REQUESTED")
            return C_REQUESTEDSym
         end

         if EqualStr("REF")
            return C_REFSym
         end

         if EqualStr("REFERENCE")
            return C_REFERENCESym
         end

         if EqualStr("RANGE")
            return C_RANGESym
         end

         if EqualStr("RETURNING")
            return C_RETURNINGSym
         end

         if EqualStr("READ-ONLY")
            return C_READMinusONLYSym
         end

         if EqualStr("RIGHT-JUSTIFIED")
            return C_RIGHTMinusJUSTIFIEDSym
         end

         if EqualStr("RECEIVING")
            return C_RECEIVINGSym
         end


      when 'S'
         if EqualStr("SUFFIX")
            return C_SUFFIXSym
         end

         if EqualStr("SPECIFIED")
            return C_SPECIFIEDSym
         end

         if EqualStr("SIZE")
            return C_SIZESym
         end

         if EqualStr("SELECT")
            return C_SELECTSym
         end

         if EqualStr("SINGLE")
            return C_SINGLESym
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

         if EqualStr("STATICS")
            return C_STATICSSym
         end

         if EqualStr("STYLE")
            return C_STYLESym
         end

         if EqualStr("SYMBOL")
            return C_SYMBOLSym
         end

         if EqualStr("SHARED")
            return C_SHAREDSym
         end

         if EqualStr("SKIPPING")
            return C_SKIPPINGSym
         end

         if EqualStr("SMART")
            return C_SMARTSym
         end

         if EqualStr("SORT")
            return C_SORTSym
         end

         if EqualStr("SUBMIT")
            return C_SUBMITSym
         end

         if EqualStr("SELECTIONS")
            return C_SELECTIONSSym
         end

         if EqualStr("SPOOL")
            return C_SPOOLSym
         end

         if EqualStr("STRUCTURE")
            return C_STRUCTURESym
         end

         if EqualStr("SET")
            return C_SETSym
         end

         if EqualStr("SEPARATE")
            return C_SEPARATESym
         end

         if EqualStr("SHORT")
            return C_SHORTSym
         end

         if EqualStr("SECTION")
            return C_SECTIONSym
         end

         if EqualStr("SUBKEY")
            return C_SUBKEYSym
         end

         if EqualStr("SKIP")
            return C_SKIPSym
         end

         if EqualStr("SOURCE")
            return C_SOURCESym
         end

         if EqualStr("SORTABLE")
            return C_SORTABLESym
         end

         if EqualStr("STAMP")
            return C_STAMPSym
         end

         if EqualStr("SAVING")
            return C_SAVINGSym
         end

         if EqualStr("SQL")
            return C_SQLSym
         end

         if EqualStr("SUBSTRING")
            return C_SUBSTRINGSym
         end

         if EqualStr("SUBMATCHES")
            return C_SUBMATCHESSym
         end

         if EqualStr("SUBROUTINE")
            return C_SUBROUTINESym
         end

         if EqualStr("SCROLLING")
            return C_SCROLLINGSym
         end

         if EqualStr("SCROLL")
            return C_SCROLLSym
         end

         if EqualStr("SELECTION")
            return C_SELECTIONSym
         end

         if EqualStr("SHIFT")
            return C_SHIFTSym
         end

         if EqualStr("STOP")
            return C_STOPSym
         end

         if EqualStr("SUBTRACT")
            return C_SUBTRACTSym
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

         if EqualStr("SWITCHSTATES")
            return C_SWITCHSTATESSym
         end

         if EqualStr("SECONDS")
            return C_SECONDSSym
         end

         if EqualStr("SPLIT")
            return C_SPLITSym
         end

         if EqualStr("SUPPLIED")
            return C_SUPPLIEDSym
         end

         if EqualStr("SORTED")
            return C_SORTEDSym
         end

         if EqualStr("STANDARD")
            return C_STANDARDSym
         end

         if EqualStr("STABLE")
            return C_STABLESym
         end

         if EqualStr("SELECTION-SCREEN")
            return C_SELECTIONMinusSCREENSym
         end

         if EqualStr("SELECTION-SET")
            return C_SELECTIONMinusSETSym
         end

         if EqualStr("SELECTION-SETS")
            return C_SELECTIONMinusSETSSym
         end

         if EqualStr("SELECTION-TABLE")
            return C_SELECTIONMinusTABLESym
         end

         if EqualStr("SAP-SPOOL")
            return C_SAPMinusSPOOLSym
         end

         if EqualStr("STEP-LOOP")
            return C_STEPMinusLOOPSym
         end

         if EqualStr("SHORTDUMP-ID")
            return C_SHORTDUMPMinusIDSym
         end

         if EqualStr("SELECT-OPTIONS")
            return C_SELECTMinusOPTIONSSym
         end

         if EqualStr("SCROLL-BOUNDARY")
            return C_SCROLLMinusBOUNDARYSym
         end

         if EqualStr("SUBTRACT-CORRESPONDING")
            return C_SUBTRACTMinusCORRESPONDINGSym
         end

         if EqualStr("SYNTAX-CHECK")
            return C_SYNTAXMinusCHECKSym
         end


      when 'T'
         if EqualStr("TARGET")
            return C_TARGETSym
         end

         if EqualStr("TO")
            return C_TOSym
         end

         if EqualStr("TABLES")
            return C_TABLESSym
         end

         if EqualStr("TEXT")
            return C_TEXTSym
         end

         if EqualStr("TIME")
            return C_TIMESym
         end

         if EqualStr("TIMES")
            return C_TIMESSym
         end

         if EqualStr("TEXTPOOL")
            return C_TEXTPOOLSym
         end

         if EqualStr("TRY")
            return C_TRYSym
         end

         if EqualStr("TYPES")
            return C_TYPESSym
         end

         if EqualStr("TASK")
            return C_TASKSym
         end

         if EqualStr("TESTING")
            return C_TESTINGSym
         end

         if EqualStr("THEN")
            return C_THENSym
         end

         if EqualStr("TRANSACTION")
            return C_TRANSACTIONSym
         end

         if EqualStr("TRANSFORMATION")
            return C_TRANSFORMATIONSym
         end

         if EqualStr("TABLEVIEW")
            return C_TABLEVIEWSym
         end

         if EqualStr("TABSTRIP")
            return C_TABSTRIPSym
         end

         if EqualStr("TITLE")
            return C_TITLESym
         end

         if EqualStr("TRUNCATION")
            return C_TRUNCATIONSym
         end

         if EqualStr("TAB")
            return C_TABSym
         end

         if EqualStr("TITLEBAR")
            return C_TITLEBARSym
         end

         if EqualStr("TRAILING")
            return C_TRAILINGSym
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

         if EqualStr("TASKS")
            return C_TASKSSym
         end

         if EqualStr("TRANSPORTING")
            return C_TRANSPORTINGSym
         end

         if EqualStr("TYPE")
            return C_TYPESym
         end

         if EqualStr("TYPE-POOL")
            return C_TYPEMinusPOOLSym
         end

         if EqualStr("TABLE")
            return C_TABLESym
         end

         if EqualStr("TOP-LINES")
            return C_TOPMinusLINESSym
         end

         if EqualStr("TITLE-LINES")
            return C_TITLEMinusLINESSym
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

         if EqualStr("TYPE-POOLS")
            return C_TYPEMinusPOOLSSym
         end


      when 'U'
         if EqualStr("USING")
            return C_USINGSym
         end

         if EqualStr("UPDATE")
            return C_UPDATESym
         end

         if EqualStr("UNION")
            return C_UNIONSym
         end

         if EqualStr("UP")
            return C_UPSym
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

         if EqualStr("USER")
            return C_USERSym
         end

         if EqualStr("UNIX")
            return C_UNIXSym
         end

         if EqualStr("UNWIND")
            return C_UNWINDSym
         end

         if EqualStr("UNTIL")
            return C_UNTILSym
         end

         if EqualStr("UNICODE")
            return C_UNICODESym
         end

         if EqualStr("UPPER")
            return C_UPPERSym
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

         if EqualStr("USER-COMMAND")
            return C_USERMinusCOMMANDSym
         end


      when 'V'
         if EqualStr("VALUE")
            return C_VALUESym
         end

         if EqualStr("VERSION")
            return C_VERSIONSym
         end

         if EqualStr("VALID")
            return C_VALIDSym
         end

         if EqualStr("VARYING")
            return C_VARYINGSym
         end

         if EqualStr("VIA")
            return C_VIASym
         end

         if EqualStr("VARY")
            return C_VARYSym
         end

         if EqualStr("VALUES")
            return C_VALUESSym
         end

         if EqualStr("VISIBLE")
            return C_VISIBLESym
         end

         if EqualStr("VALUE-REQUEST")
            return C_VALUEMinusREQUESTSym
         end


      when 'W'
         if EqualStr("WHERE")
            return C_WHERESym
         end

         if EqualStr("WITHOUT")
            return C_WITHOUTSym
         end

         if EqualStr("WRITE")
            return C_WRITESym
         end

         if EqualStr("WHEN")
            return C_WHENSym
         end

         if EqualStr("WINDOWS")
            return C_WINDOWSSym
         end

         if EqualStr("WIDTH")
            return C_WIDTHSym
         end

         if EqualStr("WHILE")
            return C_WHILESym
         end

         if EqualStr("WORK")
            return C_WORKSym
         end

         if EqualStr("WAIT")
            return C_WAITSym
         end

         if EqualStr("WINDOW")
            return C_WINDOWSym
         end

         if EqualStr("WITH")
            return C_WITHSym
         end

         if EqualStr("WITH-TITLE")
            return C_WITHMinusTITLESym
         end

         if EqualStr("WITH-HEADING")
            return C_WITHMinusHEADINGSym
         end


      when 'X'
         if EqualStr("XML")
            return C_XMLSym
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
         if EqualStr("aggregate")
            return C_aggregateSym
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


      when '|'
         if EqualStr("||")
            return C_BarBarSym
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
            if @ch=='U'
               state=2
            else
               if @ch=='u'
                  state=3
               else
                  if @ch=='L'
                     state=4
                  else
                     if @ch=='l'
                        state=5
                     else
                        if @ch>='0'&&@ch<='9'

                        else
                           return C_numberSym
                        end

                     end

                  end

               end

            end


         when 2
            return C_numberSym
         when 3
            return C_numberSym
         when 4
            return C_numberSym
         when 5
            return C_numberSym
         when 7
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
               state=8
            else
               return No_Sym
            end


         when 8
            if @ch=='U'
               state=9
            else
               if @ch=='u'
                  state=10
               else
                  if @ch=='L'
                     state=11
                  else
                     if @ch=='l'
                        state=12
                     else
                        if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                        else
                           return C_hexnumberSym
                        end

                     end

                  end

               end

            end


         when 9
            return C_hexnumberSym
         when 10
            return C_hexnumberSym
         when 11
            return C_hexnumberSym
         when 12
            return C_hexnumberSym
         when 13
            if @ch==39
               state=15
            else
               if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

               else
                  return No_Sym
               end

            end


         when 14
            if @ch=='`'
               state=16
            else
               if @ch>=' '&&@ch<='_'||@ch>='a'&&@ch<=255

               else
                  return No_Sym
               end

            end


         when 15
            return C_stringD1Sym
         when 16
            return C_stringD1Sym
         when 17
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
               state=19
            else
               if @ch==92
                  state=33
               else
                  return No_Sym
               end

            end


         when 19
            if @ch=='"'
               state=20
            else
               return No_Sym
            end


         when 20
            return C_charSym
         when 21
            if @ch=='|'
               state=22
            else
               if @ch>=' '&&@ch<='{'||@ch>='}'&&@ch<=255

               else
                  return C_BarSym
               end

            end


         when 22
            return CheckLiteral(C_regexD1Sym)
         when 23
            return C_ColonSym
         when 24
            return C_spaceD1Sym
         when 26
            if @ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

            else
               if @ch=='/'||@ch=='~'
                  state=27
               else
                  if @ch=='-'
                     state=34
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 27
            if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               return No_Sym
            end


         when 29
            if @ch=='#'
               state=30
            else
               return C_HashSym
            end


         when 30
            if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=31
            else
               return No_Sym
            end


         when 31
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

            else
               return C_PreProcessorSym
            end


         when 32
            if @ch=='U'
               state=2
            else
               if @ch=='u'
                  state=3
               else
                  if @ch=='L'
                     state=4
                  else
                     if @ch=='l'
                        state=5
                     else
                        if @ch>='0'&&@ch<='9'
                           state=1
                        else
                           if @ch=='X'||@ch=='x'
                              state=7
                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end

            end


         when 33
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
               state=19
            else
               if @ch=='"'
                  state=20
               else
                  return No_Sym
               end

            end


         when 34
            if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               if @ch=='>'
                  state=35
               else
                  return No_Sym
               end

            end


         when 35
            if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               if @ch=='/'||@ch=='~'
                  state=27
               else
                  if @ch=='-'
                     state=34
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 36
            return C_LparenSym
         when 37
            return C_RparenSym
         when 38
            if @ch=='>'
               state=39
            else
               return C_EqualSym
            end


         when 39
            return C_EqualGreaterSym
         when 40
            return C_PointSym
         when 41
            if @ch=='*'
               state=57
            else
               if @ch=='='
                  state=75
               else
                  return C_StarSym
               end

            end


         when 42
            return C_CommaSym
         when 43
            if @ch=='*'
               state=44
            else
               return C_TildeSym
            end


         when 44
            return C_TildeStarSym
         when 45
            if @ch=='D'
               state=46
            else
               return C_AtSym
            end


         when 46
            if @ch=='A'
               state=47
            else
               return No_Sym
            end


         when 47
            if @ch=='T'
               state=48
            else
               return No_Sym
            end


         when 48
            if @ch=='A'
               state=49
            else
               return No_Sym
            end


         when 49
            return C_AtDATASym
         when 50
            if @ch=='='
               state=79
            else
               return C_PlusSym
            end


         when 51
            if @ch=='T'
               state=52
            else
               if @ch=='='
                  state=87
               else
                  return C_QuerySym
               end

            end


         when 52
            if @ch=='O'
               state=53
            else
               return No_Sym
            end


         when 53
            return C_QueryTOSym
         when 54
            return C_LbrackSym
         when 55
            return C_RbrackSym
         when 57
            return C_StarStarSym
         when 58
            return C_SemicolonSym
         when 59
            if @ch=='>'
               state=60
            else
               if @ch=='='
                  state=80
               else
                  return C_MinusSym
               end

            end


         when 60
            return C_MinusGreaterSym
         when 61
            if @ch=='&'
               state=62
            else
               if @ch=='='
                  state=81
               else
                  return C_AndSym
               end

            end


         when 62
            return C_AndAndSym
         when 63
            if @ch=='='
               state=82
            else
               return C_UparrowSym
            end


         when 65
            return C_LessGreaterSym
         when 67
            if @ch=='='
               state=70
            else
               if @ch=='>'
                  state=73
               else
                  return C_GreaterSym
               end

            end


         when 69
            return C_LessEqualSym
         when 70
            return C_GreaterEqualSym
         when 73
            if @ch=='='
               state=86
            else
               return C_GreaterGreaterSym
            end


         when 74
            if @ch=='='
               state=78
            else
               return C_PercentSym
            end


         when 75
            return C_StarEqualSym
         when 77
            return C_SlashEqualSym
         when 78
            return C_PercentEqualSym
         when 79
            return C_PlusEqualSym
         when 80
            return C_MinusEqualSym
         when 81
            return C_AndEqualSym
         when 82
            return C_UparrowEqualSym
         when 85
            return C_LessLessEqualSym
         when 86
            return C_GreaterGreaterEqualSym
         when 87
            return C_QueryEqualSym
         when 89
            if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               return C_BangSym
            end


         when 90
            if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               if @ch=='='
                  state=77
               else
                  return C_SlashSym
               end

            end


         when 91
            if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=26
            else
               if @ch=='>'
                  state=65
               else
                  if @ch=='='
                     state=69
                  else
                     if @ch=='<'
                        state=92
                     else
                        return C_LessSym
                     end

                  end

               end

            end


         when 92
            if @ch=='='
               state=85
            else
               return C_LessLessSym
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
               if @ch=='U'
                  state=2
               else
                  if @ch=='u'
                     state=3
                  else
                     if @ch=='L'
                        state=4
                     else
                        if @ch=='l'
                           state=5
                        else
                           if @ch>='0'&&@ch<='9'

                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end


            when 2
               return C_numberSym
            when 3
               return C_numberSym
            when 4
               return C_numberSym
            when 5
               return C_numberSym
            when 7
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
                  state=8
               else
                  return No_Sym
               end


            when 8
               if @ch=='U'
                  state=9
               else
                  if @ch=='u'
                     state=10
                  else
                     if @ch=='L'
                        state=11
                     else
                        if @ch=='l'
                           state=12
                        else
                           if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                           else
                              return C_hexnumberSym
                           end

                        end

                     end

                  end

               end


            when 9
               return C_hexnumberSym
            when 10
               return C_hexnumberSym
            when 11
               return C_hexnumberSym
            when 12
               return C_hexnumberSym
            when 13
               if @ch==39
                  state=15
               else
                  if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

                  else
                     return No_Sym
                  end

               end


            when 14
               if @ch=='`'
                  state=16
               else
                  if @ch>=' '&&@ch<='_'||@ch>='a'&&@ch<=255

                  else
                     return No_Sym
                  end

               end


            when 15
               return C_stringD1Sym
            when 16
               return C_stringD1Sym
            when 17
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
                  state=19
               else
                  if @ch==92
                     state=33
                  else
                     return No_Sym
                  end

               end


            when 19
               if @ch=='"'
                  state=20
               else
                  return No_Sym
               end


            when 20
               return C_charSym
            when 21
               if @ch=='|'
                  state=22
               else
                  if @ch>=' '&&@ch<='{'||@ch>='}'&&@ch<=255

                  else
                     return C_BarSym
                  end

               end


            when 22
               return CheckLiteral(C_regexD1Sym)
            when 23
               return C_ColonSym
            when 24
               return C_spaceD1Sym
            when 26
               if @ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

               else
                  if @ch=='/'||@ch=='~'
                     state=27
                  else
                     if @ch=='-'
                        state=34
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 27
               if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  return No_Sym
               end


            when 29
               if @ch=='#'
                  state=30
               else
                  return C_HashSym
               end


            when 30
               if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=31
               else
                  return No_Sym
               end


            when 31
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

               else
                  return C_PreProcessorSym
               end


            when 32
               if @ch=='U'
                  state=2
               else
                  if @ch=='u'
                     state=3
                  else
                     if @ch=='L'
                        state=4
                     else
                        if @ch=='l'
                           state=5
                        else
                           if @ch>='0'&&@ch<='9'
                              state=1
                           else
                              if @ch=='X'||@ch=='x'
                                 state=7
                              else
                                 return C_numberSym
                              end

                           end

                        end

                     end

                  end

               end


            when 33
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
                  state=19
               else
                  if @ch=='"'
                     state=20
                  else
                     return No_Sym
                  end

               end


            when 34
               if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  if @ch=='>'
                     state=35
                  else
                     return No_Sym
                  end

               end


            when 35
               if @ch=='*'||@ch>='0'&&@ch<='9'||@ch=='<'||@ch=='>'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  if @ch=='/'||@ch=='~'
                     state=27
                  else
                     if @ch=='-'
                        state=34
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 36
               return C_LparenSym
            when 37
               return C_RparenSym
            when 38
               if @ch=='>'
                  state=39
               else
                  return C_EqualSym
               end


            when 39
               return C_EqualGreaterSym
            when 40
               return C_PointSym
            when 41
               if @ch=='*'
                  state=57
               else
                  if @ch=='='
                     state=75
                  else
                     return C_StarSym
                  end

               end


            when 42
               return C_CommaSym
            when 43
               if @ch=='*'
                  state=44
               else
                  return C_TildeSym
               end


            when 44
               return C_TildeStarSym
            when 45
               if @ch=='D'
                  state=46
               else
                  return C_AtSym
               end


            when 46
               if @ch=='A'
                  state=47
               else
                  return No_Sym
               end


            when 47
               if @ch=='T'
                  state=48
               else
                  return No_Sym
               end


            when 48
               if @ch=='A'
                  state=49
               else
                  return No_Sym
               end


            when 49
               return C_AtDATASym
            when 50
               if @ch=='='
                  state=79
               else
                  return C_PlusSym
               end


            when 51
               if @ch=='T'
                  state=52
               else
                  if @ch=='='
                     state=87
                  else
                     return C_QuerySym
                  end

               end


            when 52
               if @ch=='O'
                  state=53
               else
                  return No_Sym
               end


            when 53
               return C_QueryTOSym
            when 54
               return C_LbrackSym
            when 55
               return C_RbrackSym
            when 57
               return C_StarStarSym
            when 58
               return C_SemicolonSym
            when 59
               if @ch=='>'
                  state=60
               else
                  if @ch=='='
                     state=80
                  else
                     return C_MinusSym
                  end

               end


            when 60
               return C_MinusGreaterSym
            when 61
               if @ch=='&'
                  state=62
               else
                  if @ch=='='
                     state=81
                  else
                     return C_AndSym
                  end

               end


            when 62
               return C_AndAndSym
            when 63
               if @ch=='='
                  state=82
               else
                  return C_UparrowSym
               end


            when 65
               return C_LessGreaterSym
            when 67
               if @ch=='='
                  state=70
               else
                  if @ch=='>'
                     state=73
                  else
                     return C_GreaterSym
                  end

               end


            when 69
               return C_LessEqualSym
            when 70
               return C_GreaterEqualSym
            when 73
               if @ch=='='
                  state=86
               else
                  return C_GreaterGreaterSym
               end


            when 74
               if @ch=='='
                  state=78
               else
                  return C_PercentSym
               end


            when 75
               return C_StarEqualSym
            when 77
               return C_SlashEqualSym
            when 78
               return C_PercentEqualSym
            when 79
               return C_PlusEqualSym
            when 80
               return C_MinusEqualSym
            when 81
               return C_AndEqualSym
            when 82
               return C_UparrowEqualSym
            when 85
               return C_LessLessEqualSym
            when 86
               return C_GreaterGreaterEqualSym
            when 87
               return C_QueryEqualSym
            when 89
               if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  return C_BangSym
               end


            when 90
               if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  if @ch=='='
                     state=77
                  else
                     return C_SlashSym
                  end

               end


            when 91
               if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=26
               else
                  if @ch=='>'
                     state=65
                  else
                     if @ch=='='
                        state=69
                     else
                        if @ch=='<'
                           state=92
                        else
                           return C_LessSym
                        end

                     end

                  end

               end


            when 92
               if @ch=='='
                  state=85
               else
                  return C_LessLessSym
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
