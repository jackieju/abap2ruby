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
         if EqualStr("AS")
            return C_ASSym
         end

         if EqualStr("ASCENDING")
            return C_ASCENDINGSym
         end

         if EqualStr("APPENDING")
            return C_APPENDINGSym
         end

         if EqualStr("ALL")
            return C_ALLSym
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

         if EqualStr("ACTIVATION")
            return C_ACTIVATIONSym
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


      when 'B'
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

         if EqualStr("BOXED")
            return C_BOXEDSym
         end

         if EqualStr("BEGIN")
            return C_BEGINSym
         end

         if EqualStr("BETWEEN")
            return C_BETWEENSym
         end

         if EqualStr("BINARY")
            return C_BINARYSym
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


      when 'C'
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

         if EqualStr("COMPONENTS")
            return C_COMPONENTSSym
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

         if EqualStr("CONDITION")
            return C_CONDITIONSym
         end

         if EqualStr("COMPONENT")
            return C_COMPONENTSym
         end

         if EqualStr("CALL")
            return C_CALLSym
         end

         if EqualStr("CHECK")
            return C_CHECKSym
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


      when 'D'
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

         if EqualStr("DECIMALS")
            return C_DECIMALSSym
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

         if EqualStr("DUMMY")
            return C_DUMMYSym
         end

         if EqualStr("DELETE")
            return C_DELETESym
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


      when 'E'
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

         if EqualStr("EDIT")
            return C_EDITSym
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

         if EqualStr("EXCEPTIONS")
            return C_EXCEPTIONSSym
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

         if EqualStr("HASHED")
            return C_HASHEDSym
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


      when 'I'
         if EqualStr("INNER")
            return C_INNERSym
         end

         if EqualStr("INTO")
            return C_INTOSym
         end

         if EqualStr("IN")
            return C_INSym
         end

         if EqualStr("INITIAL")
            return C_INITIALSym
         end

         if EqualStr("ID")
            return C_IDSym
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

         if EqualStr("KEEPING")
            return C_KEEPINGSym
         end

         if EqualStr("KIND")
            return C_KINDSym
         end

         if EqualStr("KEYS")
            return C_KEYSSym
         end


      when 'L'
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

         if EqualStr("LAST")
            return C_LASTSym
         end

         if EqualStr("LOCALE")
            return C_LOCALESym
         end

         if EqualStr("LOAD")
            return C_LOADSym
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

         if EqualStr("MESSAGE")
            return C_MESSAGESym
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

         if EqualStr("NODE")
            return C_NODESym
         end

         if EqualStr("NA")
            return C_NASym
         end

         if EqualStr("NS")
            return C_NSSym
         end


      when 'O'
         if EqualStr("OUTER")
            return C_OUTERSym
         end

         if EqualStr("ON")
            return C_ONSym
         end

         if EqualStr("ORDER")
            return C_ORDERSym
         end

         if EqualStr("OF")
            return C_OFSym
         end

         if EqualStr("OTHER")
            return C_OTHERSym
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


      when 'P'
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

         if EqualStr("PARAMETERS")
            return C_PARAMETERSSym
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

         if EqualStr("PARAMETER")
            return C_PARAMETERSym
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


      when 'Q'
         if EqualStr("QUICKINFO")
            return C_QUICKINFOSym
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

         if EqualStr("REFERENCE")
            return C_REFERENCESym
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

         if EqualStr("REF")
            return C_REFSym
         end

         if EqualStr("RANGE")
            return C_RANGESym
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

         if EqualStr("RETURNING")
            return C_RETURNINGSym
         end

         if EqualStr("RECEIVING")
            return C_RECEIVINGSym
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


      when 'S'
         if EqualStr("STANDARD")
            return C_STANDARDSym
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

         if EqualStr("SUFFIX")
            return C_SUFFIXSym
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


      when 'T'
         if EqualStr("TABLE")
            return C_TABLESym
         end

         if EqualStr("TO")
            return C_TOSym
         end

         if EqualStr("TABLES")
            return C_TABLESSym
         end

         if EqualStr("TARGET")
            return C_TARGETSym
         end

         if EqualStr("TYPE")
            return C_TYPESym
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


      when 'V'
         if EqualStr("VERSION")
            return C_VERSIONSym
         end

         if EqualStr("VALID")
            return C_VALIDSym
         end

         if EqualStr("VALUE")
            return C_VALUESym
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


      when 'W'
         if EqualStr("WHERE")
            return C_WHERESym
         end

         if EqualStr("WITH")
            return C_WITHSym
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


      when 'p'
         if EqualStr("primary_key")
            return C_primaryUnderscorekeySym
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
            if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               return C_BangSym
            end


         when 2
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

            else
               return CheckLiteral(C_identifierSym)
            end


         when 3
            if @ch=='U'
               state=4
            else
               if @ch=='u'
                  state=5
               else
                  if @ch=='L'
                     state=6
                  else
                     if @ch=='l'
                        state=7
                     else
                        if @ch>='0'&&@ch<='9'

                        else
                           return C_numberSym
                        end

                     end

                  end

               end

            end


         when 4
            return C_numberSym
         when 5
            return C_numberSym
         when 6
            return C_numberSym
         when 7
            return C_numberSym
         when 9
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
               state=10
            else
               return No_Sym
            end


         when 10
            if @ch=='U'
               state=11
            else
               if @ch=='u'
                  state=12
               else
                  if @ch=='L'
                     state=13
                  else
                     if @ch=='l'
                        state=14
                     else
                        if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                        else
                           return C_hexnumberSym
                        end

                     end

                  end

               end

            end


         when 11
            return C_hexnumberSym
         when 12
            return C_hexnumberSym
         when 13
            return C_hexnumberSym
         when 14
            return C_hexnumberSym
         when 15
            if @ch==39
               state=16
            else
               if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

               else
                  return No_Sym
               end

            end


         when 16
            return C_stringD1Sym
         when 17
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
               state=19
            else
               if @ch==92
                  state=26
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
            return C_ColonSym
         when 22
            return C_spaceD1Sym
         when 23
            if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
               state=24
            else
               return No_Sym
            end


         when 24
            return C_PreProcessorSym
         when 25
            if @ch=='U'
               state=4
            else
               if @ch=='u'
                  state=5
               else
                  if @ch=='L'
                     state=6
                  else
                     if @ch=='l'
                        state=7
                     else
                        if @ch>='0'&&@ch<='9'
                           state=3
                        else
                           if @ch=='X'||@ch=='x'
                              state=9
                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end

            end


         when 26
            if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
               state=19
            else
               if @ch=='"'
                  state=20
               else
                  return No_Sym
               end

            end


         when 27
            return C_LparenSym
         when 28
            return C_RparenSym
         when 29
            if @ch=='>'
               state=1132
            else
               if @ch=='='
                  state=1133
               else
                  if @ch=='<'
                     state=1177
                  else
                     return C_LessSym
                  end

               end

            end


         when 30
            if @ch=='='
               state=1134
            else
               if @ch=='>'
                  state=1178
               else
                  return C_GreaterSym
               end

            end


         when 37
            if @ch=='Z'
               state=38
            else
               return No_Sym
            end


         when 38
            if @ch=='E'
               state=39
            else
               return No_Sym
            end


         when 39
            return C_LINEMinusSIZESym
         when 45
            if @ch=='O'
               state=46
            else
               return No_Sym
            end


         when 46
            if @ch=='U'
               state=47
            else
               return No_Sym
            end


         when 47
            if @ch=='N'
               state=48
            else
               return No_Sym
            end


         when 48
            if @ch=='T'
               state=49
            else
               return No_Sym
            end


         when 49
            return C_LINEMinusCOUNTSym
         when 57
            if @ch=='I'
               state=58
            else
               return No_Sym
            end


         when 58
            if @ch=='D'
               state=59
            else
               return No_Sym
            end


         when 59
            return C_MESSAGEMinusIDSym
         when 60
            return C_PointSym
         when 61
            if @ch=='*'
               state=115
            else
               if @ch=='='
                  state=1182
               else
                  return C_StarSym
               end

            end


         when 62
            return C_CommaSym
         when 63
            if @ch=='*'
               state=64
            else
               return C_TildeSym
            end


         when 64
            return C_TildeStarSym
         when 65
            if @ch=='D'
               state=66
            else
               return C_AtSym
            end


         when 66
            if @ch=='A'
               state=67
            else
               return No_Sym
            end


         when 67
            if @ch=='T'
               state=68
            else
               return No_Sym
            end


         when 68
            if @ch=='A'
               state=69
            else
               return No_Sym
            end


         when 69
            return C_AtDATASym
         when 70
            if @ch=='+'
               state=1180
            else
               if @ch=='='
                  state=1185
               else
                  return C_PlusSym
               end

            end


         when 71
            if @ch=='T'
               state=72
            else
               return C_QuerySym
            end


         when 72
            if @ch=='O'
               state=73
            else
               return No_Sym
            end


         when 73
            return C_QueryTOSym
         when 78
            if @ch=='C'
               state=79
            else
               return No_Sym
            end


         when 79
            if @ch=='O'
               state=80
            else
               return No_Sym
            end


         when 80
            if @ch=='R'
               state=81
            else
               return No_Sym
            end


         when 81
            if @ch=='R'
               state=82
            else
               return No_Sym
            end


         when 82
            if @ch=='E'
               state=83
            else
               return No_Sym
            end


         when 83
            if @ch=='S'
               state=84
            else
               return No_Sym
            end


         when 84
            if @ch=='P'
               state=85
            else
               return No_Sym
            end


         when 85
            if @ch=='O'
               state=86
            else
               return No_Sym
            end


         when 86
            if @ch=='N'
               state=87
            else
               return No_Sym
            end


         when 87
            if @ch=='D'
               state=88
            else
               return No_Sym
            end


         when 88
            if @ch=='I'
               state=89
            else
               return No_Sym
            end


         when 89
            if @ch=='N'
               state=90
            else
               return No_Sym
            end


         when 90
            if @ch=='G'
               state=91
            else
               return No_Sym
            end


         when 91
            return C_MOVEMinusCORRESPONDINGSym
         when 92
            return C_LbrackSym
         when 93
            return C_RbrackSym
         when 94
            if @ch=='>'
               state=383
            else
               return C_EqualSym
            end


         when 102
            if @ch=='U'
               state=103
            else
               return No_Sym
            end


         when 103
            if @ch=='E'
               state=104
            else
               return No_Sym
            end


         when 104
            return C_NONMinusUNIQUESym
         when 109
            if @ch=='O'
               state=110
            else
               return No_Sym
            end


         when 110
            if @ch=='N'
               state=111
            else
               return No_Sym
            end


         when 111
            if @ch=='L'
               state=112
            else
               return No_Sym
            end


         when 112
            if @ch=='Y'
               state=113
            else
               return No_Sym
            end


         when 113
            return C_READMinusONLYSym
         when 114
            if @ch=='='
               state=1183
            else
               return C_SlashSym
            end


         when 115
            return C_StarStarSym
         when 126
            if @ch=='J'
               state=127
            else
               return No_Sym
            end


         when 127
            if @ch=='U'
               state=128
            else
               return No_Sym
            end


         when 128
            if @ch=='S'
               state=129
            else
               return No_Sym
            end


         when 129
            if @ch=='T'
               state=130
            else
               return No_Sym
            end


         when 130
            if @ch=='I'
               state=131
            else
               return No_Sym
            end


         when 131
            if @ch=='F'
               state=132
            else
               return No_Sym
            end


         when 132
            if @ch=='I'
               state=133
            else
               return No_Sym
            end


         when 133
            if @ch=='E'
               state=134
            else
               return No_Sym
            end


         when 134
            if @ch=='D'
               state=135
            else
               return No_Sym
            end


         when 135
            return C_LEFTMinusJUSTIFIEDSym
         when 141
            if @ch=='J'
               state=142
            else
               return No_Sym
            end


         when 142
            if @ch=='U'
               state=143
            else
               return No_Sym
            end


         when 143
            if @ch=='S'
               state=144
            else
               return No_Sym
            end


         when 144
            if @ch=='T'
               state=145
            else
               return No_Sym
            end


         when 145
            if @ch=='I'
               state=146
            else
               return No_Sym
            end


         when 146
            if @ch=='F'
               state=147
            else
               return No_Sym
            end


         when 147
            if @ch=='I'
               state=148
            else
               return No_Sym
            end


         when 148
            if @ch=='E'
               state=149
            else
               return No_Sym
            end


         when 149
            if @ch=='D'
               state=150
            else
               return No_Sym
            end


         when 150
            return C_RIGHTMinusJUSTIFIEDSym
         when 155
            if @ch=='O'
               state=156
            else
               return No_Sym
            end


         when 156
            if @ch=='U'
               state=157
            else
               return No_Sym
            end


         when 157
            if @ch=='P'
               state=158
            else
               return No_Sym
            end


         when 158
            if @ch=='I'
               state=159
            else
               return No_Sym
            end


         when 159
            if @ch=='N'
               state=160
            else
               return No_Sym
            end


         when 160
            if @ch=='G'
               state=161
            else
               return No_Sym
            end


         when 161
            return C_NOMinusGROUPINGSym
         when 166
            if @ch=='G'
               state=167
            else
               return No_Sym
            end


         when 167
            if @ch=='N'
               state=168
            else
               return No_Sym
            end


         when 168
            return C_NOMinusSIGNSym
         when 172
            if @ch=='E'
               state=173
            else
               return No_Sym
            end


         when 173
            if @ch=='R'
               state=174
            else
               return No_Sym
            end


         when 174
            if @ch=='O'
               state=175
            else
               return No_Sym
            end


         when 175
            return C_NOMinusZEROSym
         when 200
            if @ch=='Y'
               state=201
            else
               return No_Sym
            end


         when 201
            return C_DDSlashMMSlashYYYYSym
         when 210
            if @ch=='Y'
               state=211
            else
               return No_Sym
            end


         when 211
            return C_MMSlashDDSlashYYYYSym
         when 221
            if @ch=='C'
               state=222
            else
               return No_Sym
            end


         when 222
            if @ch=='H'
               state=223
            else
               return No_Sym
            end


         when 223
            if @ch=='E'
               state=224
            else
               return No_Sym
            end


         when 224
            if @ch=='C'
               state=225
            else
               return No_Sym
            end


         when 225
            if @ch=='K'
               state=226
            else
               return No_Sym
            end


         when 226
            return C_AUTHORITYMinusCHECKSym
         when 230
            if @ch=='8'
               state=231
            else
               return No_Sym
            end


         when 231
            return C_UTFMinusD8Sym
         when 237
            if @ch=='R'
               state=238
            else
               return No_Sym
            end


         when 238
            if @ch=='D'
               state=239
            else
               return No_Sym
            end


         when 239
            if @ch=='E'
               state=240
            else
               return No_Sym
            end


         when 240
            if @ch=='R'
               state=241
            else
               return No_Sym
            end


         when 241
            return C_BYTEMinusORDERSym
         when 249
            if @ch=='O'
               state=250
            else
               return No_Sym
            end


         when 250
            if @ch=='D'
               state=251
            else
               return No_Sym
            end


         when 251
            if @ch=='E'
               state=252
            else
               return No_Sym
            end


         when 252
            return C_NONMinusUNICODESym
         when 264
            if @ch=='R'
               state=265
            else
               return No_Sym
            end


         when 265
            if @ch=='E'
               state=266
            else
               return No_Sym
            end


         when 266
            if @ch=='E'
               state=267
            else
               return No_Sym
            end


         when 267
            if @ch=='N'
               state=268
            else
               return No_Sym
            end


         when 268
            return C_SELECTIONMinusSCREENSym
         when 295
            return C_SELECTIONMinusSETSSym
         when 306
            if @ch=='A'
               state=307
            else
               return No_Sym
            end


         when 307
            if @ch=='B'
               state=308
            else
               return No_Sym
            end


         when 308
            if @ch=='L'
               state=309
            else
               return No_Sym
            end


         when 309
            if @ch=='E'
               state=310
            else
               return No_Sym
            end


         when 310
            return C_SELECTIONMinusTABLESym
         when 314
            if @ch=='S'
               state=315
            else
               return No_Sym
            end


         when 315
            if @ch=='P'
               state=316
            else
               return No_Sym
            end


         when 316
            if @ch=='O'
               state=317
            else
               return No_Sym
            end


         when 317
            if @ch=='O'
               state=318
            else
               return No_Sym
            end


         when 318
            if @ch=='L'
               state=319
            else
               return No_Sym
            end


         when 319
            return C_SAPMinusSPOOLSym
         when 320
            return C_SemicolonSym
         when 330
            if @ch=='T'
               state=331
            else
               return No_Sym
            end


         when 331
            if @ch=='A'
               state=332
            else
               return No_Sym
            end


         when 332
            if @ch=='B'
               state=333
            else
               return No_Sym
            end


         when 333
            if @ch=='L'
               state=334
            else
               return No_Sym
            end


         when 334
            if @ch=='E'
               state=335
            else
               return No_Sym
            end


         when 335
            return C_PARAMETERMinusTABLESym
         when 345
            if @ch=='T'
               state=346
            else
               return No_Sym
            end


         when 346
            if @ch=='A'
               state=347
            else
               return No_Sym
            end


         when 347
            if @ch=='B'
               state=348
            else
               return No_Sym
            end


         when 348
            if @ch=='L'
               state=349
            else
               return No_Sym
            end


         when 349
            if @ch=='E'
               state=350
            else
               return No_Sym
            end


         when 350
            return C_EXCEPTIONMinusTABLESym
         when 357
            if @ch=='E'
               state=358
            else
               return No_Sym
            end


         when 358
            if @ch=='T'
               state=359
            else
               return No_Sym
            end


         when 359
            if @ch=='H'
               state=360
            else
               return No_Sym
            end


         when 360
            if @ch=='O'
               state=361
            else
               return No_Sym
            end


         when 361
            if @ch=='D'
               state=362
            else
               return No_Sym
            end


         when 362
            if @ch=='S'
               state=363
            else
               return No_Sym
            end


         when 363
            return C_CLASSMinusMETHODSSym
         when 367
            if @ch=='C'
               state=368
            else
               return No_Sym
            end


         when 368
            if @ch=='O'
               state=369
            else
               return No_Sym
            end


         when 369
            if @ch=='R'
               state=370
            else
               return No_Sym
            end


         when 370
            if @ch=='R'
               state=371
            else
               return No_Sym
            end


         when 371
            if @ch=='E'
               state=372
            else
               return No_Sym
            end


         when 372
            if @ch=='S'
               state=373
            else
               return No_Sym
            end


         when 373
            if @ch=='P'
               state=374
            else
               return No_Sym
            end


         when 374
            if @ch=='O'
               state=375
            else
               return No_Sym
            end


         when 375
            if @ch=='N'
               state=376
            else
               return No_Sym
            end


         when 376
            if @ch=='D'
               state=377
            else
               return No_Sym
            end


         when 377
            if @ch=='I'
               state=378
            else
               return No_Sym
            end


         when 378
            if @ch=='N'
               state=379
            else
               return No_Sym
            end


         when 379
            if @ch=='G'
               state=380
            else
               return No_Sym
            end


         when 380
            return C_ADDMinusCORRESPONDINGSym
         when 381
            if @ch=='>'
               state=382
            else
               if @ch=='-'
                  state=1181
               else
                  if @ch=='='
                     state=1186
                  else
                     return C_MinusSym
                  end

               end

            end


         when 382
            return C_MinusGreaterSym
         when 383
            return C_EqualGreaterSym
         when 389
            if @ch=='P'
               state=390
            else
               return No_Sym
            end


         when 390
            if @ch=='O'
               state=391
            else
               return No_Sym
            end


         when 391
            if @ch=='I'
               state=392
            else
               return No_Sym
            end


         when 392
            if @ch=='N'
               state=393
            else
               return No_Sym
            end


         when 393
            if @ch=='T'
               state=394
            else
               return No_Sym
            end


         when 394
            return C_BREAKMinusPOINTSym
         when 403
            if @ch=='F'
               state=404
            else
               return No_Sym
            end


         when 404
            if @ch=='U'
               state=405
            else
               return No_Sym
            end


         when 405
            if @ch=='N'
               state=406
            else
               return No_Sym
            end


         when 406
            if @ch=='C'
               state=407
            else
               return No_Sym
            end


         when 407
            if @ch=='T'
               state=408
            else
               return No_Sym
            end


         when 408
            if @ch=='I'
               state=409
            else
               return No_Sym
            end


         when 409
            if @ch=='O'
               state=410
            else
               return No_Sym
            end


         when 410
            if @ch=='N'
               state=411
            else
               return No_Sym
            end


         when 411
            return C_CUSTOMERMinusFUNCTIONSym
         when 417
            if @ch=='O'
               state=418
            else
               return No_Sym
            end


         when 418
            if @ch=='N'
               state=419
            else
               return No_Sym
            end


         when 419
            if @ch=='L'
               state=420
            else
               return No_Sym
            end


         when 420
            if @ch=='Y'
               state=421
            else
               return No_Sym
            end


         when 421
            return C_QUEUEMinusONLYSym
         when 428
            if @ch=='A'
               state=429
            else
               return No_Sym
            end


         when 429
            if @ch=='T'
               state=430
            else
               return No_Sym
            end


         when 430
            if @ch=='A'
               state=431
            else
               return No_Sym
            end


         when 431
            return C_CLASSMinusDATASym
         when 438
            if @ch=='V'
               state=439
            else
               return No_Sym
            end


         when 439
            if @ch=='E'
               state=440
            else
               return No_Sym
            end


         when 440
            if @ch=='N'
               state=441
            else
               return No_Sym
            end


         when 441
            if @ch=='T'
               state=442
            else
               return No_Sym
            end


         when 442
            if @ch=='S'
               state=443
            else
               return No_Sym
            end


         when 443
            return C_CLASSMinusEVENTSSym
         when 450
            if @ch=='O'
               state=451
            else
               return No_Sym
            end


         when 451
            if @ch=='O'
               state=452
            else
               return No_Sym
            end


         when 452
            if @ch=='L'
               state=453
            else
               return No_Sym
            end


         when 453
            return C_CLASSMinusPOOLSym
         when 460
            return C_NOMinusGAPSSym
         when 467
            if @ch=='L'
               state=468
            else
               return No_Sym
            end


         when 468
            if @ch=='E'
               state=469
            else
               return No_Sym
            end


         when 469
            if @ch=='N'
               state=470
            else
               return No_Sym
            end


         when 470
            if @ch=='G'
               state=471
            else
               return No_Sym
            end


         when 471
            if @ch=='T'
               state=472
            else
               return No_Sym
            end


         when 472
            if @ch=='H'
               state=473
            else
               return No_Sym
            end


         when 473
            return C_OUTPUTMinusLENGTHSym
         when 479
            if @ch=='D'
               state=480
            else
               return No_Sym
            end


         when 480
            return C_HELPMinusIDSym
         when 486
            if @ch=='L'
               state=487
            else
               return No_Sym
            end


         when 487
            if @ch=='I'
               state=488
            else
               return No_Sym
            end


         when 488
            if @ch=='N'
               state=489
            else
               return No_Sym
            end


         when 489
            if @ch=='E'
               state=490
            else
               return No_Sym
            end


         when 490
            return C_FIRSTMinusLINESym
         when 495
            if @ch=='I'
               state=496
            else
               return No_Sym
            end


         when 496
            if @ch=='N'
               state=497
            else
               return No_Sym
            end


         when 497
            if @ch=='E'
               state=498
            else
               return No_Sym
            end


         when 498
            if @ch=='S'
               state=499
            else
               return No_Sym
            end


         when 499
            return C_TOPMinusLINESSym
         when 505
            if @ch=='L'
               state=506
            else
               return No_Sym
            end


         when 506
            if @ch=='I'
               state=507
            else
               return No_Sym
            end


         when 507
            if @ch=='N'
               state=508
            else
               return No_Sym
            end


         when 508
            if @ch=='E'
               state=509
            else
               return No_Sym
            end


         when 509
            if @ch=='S'
               state=510
            else
               return No_Sym
            end


         when 510
            return C_TITLEMinusLINESSym
         when 515
            if @ch=='L'
               state=516
            else
               return No_Sym
            end


         when 516
            if @ch=='I'
               state=517
            else
               return No_Sym
            end


         when 517
            if @ch=='N'
               state=518
            else
               return No_Sym
            end


         when 518
            if @ch=='E'
               state=519
            else
               return No_Sym
            end


         when 519
            if @ch=='S'
               state=520
            else
               return No_Sym
            end


         when 520
            return C_HEADMinusLINESSym
         when 525
            if @ch=='I'
               state=526
            else
               return No_Sym
            end


         when 526
            if @ch=='N'
               state=527
            else
               return No_Sym
            end


         when 527
            if @ch=='E'
               state=528
            else
               return No_Sym
            end


         when 528
            if @ch=='S'
               state=529
            else
               return No_Sym
            end


         when 529
            return C_ENDMinusLINESSym
         when 536
            if @ch=='C'
               state=537
            else
               return No_Sym
            end


         when 537
            if @ch=='O'
               state=538
            else
               return No_Sym
            end


         when 538
            if @ch=='R'
               state=539
            else
               return No_Sym
            end


         when 539
            if @ch=='R'
               state=540
            else
               return No_Sym
            end


         when 540
            if @ch=='E'
               state=541
            else
               return No_Sym
            end


         when 541
            if @ch=='S'
               state=542
            else
               return No_Sym
            end


         when 542
            if @ch=='P'
               state=543
            else
               return No_Sym
            end


         when 543
            if @ch=='O'
               state=544
            else
               return No_Sym
            end


         when 544
            if @ch=='N'
               state=545
            else
               return No_Sym
            end


         when 545
            if @ch=='D'
               state=546
            else
               return No_Sym
            end


         when 546
            if @ch=='I'
               state=547
            else
               return No_Sym
            end


         when 547
            if @ch=='N'
               state=548
            else
               return No_Sym
            end


         when 548
            if @ch=='G'
               state=549
            else
               return No_Sym
            end


         when 549
            return C_DIVIDEMinusCORRESPONDINGSym
         when 556
            if @ch=='C'
               state=557
            else
               return No_Sym
            end


         when 557
            if @ch=='A'
               state=558
            else
               return No_Sym
            end


         when 558
            if @ch=='L'
               state=559
            else
               return No_Sym
            end


         when 559
            if @ch=='L'
               state=560
            else
               return No_Sym
            end


         when 560
            return C_EDITORMinusCALLSym
         when 568
            if @ch=='M'
               state=569
            else
               return No_Sym
            end


         when 569
            if @ch=='O'
               state=570
            else
               return No_Sym
            end


         when 570
            if @ch=='D'
               state=571
            else
               return No_Sym
            end


         when 571
            if @ch=='E'
               state=572
            else
               return No_Sym
            end


         when 572
            return C_DISPLAYMinusMODESym
         when 580
            if @ch=='A'
               state=581
            else
               return No_Sym
            end


         when 581
            if @ch=='G'
               state=582
            else
               return No_Sym
            end


         when 582
            if @ch=='E'
               state=583
            else
               return No_Sym
            end


         when 583
            return C_ENDMinusOFMinusPAGESym
         when 591
            if @ch=='E'
               state=592
            else
               return No_Sym
            end


         when 592
            if @ch=='L'
               state=593
            else
               return No_Sym
            end


         when 593
            if @ch=='E'
               state=594
            else
               return No_Sym
            end


         when 594
            if @ch=='C'
               state=595
            else
               return No_Sym
            end


         when 595
            if @ch=='T'
               state=596
            else
               return No_Sym
            end


         when 596
            if @ch=='I'
               state=597
            else
               return No_Sym
            end


         when 597
            if @ch=='O'
               state=598
            else
               return No_Sym
            end


         when 598
            if @ch=='N'
               state=599
            else
               return No_Sym
            end


         when 599
            return C_ENDMinusOFMinusSELECTIONSym
         when 604
            if @ch=='L'
               state=605
            else
               return No_Sym
            end


         when 605
            if @ch=='O'
               state=606
            else
               return No_Sym
            end


         when 606
            if @ch=='O'
               state=607
            else
               return No_Sym
            end


         when 607
            if @ch=='P'
               state=608
            else
               return No_Sym
            end


         when 608
            return C_STEPMinusLOOPSym
         when 615
            if @ch=='R'
               state=616
            else
               return No_Sym
            end


         when 616
            if @ch=='O'
               state=617
            else
               return No_Sym
            end


         when 617
            if @ch=='U'
               state=618
            else
               return No_Sym
            end


         when 618
            if @ch=='P'
               state=619
            else
               return No_Sym
            end


         when 619
            if @ch=='S'
               state=620
            else
               return No_Sym
            end


         when 620
            return C_FIELDMinusGROUPSSym
         when 627
            if @ch=='Y'
               state=628
            else
               return No_Sym
            end


         when 628
            if @ch=='M'
               state=629
            else
               return No_Sym
            end


         when 629
            if @ch=='B'
               state=630
            else
               return No_Sym
            end


         when 630
            if @ch=='O'
               state=631
            else
               return No_Sym
            end


         when 631
            if @ch=='L'
               state=632
            else
               return No_Sym
            end


         when 632
            if @ch=='S'
               state=633
            else
               return No_Sym
            end


         when 633
            return C_FIELDMinusSYMBOLSSym
         when 642
            if @ch=='P'
               state=643
            else
               return No_Sym
            end


         when 643
            if @ch=='O'
               state=644
            else
               return No_Sym
            end


         when 644
            if @ch=='O'
               state=645
            else
               return No_Sym
            end


         when 645
            if @ch=='L'
               state=646
            else
               return No_Sym
            end


         when 646
            return C_FUNCTIONMinusPOOLSym
         when 656
            if @ch=='I'
               state=657
            else
               return No_Sym
            end


         when 657
            if @ch=='D'
               state=658
            else
               return No_Sym
            end


         when 658
            return C_SHORTDUMPMinusIDSym
         when 665
            if @ch=='T'
               state=666
            else
               return No_Sym
            end


         when 666
            if @ch=='A'
               state=667
            else
               return No_Sym
            end


         when 667
            if @ch=='B'
               state=668
            else
               return No_Sym
            end


         when 668
            if @ch=='L'
               state=669
            else
               return No_Sym
            end


         when 669
            if @ch=='E'
               state=670
            else
               return No_Sym
            end


         when 670
            return C_FILTERMinusTABLESym
         when 673
            if @ch=='S'
               state=674
            else
               return No_Sym
            end


         when 674
            if @ch=='T'
               state=675
            else
               return No_Sym
            end


         when 675
            if @ch=='A'
               state=676
            else
               return No_Sym
            end


         when 676
            if @ch=='T'
               state=677
            else
               return No_Sym
            end


         when 677
            if @ch=='U'
               state=678
            else
               return No_Sym
            end


         when 678
            if @ch=='S'
               state=679
            else
               return No_Sym
            end


         when 679
            return C_PFMinusSTATUSSym
         when 685
            if @ch=='I'
               state=686
            else
               return No_Sym
            end


         when 686
            if @ch=='D'
               state=687
            else
               return No_Sym
            end


         when 687
            return C_MAJORMinusIDSym
         when 693
            if @ch=='I'
               state=694
            else
               return No_Sym
            end


         when 694
            if @ch=='D'
               state=695
            else
               return No_Sym
            end


         when 695
            return C_MINORMinusIDSym
         when 700
            if @ch=='T'
               state=701
            else
               return No_Sym
            end


         when 701
            if @ch=='O'
               state=702
            else
               return No_Sym
            end


         when 702
            if @ch=='-'
               state=703
            else
               return No_Sym
            end


         when 703
            if @ch=='H'
               state=704
            else
               return No_Sym
            end


         when 704
            if @ch=='E'
               state=705
            else
               return No_Sym
            end


         when 705
            if @ch=='X'
               state=706
            else
               return No_Sym
            end


         when 706
            return C_CHARMinusTOMinusHEXSym
         when 712
            if @ch=='P'
               state=713
            else
               return No_Sym
            end


         when 713
            if @ch=='O'
               state=714
            else
               return No_Sym
            end


         when 714
            if @ch=='I'
               state=715
            else
               return No_Sym
            end


         when 715
            if @ch=='N'
               state=716
            else
               return No_Sym
            end


         when 716
            if @ch=='T'
               state=717
            else
               return No_Sym
            end


         when 717
            return C_FIXEDMinusPOINTSym
         when 727
            if @ch=='P'
               state=728
            else
               return No_Sym
            end


         when 728
            if @ch=='O'
               state=729
            else
               return No_Sym
            end


         when 729
            if @ch=='O'
               state=730
            else
               return No_Sym
            end


         when 730
            if @ch=='L'
               state=731
            else
               return No_Sym
            end


         when 731
            return C_INTERFACEMinusPOOLSym
         when 736
            if @ch=='P'
               state=737
            else
               return No_Sym
            end


         when 737
            if @ch=='R'
               state=738
            else
               return No_Sym
            end


         when 738
            if @ch=='O'
               state=739
            else
               return No_Sym
            end


         when 739
            if @ch=='C'
               state=740
            else
               return No_Sym
            end


         when 740
            if @ch=='E'
               state=741
            else
               return No_Sym
            end


         when 741
            if @ch=='S'
               state=742
            else
               return No_Sym
            end


         when 742
            if @ch=='S'
               state=743
            else
               return No_Sym
            end


         when 743
            if @ch=='I'
               state=744
            else
               return No_Sym
            end


         when 744
            if @ch=='N'
               state=745
            else
               return No_Sym
            end


         when 745
            if @ch=='G'
               state=746
            else
               return No_Sym
            end


         when 746
            return C_LISTMinusPROCESSINGSym
         when 751
            if @ch=='O'
               state=752
            else
               return No_Sym
            end


         when 752
            if @ch=='F'
               state=753
            else
               return No_Sym
            end


         when 753
            if @ch=='-'
               state=754
            else
               return No_Sym
            end


         when 754
            if @ch=='P'
               state=755
            else
               return No_Sym
            end


         when 755
            if @ch=='R'
               state=756
            else
               return No_Sym
            end


         when 756
            if @ch=='O'
               state=757
            else
               return No_Sym
            end


         when 757
            if @ch=='G'
               state=758
            else
               return No_Sym
            end


         when 758
            if @ch=='R'
               state=759
            else
               return No_Sym
            end


         when 759
            if @ch=='A'
               state=760
            else
               return No_Sym
            end


         when 760
            if @ch=='M'
               state=761
            else
               return No_Sym
            end


         when 761
            return C_LOADMinusOFMinusPROGRAMSym
         when 765
            if @ch=='P'
               state=766
            else
               return No_Sym
            end


         when 766
            if @ch=='O'
               state=767
            else
               return No_Sym
            end


         when 767
            if @ch=='I'
               state=768
            else
               return No_Sym
            end


         when 768
            if @ch=='N'
               state=769
            else
               return No_Sym
            end


         when 769
            if @ch=='T'
               state=770
            else
               return No_Sym
            end


         when 770
            return C_LOGMinusPOINTSym
         when 779
            if @ch=='C'
               state=780
            else
               return No_Sym
            end


         when 780
            if @ch=='O'
               state=781
            else
               return No_Sym
            end


         when 781
            if @ch=='R'
               state=782
            else
               return No_Sym
            end


         when 782
            if @ch=='R'
               state=783
            else
               return No_Sym
            end


         when 783
            if @ch=='E'
               state=784
            else
               return No_Sym
            end


         when 784
            if @ch=='S'
               state=785
            else
               return No_Sym
            end


         when 785
            if @ch=='P'
               state=786
            else
               return No_Sym
            end


         when 786
            if @ch=='O'
               state=787
            else
               return No_Sym
            end


         when 787
            if @ch=='N'
               state=788
            else
               return No_Sym
            end


         when 788
            if @ch=='D'
               state=789
            else
               return No_Sym
            end


         when 789
            if @ch=='I'
               state=790
            else
               return No_Sym
            end


         when 790
            if @ch=='N'
               state=791
            else
               return No_Sym
            end


         when 791
            if @ch=='G'
               state=792
            else
               return No_Sym
            end


         when 792
            return C_MULTIPLYMinusCORRESPONDINGSym
         when 797
            if @ch=='I'
               state=798
            else
               return No_Sym
            end


         when 798
            if @ch=='N'
               state=799
            else
               return No_Sym
            end


         when 799
            if @ch=='E'
               state=800
            else
               return No_Sym
            end


         when 800
            return C_NEWMinusLINESym
         when 805
            if @ch=='R'
               state=806
            else
               return No_Sym
            end


         when 806
            if @ch=='O'
               state=807
            else
               return No_Sym
            end


         when 807
            if @ch=='L'
               state=808
            else
               return No_Sym
            end


         when 808
            if @ch=='L'
               state=809
            else
               return No_Sym
            end


         when 809
            if @ch=='I'
               state=810
            else
               return No_Sym
            end


         when 810
            if @ch=='N'
               state=811
            else
               return No_Sym
            end


         when 811
            if @ch=='G'
               state=812
            else
               return No_Sym
            end


         when 812
            return C_NOMinusSCROLLINGSym
         when 817
            if @ch=='A'
               state=818
            else
               return No_Sym
            end


         when 818
            if @ch=='G'
               state=819
            else
               return No_Sym
            end


         when 819
            if @ch=='E'
               state=820
            else
               return No_Sym
            end


         when 820
            return C_NEWMinusPAGESym
         when 826
            if @ch=='I'
               state=827
            else
               return No_Sym
            end


         when 827
            if @ch=='T'
               state=828
            else
               return No_Sym
            end


         when 828
            if @ch=='L'
               state=829
            else
               return No_Sym
            end


         when 829
            if @ch=='E'
               state=830
            else
               return No_Sym
            end


         when 830
            return C_WITHMinusTITLESym
         when 835
            if @ch=='T'
               state=836
            else
               return No_Sym
            end


         when 836
            if @ch=='L'
               state=837
            else
               return No_Sym
            end


         when 837
            if @ch=='E'
               state=838
            else
               return No_Sym
            end


         when 838
            return C_NOMinusTITLESym
         when 844
            if @ch=='E'
               state=845
            else
               return No_Sym
            end


         when 845
            if @ch=='A'
               state=846
            else
               return No_Sym
            end


         when 846
            if @ch=='D'
               state=847
            else
               return No_Sym
            end


         when 847
            if @ch=='I'
               state=848
            else
               return No_Sym
            end


         when 848
            if @ch=='N'
               state=849
            else
               return No_Sym
            end


         when 849
            if @ch=='G'
               state=850
            else
               return No_Sym
            end


         when 850
            return C_WITHMinusHEADINGSym
         when 854
            if @ch=='E'
               state=855
            else
               return No_Sym
            end


         when 855
            if @ch=='A'
               state=856
            else
               return No_Sym
            end


         when 856
            if @ch=='D'
               state=857
            else
               return No_Sym
            end


         when 857
            if @ch=='I'
               state=858
            else
               return No_Sym
            end


         when 858
            if @ch=='N'
               state=859
            else
               return No_Sym
            end


         when 859
            if @ch=='G'
               state=860
            else
               return No_Sym
            end


         when 860
            return C_NOMinusHEADINGSym
         when 865
            if @ch=='P'
               state=866
            else
               return No_Sym
            end


         when 866
            if @ch=='O'
               state=867
            else
               return No_Sym
            end


         when 867
            if @ch=='F'
               state=868
            else
               return No_Sym
            end


         when 868
            if @ch=='P'
               state=869
            else
               return No_Sym
            end


         when 869
            if @ch=='A'
               state=870
            else
               return No_Sym
            end


         when 870
            if @ch=='G'
               state=871
            else
               return No_Sym
            end


         when 871
            if @ch=='E'
               state=872
            else
               return No_Sym
            end


         when 872
            return C_NOMinusTOPOFPAGESym
         when 877
            if @ch=='E'
               state=878
            else
               return No_Sym
            end


         when 878
            if @ch=='C'
               state=879
            else
               return No_Sym
            end


         when 879
            if @ch=='T'
               state=880
            else
               return No_Sym
            end


         when 880
            if @ch=='I'
               state=881
            else
               return No_Sym
            end


         when 881
            if @ch=='O'
               state=882
            else
               return No_Sym
            end


         when 882
            if @ch=='N'
               state=883
            else
               return No_Sym
            end


         when 883
            return C_NEWMinusSECTIONSym
         when 887
            if @ch=='I'
               state=888
            else
               return No_Sym
            end


         when 888
            if @ch=='S'
               state=889
            else
               return No_Sym
            end


         when 889
            if @ch=='P'
               state=890
            else
               return No_Sym
            end


         when 890
            if @ch=='L'
               state=891
            else
               return No_Sym
            end


         when 891
            if @ch=='A'
               state=892
            else
               return No_Sym
            end


         when 892
            if @ch=='Y'
               state=893
            else
               return No_Sym
            end


         when 893
            return C_NOMinusDISPLAYSym
         when 898
            if @ch=='C'
               state=899
            else
               return No_Sym
            end


         when 899
            if @ch=='O'
               state=900
            else
               return No_Sym
            end


         when 900
            if @ch=='M'
               state=901
            else
               return No_Sym
            end


         when 901
            if @ch=='M'
               state=902
            else
               return No_Sym
            end


         when 902
            if @ch=='A'
               state=903
            else
               return No_Sym
            end


         when 903
            if @ch=='N'
               state=904
            else
               return No_Sym
            end


         when 904
            if @ch=='D'
               state=905
            else
               return No_Sym
            end


         when 905
            return C_USERMinusCOMMANDSym
         when 911
            if @ch=='E'
               state=912
            else
               return No_Sym
            end


         when 912
            if @ch=='Q'
               state=913
            else
               return No_Sym
            end


         when 913
            if @ch=='U'
               state=914
            else
               return No_Sym
            end


         when 914
            if @ch=='E'
               state=915
            else
               return No_Sym
            end


         when 915
            if @ch=='S'
               state=916
            else
               return No_Sym
            end


         when 916
            if @ch=='T'
               state=917
            else
               return No_Sym
            end


         when 917
            return C_HELPMinusREQUESTSym
         when 923
            if @ch=='R'
               state=924
            else
               return No_Sym
            end


         when 924
            if @ch=='E'
               state=925
            else
               return No_Sym
            end


         when 925
            if @ch=='Q'
               state=926
            else
               return No_Sym
            end


         when 926
            if @ch=='U'
               state=927
            else
               return No_Sym
            end


         when 927
            if @ch=='E'
               state=928
            else
               return No_Sym
            end


         when 928
            if @ch=='S'
               state=929
            else
               return No_Sym
            end


         when 929
            if @ch=='T'
               state=930
            else
               return No_Sym
            end


         when 930
            return C_VALUEMinusREQUESTSym
         when 936
            if @ch=='C'
               state=937
            else
               return No_Sym
            end


         when 937
            if @ch=='O'
               state=938
            else
               return No_Sym
            end


         when 938
            if @ch=='N'
               state=939
            else
               return No_Sym
            end


         when 939
            if @ch=='T'
               state=940
            else
               return No_Sym
            end


         when 940
            if @ch=='R'
               state=941
            else
               return No_Sym
            end


         when 941
            if @ch=='O'
               state=942
            else
               return No_Sym
            end


         when 942
            if @ch=='L'
               state=943
            else
               return No_Sym
            end


         when 943
            return C_PRINTMinusCONTROLSym
         when 949
            if @ch=='L'
               state=950
            else
               return No_Sym
            end


         when 950
            if @ch=='I'
               state=951
            else
               return No_Sym
            end


         when 951
            if @ch=='N'
               state=952
            else
               return No_Sym
            end


         when 952
            if @ch=='E'
               state=953
            else
               return No_Sym
            end


         when 953
            return C_INDEXMinusLINESym
         when 960
            if @ch=='O'
               state=961
            else
               return No_Sym
            end


         when 961
            if @ch=='P'
               state=962
            else
               return No_Sym
            end


         when 962
            if @ch=='T'
               state=963
            else
               return No_Sym
            end


         when 963
            if @ch=='I'
               state=964
            else
               return No_Sym
            end


         when 964
            if @ch=='O'
               state=965
            else
               return No_Sym
            end


         when 965
            if @ch=='N'
               state=966
            else
               return No_Sym
            end


         when 966
            if @ch=='S'
               state=967
            else
               return No_Sym
            end


         when 967
            return C_SELECTMinusOPTIONSSym
         when 971
            if @ch=='X'
               state=972
            else
               return No_Sym
            end


         when 972
            if @ch=='T'
               state=973
            else
               return No_Sym
            end


         when 973
            if @ch=='E'
               state=974
            else
               return No_Sym
            end


         when 974
            if @ch=='N'
               state=975
            else
               return No_Sym
            end


         when 975
            if @ch=='S'
               state=976
            else
               return No_Sym
            end


         when 976
            if @ch=='I'
               state=977
            else
               return No_Sym
            end


         when 977
            if @ch=='O'
               state=978
            else
               return No_Sym
            end


         when 978
            if @ch=='N'
               state=979
            else
               return No_Sym
            end


         when 979
            return C_NOMinusEXTENSIONSym
         when 986
            if @ch=='B'
               state=987
            else
               return No_Sym
            end


         when 987
            if @ch=='O'
               state=988
            else
               return No_Sym
            end


         when 988
            if @ch=='U'
               state=989
            else
               return No_Sym
            end


         when 989
            if @ch=='N'
               state=990
            else
               return No_Sym
            end


         when 990
            if @ch=='D'
               state=991
            else
               return No_Sym
            end


         when 991
            if @ch=='A'
               state=992
            else
               return No_Sym
            end


         when 992
            if @ch=='R'
               state=993
            else
               return No_Sym
            end


         when 993
            if @ch=='Y'
               state=994
            else
               return No_Sym
            end


         when 994
            return C_SCROLLMinusBOUNDARYSym
         when 1003
            if @ch=='C'
               state=1004
            else
               return No_Sym
            end


         when 1004
            if @ch=='O'
               state=1005
            else
               return No_Sym
            end


         when 1005
            if @ch=='R'
               state=1006
            else
               return No_Sym
            end


         when 1006
            if @ch=='R'
               state=1007
            else
               return No_Sym
            end


         when 1007
            if @ch=='E'
               state=1008
            else
               return No_Sym
            end


         when 1008
            if @ch=='S'
               state=1009
            else
               return No_Sym
            end


         when 1009
            if @ch=='P'
               state=1010
            else
               return No_Sym
            end


         when 1010
            if @ch=='O'
               state=1011
            else
               return No_Sym
            end


         when 1011
            if @ch=='N'
               state=1012
            else
               return No_Sym
            end


         when 1012
            if @ch=='D'
               state=1013
            else
               return No_Sym
            end


         when 1013
            if @ch=='I'
               state=1014
            else
               return No_Sym
            end


         when 1014
            if @ch=='N'
               state=1015
            else
               return No_Sym
            end


         when 1015
            if @ch=='G'
               state=1016
            else
               return No_Sym
            end


         when 1016
            return C_SUBTRACTMinusCORRESPONDINGSym
         when 1023
            if @ch=='C'
               state=1024
            else
               return No_Sym
            end


         when 1024
            if @ch=='H'
               state=1025
            else
               return No_Sym
            end


         when 1025
            if @ch=='E'
               state=1026
            else
               return No_Sym
            end


         when 1026
            if @ch=='C'
               state=1027
            else
               return No_Sym
            end


         when 1027
            if @ch=='K'
               state=1028
            else
               return No_Sym
            end


         when 1028
            return C_SYNTAXMinusCHECKSym
         when 1034
            if @ch=='N'
               state=1035
            else
               return No_Sym
            end


         when 1035
            if @ch=='J'
               state=1036
            else
               return No_Sym
            end


         when 1036
            if @ch=='E'
               state=1037
            else
               return No_Sym
            end


         when 1037
            if @ch=='C'
               state=1038
            else
               return No_Sym
            end


         when 1038
            if @ch=='T'
               state=1039
            else
               return No_Sym
            end


         when 1039
            if @ch=='I'
               state=1040
            else
               return No_Sym
            end


         when 1040
            if @ch=='O'
               state=1041
            else
               return No_Sym
            end


         when 1041
            if @ch=='N'
               state=1042
            else
               return No_Sym
            end


         when 1042
            return C_TESTMinusINJECTIONSym
         when 1052
            if @ch=='N'
               state=1053
            else
               return No_Sym
            end


         when 1053
            if @ch=='J'
               state=1054
            else
               return No_Sym
            end


         when 1054
            if @ch=='E'
               state=1055
            else
               return No_Sym
            end


         when 1055
            if @ch=='C'
               state=1056
            else
               return No_Sym
            end


         when 1056
            if @ch=='T'
               state=1057
            else
               return No_Sym
            end


         when 1057
            if @ch=='I'
               state=1058
            else
               return No_Sym
            end


         when 1058
            if @ch=='O'
               state=1059
            else
               return No_Sym
            end


         when 1059
            if @ch=='N'
               state=1060
            else
               return No_Sym
            end


         when 1060
            return C_ENDMinusTESTMinusINJECTIONSym
         when 1066
            if @ch=='E'
               state=1067
            else
               return No_Sym
            end


         when 1067
            if @ch=='A'
               state=1068
            else
               return No_Sym
            end


         when 1068
            if @ch=='M'
               state=1069
            else
               return No_Sym
            end


         when 1069
            return C_TESTMinusSEAMSym
         when 1079
            if @ch=='E'
               state=1080
            else
               return No_Sym
            end


         when 1080
            if @ch=='A'
               state=1081
            else
               return No_Sym
            end


         when 1081
            if @ch=='M'
               state=1082
            else
               return No_Sym
            end


         when 1082
            return C_ENDMinusTESTMinusSEAMSym
         when 1087
            if @ch=='F'
               state=1088
            else
               return No_Sym
            end


         when 1088
            if @ch=='-'
               state=1089
            else
               return No_Sym
            end


         when 1089
            if @ch=='P'
               state=1090
            else
               return No_Sym
            end


         when 1090
            if @ch=='A'
               state=1091
            else
               return No_Sym
            end


         when 1091
            if @ch=='G'
               state=1092
            else
               return No_Sym
            end


         when 1092
            if @ch=='E'
               state=1093
            else
               return No_Sym
            end


         when 1093
            return C_TOPMinusOFMinusPAGESym
         when 1100
            if @ch=='L'
               state=1101
            else
               return No_Sym
            end


         when 1101
            if @ch=='E'
               state=1102
            else
               return No_Sym
            end


         when 1102
            if @ch=='C'
               state=1103
            else
               return No_Sym
            end


         when 1103
            if @ch=='T'
               state=1104
            else
               return No_Sym
            end


         when 1104
            if @ch=='I'
               state=1105
            else
               return No_Sym
            end


         when 1105
            if @ch=='O'
               state=1106
            else
               return No_Sym
            end


         when 1106
            if @ch=='N'
               state=1107
            else
               return No_Sym
            end


         when 1107
            return C_LINEMinusSELECTIONSym
         when 1126
            return C_TYPEMinusPOOLSSym
         when 1127
            if @ch=='|'
               state=1128
            else
               if @ch=='='
                  state=1189
               else
                  return C_BarSym
               end

            end


         when 1128
            return C_BarBarSym
         when 1129
            if @ch=='&'
               state=1130
            else
               if @ch=='='
                  state=1187
               else
                  return C_AndSym
               end

            end


         when 1130
            return C_AndAndSym
         when 1131
            if @ch=='='
               state=1188
            else
               return C_UparrowSym
            end


         when 1132
            return C_LessGreaterSym
         when 1133
            return C_LessEqualSym
         when 1134
            return C_GreaterEqualSym
         when 1141
            return C_BYTEMinusCOSym
         when 1148
            return C_BYTEMinusCNSym
         when 1155
            return C_BYTEMinusCASym
         when 1162
            return C_BYTEMinusNASym
         when 1169
            return C_BYTEMinusCSSym
         when 1176
            return C_BYTEMinusNSSym
         when 1177
            if @ch=='='
               state=1190
            else
               return C_LessLessSym
            end


         when 1178
            if @ch=='='
               state=1191
            else
               return C_GreaterGreaterSym
            end


         when 1179
            if @ch=='='
               state=1184
            else
               return C_PercentSym
            end


         when 1180
            return C_PlusPlusSym
         when 1181
            return C_MinusMinusSym
         when 1182
            return C_StarEqualSym
         when 1183
            return C_SlashEqualSym
         when 1184
            return C_PercentEqualSym
         when 1185
            return C_PlusEqualSym
         when 1186
            return C_MinusEqualSym
         when 1187
            return C_AndEqualSym
         when 1188
            return C_UparrowEqualSym
         when 1189
            return C_BarEqualSym
         when 1190
            return C_LessLessEqualSym
         when 1191
            return C_GreaterGreaterEqualSym
         when 1192
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1212
               else
                  if @ch=='E'
                     state=1213
                  else
                     if @ch=='O'
                        state=1214
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end

            end


         when 1193
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='L'||@ch=='N'||@ch>='P'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1215
               else
                  if @ch=='O'
                     state=1216
                  else
                     if @ch=='M'
                        state=1217
                     else
                        if @ch=='A'
                           state=1218
                        else
                           if @ch=='I'
                              state=1219
                           else
                              if @ch=='U'
                                 state=1220
                              else
                                 return CheckLiteral(C_identifierSym)
                              end

                           end

                        end

                     end

                  end

               end

            end


         when 1194
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1221
               else
                  if @ch=='E'
                     state=1222
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1195
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1223
               else
                  if @ch=='I'
                     state=1224
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1196
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1225
               else
                  if @ch=='I'
                     state=1226
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1197
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1227
               else
                  if @ch=='D'
                     state=1228
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1198
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1229
               else
                  if @ch=='S'
                     state=1230
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1199
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='Y'
                  state=1231
               else
                  if @ch=='R'
                     state=1232
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1200
            if @ch>='0'&&@ch<='9'||@ch=='B'||@ch=='D'||@ch>='F'&&@ch<='G'||@ch>='I'&&@ch<='S'||@ch>='V'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1233
               else
                  if @ch=='A'
                     state=1234
                  else
                     if @ch=='T'
                        state=1235
                     else
                        if @ch=='H'
                           state=1236
                        else
                           if @ch=='C'
                              state=1237
                           else
                              if @ch=='U'
                                 state=1238
                              else
                                 if @ch=='Y'
                                    state=1239
                                 else
                                    return CheckLiteral(C_identifierSym)
                                 end

                              end

                           end

                        end

                     end

                  end

               end

            end


         when 1201
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='E'||@ch>='G'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1240
               else
                  if @ch=='F'
                     state=1241
                  else
                     if @ch=='R'
                        state=1242
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end

            end


         when 1202
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='M'||@ch>='O'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='X'
                  state=1243
               else
                  if @ch=='N'
                     state=1244
                  else
                     if @ch=='D'
                        state=1245
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end

            end


         when 1203
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='K'||@ch>='M'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1246
               else
                  if @ch=='U'
                     state=1247
                  else
                     if @ch=='H'
                        state=1248
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end

            end


         when 1204
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1249
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1205
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1250
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1206
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1251
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1207
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1252
               else
                  if @ch=='U'
                     state=1253
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1208
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='N'||@ch>='P'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1254
               else
                  if @ch=='I'
                     state=1255
                  else
                     if @ch=='E'
                        state=1256
                     else
                        if @ch=='Y'
                           state=1257
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end

            end


         when 1209
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1258
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1210
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1259
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1211
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1260
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1212
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1261
               else
                  if @ch=='S'
                     state=1262
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1213
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='F'
                  state=1263
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1214
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1264
               else
                  if @ch=='G'
                     state=1265
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1215
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1266
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1216
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='U'||@ch>='W'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='V'
                  state=1267
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1217
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='/'
                  state=1268
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1218
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='I'||@ch>='K'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='J'
                  state=1269
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1219
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1270
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1220
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1271
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1221
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1272
               else
                  if @ch=='-'
                     state=1273
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1222
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='V'||@ch>='X'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='W'
                  state=1274
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1223
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1275
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1224
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='G'
                  state=1276
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1225
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='/'
                  state=1277
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1226
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='U'||@ch>='W'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='V'
                  state=1278
               else
                  if @ch=='S'
                     state=1279
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1227
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1280
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1228
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1281
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1229
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='F'
                  state=1282
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1230
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1283
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1231
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1284
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1232
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1285
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1233
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1286
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1234
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1287
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1235
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1288
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1236
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1289
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1237
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1290
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1238
            if @ch>='0'&&@ch<='9'||@ch=='A'||@ch>='C'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='B'
                  state=1291
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1239
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1292
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1240
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1293
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1241
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=673
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1242
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1294
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1243
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='C'
                  state=1295
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1244
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1296
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1245
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1297
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1246
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1298
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1247
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1299
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1248
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1300
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1249
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1301
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1250
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1302
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1251
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1303
               else
                  if @ch=='A'
                     state=1304
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1252
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='K'||@ch>='M'&&@ch<='Q'||@ch>='S'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1305
               else
                  if @ch=='E'
                     state=1306
                  else
                     if @ch=='L'
                        state=1307
                     else
                        if @ch=='X'
                           state=1308
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end

            end


         when 1253
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1309
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1254
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1310
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1255
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1311
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1256
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1312
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1257
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1313
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1258
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1314
               else
                  if @ch=='D'
                     state=1315
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1259
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1316
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1260
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1317
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1261
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1318
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1262
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1319
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1263
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1320
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1264
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1321
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1265
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=765
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1266
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1322
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1267
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1323
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1268
            if @ch=='D'
               state=1324
            else
               return No_Sym
            end


         when 1269
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1325
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1270
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1326
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1271
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1327
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1272
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1328
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1273
            if @ch=='G'
               state=1329
            else
               if @ch=='S'
                  state=1330
               else
                  if @ch=='Z'
                     state=172
                  else
                     if @ch=='T'
                        state=1331
                     else
                        if @ch=='H'
                           state=854
                        else
                           if @ch=='D'
                              state=887
                           else
                              if @ch=='E'
                                 state=971
                              else
                                 return No_Sym
                              end

                           end

                        end

                     end

                  end

               end

            end


         when 1274
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1332
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1275
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1333
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1276
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='H'
                  state=1334
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1277
            if @ch=='M'
               state=1335
            else
               return No_Sym
            end


         when 1278
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1336
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1279
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1337
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1280
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='H'
                  state=1338
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1281
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=367
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1282
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=230
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1283
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1339
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1284
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1340
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1285
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1341
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1286
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1342
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1287
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=314
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1288
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1343
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1289
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1344
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1290
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1345
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1291
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1346
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1292
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1347
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1293
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1348
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1294
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1349
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1295
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1350
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1296
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1351
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1297
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1352
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1298
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1353
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1299
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1354
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1300
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1355
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1301
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1356
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1302
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1357
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1303
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1358
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1304
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1359
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1305
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1360
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1306
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1361
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1307
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1362
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1308
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1363
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1309
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='C'
                  state=1364
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1310
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1365
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1311
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1366
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1312
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1367
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1313
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1368
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1314
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1369
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1315
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1370
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1316
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='H'
                  state=1371
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1317
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1372
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1318
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1373
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1319
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=736
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1320
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=126
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1321
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=751
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1322
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1374
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1323
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=78
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1324
            if @ch=='D'
               state=1375
            else
               return No_Sym
            end


         when 1325
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1376
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1326
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1377
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1327
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1378
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1328
            if @ch=='U'
               state=1379
            else
               return No_Sym
            end


         when 1329
            if @ch=='A'
               state=1380
            else
               if @ch=='R'
                  state=155
               else
                  return No_Sym
               end

            end


         when 1330
            if @ch=='I'
               state=166
            else
               if @ch=='C'
                  state=805
               else
                  return No_Sym
               end

            end


         when 1331
            if @ch=='I'
               state=835
            else
               if @ch=='O'
                  state=865
               else
                  return No_Sym
               end

            end


         when 1332
            if @ch=='L'
               state=797
            else
               if @ch=='P'
                  state=817
               else
                  if @ch=='S'
                     state=877
                  else
                     return No_Sym
                  end

               end

            end


         when 1333
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=109
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1334
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1381
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1335
            if @ch=='M'
               state=1382
            else
               return No_Sym
            end


         when 1336
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1383
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1337
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1384
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1338
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1385
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1339
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=898
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1340
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1386
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1341
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='J'||@ch>='L'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='K'
                  state=1387
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1342
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='C'
                  state=1388
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1343
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=604
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1344
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1389
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1345
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1390
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1346
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1391
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1347
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1392
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1348
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='M'
                  state=1393
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1349
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1394
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1350
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1395
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1351
            if @ch=='L'
               state=525
            else
               if @ch=='O'
                  state=1396
               else
                  if @ch=='T'
                     state=1397
                  else
                     return No_Sym
                  end

               end

            end


         when 1352
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1398
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1353
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='S'
                  state=1399
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1354
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1400
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1355
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=700
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1356
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1401
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1357
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1402
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1358
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1403
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1359
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=515
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1360
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1404
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1361
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1405
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1362
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1406
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1363
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1407
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1364
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1408
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1365
            if @ch=='L'
               state=495
            else
               if @ch=='O'
                  state=1087
               else
                  return No_Sym
               end

            end


         when 1366
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1409
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1367
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1410
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1368
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1411
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1369
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1412
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1370
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='X'
                  state=1413
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1371
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1414
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1372
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1415
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1373
            if @ch=='S'
               state=1416
            else
               if @ch=='C'
                  state=45
               else
                  return No_Sym
               end

            end


         when 1374
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='G'
                  state=1417
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1375
            if @ch=='/'
               state=1418
            else
               return No_Sym
            end


         when 1376
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=685
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1377
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=693
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1378
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1419
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1379
            if @ch=='N'
               state=1420
            else
               return No_Sym
            end


         when 1380
            if @ch=='P'
               state=1421
            else
               return No_Sym
            end


         when 1381
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=141
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1382
            if @ch=='/'
               state=1422
            else
               return No_Sym
            end


         when 1383
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1423
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1384
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1424
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1385
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1425
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1386
            if @ch=='O'
               state=237
            else
               if @ch=='C'
                  state=1426
               else
                  if @ch=='N'
                     state=1427
                  else
                     return No_Sym
                  end

               end

            end


         when 1387
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=389
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1388
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1428
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1389
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='D'
                  state=1429
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1390
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1430
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1391
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1431
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1392
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='X'
                  state=1432
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1393
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1433
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1394
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=936
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1395
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1434
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1396
            if @ch=='F'
               state=1435
            else
               return No_Sym
            end


         when 1397
            if @ch=='E'
               state=1436
            else
               return No_Sym
            end


         when 1398
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1437
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1399
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1438
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1400
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='M'
                  state=1439
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1401
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=417
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1402
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1440
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1403
            if @ch=='I'
               state=479
            else
               if @ch=='R'
                  state=911
               else
                  return No_Sym
               end

            end


         when 1404
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=486
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1405
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1441
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1406
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1442
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1407
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=712
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1408
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1443
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1409
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=505
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1410
            if @ch=='I'
               state=1034
            else
               if @ch=='S'
                  state=1066
               else
                  return No_Sym
               end

            end


         when 1411
            if @ch=='P'
               state=1444
            else
               return No_Sym
            end


         when 1412
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='F'
                  state=1445
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1413
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=949
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1414
            if @ch=='T'
               state=826
            else
               if @ch=='H'
                  state=844
               else
                  return No_Sym
               end

            end


         when 1415
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=923
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1416
            if @ch=='I'
               state=37
            else
               if @ch=='E'
                  state=1100
               else
                  return No_Sym
               end

            end


         when 1417
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1446
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1418
            if @ch=='Y'
               state=1447
            else
               return No_Sym
            end


         when 1419
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='L'
                  state=1448
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1420
            if @ch=='I'
               state=1449
            else
               return No_Sym
            end


         when 1421
            if @ch=='S'
               state=460
            else
               return C_NOMinusGAPSym
            end


         when 1422
            if @ch=='Y'
               state=1450
            else
               return No_Sym
            end


         when 1423
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=536
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1424
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='Y'
                  state=1451
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1425
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1452
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1426
            if @ch=='O'
               state=1141
            else
               if @ch=='N'
                  state=1148
               else
                  if @ch=='A'
                     state=1155
                  else
                     if @ch=='S'
                        state=1169
                     else
                        return No_Sym
                     end

                  end

               end

            end


         when 1427
            if @ch=='A'
               state=1162
            else
               if @ch=='S'
                  state=1176
               else
                  return No_Sym
               end

            end


         when 1428
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1453
               else
                  if @ch=='-'
                     state=960
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end

            end


         when 1429
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='U'
                  state=1454
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1430
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=986
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1431
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='C'
                  state=1455
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1432
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1023
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1433
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1456
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1434
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='I'
                  state=1457
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1435
            if @ch=='-'
               state=1458
            else
               return No_Sym
            end


         when 1436
            if @ch=='S'
               state=1459
            else
               return No_Sym
            end


         when 1437
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=556
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1438
            if @ch=='M'
               state=357
            else
               if @ch=='D'
                  state=428
               else
                  if @ch=='E'
                     state=438
                  else
                     if @ch=='P'
                        state=450
                     else
                        return No_Sym
                     end

                  end

               end

            end


         when 1439
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1460
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1440
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=467
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1441
            if @ch=='G'
               state=615
            else
               if @ch=='S'
                  state=627
               else
                  return No_Sym
               end

            end


         when 1442
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=665
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1443
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1461
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1444
            if @ch=='O'
               state=1462
            else
               return No_Sym
            end


         when 1445
            if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='A'
                  state=1463
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1446
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=57
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1447
            if @ch=='Y'
               state=1464
            else
               return No_Sym
            end


         when 1448
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='Y'
                  state=1465
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1449
            if @ch=='Q'
               state=102
            else
               if @ch=='C'
                  state=249
               else
                  return No_Sym
               end

            end


         when 1450
            if @ch=='Y'
               state=1466
            else
               return No_Sym
            end


         when 1451
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=568
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1452
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1467
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1453
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1468
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1454
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='M'
                  state=1469
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1455
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='T'
                  state=1470
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1456
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1471
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1457
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='O'
                  state=1472
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1458
            if @ch=='P'
               state=580
            else
               if @ch=='S'
                  state=591
               else
                  return No_Sym
               end

            end


         when 1459
            if @ch=='T'
               state=1473
            else
               return No_Sym
            end


         when 1460
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1474
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1461
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1475
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1462
            if @ch=='O'
               state=1476
            else
               return No_Sym
            end


         when 1463
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='C'
                  state=1477
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1464
            if @ch=='Y'
               state=210
            else
               return C_MMSlashDDSlashYYSym
            end


         when 1465
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=779
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1466
            if @ch=='Y'
               state=200
            else
               return C_DDSlashMMSlashYYSym
            end


         when 1467
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='Y'
                  state=1478
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1468
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1479
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1469
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='P'
                  state=1480
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1470
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1003
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1471
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='R'
                  state=1481
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1472
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='N'
                  state=1482
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1473
            if @ch=='-'
               state=1483
            else
               return No_Sym
            end


         when 1474
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=403
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1475
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=642
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1476
            if @ch=='L'
               state=1484
            else
               return No_Sym
            end


         when 1477
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='E'
                  state=1485
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1478
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=221
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1479
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=1486
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1480
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=656
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1481
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=330
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1482
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=345
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1483
            if @ch=='I'
               state=1052
            else
               if @ch=='S'
                  state=1079
               else
                  return No_Sym
               end

            end


         when 1484
            if @ch=='S'
               state=1126
            else
               return C_TYPEMinusPOOLSym
            end


         when 1485
            if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
               state=2
            else
               if @ch=='-'
                  state=727
               else
                  return CheckLiteral(C_identifierSym)
               end

            end


         when 1486
            if @ch=='S'
               state=1487
            else
               if @ch=='T'
                  state=306
               else
                  return No_Sym
               end

            end


         when 1487
            if @ch=='C'
               state=264
            else
               if @ch=='E'
                  state=1488
               else
                  return No_Sym
               end

            end


         when 1488
            if @ch=='T'
               state=1489
            else
               return No_Sym
            end


         when 1489
            if @ch=='S'
               state=295
            else
               return C_SELECTIONMinusSETSym
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
               if @ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  return C_BangSym
               end


            when 2
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

               else
                  return CheckLiteral(C_identifierSym)
               end


            when 3
               if @ch=='U'
                  state=4
               else
                  if @ch=='u'
                     state=5
                  else
                     if @ch=='L'
                        state=6
                     else
                        if @ch=='l'
                           state=7
                        else
                           if @ch>='0'&&@ch<='9'

                           else
                              return C_numberSym
                           end

                        end

                     end

                  end

               end


            when 4
               return C_numberSym
            when 5
               return C_numberSym
            when 6
               return C_numberSym
            when 7
               return C_numberSym
            when 9
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
                  state=10
               else
                  return No_Sym
               end


            when 10
               if @ch=='U'
                  state=11
               else
                  if @ch=='u'
                     state=12
                  else
                     if @ch=='L'
                        state=13
                     else
                        if @ch=='l'
                           state=14
                        else
                           if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                           else
                              return C_hexnumberSym
                           end

                        end

                     end

                  end

               end


            when 11
               return C_hexnumberSym
            when 12
               return C_hexnumberSym
            when 13
               return C_hexnumberSym
            when 14
               return C_hexnumberSym
            when 15
               if @ch==39
                  state=16
               else
                  if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<=255

                  else
                     return No_Sym
                  end

               end


            when 16
               return C_stringD1Sym
            when 17
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='['||@ch>=']'&&@ch<=255
                  state=19
               else
                  if @ch==92
                     state=26
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
               return C_ColonSym
            when 22
               return C_spaceD1Sym
            when 23
               if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
                  state=24
               else
                  return No_Sym
               end


            when 24
               return C_PreProcessorSym
            when 25
               if @ch=='U'
                  state=4
               else
                  if @ch=='u'
                     state=5
                  else
                     if @ch=='L'
                        state=6
                     else
                        if @ch=='l'
                           state=7
                        else
                           if @ch>='0'&&@ch<='9'
                              state=3
                           else
                              if @ch=='X'||@ch=='x'
                                 state=9
                              else
                                 return C_numberSym
                              end

                           end

                        end

                     end

                  end

               end


            when 26
               if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<=255
                  state=19
               else
                  if @ch=='"'
                     state=20
                  else
                     return No_Sym
                  end

               end


            when 27
               return C_LparenSym
            when 28
               return C_RparenSym
            when 29
               if @ch=='>'
                  state=1132
               else
                  if @ch=='='
                     state=1133
                  else
                     if @ch=='<'
                        state=1177
                     else
                        return C_LessSym
                     end

                  end

               end


            when 30
               if @ch=='='
                  state=1134
               else
                  if @ch=='>'
                     state=1178
                  else
                     return C_GreaterSym
                  end

               end


            when 37
               if @ch=='Z'
                  state=38
               else
                  return No_Sym
               end


            when 38
               if @ch=='E'
                  state=39
               else
                  return No_Sym
               end


            when 39
               return C_LINEMinusSIZESym
            when 45
               if @ch=='O'
                  state=46
               else
                  return No_Sym
               end


            when 46
               if @ch=='U'
                  state=47
               else
                  return No_Sym
               end


            when 47
               if @ch=='N'
                  state=48
               else
                  return No_Sym
               end


            when 48
               if @ch=='T'
                  state=49
               else
                  return No_Sym
               end


            when 49
               return C_LINEMinusCOUNTSym
            when 57
               if @ch=='I'
                  state=58
               else
                  return No_Sym
               end


            when 58
               if @ch=='D'
                  state=59
               else
                  return No_Sym
               end


            when 59
               return C_MESSAGEMinusIDSym
            when 60
               return C_PointSym
            when 61
               if @ch=='*'
                  state=115
               else
                  if @ch=='='
                     state=1182
                  else
                     return C_StarSym
                  end

               end


            when 62
               return C_CommaSym
            when 63
               if @ch=='*'
                  state=64
               else
                  return C_TildeSym
               end


            when 64
               return C_TildeStarSym
            when 65
               if @ch=='D'
                  state=66
               else
                  return C_AtSym
               end


            when 66
               if @ch=='A'
                  state=67
               else
                  return No_Sym
               end


            when 67
               if @ch=='T'
                  state=68
               else
                  return No_Sym
               end


            when 68
               if @ch=='A'
                  state=69
               else
                  return No_Sym
               end


            when 69
               return C_AtDATASym
            when 70
               if @ch=='+'
                  state=1180
               else
                  if @ch=='='
                     state=1185
                  else
                     return C_PlusSym
                  end

               end


            when 71
               if @ch=='T'
                  state=72
               else
                  return C_QuerySym
               end


            when 72
               if @ch=='O'
                  state=73
               else
                  return No_Sym
               end


            when 73
               return C_QueryTOSym
            when 78
               if @ch=='C'
                  state=79
               else
                  return No_Sym
               end


            when 79
               if @ch=='O'
                  state=80
               else
                  return No_Sym
               end


            when 80
               if @ch=='R'
                  state=81
               else
                  return No_Sym
               end


            when 81
               if @ch=='R'
                  state=82
               else
                  return No_Sym
               end


            when 82
               if @ch=='E'
                  state=83
               else
                  return No_Sym
               end


            when 83
               if @ch=='S'
                  state=84
               else
                  return No_Sym
               end


            when 84
               if @ch=='P'
                  state=85
               else
                  return No_Sym
               end


            when 85
               if @ch=='O'
                  state=86
               else
                  return No_Sym
               end


            when 86
               if @ch=='N'
                  state=87
               else
                  return No_Sym
               end


            when 87
               if @ch=='D'
                  state=88
               else
                  return No_Sym
               end


            when 88
               if @ch=='I'
                  state=89
               else
                  return No_Sym
               end


            when 89
               if @ch=='N'
                  state=90
               else
                  return No_Sym
               end


            when 90
               if @ch=='G'
                  state=91
               else
                  return No_Sym
               end


            when 91
               return C_MOVEMinusCORRESPONDINGSym
            when 92
               return C_LbrackSym
            when 93
               return C_RbrackSym
            when 94
               if @ch=='>'
                  state=383
               else
                  return C_EqualSym
               end


            when 102
               if @ch=='U'
                  state=103
               else
                  return No_Sym
               end


            when 103
               if @ch=='E'
                  state=104
               else
                  return No_Sym
               end


            when 104
               return C_NONMinusUNIQUESym
            when 109
               if @ch=='O'
                  state=110
               else
                  return No_Sym
               end


            when 110
               if @ch=='N'
                  state=111
               else
                  return No_Sym
               end


            when 111
               if @ch=='L'
                  state=112
               else
                  return No_Sym
               end


            when 112
               if @ch=='Y'
                  state=113
               else
                  return No_Sym
               end


            when 113
               return C_READMinusONLYSym
            when 114
               if @ch=='='
                  state=1183
               else
                  return C_SlashSym
               end


            when 115
               return C_StarStarSym
            when 126
               if @ch=='J'
                  state=127
               else
                  return No_Sym
               end


            when 127
               if @ch=='U'
                  state=128
               else
                  return No_Sym
               end


            when 128
               if @ch=='S'
                  state=129
               else
                  return No_Sym
               end


            when 129
               if @ch=='T'
                  state=130
               else
                  return No_Sym
               end


            when 130
               if @ch=='I'
                  state=131
               else
                  return No_Sym
               end


            when 131
               if @ch=='F'
                  state=132
               else
                  return No_Sym
               end


            when 132
               if @ch=='I'
                  state=133
               else
                  return No_Sym
               end


            when 133
               if @ch=='E'
                  state=134
               else
                  return No_Sym
               end


            when 134
               if @ch=='D'
                  state=135
               else
                  return No_Sym
               end


            when 135
               return C_LEFTMinusJUSTIFIEDSym
            when 141
               if @ch=='J'
                  state=142
               else
                  return No_Sym
               end


            when 142
               if @ch=='U'
                  state=143
               else
                  return No_Sym
               end


            when 143
               if @ch=='S'
                  state=144
               else
                  return No_Sym
               end


            when 144
               if @ch=='T'
                  state=145
               else
                  return No_Sym
               end


            when 145
               if @ch=='I'
                  state=146
               else
                  return No_Sym
               end


            when 146
               if @ch=='F'
                  state=147
               else
                  return No_Sym
               end


            when 147
               if @ch=='I'
                  state=148
               else
                  return No_Sym
               end


            when 148
               if @ch=='E'
                  state=149
               else
                  return No_Sym
               end


            when 149
               if @ch=='D'
                  state=150
               else
                  return No_Sym
               end


            when 150
               return C_RIGHTMinusJUSTIFIEDSym
            when 155
               if @ch=='O'
                  state=156
               else
                  return No_Sym
               end


            when 156
               if @ch=='U'
                  state=157
               else
                  return No_Sym
               end


            when 157
               if @ch=='P'
                  state=158
               else
                  return No_Sym
               end


            when 158
               if @ch=='I'
                  state=159
               else
                  return No_Sym
               end


            when 159
               if @ch=='N'
                  state=160
               else
                  return No_Sym
               end


            when 160
               if @ch=='G'
                  state=161
               else
                  return No_Sym
               end


            when 161
               return C_NOMinusGROUPINGSym
            when 166
               if @ch=='G'
                  state=167
               else
                  return No_Sym
               end


            when 167
               if @ch=='N'
                  state=168
               else
                  return No_Sym
               end


            when 168
               return C_NOMinusSIGNSym
            when 172
               if @ch=='E'
                  state=173
               else
                  return No_Sym
               end


            when 173
               if @ch=='R'
                  state=174
               else
                  return No_Sym
               end


            when 174
               if @ch=='O'
                  state=175
               else
                  return No_Sym
               end


            when 175
               return C_NOMinusZEROSym
            when 200
               if @ch=='Y'
                  state=201
               else
                  return No_Sym
               end


            when 201
               return C_DDSlashMMSlashYYYYSym
            when 210
               if @ch=='Y'
                  state=211
               else
                  return No_Sym
               end


            when 211
               return C_MMSlashDDSlashYYYYSym
            when 221
               if @ch=='C'
                  state=222
               else
                  return No_Sym
               end


            when 222
               if @ch=='H'
                  state=223
               else
                  return No_Sym
               end


            when 223
               if @ch=='E'
                  state=224
               else
                  return No_Sym
               end


            when 224
               if @ch=='C'
                  state=225
               else
                  return No_Sym
               end


            when 225
               if @ch=='K'
                  state=226
               else
                  return No_Sym
               end


            when 226
               return C_AUTHORITYMinusCHECKSym
            when 230
               if @ch=='8'
                  state=231
               else
                  return No_Sym
               end


            when 231
               return C_UTFMinusD8Sym
            when 237
               if @ch=='R'
                  state=238
               else
                  return No_Sym
               end


            when 238
               if @ch=='D'
                  state=239
               else
                  return No_Sym
               end


            when 239
               if @ch=='E'
                  state=240
               else
                  return No_Sym
               end


            when 240
               if @ch=='R'
                  state=241
               else
                  return No_Sym
               end


            when 241
               return C_BYTEMinusORDERSym
            when 249
               if @ch=='O'
                  state=250
               else
                  return No_Sym
               end


            when 250
               if @ch=='D'
                  state=251
               else
                  return No_Sym
               end


            when 251
               if @ch=='E'
                  state=252
               else
                  return No_Sym
               end


            when 252
               return C_NONMinusUNICODESym
            when 264
               if @ch=='R'
                  state=265
               else
                  return No_Sym
               end


            when 265
               if @ch=='E'
                  state=266
               else
                  return No_Sym
               end


            when 266
               if @ch=='E'
                  state=267
               else
                  return No_Sym
               end


            when 267
               if @ch=='N'
                  state=268
               else
                  return No_Sym
               end


            when 268
               return C_SELECTIONMinusSCREENSym
            when 295
               return C_SELECTIONMinusSETSSym
            when 306
               if @ch=='A'
                  state=307
               else
                  return No_Sym
               end


            when 307
               if @ch=='B'
                  state=308
               else
                  return No_Sym
               end


            when 308
               if @ch=='L'
                  state=309
               else
                  return No_Sym
               end


            when 309
               if @ch=='E'
                  state=310
               else
                  return No_Sym
               end


            when 310
               return C_SELECTIONMinusTABLESym
            when 314
               if @ch=='S'
                  state=315
               else
                  return No_Sym
               end


            when 315
               if @ch=='P'
                  state=316
               else
                  return No_Sym
               end


            when 316
               if @ch=='O'
                  state=317
               else
                  return No_Sym
               end


            when 317
               if @ch=='O'
                  state=318
               else
                  return No_Sym
               end


            when 318
               if @ch=='L'
                  state=319
               else
                  return No_Sym
               end


            when 319
               return C_SAPMinusSPOOLSym
            when 320
               return C_SemicolonSym
            when 330
               if @ch=='T'
                  state=331
               else
                  return No_Sym
               end


            when 331
               if @ch=='A'
                  state=332
               else
                  return No_Sym
               end


            when 332
               if @ch=='B'
                  state=333
               else
                  return No_Sym
               end


            when 333
               if @ch=='L'
                  state=334
               else
                  return No_Sym
               end


            when 334
               if @ch=='E'
                  state=335
               else
                  return No_Sym
               end


            when 335
               return C_PARAMETERMinusTABLESym
            when 345
               if @ch=='T'
                  state=346
               else
                  return No_Sym
               end


            when 346
               if @ch=='A'
                  state=347
               else
                  return No_Sym
               end


            when 347
               if @ch=='B'
                  state=348
               else
                  return No_Sym
               end


            when 348
               if @ch=='L'
                  state=349
               else
                  return No_Sym
               end


            when 349
               if @ch=='E'
                  state=350
               else
                  return No_Sym
               end


            when 350
               return C_EXCEPTIONMinusTABLESym
            when 357
               if @ch=='E'
                  state=358
               else
                  return No_Sym
               end


            when 358
               if @ch=='T'
                  state=359
               else
                  return No_Sym
               end


            when 359
               if @ch=='H'
                  state=360
               else
                  return No_Sym
               end


            when 360
               if @ch=='O'
                  state=361
               else
                  return No_Sym
               end


            when 361
               if @ch=='D'
                  state=362
               else
                  return No_Sym
               end


            when 362
               if @ch=='S'
                  state=363
               else
                  return No_Sym
               end


            when 363
               return C_CLASSMinusMETHODSSym
            when 367
               if @ch=='C'
                  state=368
               else
                  return No_Sym
               end


            when 368
               if @ch=='O'
                  state=369
               else
                  return No_Sym
               end


            when 369
               if @ch=='R'
                  state=370
               else
                  return No_Sym
               end


            when 370
               if @ch=='R'
                  state=371
               else
                  return No_Sym
               end


            when 371
               if @ch=='E'
                  state=372
               else
                  return No_Sym
               end


            when 372
               if @ch=='S'
                  state=373
               else
                  return No_Sym
               end


            when 373
               if @ch=='P'
                  state=374
               else
                  return No_Sym
               end


            when 374
               if @ch=='O'
                  state=375
               else
                  return No_Sym
               end


            when 375
               if @ch=='N'
                  state=376
               else
                  return No_Sym
               end


            when 376
               if @ch=='D'
                  state=377
               else
                  return No_Sym
               end


            when 377
               if @ch=='I'
                  state=378
               else
                  return No_Sym
               end


            when 378
               if @ch=='N'
                  state=379
               else
                  return No_Sym
               end


            when 379
               if @ch=='G'
                  state=380
               else
                  return No_Sym
               end


            when 380
               return C_ADDMinusCORRESPONDINGSym
            when 381
               if @ch=='>'
                  state=382
               else
                  if @ch=='-'
                     state=1181
                  else
                     if @ch=='='
                        state=1186
                     else
                        return C_MinusSym
                     end

                  end

               end


            when 382
               return C_MinusGreaterSym
            when 383
               return C_EqualGreaterSym
            when 389
               if @ch=='P'
                  state=390
               else
                  return No_Sym
               end


            when 390
               if @ch=='O'
                  state=391
               else
                  return No_Sym
               end


            when 391
               if @ch=='I'
                  state=392
               else
                  return No_Sym
               end


            when 392
               if @ch=='N'
                  state=393
               else
                  return No_Sym
               end


            when 393
               if @ch=='T'
                  state=394
               else
                  return No_Sym
               end


            when 394
               return C_BREAKMinusPOINTSym
            when 403
               if @ch=='F'
                  state=404
               else
                  return No_Sym
               end


            when 404
               if @ch=='U'
                  state=405
               else
                  return No_Sym
               end


            when 405
               if @ch=='N'
                  state=406
               else
                  return No_Sym
               end


            when 406
               if @ch=='C'
                  state=407
               else
                  return No_Sym
               end


            when 407
               if @ch=='T'
                  state=408
               else
                  return No_Sym
               end


            when 408
               if @ch=='I'
                  state=409
               else
                  return No_Sym
               end


            when 409
               if @ch=='O'
                  state=410
               else
                  return No_Sym
               end


            when 410
               if @ch=='N'
                  state=411
               else
                  return No_Sym
               end


            when 411
               return C_CUSTOMERMinusFUNCTIONSym
            when 417
               if @ch=='O'
                  state=418
               else
                  return No_Sym
               end


            when 418
               if @ch=='N'
                  state=419
               else
                  return No_Sym
               end


            when 419
               if @ch=='L'
                  state=420
               else
                  return No_Sym
               end


            when 420
               if @ch=='Y'
                  state=421
               else
                  return No_Sym
               end


            when 421
               return C_QUEUEMinusONLYSym
            when 428
               if @ch=='A'
                  state=429
               else
                  return No_Sym
               end


            when 429
               if @ch=='T'
                  state=430
               else
                  return No_Sym
               end


            when 430
               if @ch=='A'
                  state=431
               else
                  return No_Sym
               end


            when 431
               return C_CLASSMinusDATASym
            when 438
               if @ch=='V'
                  state=439
               else
                  return No_Sym
               end


            when 439
               if @ch=='E'
                  state=440
               else
                  return No_Sym
               end


            when 440
               if @ch=='N'
                  state=441
               else
                  return No_Sym
               end


            when 441
               if @ch=='T'
                  state=442
               else
                  return No_Sym
               end


            when 442
               if @ch=='S'
                  state=443
               else
                  return No_Sym
               end


            when 443
               return C_CLASSMinusEVENTSSym
            when 450
               if @ch=='O'
                  state=451
               else
                  return No_Sym
               end


            when 451
               if @ch=='O'
                  state=452
               else
                  return No_Sym
               end


            when 452
               if @ch=='L'
                  state=453
               else
                  return No_Sym
               end


            when 453
               return C_CLASSMinusPOOLSym
            when 460
               return C_NOMinusGAPSSym
            when 467
               if @ch=='L'
                  state=468
               else
                  return No_Sym
               end


            when 468
               if @ch=='E'
                  state=469
               else
                  return No_Sym
               end


            when 469
               if @ch=='N'
                  state=470
               else
                  return No_Sym
               end


            when 470
               if @ch=='G'
                  state=471
               else
                  return No_Sym
               end


            when 471
               if @ch=='T'
                  state=472
               else
                  return No_Sym
               end


            when 472
               if @ch=='H'
                  state=473
               else
                  return No_Sym
               end


            when 473
               return C_OUTPUTMinusLENGTHSym
            when 479
               if @ch=='D'
                  state=480
               else
                  return No_Sym
               end


            when 480
               return C_HELPMinusIDSym
            when 486
               if @ch=='L'
                  state=487
               else
                  return No_Sym
               end


            when 487
               if @ch=='I'
                  state=488
               else
                  return No_Sym
               end


            when 488
               if @ch=='N'
                  state=489
               else
                  return No_Sym
               end


            when 489
               if @ch=='E'
                  state=490
               else
                  return No_Sym
               end


            when 490
               return C_FIRSTMinusLINESym
            when 495
               if @ch=='I'
                  state=496
               else
                  return No_Sym
               end


            when 496
               if @ch=='N'
                  state=497
               else
                  return No_Sym
               end


            when 497
               if @ch=='E'
                  state=498
               else
                  return No_Sym
               end


            when 498
               if @ch=='S'
                  state=499
               else
                  return No_Sym
               end


            when 499
               return C_TOPMinusLINESSym
            when 505
               if @ch=='L'
                  state=506
               else
                  return No_Sym
               end


            when 506
               if @ch=='I'
                  state=507
               else
                  return No_Sym
               end


            when 507
               if @ch=='N'
                  state=508
               else
                  return No_Sym
               end


            when 508
               if @ch=='E'
                  state=509
               else
                  return No_Sym
               end


            when 509
               if @ch=='S'
                  state=510
               else
                  return No_Sym
               end


            when 510
               return C_TITLEMinusLINESSym
            when 515
               if @ch=='L'
                  state=516
               else
                  return No_Sym
               end


            when 516
               if @ch=='I'
                  state=517
               else
                  return No_Sym
               end


            when 517
               if @ch=='N'
                  state=518
               else
                  return No_Sym
               end


            when 518
               if @ch=='E'
                  state=519
               else
                  return No_Sym
               end


            when 519
               if @ch=='S'
                  state=520
               else
                  return No_Sym
               end


            when 520
               return C_HEADMinusLINESSym
            when 525
               if @ch=='I'
                  state=526
               else
                  return No_Sym
               end


            when 526
               if @ch=='N'
                  state=527
               else
                  return No_Sym
               end


            when 527
               if @ch=='E'
                  state=528
               else
                  return No_Sym
               end


            when 528
               if @ch=='S'
                  state=529
               else
                  return No_Sym
               end


            when 529
               return C_ENDMinusLINESSym
            when 536
               if @ch=='C'
                  state=537
               else
                  return No_Sym
               end


            when 537
               if @ch=='O'
                  state=538
               else
                  return No_Sym
               end


            when 538
               if @ch=='R'
                  state=539
               else
                  return No_Sym
               end


            when 539
               if @ch=='R'
                  state=540
               else
                  return No_Sym
               end


            when 540
               if @ch=='E'
                  state=541
               else
                  return No_Sym
               end


            when 541
               if @ch=='S'
                  state=542
               else
                  return No_Sym
               end


            when 542
               if @ch=='P'
                  state=543
               else
                  return No_Sym
               end


            when 543
               if @ch=='O'
                  state=544
               else
                  return No_Sym
               end


            when 544
               if @ch=='N'
                  state=545
               else
                  return No_Sym
               end


            when 545
               if @ch=='D'
                  state=546
               else
                  return No_Sym
               end


            when 546
               if @ch=='I'
                  state=547
               else
                  return No_Sym
               end


            when 547
               if @ch=='N'
                  state=548
               else
                  return No_Sym
               end


            when 548
               if @ch=='G'
                  state=549
               else
                  return No_Sym
               end


            when 549
               return C_DIVIDEMinusCORRESPONDINGSym
            when 556
               if @ch=='C'
                  state=557
               else
                  return No_Sym
               end


            when 557
               if @ch=='A'
                  state=558
               else
                  return No_Sym
               end


            when 558
               if @ch=='L'
                  state=559
               else
                  return No_Sym
               end


            when 559
               if @ch=='L'
                  state=560
               else
                  return No_Sym
               end


            when 560
               return C_EDITORMinusCALLSym
            when 568
               if @ch=='M'
                  state=569
               else
                  return No_Sym
               end


            when 569
               if @ch=='O'
                  state=570
               else
                  return No_Sym
               end


            when 570
               if @ch=='D'
                  state=571
               else
                  return No_Sym
               end


            when 571
               if @ch=='E'
                  state=572
               else
                  return No_Sym
               end


            when 572
               return C_DISPLAYMinusMODESym
            when 580
               if @ch=='A'
                  state=581
               else
                  return No_Sym
               end


            when 581
               if @ch=='G'
                  state=582
               else
                  return No_Sym
               end


            when 582
               if @ch=='E'
                  state=583
               else
                  return No_Sym
               end


            when 583
               return C_ENDMinusOFMinusPAGESym
            when 591
               if @ch=='E'
                  state=592
               else
                  return No_Sym
               end


            when 592
               if @ch=='L'
                  state=593
               else
                  return No_Sym
               end


            when 593
               if @ch=='E'
                  state=594
               else
                  return No_Sym
               end


            when 594
               if @ch=='C'
                  state=595
               else
                  return No_Sym
               end


            when 595
               if @ch=='T'
                  state=596
               else
                  return No_Sym
               end


            when 596
               if @ch=='I'
                  state=597
               else
                  return No_Sym
               end


            when 597
               if @ch=='O'
                  state=598
               else
                  return No_Sym
               end


            when 598
               if @ch=='N'
                  state=599
               else
                  return No_Sym
               end


            when 599
               return C_ENDMinusOFMinusSELECTIONSym
            when 604
               if @ch=='L'
                  state=605
               else
                  return No_Sym
               end


            when 605
               if @ch=='O'
                  state=606
               else
                  return No_Sym
               end


            when 606
               if @ch=='O'
                  state=607
               else
                  return No_Sym
               end


            when 607
               if @ch=='P'
                  state=608
               else
                  return No_Sym
               end


            when 608
               return C_STEPMinusLOOPSym
            when 615
               if @ch=='R'
                  state=616
               else
                  return No_Sym
               end


            when 616
               if @ch=='O'
                  state=617
               else
                  return No_Sym
               end


            when 617
               if @ch=='U'
                  state=618
               else
                  return No_Sym
               end


            when 618
               if @ch=='P'
                  state=619
               else
                  return No_Sym
               end


            when 619
               if @ch=='S'
                  state=620
               else
                  return No_Sym
               end


            when 620
               return C_FIELDMinusGROUPSSym
            when 627
               if @ch=='Y'
                  state=628
               else
                  return No_Sym
               end


            when 628
               if @ch=='M'
                  state=629
               else
                  return No_Sym
               end


            when 629
               if @ch=='B'
                  state=630
               else
                  return No_Sym
               end


            when 630
               if @ch=='O'
                  state=631
               else
                  return No_Sym
               end


            when 631
               if @ch=='L'
                  state=632
               else
                  return No_Sym
               end


            when 632
               if @ch=='S'
                  state=633
               else
                  return No_Sym
               end


            when 633
               return C_FIELDMinusSYMBOLSSym
            when 642
               if @ch=='P'
                  state=643
               else
                  return No_Sym
               end


            when 643
               if @ch=='O'
                  state=644
               else
                  return No_Sym
               end


            when 644
               if @ch=='O'
                  state=645
               else
                  return No_Sym
               end


            when 645
               if @ch=='L'
                  state=646
               else
                  return No_Sym
               end


            when 646
               return C_FUNCTIONMinusPOOLSym
            when 656
               if @ch=='I'
                  state=657
               else
                  return No_Sym
               end


            when 657
               if @ch=='D'
                  state=658
               else
                  return No_Sym
               end


            when 658
               return C_SHORTDUMPMinusIDSym
            when 665
               if @ch=='T'
                  state=666
               else
                  return No_Sym
               end


            when 666
               if @ch=='A'
                  state=667
               else
                  return No_Sym
               end


            when 667
               if @ch=='B'
                  state=668
               else
                  return No_Sym
               end


            when 668
               if @ch=='L'
                  state=669
               else
                  return No_Sym
               end


            when 669
               if @ch=='E'
                  state=670
               else
                  return No_Sym
               end


            when 670
               return C_FILTERMinusTABLESym
            when 673
               if @ch=='S'
                  state=674
               else
                  return No_Sym
               end


            when 674
               if @ch=='T'
                  state=675
               else
                  return No_Sym
               end


            when 675
               if @ch=='A'
                  state=676
               else
                  return No_Sym
               end


            when 676
               if @ch=='T'
                  state=677
               else
                  return No_Sym
               end


            when 677
               if @ch=='U'
                  state=678
               else
                  return No_Sym
               end


            when 678
               if @ch=='S'
                  state=679
               else
                  return No_Sym
               end


            when 679
               return C_PFMinusSTATUSSym
            when 685
               if @ch=='I'
                  state=686
               else
                  return No_Sym
               end


            when 686
               if @ch=='D'
                  state=687
               else
                  return No_Sym
               end


            when 687
               return C_MAJORMinusIDSym
            when 693
               if @ch=='I'
                  state=694
               else
                  return No_Sym
               end


            when 694
               if @ch=='D'
                  state=695
               else
                  return No_Sym
               end


            when 695
               return C_MINORMinusIDSym
            when 700
               if @ch=='T'
                  state=701
               else
                  return No_Sym
               end


            when 701
               if @ch=='O'
                  state=702
               else
                  return No_Sym
               end


            when 702
               if @ch=='-'
                  state=703
               else
                  return No_Sym
               end


            when 703
               if @ch=='H'
                  state=704
               else
                  return No_Sym
               end


            when 704
               if @ch=='E'
                  state=705
               else
                  return No_Sym
               end


            when 705
               if @ch=='X'
                  state=706
               else
                  return No_Sym
               end


            when 706
               return C_CHARMinusTOMinusHEXSym
            when 712
               if @ch=='P'
                  state=713
               else
                  return No_Sym
               end


            when 713
               if @ch=='O'
                  state=714
               else
                  return No_Sym
               end


            when 714
               if @ch=='I'
                  state=715
               else
                  return No_Sym
               end


            when 715
               if @ch=='N'
                  state=716
               else
                  return No_Sym
               end


            when 716
               if @ch=='T'
                  state=717
               else
                  return No_Sym
               end


            when 717
               return C_FIXEDMinusPOINTSym
            when 727
               if @ch=='P'
                  state=728
               else
                  return No_Sym
               end


            when 728
               if @ch=='O'
                  state=729
               else
                  return No_Sym
               end


            when 729
               if @ch=='O'
                  state=730
               else
                  return No_Sym
               end


            when 730
               if @ch=='L'
                  state=731
               else
                  return No_Sym
               end


            when 731
               return C_INTERFACEMinusPOOLSym
            when 736
               if @ch=='P'
                  state=737
               else
                  return No_Sym
               end


            when 737
               if @ch=='R'
                  state=738
               else
                  return No_Sym
               end


            when 738
               if @ch=='O'
                  state=739
               else
                  return No_Sym
               end


            when 739
               if @ch=='C'
                  state=740
               else
                  return No_Sym
               end


            when 740
               if @ch=='E'
                  state=741
               else
                  return No_Sym
               end


            when 741
               if @ch=='S'
                  state=742
               else
                  return No_Sym
               end


            when 742
               if @ch=='S'
                  state=743
               else
                  return No_Sym
               end


            when 743
               if @ch=='I'
                  state=744
               else
                  return No_Sym
               end


            when 744
               if @ch=='N'
                  state=745
               else
                  return No_Sym
               end


            when 745
               if @ch=='G'
                  state=746
               else
                  return No_Sym
               end


            when 746
               return C_LISTMinusPROCESSINGSym
            when 751
               if @ch=='O'
                  state=752
               else
                  return No_Sym
               end


            when 752
               if @ch=='F'
                  state=753
               else
                  return No_Sym
               end


            when 753
               if @ch=='-'
                  state=754
               else
                  return No_Sym
               end


            when 754
               if @ch=='P'
                  state=755
               else
                  return No_Sym
               end


            when 755
               if @ch=='R'
                  state=756
               else
                  return No_Sym
               end


            when 756
               if @ch=='O'
                  state=757
               else
                  return No_Sym
               end


            when 757
               if @ch=='G'
                  state=758
               else
                  return No_Sym
               end


            when 758
               if @ch=='R'
                  state=759
               else
                  return No_Sym
               end


            when 759
               if @ch=='A'
                  state=760
               else
                  return No_Sym
               end


            when 760
               if @ch=='M'
                  state=761
               else
                  return No_Sym
               end


            when 761
               return C_LOADMinusOFMinusPROGRAMSym
            when 765
               if @ch=='P'
                  state=766
               else
                  return No_Sym
               end


            when 766
               if @ch=='O'
                  state=767
               else
                  return No_Sym
               end


            when 767
               if @ch=='I'
                  state=768
               else
                  return No_Sym
               end


            when 768
               if @ch=='N'
                  state=769
               else
                  return No_Sym
               end


            when 769
               if @ch=='T'
                  state=770
               else
                  return No_Sym
               end


            when 770
               return C_LOGMinusPOINTSym
            when 779
               if @ch=='C'
                  state=780
               else
                  return No_Sym
               end


            when 780
               if @ch=='O'
                  state=781
               else
                  return No_Sym
               end


            when 781
               if @ch=='R'
                  state=782
               else
                  return No_Sym
               end


            when 782
               if @ch=='R'
                  state=783
               else
                  return No_Sym
               end


            when 783
               if @ch=='E'
                  state=784
               else
                  return No_Sym
               end


            when 784
               if @ch=='S'
                  state=785
               else
                  return No_Sym
               end


            when 785
               if @ch=='P'
                  state=786
               else
                  return No_Sym
               end


            when 786
               if @ch=='O'
                  state=787
               else
                  return No_Sym
               end


            when 787
               if @ch=='N'
                  state=788
               else
                  return No_Sym
               end


            when 788
               if @ch=='D'
                  state=789
               else
                  return No_Sym
               end


            when 789
               if @ch=='I'
                  state=790
               else
                  return No_Sym
               end


            when 790
               if @ch=='N'
                  state=791
               else
                  return No_Sym
               end


            when 791
               if @ch=='G'
                  state=792
               else
                  return No_Sym
               end


            when 792
               return C_MULTIPLYMinusCORRESPONDINGSym
            when 797
               if @ch=='I'
                  state=798
               else
                  return No_Sym
               end


            when 798
               if @ch=='N'
                  state=799
               else
                  return No_Sym
               end


            when 799
               if @ch=='E'
                  state=800
               else
                  return No_Sym
               end


            when 800
               return C_NEWMinusLINESym
            when 805
               if @ch=='R'
                  state=806
               else
                  return No_Sym
               end


            when 806
               if @ch=='O'
                  state=807
               else
                  return No_Sym
               end


            when 807
               if @ch=='L'
                  state=808
               else
                  return No_Sym
               end


            when 808
               if @ch=='L'
                  state=809
               else
                  return No_Sym
               end


            when 809
               if @ch=='I'
                  state=810
               else
                  return No_Sym
               end


            when 810
               if @ch=='N'
                  state=811
               else
                  return No_Sym
               end


            when 811
               if @ch=='G'
                  state=812
               else
                  return No_Sym
               end


            when 812
               return C_NOMinusSCROLLINGSym
            when 817
               if @ch=='A'
                  state=818
               else
                  return No_Sym
               end


            when 818
               if @ch=='G'
                  state=819
               else
                  return No_Sym
               end


            when 819
               if @ch=='E'
                  state=820
               else
                  return No_Sym
               end


            when 820
               return C_NEWMinusPAGESym
            when 826
               if @ch=='I'
                  state=827
               else
                  return No_Sym
               end


            when 827
               if @ch=='T'
                  state=828
               else
                  return No_Sym
               end


            when 828
               if @ch=='L'
                  state=829
               else
                  return No_Sym
               end


            when 829
               if @ch=='E'
                  state=830
               else
                  return No_Sym
               end


            when 830
               return C_WITHMinusTITLESym
            when 835
               if @ch=='T'
                  state=836
               else
                  return No_Sym
               end


            when 836
               if @ch=='L'
                  state=837
               else
                  return No_Sym
               end


            when 837
               if @ch=='E'
                  state=838
               else
                  return No_Sym
               end


            when 838
               return C_NOMinusTITLESym
            when 844
               if @ch=='E'
                  state=845
               else
                  return No_Sym
               end


            when 845
               if @ch=='A'
                  state=846
               else
                  return No_Sym
               end


            when 846
               if @ch=='D'
                  state=847
               else
                  return No_Sym
               end


            when 847
               if @ch=='I'
                  state=848
               else
                  return No_Sym
               end


            when 848
               if @ch=='N'
                  state=849
               else
                  return No_Sym
               end


            when 849
               if @ch=='G'
                  state=850
               else
                  return No_Sym
               end


            when 850
               return C_WITHMinusHEADINGSym
            when 854
               if @ch=='E'
                  state=855
               else
                  return No_Sym
               end


            when 855
               if @ch=='A'
                  state=856
               else
                  return No_Sym
               end


            when 856
               if @ch=='D'
                  state=857
               else
                  return No_Sym
               end


            when 857
               if @ch=='I'
                  state=858
               else
                  return No_Sym
               end


            when 858
               if @ch=='N'
                  state=859
               else
                  return No_Sym
               end


            when 859
               if @ch=='G'
                  state=860
               else
                  return No_Sym
               end


            when 860
               return C_NOMinusHEADINGSym
            when 865
               if @ch=='P'
                  state=866
               else
                  return No_Sym
               end


            when 866
               if @ch=='O'
                  state=867
               else
                  return No_Sym
               end


            when 867
               if @ch=='F'
                  state=868
               else
                  return No_Sym
               end


            when 868
               if @ch=='P'
                  state=869
               else
                  return No_Sym
               end


            when 869
               if @ch=='A'
                  state=870
               else
                  return No_Sym
               end


            when 870
               if @ch=='G'
                  state=871
               else
                  return No_Sym
               end


            when 871
               if @ch=='E'
                  state=872
               else
                  return No_Sym
               end


            when 872
               return C_NOMinusTOPOFPAGESym
            when 877
               if @ch=='E'
                  state=878
               else
                  return No_Sym
               end


            when 878
               if @ch=='C'
                  state=879
               else
                  return No_Sym
               end


            when 879
               if @ch=='T'
                  state=880
               else
                  return No_Sym
               end


            when 880
               if @ch=='I'
                  state=881
               else
                  return No_Sym
               end


            when 881
               if @ch=='O'
                  state=882
               else
                  return No_Sym
               end


            when 882
               if @ch=='N'
                  state=883
               else
                  return No_Sym
               end


            when 883
               return C_NEWMinusSECTIONSym
            when 887
               if @ch=='I'
                  state=888
               else
                  return No_Sym
               end


            when 888
               if @ch=='S'
                  state=889
               else
                  return No_Sym
               end


            when 889
               if @ch=='P'
                  state=890
               else
                  return No_Sym
               end


            when 890
               if @ch=='L'
                  state=891
               else
                  return No_Sym
               end


            when 891
               if @ch=='A'
                  state=892
               else
                  return No_Sym
               end


            when 892
               if @ch=='Y'
                  state=893
               else
                  return No_Sym
               end


            when 893
               return C_NOMinusDISPLAYSym
            when 898
               if @ch=='C'
                  state=899
               else
                  return No_Sym
               end


            when 899
               if @ch=='O'
                  state=900
               else
                  return No_Sym
               end


            when 900
               if @ch=='M'
                  state=901
               else
                  return No_Sym
               end


            when 901
               if @ch=='M'
                  state=902
               else
                  return No_Sym
               end


            when 902
               if @ch=='A'
                  state=903
               else
                  return No_Sym
               end


            when 903
               if @ch=='N'
                  state=904
               else
                  return No_Sym
               end


            when 904
               if @ch=='D'
                  state=905
               else
                  return No_Sym
               end


            when 905
               return C_USERMinusCOMMANDSym
            when 911
               if @ch=='E'
                  state=912
               else
                  return No_Sym
               end


            when 912
               if @ch=='Q'
                  state=913
               else
                  return No_Sym
               end


            when 913
               if @ch=='U'
                  state=914
               else
                  return No_Sym
               end


            when 914
               if @ch=='E'
                  state=915
               else
                  return No_Sym
               end


            when 915
               if @ch=='S'
                  state=916
               else
                  return No_Sym
               end


            when 916
               if @ch=='T'
                  state=917
               else
                  return No_Sym
               end


            when 917
               return C_HELPMinusREQUESTSym
            when 923
               if @ch=='R'
                  state=924
               else
                  return No_Sym
               end


            when 924
               if @ch=='E'
                  state=925
               else
                  return No_Sym
               end


            when 925
               if @ch=='Q'
                  state=926
               else
                  return No_Sym
               end


            when 926
               if @ch=='U'
                  state=927
               else
                  return No_Sym
               end


            when 927
               if @ch=='E'
                  state=928
               else
                  return No_Sym
               end


            when 928
               if @ch=='S'
                  state=929
               else
                  return No_Sym
               end


            when 929
               if @ch=='T'
                  state=930
               else
                  return No_Sym
               end


            when 930
               return C_VALUEMinusREQUESTSym
            when 936
               if @ch=='C'
                  state=937
               else
                  return No_Sym
               end


            when 937
               if @ch=='O'
                  state=938
               else
                  return No_Sym
               end


            when 938
               if @ch=='N'
                  state=939
               else
                  return No_Sym
               end


            when 939
               if @ch=='T'
                  state=940
               else
                  return No_Sym
               end


            when 940
               if @ch=='R'
                  state=941
               else
                  return No_Sym
               end


            when 941
               if @ch=='O'
                  state=942
               else
                  return No_Sym
               end


            when 942
               if @ch=='L'
                  state=943
               else
                  return No_Sym
               end


            when 943
               return C_PRINTMinusCONTROLSym
            when 949
               if @ch=='L'
                  state=950
               else
                  return No_Sym
               end


            when 950
               if @ch=='I'
                  state=951
               else
                  return No_Sym
               end


            when 951
               if @ch=='N'
                  state=952
               else
                  return No_Sym
               end


            when 952
               if @ch=='E'
                  state=953
               else
                  return No_Sym
               end


            when 953
               return C_INDEXMinusLINESym
            when 960
               if @ch=='O'
                  state=961
               else
                  return No_Sym
               end


            when 961
               if @ch=='P'
                  state=962
               else
                  return No_Sym
               end


            when 962
               if @ch=='T'
                  state=963
               else
                  return No_Sym
               end


            when 963
               if @ch=='I'
                  state=964
               else
                  return No_Sym
               end


            when 964
               if @ch=='O'
                  state=965
               else
                  return No_Sym
               end


            when 965
               if @ch=='N'
                  state=966
               else
                  return No_Sym
               end


            when 966
               if @ch=='S'
                  state=967
               else
                  return No_Sym
               end


            when 967
               return C_SELECTMinusOPTIONSSym
            when 971
               if @ch=='X'
                  state=972
               else
                  return No_Sym
               end


            when 972
               if @ch=='T'
                  state=973
               else
                  return No_Sym
               end


            when 973
               if @ch=='E'
                  state=974
               else
                  return No_Sym
               end


            when 974
               if @ch=='N'
                  state=975
               else
                  return No_Sym
               end


            when 975
               if @ch=='S'
                  state=976
               else
                  return No_Sym
               end


            when 976
               if @ch=='I'
                  state=977
               else
                  return No_Sym
               end


            when 977
               if @ch=='O'
                  state=978
               else
                  return No_Sym
               end


            when 978
               if @ch=='N'
                  state=979
               else
                  return No_Sym
               end


            when 979
               return C_NOMinusEXTENSIONSym
            when 986
               if @ch=='B'
                  state=987
               else
                  return No_Sym
               end


            when 987
               if @ch=='O'
                  state=988
               else
                  return No_Sym
               end


            when 988
               if @ch=='U'
                  state=989
               else
                  return No_Sym
               end


            when 989
               if @ch=='N'
                  state=990
               else
                  return No_Sym
               end


            when 990
               if @ch=='D'
                  state=991
               else
                  return No_Sym
               end


            when 991
               if @ch=='A'
                  state=992
               else
                  return No_Sym
               end


            when 992
               if @ch=='R'
                  state=993
               else
                  return No_Sym
               end


            when 993
               if @ch=='Y'
                  state=994
               else
                  return No_Sym
               end


            when 994
               return C_SCROLLMinusBOUNDARYSym
            when 1003
               if @ch=='C'
                  state=1004
               else
                  return No_Sym
               end


            when 1004
               if @ch=='O'
                  state=1005
               else
                  return No_Sym
               end


            when 1005
               if @ch=='R'
                  state=1006
               else
                  return No_Sym
               end


            when 1006
               if @ch=='R'
                  state=1007
               else
                  return No_Sym
               end


            when 1007
               if @ch=='E'
                  state=1008
               else
                  return No_Sym
               end


            when 1008
               if @ch=='S'
                  state=1009
               else
                  return No_Sym
               end


            when 1009
               if @ch=='P'
                  state=1010
               else
                  return No_Sym
               end


            when 1010
               if @ch=='O'
                  state=1011
               else
                  return No_Sym
               end


            when 1011
               if @ch=='N'
                  state=1012
               else
                  return No_Sym
               end


            when 1012
               if @ch=='D'
                  state=1013
               else
                  return No_Sym
               end


            when 1013
               if @ch=='I'
                  state=1014
               else
                  return No_Sym
               end


            when 1014
               if @ch=='N'
                  state=1015
               else
                  return No_Sym
               end


            when 1015
               if @ch=='G'
                  state=1016
               else
                  return No_Sym
               end


            when 1016
               return C_SUBTRACTMinusCORRESPONDINGSym
            when 1023
               if @ch=='C'
                  state=1024
               else
                  return No_Sym
               end


            when 1024
               if @ch=='H'
                  state=1025
               else
                  return No_Sym
               end


            when 1025
               if @ch=='E'
                  state=1026
               else
                  return No_Sym
               end


            when 1026
               if @ch=='C'
                  state=1027
               else
                  return No_Sym
               end


            when 1027
               if @ch=='K'
                  state=1028
               else
                  return No_Sym
               end


            when 1028
               return C_SYNTAXMinusCHECKSym
            when 1034
               if @ch=='N'
                  state=1035
               else
                  return No_Sym
               end


            when 1035
               if @ch=='J'
                  state=1036
               else
                  return No_Sym
               end


            when 1036
               if @ch=='E'
                  state=1037
               else
                  return No_Sym
               end


            when 1037
               if @ch=='C'
                  state=1038
               else
                  return No_Sym
               end


            when 1038
               if @ch=='T'
                  state=1039
               else
                  return No_Sym
               end


            when 1039
               if @ch=='I'
                  state=1040
               else
                  return No_Sym
               end


            when 1040
               if @ch=='O'
                  state=1041
               else
                  return No_Sym
               end


            when 1041
               if @ch=='N'
                  state=1042
               else
                  return No_Sym
               end


            when 1042
               return C_TESTMinusINJECTIONSym
            when 1052
               if @ch=='N'
                  state=1053
               else
                  return No_Sym
               end


            when 1053
               if @ch=='J'
                  state=1054
               else
                  return No_Sym
               end


            when 1054
               if @ch=='E'
                  state=1055
               else
                  return No_Sym
               end


            when 1055
               if @ch=='C'
                  state=1056
               else
                  return No_Sym
               end


            when 1056
               if @ch=='T'
                  state=1057
               else
                  return No_Sym
               end


            when 1057
               if @ch=='I'
                  state=1058
               else
                  return No_Sym
               end


            when 1058
               if @ch=='O'
                  state=1059
               else
                  return No_Sym
               end


            when 1059
               if @ch=='N'
                  state=1060
               else
                  return No_Sym
               end


            when 1060
               return C_ENDMinusTESTMinusINJECTIONSym
            when 1066
               if @ch=='E'
                  state=1067
               else
                  return No_Sym
               end


            when 1067
               if @ch=='A'
                  state=1068
               else
                  return No_Sym
               end


            when 1068
               if @ch=='M'
                  state=1069
               else
                  return No_Sym
               end


            when 1069
               return C_TESTMinusSEAMSym
            when 1079
               if @ch=='E'
                  state=1080
               else
                  return No_Sym
               end


            when 1080
               if @ch=='A'
                  state=1081
               else
                  return No_Sym
               end


            when 1081
               if @ch=='M'
                  state=1082
               else
                  return No_Sym
               end


            when 1082
               return C_ENDMinusTESTMinusSEAMSym
            when 1087
               if @ch=='F'
                  state=1088
               else
                  return No_Sym
               end


            when 1088
               if @ch=='-'
                  state=1089
               else
                  return No_Sym
               end


            when 1089
               if @ch=='P'
                  state=1090
               else
                  return No_Sym
               end


            when 1090
               if @ch=='A'
                  state=1091
               else
                  return No_Sym
               end


            when 1091
               if @ch=='G'
                  state=1092
               else
                  return No_Sym
               end


            when 1092
               if @ch=='E'
                  state=1093
               else
                  return No_Sym
               end


            when 1093
               return C_TOPMinusOFMinusPAGESym
            when 1100
               if @ch=='L'
                  state=1101
               else
                  return No_Sym
               end


            when 1101
               if @ch=='E'
                  state=1102
               else
                  return No_Sym
               end


            when 1102
               if @ch=='C'
                  state=1103
               else
                  return No_Sym
               end


            when 1103
               if @ch=='T'
                  state=1104
               else
                  return No_Sym
               end


            when 1104
               if @ch=='I'
                  state=1105
               else
                  return No_Sym
               end


            when 1105
               if @ch=='O'
                  state=1106
               else
                  return No_Sym
               end


            when 1106
               if @ch=='N'
                  state=1107
               else
                  return No_Sym
               end


            when 1107
               return C_LINEMinusSELECTIONSym
            when 1126
               return C_TYPEMinusPOOLSSym
            when 1127
               if @ch=='|'
                  state=1128
               else
                  if @ch=='='
                     state=1189
                  else
                     return C_BarSym
                  end

               end


            when 1128
               return C_BarBarSym
            when 1129
               if @ch=='&'
                  state=1130
               else
                  if @ch=='='
                     state=1187
                  else
                     return C_AndSym
                  end

               end


            when 1130
               return C_AndAndSym
            when 1131
               if @ch=='='
                  state=1188
               else
                  return C_UparrowSym
               end


            when 1132
               return C_LessGreaterSym
            when 1133
               return C_LessEqualSym
            when 1134
               return C_GreaterEqualSym
            when 1141
               return C_BYTEMinusCOSym
            when 1148
               return C_BYTEMinusCNSym
            when 1155
               return C_BYTEMinusCASym
            when 1162
               return C_BYTEMinusNASym
            when 1169
               return C_BYTEMinusCSSym
            when 1176
               return C_BYTEMinusNSSym
            when 1177
               if @ch=='='
                  state=1190
               else
                  return C_LessLessSym
               end


            when 1178
               if @ch=='='
                  state=1191
               else
                  return C_GreaterGreaterSym
               end


            when 1179
               if @ch=='='
                  state=1184
               else
                  return C_PercentSym
               end


            when 1180
               return C_PlusPlusSym
            when 1181
               return C_MinusMinusSym
            when 1182
               return C_StarEqualSym
            when 1183
               return C_SlashEqualSym
            when 1184
               return C_PercentEqualSym
            when 1185
               return C_PlusEqualSym
            when 1186
               return C_MinusEqualSym
            when 1187
               return C_AndEqualSym
            when 1188
               return C_UparrowEqualSym
            when 1189
               return C_BarEqualSym
            when 1190
               return C_LessLessEqualSym
            when 1191
               return C_GreaterGreaterEqualSym
            when 1192
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1212
                  else
                     if @ch=='E'
                        state=1213
                     else
                        if @ch=='O'
                           state=1214
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end


            when 1193
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='L'||@ch=='N'||@ch>='P'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1215
                  else
                     if @ch=='O'
                        state=1216
                     else
                        if @ch=='M'
                           state=1217
                        else
                           if @ch=='A'
                              state=1218
                           else
                              if @ch=='I'
                                 state=1219
                              else
                                 if @ch=='U'
                                    state=1220
                                 else
                                    return CheckLiteral(C_identifierSym)
                                 end

                              end

                           end

                        end

                     end

                  end

               end


            when 1194
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1221
                  else
                     if @ch=='E'
                        state=1222
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1195
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1223
                  else
                     if @ch=='I'
                        state=1224
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1196
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1225
                  else
                     if @ch=='I'
                        state=1226
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1197
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1227
                  else
                     if @ch=='D'
                        state=1228
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1198
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1229
                  else
                     if @ch=='S'
                        state=1230
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1199
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='Y'
                     state=1231
                  else
                     if @ch=='R'
                        state=1232
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1200
               if @ch>='0'&&@ch<='9'||@ch=='B'||@ch=='D'||@ch>='F'&&@ch<='G'||@ch>='I'&&@ch<='S'||@ch>='V'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1233
                  else
                     if @ch=='A'
                        state=1234
                     else
                        if @ch=='T'
                           state=1235
                        else
                           if @ch=='H'
                              state=1236
                           else
                              if @ch=='C'
                                 state=1237
                              else
                                 if @ch=='U'
                                    state=1238
                                 else
                                    if @ch=='Y'
                                       state=1239
                                    else
                                       return CheckLiteral(C_identifierSym)
                                    end

                                 end

                              end

                           end

                        end

                     end

                  end

               end


            when 1201
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='E'||@ch>='G'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1240
                  else
                     if @ch=='F'
                        state=1241
                     else
                        if @ch=='R'
                           state=1242
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end


            when 1202
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='M'||@ch>='O'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='X'
                     state=1243
                  else
                     if @ch=='N'
                        state=1244
                     else
                        if @ch=='D'
                           state=1245
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end


            when 1203
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='K'||@ch>='M'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1246
                  else
                     if @ch=='U'
                        state=1247
                     else
                        if @ch=='H'
                           state=1248
                        else
                           return CheckLiteral(C_identifierSym)
                        end

                     end

                  end

               end


            when 1204
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1249
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1205
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1250
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1206
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1251
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1207
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1252
                  else
                     if @ch=='U'
                        state=1253
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1208
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='H'||@ch>='J'&&@ch<='N'||@ch>='P'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1254
                  else
                     if @ch=='I'
                        state=1255
                     else
                        if @ch=='E'
                           state=1256
                        else
                           if @ch=='Y'
                              state=1257
                           else
                              return CheckLiteral(C_identifierSym)
                           end

                        end

                     end

                  end

               end


            when 1209
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1258
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1210
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1259
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1211
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1260
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1212
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1261
                  else
                     if @ch=='S'
                        state=1262
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1213
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='F'
                     state=1263
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1214
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1264
                  else
                     if @ch=='G'
                        state=1265
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1215
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1266
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1216
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='U'||@ch>='W'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='V'
                     state=1267
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1217
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='/'
                     state=1268
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1218
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='I'||@ch>='K'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='J'
                     state=1269
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1219
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1270
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1220
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1271
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1221
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1272
                  else
                     if @ch=='-'
                        state=1273
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1222
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='V'||@ch>='X'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='W'
                     state=1274
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1223
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1275
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1224
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='G'
                     state=1276
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1225
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='/'
                     state=1277
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1226
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='U'||@ch>='W'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='V'
                     state=1278
                  else
                     if @ch=='S'
                        state=1279
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1227
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1280
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1228
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1281
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1229
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='F'
                     state=1282
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1230
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1283
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1231
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1284
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1232
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1285
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1233
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1286
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1234
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1287
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1235
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1288
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1236
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1289
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1237
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1290
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1238
               if @ch>='0'&&@ch<='9'||@ch=='A'||@ch>='C'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='B'
                     state=1291
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1239
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1292
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1240
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1293
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1241
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=673
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1242
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1294
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1243
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='C'
                     state=1295
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1244
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1296
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1245
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1297
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1246
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1298
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1247
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1299
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1248
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1300
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1249
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1301
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1250
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1302
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1251
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1303
                  else
                     if @ch=='A'
                        state=1304
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1252
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='K'||@ch>='M'&&@ch<='Q'||@ch>='S'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1305
                  else
                     if @ch=='E'
                        state=1306
                     else
                        if @ch=='L'
                           state=1307
                        else
                           if @ch=='X'
                              state=1308
                           else
                              return CheckLiteral(C_identifierSym)
                           end

                        end

                     end

                  end

               end


            when 1253
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1309
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1254
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1310
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1255
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1311
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1256
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1312
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1257
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1313
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1258
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1314
                  else
                     if @ch=='D'
                        state=1315
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1259
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1316
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1260
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1317
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1261
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1318
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1262
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1319
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1263
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1320
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1264
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1321
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1265
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=765
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1266
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1322
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1267
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1323
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1268
               if @ch=='D'
                  state=1324
               else
                  return No_Sym
               end


            when 1269
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1325
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1270
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1326
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1271
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1327
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1272
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1328
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1273
               if @ch=='G'
                  state=1329
               else
                  if @ch=='S'
                     state=1330
                  else
                     if @ch=='Z'
                        state=172
                     else
                        if @ch=='T'
                           state=1331
                        else
                           if @ch=='H'
                              state=854
                           else
                              if @ch=='D'
                                 state=887
                              else
                                 if @ch=='E'
                                    state=971
                                 else
                                    return No_Sym
                                 end

                              end

                           end

                        end

                     end

                  end

               end


            when 1274
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1332
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1275
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1333
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1276
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='H'
                     state=1334
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1277
               if @ch=='M'
                  state=1335
               else
                  return No_Sym
               end


            when 1278
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1336
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1279
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1337
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1280
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='H'
                     state=1338
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1281
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=367
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1282
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=230
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1283
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1339
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1284
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1340
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1285
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1341
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1286
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1342
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1287
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=314
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1288
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1343
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1289
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1344
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1290
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1345
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1291
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1346
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1292
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1347
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1293
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1348
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1294
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1349
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1295
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1350
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1296
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1351
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1297
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1352
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1298
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1353
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1299
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1354
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1300
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1355
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1301
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1356
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1302
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1357
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1303
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1358
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1304
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1359
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1305
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1360
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1306
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1361
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1307
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1362
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1308
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1363
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1309
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='C'
                     state=1364
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1310
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1365
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1311
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1366
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1312
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1367
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1313
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1368
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1314
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1369
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1315
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1370
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1316
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='H'
                     state=1371
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1317
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1372
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1318
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1373
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1319
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=736
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1320
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=126
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1321
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=751
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1322
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1374
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1323
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=78
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1324
               if @ch=='D'
                  state=1375
               else
                  return No_Sym
               end


            when 1325
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1376
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1326
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1377
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1327
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1378
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1328
               if @ch=='U'
                  state=1379
               else
                  return No_Sym
               end


            when 1329
               if @ch=='A'
                  state=1380
               else
                  if @ch=='R'
                     state=155
                  else
                     return No_Sym
                  end

               end


            when 1330
               if @ch=='I'
                  state=166
               else
                  if @ch=='C'
                     state=805
                  else
                     return No_Sym
                  end

               end


            when 1331
               if @ch=='I'
                  state=835
               else
                  if @ch=='O'
                     state=865
                  else
                     return No_Sym
                  end

               end


            when 1332
               if @ch=='L'
                  state=797
               else
                  if @ch=='P'
                     state=817
                  else
                     if @ch=='S'
                        state=877
                     else
                        return No_Sym
                     end

                  end

               end


            when 1333
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=109
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1334
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1381
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1335
               if @ch=='M'
                  state=1382
               else
                  return No_Sym
               end


            when 1336
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1383
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1337
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1384
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1338
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1385
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1339
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=898
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1340
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1386
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1341
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='J'||@ch>='L'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='K'
                     state=1387
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1342
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='C'
                     state=1388
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1343
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=604
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1344
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1389
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1345
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1390
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1346
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1391
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1347
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1392
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1348
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='M'
                     state=1393
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1349
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1394
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1350
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1395
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1351
               if @ch=='L'
                  state=525
               else
                  if @ch=='O'
                     state=1396
                  else
                     if @ch=='T'
                        state=1397
                     else
                        return No_Sym
                     end

                  end

               end


            when 1352
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1398
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1353
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='R'||@ch>='T'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='S'
                     state=1399
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1354
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1400
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1355
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=700
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1356
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1401
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1357
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1402
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1358
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1403
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1359
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=515
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1360
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1404
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1361
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1405
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1362
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1406
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1363
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1407
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1364
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1408
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1365
               if @ch=='L'
                  state=495
               else
                  if @ch=='O'
                     state=1087
                  else
                     return No_Sym
                  end

               end


            when 1366
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1409
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1367
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1410
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1368
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1411
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1369
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1412
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1370
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='X'
                     state=1413
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1371
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1414
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1372
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1415
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1373
               if @ch=='S'
                  state=1416
               else
                  if @ch=='C'
                     state=45
                  else
                     return No_Sym
                  end

               end


            when 1374
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='G'
                     state=1417
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1375
               if @ch=='/'
                  state=1418
               else
                  return No_Sym
               end


            when 1376
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=685
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1377
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=693
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1378
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1419
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1379
               if @ch=='N'
                  state=1420
               else
                  return No_Sym
               end


            when 1380
               if @ch=='P'
                  state=1421
               else
                  return No_Sym
               end


            when 1381
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=141
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1382
               if @ch=='/'
                  state=1422
               else
                  return No_Sym
               end


            when 1383
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1423
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1384
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1424
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1385
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1425
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1386
               if @ch=='O'
                  state=237
               else
                  if @ch=='C'
                     state=1426
                  else
                     if @ch=='N'
                        state=1427
                     else
                        return No_Sym
                     end

                  end

               end


            when 1387
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=389
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1388
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1428
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1389
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='D'
                     state=1429
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1390
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1430
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1391
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1431
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1392
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='W'||@ch>='Y'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='X'
                     state=1432
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1393
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1433
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1394
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=936
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1395
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1434
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1396
               if @ch=='F'
                  state=1435
               else
                  return No_Sym
               end


            when 1397
               if @ch=='E'
                  state=1436
               else
                  return No_Sym
               end


            when 1398
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1437
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1399
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1438
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1400
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='M'
                     state=1439
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1401
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=417
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1402
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1440
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1403
               if @ch=='I'
                  state=479
               else
                  if @ch=='R'
                     state=911
                  else
                     return No_Sym
                  end

               end


            when 1404
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=486
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1405
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1441
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1406
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1442
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1407
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=712
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1408
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1443
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1409
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=505
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1410
               if @ch=='I'
                  state=1034
               else
                  if @ch=='S'
                     state=1066
                  else
                     return No_Sym
                  end

               end


            when 1411
               if @ch=='P'
                  state=1444
               else
                  return No_Sym
               end


            when 1412
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='F'
                     state=1445
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1413
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=949
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1414
               if @ch=='T'
                  state=826
               else
                  if @ch=='H'
                     state=844
                  else
                     return No_Sym
                  end

               end


            when 1415
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=923
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1416
               if @ch=='I'
                  state=37
               else
                  if @ch=='E'
                     state=1100
                  else
                     return No_Sym
                  end

               end


            when 1417
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1446
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1418
               if @ch=='Y'
                  state=1447
               else
                  return No_Sym
               end


            when 1419
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='K'||@ch>='M'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='L'
                     state=1448
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1420
               if @ch=='I'
                  state=1449
               else
                  return No_Sym
               end


            when 1421
               if @ch=='S'
                  state=460
               else
                  return C_NOMinusGAPSym
               end


            when 1422
               if @ch=='Y'
                  state=1450
               else
                  return No_Sym
               end


            when 1423
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=536
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1424
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='Y'
                     state=1451
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1425
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1452
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1426
               if @ch=='O'
                  state=1141
               else
                  if @ch=='N'
                     state=1148
                  else
                     if @ch=='A'
                        state=1155
                     else
                        if @ch=='S'
                           state=1169
                        else
                           return No_Sym
                        end

                     end

                  end

               end


            when 1427
               if @ch=='A'
                  state=1162
               else
                  if @ch=='S'
                     state=1176
                  else
                     return No_Sym
                  end

               end


            when 1428
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1453
                  else
                     if @ch=='-'
                        state=960
                     else
                        return CheckLiteral(C_identifierSym)
                     end

                  end

               end


            when 1429
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='T'||@ch>='V'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='U'
                     state=1454
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1430
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=986
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1431
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='C'
                     state=1455
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1432
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1023
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1433
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1456
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1434
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='I'
                     state=1457
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1435
               if @ch=='-'
                  state=1458
               else
                  return No_Sym
               end


            when 1436
               if @ch=='S'
                  state=1459
               else
                  return No_Sym
               end


            when 1437
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=556
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1438
               if @ch=='M'
                  state=357
               else
                  if @ch=='D'
                     state=428
                  else
                     if @ch=='E'
                        state=438
                     else
                        if @ch=='P'
                           state=450
                        else
                           return No_Sym
                        end

                     end

                  end

               end


            when 1439
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1460
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1440
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=467
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1441
               if @ch=='G'
                  state=615
               else
                  if @ch=='S'
                     state=627
                  else
                     return No_Sym
                  end

               end


            when 1442
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=665
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1443
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1461
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1444
               if @ch=='O'
                  state=1462
               else
                  return No_Sym
               end


            when 1445
               if @ch>='0'&&@ch<='9'||@ch>='B'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='A'
                     state=1463
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1446
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=57
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1447
               if @ch=='Y'
                  state=1464
               else
                  return No_Sym
               end


            when 1448
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='Y'
                     state=1465
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1449
               if @ch=='Q'
                  state=102
               else
                  if @ch=='C'
                     state=249
                  else
                     return No_Sym
                  end

               end


            when 1450
               if @ch=='Y'
                  state=1466
               else
                  return No_Sym
               end


            when 1451
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=568
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1452
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1467
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1453
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1468
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1454
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='M'
                     state=1469
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1455
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='T'
                     state=1470
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1456
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1471
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1457
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='O'
                     state=1472
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1458
               if @ch=='P'
                  state=580
               else
                  if @ch=='S'
                     state=591
                  else
                     return No_Sym
                  end

               end


            when 1459
               if @ch=='T'
                  state=1473
               else
                  return No_Sym
               end


            when 1460
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1474
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1461
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1475
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1462
               if @ch=='O'
                  state=1476
               else
                  return No_Sym
               end


            when 1463
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='B'||@ch>='D'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='C'
                     state=1477
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1464
               if @ch=='Y'
                  state=210
               else
                  return C_MMSlashDDSlashYYSym
               end


            when 1465
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=779
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1466
               if @ch=='Y'
                  state=200
               else
                  return C_DDSlashMMSlashYYSym
               end


            when 1467
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='Y'
                     state=1478
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1468
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1479
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1469
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='O'||@ch>='Q'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='P'
                     state=1480
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1470
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1003
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1471
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Q'||@ch>='S'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='R'
                     state=1481
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1472
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='M'||@ch>='O'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='N'
                     state=1482
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1473
               if @ch=='-'
                  state=1483
               else
                  return No_Sym
               end


            when 1474
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=403
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1475
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=642
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1476
               if @ch=='L'
                  state=1484
               else
                  return No_Sym
               end


            when 1477
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='E'
                     state=1485
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1478
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=221
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1479
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=1486
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1480
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=656
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1481
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=330
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1482
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=345
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1483
               if @ch=='I'
                  state=1052
               else
                  if @ch=='S'
                     state=1079
                  else
                     return No_Sym
                  end

               end


            when 1484
               if @ch=='S'
                  state=1126
               else
                  return C_TYPEMinusPOOLSym
               end


            when 1485
               if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                  state=2
               else
                  if @ch=='-'
                     state=727
                  else
                     return CheckLiteral(C_identifierSym)
                  end

               end


            when 1486
               if @ch=='S'
                  state=1487
               else
                  if @ch=='T'
                     state=306
                  else
                     return No_Sym
                  end

               end


            when 1487
               if @ch=='C'
                  state=264
               else
                  if @ch=='E'
                     state=1488
                  else
                     return No_Sym
                  end

               end


            when 1488
               if @ch=='T'
                  state=1489
               else
                  return No_Sym
               end


            when 1489
               if @ch=='S'
                  state=295
               else
                  return C_SELECTIONMinusSETSym
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
