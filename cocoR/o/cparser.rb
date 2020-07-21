class CParser < CRRParser

   def AllowedKeywordsForTypeName()
      _in_()
      case @sym

      when C_DATASym
         Get()

      when C_VALUESym
         Get()

      when C_PARAMETERSym
         Get()

      when C_PARAMETERSSym
         Get()

      when C_TARGETSym
         Get()

      when C_MESSAGESym
         Get()

      when C_ENDSym
         Get()

      when C_CREATESym
         Get()

      when C_KEYSym
         Get()

      when C_IDSym
         Get()

      when C_DEFAULTSym
         Get()

      when C_LENGTHSym
         Get()

      when C_DECIMALSSym
         Get()

      when C_BOXEDSym
         Get()

      when C_SUFFIXSym
         Get()

      when C_COMPONENTSSym
         Get()

      when C_EXCEPTIONSSym
         Get()

      when C_KINDSym
         Get()

      when C_DELETESym
         Get()

      when C_ACTIVATIONSym
         Get()

      when C_OFSym
         Get()

      when C_EOFSym
         Get()

      when C_REPORTSym
         Get()

      when C_NOSym
         Get()

      when C_PAGESym
         Get()

      when C_HEADINGSym
         Get()

      when C_DEFININGSym
         Get()

      when C_DATABASESym
         Get()

      when C_REDUCEDSym
         Get()

      when C_FUNCTIONALITYSym
         Get()

      when C_FUNCTIONSym
         Get()

      when C_ENDFUNCTIONSym
         Get()

      when C_ENDSELECTSym
         Get()

      when C_FIELDSSym
         Get()

      when C_DISTINCTSym
         Get()

      when C_FROMSym
         Get()

      when C_ASSym
         Get()

      when C_USINGSym
         Get()

      when C_CLIENTSym
         Get()

      when C_SPECIFIEDSym
         Get()

      when C_INNERSym
         Get()

      when C_LEFTSym
         Get()

      when C_RIGHTSym
         Get()

      when C_OUTERSym
         Get()

      when C_CROSSSym
         Get()

      when C_JOINSym
         Get()

      when C_ONSym
         Get()

      when C_ORDERSym
         Get()

      when C_BYSym
         Get()

      when C_PRIMARYSym
         Get()

      when C_ASCENDINGSym
         Get()

      when C_DESCENDINGSym
         Get()

      when C_APPENDINGSym
         Get()

      when C_CORRESPONDINGSym
         Get()

      when C_PACKAGESym
         Get()

      when C_SIZESym
         Get()

      when C_SELECTSym
         Get()

      when C_SINGLESym
         Get()

      when C_FORSym
         Get()

      when C_UPDATESym
         Get()

      when C_ENTRIESSym
         Get()

      when C_INSym
         Get()

      when C_WHERESym
         Get()

      when C_GROUPSym
         Get()

      when C_HAVINGSym
         Get()

      when C_UNIONSym
         Get()

      when C_EXTENDEDSym
         Get()

      when C_RESULTSym
         Get()

      when C_CREATINGSym
         Get()

      when C_READERSym
         Get()

      when C_LOCATORSym
         Get()

      when C_COLUMNSSym
         Get()

      when C_BLOBSym
         Get()

      when C_CLOBSym
         Get()

      when C_OFFSETSym
         Get()

      when C_UPSym
         Get()

      when C_TOSym
         Get()

      when C_ROWSSym
         Get()

      when C_BYPASSINGSym
         Get()

      when C_BUFFERSym
         Get()

      when C_CONNECTIONSym
         Get()

      when C_ENDWITHSym
         Get()

      when C_TABLESSym
         Get()

      when C_MOVESym
         Get()

      when C_EXACTSym
         Get()

      when C_PERCENTAGESym
         Get()

      when C_EXPANDINGSym
         Get()

      when C_NESTEDSym
         Get()

      when C_KEEPINGSym
         Get()

      when C_APPENDSym
         Get()

      when C_LINESym
         Get()

      when C_CASTINGSym
         Get()

      when C_CONCATENATESym
         Get()

      when C_CHARACTERSym
         Get()

      when C_BYTESym
         Get()

      when C_MODESym
         Get()

      when C_SEPARATEDSym
         Get()

      when C_RESPECTINGSym
         Get()

      when C_BLANKSSym
         Get()

      when C_SEARCHSym
         Get()

      when C_STARTINGSym
         Get()

      when C_ATSym
         Get()

      when C_ENDINGSym
         Get()

      when C_ABBREVIATEDSym
         Get()

      when C_ANDSym
         Get()

      when C_MARKSym
         Get()

      when C_RAISESym
         Get()

      when C_EVENTSym
         Get()

      when C_RESUMABLESym
         Get()

      when C_EXCEPTIONSym
         Get()

      when C_NUMBERSym
         Get()

      when C_DISPLAYSym
         Get()

      when C_LIKESym
         Get()

      when C_RAISINGSym
         Get()

      when C_INDEXSym
         Get()

      when C_TEXTSym
         Get()

      when C_WITHOUTSym
         Get()

      when C_MEMBERSSym
         Get()

      when C_LOOPSym
         Get()

      when C_VERSIONSym
         Get()

      when C_SCREENSym
         Get()

      when C_ENDLOOPSym
         Get()

      when C_LOBSym
         Get()

      when C_HANDLESym
         Get()

      when C_EMPTYSym
         Get()

      when C_HEADERSym
         Get()

      when C_UNIQUESym
         Get()

      when C_PRIMARYUnderscoreKEYSym
         Get()

      when C_ALIASSym
         Get()

      when C_STATICSSym
         Get()

      when C_CONSTANTSSym
         Get()

      when C_BEGINSym
         Get()

      when C_COMMONSym
         Get()

      when C_PARTSym
         Get()

      when C_OCCURSSym
         Get()

      when C_VALIDSym
         Get()

      when C_BETWEENSym
         Get()

      when C_ISSym
         Get()

      when C_WRITESym
         Get()

      when C_UNDERSym
         Get()

      when C_CENTEREDSym
         Get()

      when C_EXPONENTSym
         Get()

      when C_CURRENCYSym
         Get()

      when C_ROUNDSym
         Get()

      when C_UNITSym
         Get()

      when C_ENVIRONMENTSym
         Get()

      when C_TIMESym
         Get()

      when C_FORMATSym
         Get()

      when C_ZONESym
         Get()

      when C_STYLESym
         Get()

      when C_MASKSym
         Get()

      when C_DDMMYYSym
         Get()

      when C_MMDDYYSym
         Get()

      when C_YYMMDDSym
         Get()

      when C_CHECKBOXSym
         Get()

      when C_ICONSym
         Get()

      when C_SYMBOLSym
         Get()

      when C_QUICKINFOSym
         Get()

      when C_CONTINUESym
         Get()

      when C_CASESym
         Get()

      when C_WHENSym
         Get()

      when C_ORSym
         Get()

      when C_OTHERSSym
         Get()

      when C_ENDCASESym
         Get()

      when C_FIELDSym
         Get()

      when C_DUMMYSym
         Get()

      when C_OBJECTSym
         Get()

      when C_USERSym
         Get()

      when C_DATASETSym
         Get()

      when C_ADJACENTSym
         Get()

      when C_DUPLICATESSym
         Get()

      when C_COMPARINGSym
         Get()

      when C_MEMORYSym
         Get()

      when C_SHAREDSym
         Get()

      when C_VARYINGSym
         Get()

      when C_NEXTSym
         Get()

      when C_DOSym
         Get()

      when C_TIMESSym
         Get()

      when C_ENDDOSym
         Get()

      when C_OPTIONALSym
         Get()

      when C_EVENTSSym
         Get()

      when C_MODIFYSym
         Get()

      when C_CURRENTSym
         Get()

      when C_CHANGESym
         Get()

      when C_ENDONSym
         Get()

      when C_OPENSym
         Get()

      when C_CURSORSym
         Get()

      when C_HOLDSym
         Get()

      when C_INPUTSym
         Get()

      when C_OUTPUTSym
         Get()

      when C_ENCODINGSym
         Get()

      when C_SKIPPINGSym
         Get()

      when C_NATIVESym
         Get()

      when C_SMARTSym
         Get()

      when C_UNIXSym
         Get()

      when C_WINDOWSSym
         Get()

      when C_LINEFEEDSym
         Get()

      when C_LEGACYSym
         Get()

      when C_BIGSym
         Get()

      when C_LITTLESym
         Get()

      when C_ENDIANSym
         Get()

      when C_CODESym
         Get()

      when C_POSITIONSym
         Get()

      when C_FILTERSym
         Get()

      when C_IGNORINGSym
         Get()

      when C_CONVERSIONSym
         Get()

      when C_ERRORSSym
         Get()

      when C_REPLACEMENTSym
         Get()

      when C_FETCHSym
         Get()

      when C_BOUNDSSym
         Get()

      when C_PROVIDESym
         Get()

      when C_INCLUDINGSym
         Get()

      when C_GAPSSym
         Get()

      when C_ENDPROVIDESym
         Get()

      when C_READSym
         Get()

      when C_MAXIMUMSym
         Get()

      when C_ACTUALSym
         Get()

      when C_WIDTHSym
         Get()

      when C_TEXTPOOLSym
         Get()

      when C_LANGUAGESym
         Get()

      when C_SORTSym
         Get()

      when C_SUBMITSym
         Get()

      when C_VIASym
         Get()

      when C_PROGRAMSym
         Get()

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

      when C_NOTSym
         Get()

      when C_FREESym
         Get()

      when C_SELECTIONSSym
         Get()

      when C_LISTSym
         Get()

      when C_SPOOLSym
         Get()

      when C_ARCHIVESym
         Get()

      when C_DYNPROSym
         Get()

      when C_JOBSym
         Get()

      when C_RETURNSym
         Get()

      when C_TRYSym
         Get()

      when C_CATCHSym
         Get()

      when C_BEFORESym
         Get()

      when C_UNWINDSym
         Get()

      when C_CLEANUPSym
         Get()

      when C_ENDTRYSym
         Get()

      when C_ASSOCIATIONSym
         Get()

      when C_TYPESSym
         Get()

      when C_ENUMSym
         Get()

      when C_STRUCTURESym
         Get()

      when C_BASESym
         Get()

      when C_MESHSym
         Get()

      when C_SETSym
         Get()

      when C_WHILESym
         Get()

      when C_VARYSym
         Get()

      when C_ENDWHILESym
         Get()

      when C_TASKSym
         Get()

      when C_NEWSym
         Get()

      when C_BACKGROUNDSym
         Get()

      when C_SEPARATESym
         Get()

      when C_DESTINATIONSym
         Get()

      when C_CALLINGSym
         Get()

      when C_PERFORMINGSym
         Get()

      when C_IFSym
         Get()

      when C_ELSEIFSym
         Get()

      when C_ELSESym
         Get()

      when C_ENDIFSym
         Get()

      when C_CLASSSym
         Get()

      when C_DEFINITIONSym
         Get()

      when C_DEFERREDSym
         Get()

      when C_PUBLICSym
         Get()

      when C_PROTECTEDSym
         Get()

      when C_PRIVATESym
         Get()

      when C_INHERITINGSym
         Get()

      when C_ABSTRACTSym
         Get()

      when C_FINALSym
         Get()

      when C_ENABLEDSym
         Get()

      when C_TESTINGSym
         Get()

      when C_RISKSym
         Get()

      when C_LEVELSym
         Get()

      when C_CRITICALSym
         Get()

      when C_DANGEROUSSym
         Get()

      when C_HARMLESSSym
         Get()

      when C_DURATIONSym
         Get()

      when C_SHORTSym
         Get()

      when C_MEDIUMSym
         Get()

      when C_LONGSym
         Get()

      when C_GLOBALSym
         Get()

      when C_FRIENDSSym
         Get()

      when C_LOADSym
         Get()

      when C_IMPLEMENTATIONSym
         Get()

      when C_SECTIONSym
         Get()

      when C_ENDCLASSSym
         Get()

      when C_METHODSym
         Get()

      when C_ENDMETHODSym
         Get()

      when C_ANYSym
         Get()

      when C_METHODSSym
         Get()

      when C_REDEFINITIONSym
         Get()

      when C_IGNORESym
         Get()

      when C_FAILSym
         Get()

      when C_PREFERREDSym
         Get()

      when C_ADDSym
         Get()

      when C_THENSym
         Get()

      when C_UNTILSym
         Get()

      when C_GIVINGSym
         Get()

      when C_ACCORDINGSym
         Get()

      when C_ALIASESSym
         Get()

      when C_ASSERTSym
         Get()

      when C_SUBKEYSym
         Get()

      when C_CONDITIONSym
         Get()

      when C_ASSIGNSym
         Get()

      when C_COMPONENTSym
         Get()

      when C_INCREMENTSym
         Get()

      when C_FIRSTSym
         Get()

      when C_LASTSym
         Get()

      when C_ENDATSym
         Get()

      when C_BACKSym
         Get()

      when C_CALLSym
         Get()

      when C_DIALOGSym
         Get()

      when C_SKIPSym
         Get()

      when C_PROCEDURESym
         Get()

      when C_FLUSHSym
         Get()

      when C_TRANSACTIONSym
         Get()

      when C_OPTIONSSym
         Get()

      when C_MESSAGESSym
         Get()

      when C_TRANSFORMATIONSym
         Get()

      when C_OBJECTSSym
         Get()

      when C_SOURCESym
         Get()

      when C_XMLSym
         Get()

      when C_AREASym
         Get()

      when C_BADISym
         Get()

      when C_CLEARSym
         Get()

      when C_NULLSym
         Get()

      when C_CLOSESym
         Get()

      when C_COLLECTSym
         Get()

      when C_COMMITSym
         Get()

      when C_WORKSym
         Get()

      when C_WAITSym
         Get()

      when C_COMPUTESym
         Get()

      when C_CONDENSESym
         Get()

      when C_CONTROLSSym
         Get()

      when C_TABLEVIEWSym
         Get()

      when C_TABSTRIPSym
         Get()

      when C_CONVERTSym
         Get()

      when C_SORTABLESym
         Get()

      when C_STAMPSym
         Get()

      when C_DAYLIGHTSym
         Get()

      when C_SAVINGSym
         Get()

      when C_DEMANDSym
         Get()

      when C_CONTEXTSym
         Get()

      when C_DESCRIBESym
         Get()

      when C_DISTANCESym
         Get()

      when C_PAGESSym
         Get()

      when C_DETAILSym
         Get()

      when C_DIVIDESym
         Get()

      when C_TITLESym
         Get()

      when C_BACKUPSym
         Get()

      when C_EXITSym
         Get()

      when C_SQLSym
         Get()

      when C_EXPORTSym
         Get()

      when C_INTERNALSym
         Get()

      when C_COMPRESSIONSym
         Get()

      when C_OFFSym
         Get()

      when C_EXTRACTSym
         Get()

      when C_FINDSym
         Get()

      when C_OCCURRENCESym
         Get()

      when C_OCCURRENCESSym
         Get()

      when C_SUBSTRINGSym
         Get()

      when C_REGEXSym
         Get()

      when C_MATCHSym
         Get()

      when C_COUNTSym
         Get()

      when C_RESULTSSym
         Get()

      when C_SUBMATCHESSym
         Get()

      when C_COLORSym
         Get()

      when C_COLUnderscoreBACKGROUNDSym
         Get()

      when C_COLUnderscoreHEADINGSym
         Get()

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

      when C_INTENSIFIEDSym
         Get()

      when C_INVERSESym
         Get()

      when C_HOTSPOTSym
         Get()

      when C_FRAMESSym
         Get()

      when C_RESETSym
         Get()

      when C_GENERATESym
         Get()

      when C_SUBROUTINESym
         Get()

      when C_POOLSym
         Get()

      when C_INCLUDESym
         Get()

      when C_GETSym
         Get()

      when C_FILTERSSym
         Get()

      when C_BITSym
         Get()

      when C_ATTRIBUTESSym
         Get()

      when C_LOCALESym
         Get()

      when C_COUNTRYSym
         Get()

      when C_MODIFIERSym
         Get()

      when C_EXCLUDINGSym
         Get()

      when C_PROPERTYSym
         Get()

      when C_RUNSym
         Get()

      when C_HIDESym
         Get()

      when C_IMPORTSym
         Get()

      when C_ACCEPTINGSym
         Get()

      when C_PADDINGSym
         Get()

      when C_TRUNCATIONSym
         Get()

      when C_BOUNDARIESSym
         Get()

      when C_DIRECTORYSym
         Get()

      when C_RENAMINGSym
         Get()

      when C_FOUNDSym
         Get()

      when C_INFOTYPESSym
         Get()

      when C_PERSONSym
         Get()

      when C_INITIALIZATIONSym
         Get()

      when C_INSERTSym
         Get()

      when C_VALUESSym
         Get()

      when C_DUPLICATESym
         Get()

      when C_KEYSSym
         Get()

      when C_ENTRYSym
         Get()

      when C_ARITHMETICSym
         Get()

      when C_UNICODESym
         Get()

      when C_ENABLINGSym
         Get()

      when C_INTERFACESym
         Get()

      when C_ENDINTERFACESym
         Get()

      when C_INTERFACESSym
         Get()

      when C_PARTIALLYSym
         Get()

      when C_IMPLEMENTEDSym
         Get()

      when C_LEAVESym
         Get()

      when C_LOCALSym
         Get()

      when C_MINIMUMSym
         Get()

      when C_MODULESym
         Get()

      when C_ENDMODULESym
         Get()

      when C_MULTIPLYSym
         Get()

      when C_SCROLLINGSym
         Get()

      when C_PRINTSym
         Get()

      when C_NODESSym
         Get()

      when C_OVERLAYSym
         Get()

      when C_ONLYSym
         Get()

      when C_PACKSym
         Get()

      when C_OBLIGATORYSym
         Get()

      when C_VISIBLESym
         Get()

      when C_LISTBOXSym
         Get()

      when C_RADIOBUTTONSym
         Get()

      when C_MODIFSym
         Get()

      when C_LOWERSym
         Get()

      when C_MATCHCODESym
         Get()

      when C_PATTERNSym
         Get()

      when C_PERFORMSym
         Get()

      when C_ROLLBACKSym
         Get()

      when C_RANGESSym
         Get()

      when C_RECEIVESym
         Get()

      when C_REFRESHSym
         Get()

      when C_CONTROLSym
         Get()

      when C_REJECTSym
         Get()

      when C_REPLACESym
         Get()

      when C_RESERVESym
         Get()

      when C_RESUMESym
         Get()

      when C_RETRYSym
         Get()

      when C_SCROLLSym
         Get()

      when C_COLUMNSym
         Get()

      when C_PLACESSym
         Get()

      when C_FORWARDSym
         Get()

      when C_BACKWARDSym
         Get()

      when C_INTERVALSSym
         Get()

      when C_OPTIONSym
         Get()

      when C_SELECTIONSym
         Get()

      when C_LOWSym
         Get()

      when C_HIGHSym
         Get()

      when C_TABSym
         Get()

      when C_BLANKSym
         Get()

      when C_FILESym
         Get()

      when C_HANDLERSym
         Get()

      when C_INSTANCESSym
         Get()

      when C_MARGINSym
         Get()

      when C_IMMEDIATELYSym
         Get()

      when C_ANALYZERSym
         Get()

      when C_CLOCKSym
         Get()

      when C_RESOLUTIONSym
         Get()

      when C_TITLEBARSym
         Get()

      when C_SHIFTSym
         Get()

      when C_CIRCULARSym
         Get()

      when C_DELETINGSym
         Get()

      when C_LEADINGSym
         Get()

      when C_TRAILINGSym
         Get()

      when C_STOPSym
         Get()

      when C_SUBTRACTSym
         Get()

      when C_SUMSym
         Get()

      when C_SUMMARYSym
         Get()

      when C_SUMMINGSym
         Get()

      when C_SUPPLYSym
         Get()

      when C_SUPPRESSSym
         Get()

      when C_SWITCHSTATESSym
         Get()

      when C_DURINGSym
         Get()

      when C_TRANSFERSym
         Get()

      when C_TRANSLATESym
         Get()

      when C_UPPERSym
         Get()

      when C_TRUNCATESym
         Get()

      when C_ULINESym
         Get()

      when C_UNASSIGNSym
         Get()

      when C_UNPACKSym
         Get()

      when C_SECONDSSym
         Get()

      when C_ASYNCHRONOUSSym
         Get()

      when C_TASKSSym
         Get()

      when C_MESSAGINGSym
         Get()

      when C_CHANNELSSym
         Get()

      when C_PUSHSym
         Get()

      when C_WINDOWSym
         Get()

      when C_SPLITSym
         Get()

      when C_DIVSym
         Get()

      when C_MODSym
         Get()

      when C_EQUIVSym
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

      when C_INSTANCESym
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
         GenError(709)

      end

      _out_()
   end
   def AllowedKeywordsExclude()
      _in_()
      case @sym

      when C_DATASym
         Get()

      when C_REFSym
         Get()

      when C_VALUESym
         Get()

      when C_PARAMETERSym
         Get()

      when C_TARGETSym
         Get()

      when C_IDSym
         Get()

      when C_EOFSym
         Get()

      when C_KEYSym
         Get()

      when C_DEFAULTSym
         Get()

      when C_LENGTHSym
         Get()

      when C_DECIMALSSym
         Get()

      when C_BOXEDSym
         Get()

      when C_SUFFIXSym
         Get()

      when C_COMPONENTSSym
         Get()

      when C_EXCEPTIONSSym
         Get()

      when C_KINDSym
         Get()

      when C_ACTIVATIONSym
         Get()

      when C_SORTEDSym
         Get()

      when C_EDITSym
         Get()

      when C_NODESym
         Get()

      when C_REPORTSym
         Get()

      when C_NOSym
         Get()

      when C_PAGESym
         Get()

      when C_HEADINGSym
         Get()

      when C_DEFININGSym
         Get()

      when C_DATABASESym
         Get()

      when C_REDUCEDSym
         Get()

      when C_FUNCTIONALITYSym
         Get()

      when C_DISTINCTSym
         Get()

      when C_FROMSym
         Get()

      when C_ASSym
         Get()

      when C_USINGSym
         Get()

      when C_CLIENTSym
         Get()

      when C_SPECIFIEDSym
         Get()

      when C_INNERSym
         Get()

      when C_LEFTSym
         Get()

      when C_RIGHTSym
         Get()

      when C_OUTERSym
         Get()

      when C_CROSSSym
         Get()

      when C_JOINSym
         Get()

      when C_ORDERSym
         Get()

      when C_BYSym
         Get()

      when C_PRIMARYSym
         Get()

      when C_ASCENDINGSym
         Get()

      when C_DESCENDINGSym
         Get()

      when C_APPENDINGSym
         Get()

      when C_CORRESPONDINGSym
         Get()

      when C_OFSym
         Get()

      when C_PACKAGESym
         Get()

      when C_SIZESym
         Get()

      when C_SINGLESym
         Get()

      when C_FORSym
         Get()

      when C_ALLSym
         Get()

      when C_ENTRIESSym
         Get()

      when C_INSym
         Get()

      when C_WHERESym
         Get()

      when C_GROUPSym
         Get()

      when C_HAVINGSym
         Get()

      when C_UNIONSym
         Get()

      when C_EXTENDEDSym
         Get()

      when C_RESULTSym
         Get()

      when C_CREATINGSym
         Get()

      when C_READERSym
         Get()

      when C_LOCATORSym
         Get()

      when C_COLUMNSSym
         Get()

      when C_OTHERSym
         Get()

      when C_BLOBSym
         Get()

      when C_CLOBSym
         Get()

      when C_OFFSETSym
         Get()

      when C_UPSym
         Get()

      when C_TOSym
         Get()

      when C_ROWSSym
         Get()

      when C_BYPASSINGSym
         Get()

      when C_BUFFERSym
         Get()

      when C_CONNECTIONSym
         Get()

      when C_ENDWITHSym
         Get()

      when C_EXACTSym
         Get()

      when C_PERCENTAGESym
         Get()

      when C_EXPANDINGSym
         Get()

      when C_NESTEDSym
         Get()

      when C_KEEPINGSym
         Get()

      when C_INITIALSym
         Get()

      when C_ASSIGNINGSym
         Get()

      when C_CASTINGSym
         Get()

      when C_REFERENCESym
         Get()

      when C_CHARACTERSym
         Get()

      when C_BYTESym
         Get()

      when C_MODESym
         Get()

      when C_SEPARATEDSym
         Get()

      when C_RESPECTINGSym
         Get()

      when C_BLANKSSym
         Get()

      when C_STARTINGSym
         Get()

      when C_ENDINGSym
         Get()

      when C_ABBREVIATEDSym
         Get()

      when C_ANDSym
         Get()

      when C_MARKSym
         Get()

      when C_EVENTSym
         Get()

      when C_EXPORTINGSym
         Get()

      when C_RESUMABLESym
         Get()

      when C_EXCEPTIONSym
         Get()

      when C_NUMBERSym
         Get()

      when C_DISPLAYSym
         Get()

      when C_LIKESym
         Get()

      when C_RAISINGSym
         Get()

      when C_TEXTSym
         Get()

      when C_WITHOUTSym
         Get()

      when C_MEMBERSSym
         Get()

      when C_TRANSPORTINGSym
         Get()

      when C_VERSIONSym
         Get()

      when C_SCREENSym
         Get()

      when C_LOBSym
         Get()

      when C_HANDLESym
         Get()

      when C_HASHEDSym
         Get()

      when C_EMPTYSym
         Get()

      when C_HEADERSym
         Get()

      when C_UNIQUESym
         Get()

      when C_PRIMARYUnderscoreKEYSym
         Get()

      when C_ALIASSym
         Get()

      when C_RANGESym
         Get()

      when C_STATICSSym
         Get()

      when C_BEGINSym
         Get()

      when C_COMMONSym
         Get()

      when C_PARTSym
         Get()

      when C_OCCURSSym
         Get()

      when C_VALIDSym
         Get()

      when C_BETWEENSym
         Get()

      when C_ISSym
         Get()

      when C_UNDERSym
         Get()

      when C_CENTEREDSym
         Get()

      when C_EXPONENTSym
         Get()

      when C_CURRENCYSym
         Get()

      when C_ROUNDSym
         Get()

      when C_UNITSym
         Get()

      when C_ENVIRONMENTSym
         Get()

      when C_TIMESym
         Get()

      when C_ZONESym
         Get()

      when C_STYLESym
         Get()

      when C_MASKSym
         Get()

      when C_DDMMYYSym
         Get()

      when C_MMDDYYSym
         Get()

      when C_YYMMDDSym
         Get()

      when C_CHECKBOXSym
         Get()

      when C_ICONSym
         Get()

      when C_SYMBOLSym
         Get()

      when C_QUICKINFOSym
         Get()

      when C_WHENSym
         Get()

      when C_ORSym
         Get()

      when C_OTHERSSym
         Get()

      when C_FIELDSym
         Get()

      when C_DUMMYSym
         Get()

      when C_OBJECTSym
         Get()

      when C_USERSym
         Get()

      when C_DATASETSym
         Get()

      when C_ADJACENTSym
         Get()

      when C_DUPLICATESSym
         Get()

      when C_COMPARINGSym
         Get()

      when C_MEMORYSym
         Get()

      when C_SHAREDSym
         Get()

      when C_VARYINGSym
         Get()

      when C_NEXTSym
         Get()

      when C_TIMESSym
         Get()

      when C_OPTIONALSym
         Get()

      when C_CURRENTSym
         Get()

      when C_CHANGESym
         Get()

      when C_CURSORSym
         Get()

      when C_HOLDSym
         Get()

      when C_OUTPUTSym
         Get()

      when C_BINARYSym
         Get()

      when C_ENCODINGSym
         Get()

      when C_SKIPPINGSym
         Get()

      when C_NATIVESym
         Get()

      when C_SMARTSym
         Get()

      when C_UNIXSym
         Get()

      when C_WINDOWSSym
         Get()

      when C_LINEFEEDSym
         Get()

      when C_LEGACYSym
         Get()

      when C_BIGSym
         Get()

      when C_LITTLESym
         Get()

      when C_ENDIANSym
         Get()

      when C_CODESym
         Get()

      when C_FILTERSym
         Get()

      when C_IGNORINGSym
         Get()

      when C_CONVERSIONSym
         Get()

      when C_ERRORSSym
         Get()

      when C_REPLACEMENTSym
         Get()

      when C_BOUNDSSym
         Get()

      when C_INCLUDINGSym
         Get()

      when C_GAPSSym
         Get()

      when C_ACTUALSym
         Get()

      when C_WIDTHSym
         Get()

      when C_TEXTPOOLSym
         Get()

      when C_LANGUAGESym
         Get()

      when C_VIASym
         Get()

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

      when C_SELECTIONSSym
         Get()

      when C_LISTSym
         Get()

      when C_SPOOLSym
         Get()

      when C_ARCHIVESym
         Get()

      when C_DYNPROSym
         Get()

      when C_JOBSym
         Get()

      when C_BEFORESym
         Get()

      when C_UNWINDSym
         Get()

      when C_CLEANUPSym
         Get()

      when C_ASSOCIATIONSym
         Get()

      when C_ENUMSym
         Get()

      when C_STRUCTURESym
         Get()

      when C_BASESym
         Get()

      when C_MESHSym
         Get()

      when C_VARYSym
         Get()

      when C_TASKSym
         Get()

      when C_NEWSym
         Get()

      when C_BACKGROUNDSym
         Get()

      when C_SEPARATESym
         Get()

      when C_DESTINATIONSym
         Get()

      when C_CALLINGSym
         Get()

      when C_PERFORMINGSym
         Get()

      when C_IMPORTINGSym
         Get()

      when C_ELSESym
         Get()

      when C_DEFINITIONSym
         Get()

      when C_DEFERREDSym
         Get()

      when C_PUBLICSym
         Get()

      when C_PROTECTEDSym
         Get()

      when C_PRIVATESym
         Get()

      when C_INHERITINGSym
         Get()

      when C_ABSTRACTSym
         Get()

      when C_FINALSym
         Get()

      when C_ENABLEDSym
         Get()

      when C_TESTINGSym
         Get()

      when C_RISKSym
         Get()

      when C_LEVELSym
         Get()

      when C_CRITICALSym
         Get()

      when C_DANGEROUSSym
         Get()

      when C_HARMLESSSym
         Get()

      when C_DURATIONSym
         Get()

      when C_SHORTSym
         Get()

      when C_MEDIUMSym
         Get()

      when C_LONGSym
         Get()

      when C_GLOBALSym
         Get()

      when C_FRIENDSSym
         Get()

      when C_LOADSym
         Get()

      when C_IMPLEMENTATIONSym
         Get()

      when C_SECTIONSym
         Get()

      when C_REDEFINITIONSym
         Get()

      when C_IGNORESym
         Get()

      when C_FAILSym
         Get()

      when C_PREFERREDSym
         Get()

      when C_RETURNINGSym
         Get()

      when C_THENSym
         Get()

      when C_UNTILSym
         Get()

      when C_GIVINGSym
         Get()

      when C_ACCORDINGSym
         Get()

      when C_SUBKEYSym
         Get()

      when C_CONDITIONSym
         Get()

      when C_COMPONENTSym
         Get()

      when C_INCREMENTSym
         Get()

      when C_FIRSTSym
         Get()

      when C_LASTSym
         Get()

      when C_DIALOGSym
         Get()

      when C_PROCEDURESym
         Get()

      when C_FLUSHSym
         Get()

      when C_TRANSACTIONSym
         Get()

      when C_OPTIONSSym
         Get()

      when C_MESSAGESSym
         Get()

      when C_TRANSFORMATIONSym
         Get()

      when C_OBJECTSSym
         Get()

      when C_SOURCESym
         Get()

      when C_XMLSym
         Get()

      when C_AREASym
         Get()

      when C_BADISym
         Get()

      when C_NULLSym
         Get()

      when C_WORKSym
         Get()

      when C_TABLEVIEWSym
         Get()

      when C_TABSTRIPSym
         Get()

      when C_SORTABLESym
         Get()

      when C_STAMPSym
         Get()

      when C_DAYLIGHTSym
         Get()

      when C_SAVINGSym
         Get()

      when C_CONTEXTSym
         Get()

      when C_DISTANCESym
         Get()

      when C_PAGESSym
         Get()

      when C_TITLESym
         Get()

      when C_BACKUPSym
         Get()

      when C_SQLSym
         Get()

      when C_INTERNALSym
         Get()

      when C_COMPRESSIONSym
         Get()

      when C_OFFSym
         Get()

      when C_OCCURRENCESym
         Get()

      when C_OCCURRENCESSym
         Get()

      when C_SUBSTRINGSym
         Get()

      when C_REGEXSym
         Get()

      when C_MATCHSym
         Get()

      when C_COUNTSym
         Get()

      when C_RESULTSSym
         Get()

      when C_SUBMATCHESSym
         Get()

      when C_COLORSym
         Get()

      when C_COLUnderscoreBACKGROUNDSym
         Get()

      when C_COLUnderscoreHEADINGSym
         Get()

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

      when C_INTENSIFIEDSym
         Get()

      when C_INVERSESym
         Get()

      when C_HOTSPOTSym
         Get()

      when C_FRAMESSym
         Get()

      when C_RESETSym
         Get()

      when C_SUBROUTINESym
         Get()

      when C_POOLSym
         Get()

      when C_FILTERSSym
         Get()

      when C_BITSym
         Get()

      when C_ATTRIBUTESSym
         Get()

      when C_LOCALESym
         Get()

      when C_COUNTRYSym
         Get()

      when C_MODIFIERSym
         Get()

      when C_EXCLUDINGSym
         Get()

      when C_PROPERTYSym
         Get()

      when C_RUNSym
         Get()

      when C_ACCEPTINGSym
         Get()

      when C_PADDINGSym
         Get()

      when C_TRUNCATIONSym
         Get()

      when C_BOUNDARIESSym
         Get()

      when C_DIRECTORYSym
         Get()

      when C_RENAMINGSym
         Get()

      when C_FOUNDSym
         Get()

      when C_PERSONSym
         Get()

      when C_VALUESSym
         Get()

      when C_DUPLICATESym
         Get()

      when C_KEYSSym
         Get()

      when C_ENTRYSym
         Get()

      when C_ARITHMETICSym
         Get()

      when C_UNICODESym
         Get()

      when C_ENABLINGSym
         Get()

      when C_PARTIALLYSym
         Get()

      when C_IMPLEMENTEDSym
         Get()

      when C_SCROLLINGSym
         Get()

      when C_PRINTSym
         Get()

      when C_ONLYSym
         Get()

      when C_OBLIGATORYSym
         Get()

      when C_VISIBLESym
         Get()

      when C_LISTBOXSym
         Get()

      when C_RADIOBUTTONSym
         Get()

      when C_MODIFSym
         Get()

      when C_LOWERSym
         Get()

      when C_MATCHCODESym
         Get()

      when C_PATTERNSym
         Get()

      when C_CONTROLSym
         Get()

      when C_COLUMNSym
         Get()

      when C_PLACESSym
         Get()

      when C_FORWARDSym
         Get()

      when C_BACKWARDSym
         Get()

      when C_INTERVALSSym
         Get()

      when C_OPTIONSym
         Get()

      when C_SELECTIONSym
         Get()

      when C_LOWSym
         Get()

      when C_HIGHSym
         Get()

      when C_TABSym
         Get()

      when C_BLANKSym
         Get()

      when C_FILESym
         Get()

      when C_HANDLERSym
         Get()

      when C_INSTANCESSym
         Get()

      when C_MARGINSym
         Get()

      when C_IMMEDIATELYSym
         Get()

      when C_ANALYZERSym
         Get()

      when C_CLOCKSym
         Get()

      when C_RESOLUTIONSym
         Get()

      when C_TITLEBARSym
         Get()

      when C_CIRCULARSym
         Get()

      when C_DELETINGSym
         Get()

      when C_LEADINGSym
         Get()

      when C_TRAILINGSym
         Get()

      when C_SWITCHSTATESSym
         Get()

      when C_DURINGSym
         Get()

      when C_UPPERSym
         Get()

      when C_SECONDSSym
         Get()

      when C_ASYNCHRONOUSSym
         Get()

      when C_TASKSSym
         Get()

      when C_MESSAGINGSym
         Get()

      when C_CHANNELSSym
         Get()

      when C_PUSHSym
         Get()

      when C_DIVSym
         Get()

      when C_MODSym
         Get()

      when C_EQUIVSym
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

      when C_INSTANCESym
         Get()

      when C_BOUNDSym
         Get()

      when C_ASSIGNEDSym
         Get()

      when C_SUPPLIEDSym
         Get()

      when C_REQUESTEDSym
         Get()

      when C_LINESSym
         Get()

      else
         GenError(710)

      end

      _out_()
   end
   def AllowedKeywords()
      _in_()
      case @sym

      when C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_PARAMETERSSym,
         C_TARGETSym,
         C_MESSAGESym,
         C_ENDSym,
         C_CREATESym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_DELETESym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_FUNCTIONSym,
         C_ENDFUNCTIONSym,
         C_ENDSELECTSym,
         C_FIELDSSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ONSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SELECTSym,
         C_SINGLESym,
         C_FORSym,
         C_UPDATESym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_TABLESSym,
         C_MOVESym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_APPENDSym,
         C_LINESym,
         C_CASTINGSym,
         C_CONCATENATESym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_SEARCHSym,
         C_STARTINGSym,
         C_ATSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_RAISESym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_INDEXSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_LOOPSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_ENDLOOPSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_WRITESym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_FORMATSym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_CONTINUESym,
         C_CASESym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_ENDCASESym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_DOSym,
         C_TIMESSym,
         C_ENDDOSym,
         C_OPTIONALSym,
         C_EVENTSSym,
         C_MODIFYSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_ENDONSym,
         C_OPENSym,
         C_CURSORSym,
         C_HOLDSym,
         C_INPUTSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_POSITIONSym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_FETCHSym,
         C_BOUNDSSym,
         C_PROVIDESym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ENDPROVIDESym,
         C_READSym,
         C_MAXIMUMSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_SORTSym,
         C_SUBMITSym,
         C_VIASym,
         C_PROGRAMSym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_NOTSym,
         C_FREESym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_RETURNSym,
         C_TRYSym,
         C_CATCHSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ENDTRYSym,
         C_ASSOCIATIONSym,
         C_TYPESSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_SETSym,
         C_WHILESym,
         C_VARYSym,
         C_ENDWHILESym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_IFSym,
         C_ELSEIFSym,
         C_ELSESym,
         C_ENDIFSym,
         C_CLASSSym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_ENDCLASSSym,
         C_METHODSym,
         C_ENDMETHODSym,
         C_ANYSym,
         C_METHODSSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_ADDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_ALIASESSym,
         C_ASSERTSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_ASSIGNSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_ENDATSym,
         C_BACKSym,
         C_CALLSym,
         C_DIALOGSym,
         C_SKIPSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_CLEARSym,
         C_NULLSym,
         C_CLOSESym,
         C_COLLECTSym,
         C_COMMITSym,
         C_WORKSym,
         C_WAITSym,
         C_COMPUTESym,
         C_CONDENSESym,
         C_CONTROLSSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_CONVERTSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_DEMANDSym,
         C_CONTEXTSym,
         C_DESCRIBESym,
         C_DISTANCESym,
         C_PAGESSym,
         C_DETAILSym,
         C_DIVIDESym,
         C_TITLESym,
         C_BACKUPSym,
         C_EXITSym,
         C_SQLSym,
         C_EXPORTSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_EXTRACTSym,
         C_FINDSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_GENERATESym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_INCLUDESym,
         C_GETSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_HIDESym,
         C_IMPORTSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_INFOTYPESSym,
         C_PERSONSym,
         C_INITIALIZATIONSym,
         C_INSERTSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_INTERFACESym,
         C_ENDINTERFACESym,
         C_INTERFACESSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_LEAVESym,
         C_LOCALSym,
         C_MINIMUMSym,
         C_MODULESym,
         C_ENDMODULESym,
         C_MULTIPLYSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_NODESSym,
         C_OVERLAYSym,
         C_ONLYSym,
         C_PACKSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_PERFORMSym,
         C_ROLLBACKSym,
         C_RANGESSym,
         C_RECEIVESym,
         C_REFRESHSym,
         C_CONTROLSym,
         C_REJECTSym,
         C_REPLACESym,
         C_RESERVESym,
         C_RESUMESym,
         C_RETRYSym,
         C_SCROLLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_SHIFTSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_STOPSym,
         C_SUBTRACTSym,
         C_SUMSym,
         C_SUMMARYSym,
         C_SUMMINGSym,
         C_SUPPLYSym,
         C_SUPPRESSSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_TRANSFERSym,
         C_TRANSLATESym,
         C_UPPERSym,
         C_TRUNCATESym,
         C_ULINESym,
         C_UNASSIGNSym,
         C_UNPACKSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_WINDOWSym,
         C_SPLITSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym
         AllowedKeywordsForTypeName()

      when C_SORTEDSym
         Get()

      when C_STANDARDSym
         Get()

      when C_REFSym
         Get()

      when C_CHECKSym
         Get()

      when C_EDITSym
         Get()

      when C_NODESym
         Get()

      when C_TYPESym
         Get()

      else
         GenError(711)

      end

      _out_()
   end
   def TypeName()
      _in_()
      if @sym>=C_identifierSym&&@sym<=C_REQUESTEDSym
         if @sym==C_identifierSym
            Get()
         else
            if @sym>=C_DATASym&&@sym<=C_REQUESTEDSym
               AllowedKeywordsForTypeName()
            else
               GenError(712)
            end

         end

      else
         if @sym==C_LparenSym
            Get()
            if @sym==C_stringD1Sym
               Get()
            else
               if @sym==C_identifierSym
                  Get()
               else
                  if @sym>=C_DATASym&&@sym<=C_REQUESTEDSym
                     AllowedKeywordsForTypeName()
                  else
                     GenError(713)
                  end

               end

            end

            Expect(C_RparenSym)
         else
            GenError(714)
         end

      end

      while (@sym==C_EqualGreaterSym)
         Get()
         if @sym>=C_identifierSym&&@sym<=C_REQUESTEDSym
            if @sym==C_identifierSym
               Get()
            else
               if @sym>=C_DATASym&&@sym<=C_REQUESTEDSym
                  AllowedKeywordsForTypeName()
               else
                  GenError(715)
               end

            end

         else
            if @sym==C_LparenSym
               Get()
               if @sym==C_identifierSym
                  Get()
               else
                  if @sym>=C_DATASym&&@sym<=C_REQUESTEDSym
                     AllowedKeywordsForTypeName()
                  else
                     GenError(716)
                  end

               end

               Expect(C_RparenSym)
            else
               GenError(717)
            end

         end

      end


      name=fixName(src());



      src(name);

      _out_()
   end
   def Var()
      _in_()
      Expression()
      _out_()
   end
   def Expression()
      _in_()
      Conditional()
      while (@sym==C_EqualSym||@sym>=C_StarEqualSym&&@sym<=C_QueryEqualSym)
         AssignmentOperator()
         Expression()
      end

      _out_()
   end
   def Exps()
      _in_()
      Expression()
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Expression()
      end

      _out_()
   end
   def NameInVarDef()
      _in_()
      if @sym==C_identifierSym
         Get()
      else
         if @sym>=C_DATASym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
            AllowedKeywords()
         else
            if @sym==C_REFERENCESym
               Get()
            else
               GenError(718)
            end

         end

      end


      name=fixName(src());



      src(name);

      _out_()
   end
   def Name()
      _in_()
      if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
         if @sym==C_identifierSym
            Get()
         else
            if @sym>=C_DATASym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
               AllowedKeywords()
            else
               GenError(719)
            end

         end

      else
         if @sym==C_LparenSym
            Get()
            if @sym==C_identifierSym
               Get()
            else
               if @sym>=C_DATASym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
                  AllowedKeywords()
               else
                  GenError(720)
               end

            end

            Expect(C_RparenSym)
         else
            GenError(721)
         end

      end


      name=fixName(src());




      name = procName(name)
      src(name);

      _out_()
   end
   def NameInPrimary()
      _in_()

      no_comments;

      if @sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_GTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym
         if @sym==C_identifierSym
            Get()
         else
            if @sym>=C_DATASym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_GTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym
               AllowedKeywordsExclude()
            else
               GenError(722)
            end

         end

      else
         if @sym==C_LparenSym
            Get()
            if @sym==C_identifierSym
               Get()
            else
               if @sym>=C_DATASym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_GTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym
                  AllowedKeywordsExclude()
               else
                  GenError(723)
               end

            end

            Expect(C_RparenSym)
         else
            GenError(724)
         end

      end


      name=fixName(src());



      #name = lus
      ar = name.split(".")
      tail = ""
      tail = "."+ar[1..ar.size-1].join(".") if ar.size>1
      v = find_var(ar[0])
      p "find:#{name}:#{v.inspect}"
      if v
         name  = v.newname+tail
      else
         #current_scope.pre += "#{name}=nil\n"
         #current_scope.add_var(name, nil)
      end

      src(name);

      _out_()
   end
   def C()
      _in_()

      in_scope(@root_class);

      while (@sym==C_REPORTSym||@sym==C_FUNCTIONSym||@sym==C_CLASSSym||@sym==C_INTERFACESym||@sym==C_TYPEMinusPOOLSym)
         case @sym

         when C_REPORTSym
            ReportDef()

         when C_FUNCTIONSym
            FunctionDef()

         when C_CLASSSym
            ClassStatement()

         when C_INTERFACESym
            stINTERFACE()

         when C_TYPEMinusPOOLSym
            stTYPE_POOL()

         else
            GenError(725)

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

      while (@sym==C_NOSym||@sym==C_DEFININGSym||@sym==C_REDUCEDSym||@sym>=C_LINEMinusSIZESym&&@sym<=C_MESSAGEMinusIDSym)
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
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()
      end



      @root_class.add_method(fn_name, "()", [], src, "");

      _out_()
   end
   def FunctionDef()
      _in_()
      Expect(C_FUNCTIONSym)

      fn_name=curString();

      Expect(C_identifierSym)
      Expect(C_PointSym)

      src("");

      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
            if @sym==C_CREATESym||@sym==C_FORSym||@sym==C_SHAREDSym||@sym>=C_PUBLICSym&&@sym<=C_FINALSym||@sym>=C_GLOBALSym&&@sym<=C_LOADSym||@sym==C_PointSym
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
                           GenError(726)
                        end

                     end

                  end

               end

               while (@sym==C_CREATESym||@sym==C_FORSym||@sym==C_SHAREDSym||@sym>=C_INHERITINGSym&&@sym<=C_FINALSym||@sym>=C_GLOBALSym&&@sym<=C_FRIENDSSym)
                  if @sym==C_INHERITINGSym
                     Get()
                     Expect(C_FROMSym)
                     Expect(C_identifierSym)


                     n  = prevString
                     cls.parent = valid_class_name(prevString)
                     out_scope()
                     load_file("#{n}")
                     cls.add_require("#{n.downcase}.rb")

                     in_scope(cls);

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
                                 GenError(727)
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
                                    GenError(728)
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
                                    GenError(729)
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

            end

         end

         if @sym==C_LOADSym
            Get()

            out_scope() if cls;

         end

      else
         if @sym==C_IMPLEMENTATIONSym
            Get()
         else
            GenError(730)
         end

      end

      Expect(C_PointSym)
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
                     GenError(731)
                  end

               end

            end

            Expect(C_SECTIONSym)
            Expect(C_PointSym)
         end

         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Statement()
         end

      end

      if @sym==C_ENDCLASSSym
         Get()
         Expect(C_PointSym)

         out_scope() if cls;

      end

      _out_()
   end
   def stINTERFACE()
      _in_()
      Expect(C_INTERFACESym)
      Expect(C_identifierSym)


      n = prevString;clsdef = ModuleDef.new(n);current_ruby_scope.add_module(clsdef);clsdef.add_src("module_function\n#{n}=#{to_ruby_const(n)}\n");

      if @sym>=C_PUBLICSym&&@sym<=C_PRIVATESym||@sym==C_PointSym
         if @sym>=C_PUBLICSym&&@sym<=C_PRIVATESym
            if @sym==C_PUBLICSym
               Get()
            else
               if @sym==C_PRIVATESym
                  Get()
               else
                  if @sym==C_PROTECTEDSym
                     Get()
                  else
                     GenError(732)
                  end

               end

            end

         end

         Expect(C_PointSym)

         in_scope(clsdef);

         while (@sym==C_DATASym||@sym>=C_STATICSSym&&@sym<=C_CONSTANTSSym||@sym==C_TYPESSym||@sym==C_CLASSSym||@sym==C_METHODSSym||@sym==C_ALIASESSym||@sym==C_INCLUDESym||@sym==C_INTERFACESym||@sym==C_INTERFACESSym||@sym==C_CLASSMinusDATASym||@sym==C_CLASSMinusMETHODSSym||@sym==C_TYPEMinusPOOLSSym)
            case @sym

            when C_TYPESSym
               stTYPES()

            when C_INTERFACESSym
               stINTERFACES()

            when C_INTERFACESym
               stINTERFACE()

            when C_DATASym,
               C_STATICSSym,
               C_CONSTANTSSym,
               C_CLASSMinusDATASym
               VariableDefineStatement()

            when C_INCLUDESym
               stINCLUDE()

            when C_ALIASESSym
               stALIASES()

            when C_METHODSSym,
               C_CLASSMinusMETHODSSym
               MethodsStatement()

            when C_CLASSSym
               ClassStatement()

            when C_TYPEMinusPOOLSSym
               stTYPE_POOLS()

            else
               GenError(733)

            end

         end


         out_scope;

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


                  cls = current_scope
                  if cls.class_name.downcase != n.downcase
                     cls.add_src("include #{to_ruby_const(n)}\n")
                     cp = current_scope
                     out_scope
                     load_file("#{n}")
                     cls.add_require("#{n.downcase}.rb")
                     in_scope(cp)
                  end;

               else
                  GenError(734)
               end

            end

         else
            GenError(735)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stTYPE_POOL()
      _in_()
      Expect(C_TYPEMinusPOOLSym)
      Expect(C_identifierSym)


      n = prevString
      clsdef = ModuleDef.new(n)
      current_ruby_scope.add_module(clsdef)
      clsdef.add_src("#{n}=#{to_ruby_const(n)}\nmodule_function\n");

      Expect(C_PointSym)

      in_scope(clsdef);

      while (@sym==C_DATASym||@sym>=C_STATICSSym&&@sym<=C_CONSTANTSSym||@sym==C_TYPESSym||@sym==C_CLASSMinusDATASym)
         if @sym==C_TYPESSym
            stTYPES()
         else
            if @sym==C_DATASym||@sym>=C_STATICSSym&&@sym<=C_CONSTANTSSym||@sym==C_CLASSMinusDATASym
               VariableDefineStatement()
            else
               GenError(736)
            end

         end

      end


      out_scope;

      _out_()
   end
   def stTYPES()
      _in_()

      #ignore_this_rule;

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
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
            else
               if 1
                  Get()
                  Expect(C_INITIALSym)

                  back();re(".init()");

               else
                  GenError(737)
               end

            end

            while (@sym==C_CommaSym)
               Get()
               Expect(C_TYPESSym)
               Expect(C_identifierSym)
               Expect(C_VALUESym)
               if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  Expression()
               else
                  if 1
                     Get()
                     Expect(C_INITIALSym)

                     back();re(".init()");

                  else
                     GenError(738)
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
               if @sym>=C_identifierSym&&@sym<=C_TYPESSym||@sym>=C_STRUCTURESym&&@sym<=C_BASESym||@sym>=C_SETSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
                  NameInVarDef()
               else
                  GenError(739)
               end

            end

         end

      else
         if @sym==C_ENDSym
            Get()
            Expect(C_OFSym)
            Expect(C_identifierSym)
         else
            if @sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_CONSTANTSSym||@sym>=C_COMMONSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
               NameInVarDef()
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
                     GenError(740)
                  end

               end

            else
               GenError(741)
            end

         end

      end

      Expect(C_PointSym)

      src("");

      _out_()
   end
   def VariableDefineStatement()
      _in_()
      case @sym

      when C_DATASym
         Get()

      when C_STATICSSym
         Get()

      when C_CLASSMinusDATASym
         Get()

      when C_CONSTANTSSym
         Get()

      else
         GenError(742)

      end


      t=prevString.upcase;

      if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
         if @sym==C_BEGINSym
            Get()
            Expect(C_OFSym)
            if @sym==C_COMMONSym
               Get()
               Expect(C_PARTSym)
               NameInVarDef()
            else
               if @sym>=C_identifierSym&&@sym<=C_BEGINSym||@sym>=C_PARTSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
                  NameInVarDef()

                  modname=lus;

                  if @sym==C_READMinusONLYSym
                     Get()
                  end

                  if @sym==C_OCCURSSym
                     Get()
                     Expect(C_numberSym)
                  end

               else
                  GenError(743)
               end

            end



            if t == "CONSTANTS"

               current_ruby_scope.add_src("module #{to_ruby_const(modname)}\nmodule_function\n")
            elsif t == "DATA"
               in_scope("struct")
               src("#{modname} = Struct.new(")
            end;

         else
            if @sym==C_ENDSym
               Get()
               Expect(C_OFSym)
               if @sym==C_COMMONSym
                  Get()
                  Expect(C_PARTSym)
                  NameInVarDef()
               else
                  if @sym>=C_identifierSym&&@sym<=C_BEGINSym||@sym>=C_PARTSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
                     NameInVarDef()
                     if @sym==C_VALIDSym
                        Get()
                        Expect(C_BETWEENSym)
                        Expression()
                        Expect(C_ANDSym)
                        Expression()
                     end

                  else
                     GenError(744)
                  end

               end



               #out_scope
               if t == "DATA"
                  if current_scope.name == "struct"
                     src(").new\n")
                     out_scope
                  end
               else
                  current_ruby_scope.add_src("end\n")
               end;

            else
               if @sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_CONSTANTSSym||@sym>=C_COMMONSym&&@sym<=C_NODESym||@sym==C_REFERENCESym||@sym>=C_STANDARDSym&&@sym<=C_TYPESym
                  NameInVarDef()

                  name = lus
                  p "var name=#{name}"
                  if t == "DATA" && current_scope.name == "struct"
                     src(":#{name}")
                  end;

                  while (@sym==C_LparenSym)
                     Get()
                     Expect(C_numberSym)
                     Expect(C_RparenSym)
                  end

                  if @sym==C_TYPESym
                     TypeDes()

                     var_type = @lnv
                     p "var_type:#{var_type.inspect}";

                  else
                     if @sym==C_LIKESym
                        LikeDes()
                     else
                        GenError(745)
                     end

                  end

               else
                  GenError(746)
               end

            end

         end

         while (@sym==C_VALUESym||@sym==C_OCCURSSym||@sym==C_READMinusONLYSym)
            if @sym==C_VALUESym
               Get()

               value = nil;

               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                  if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                     Expression()

                     value = "" if value ==nil;value += lus;

                  else
                     if 1
                        Get()
                        Expect(C_INITIALSym)

                        back_src();re(".init()");

                     else
                        GenError(747)
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



         #add constants to module
         if current_ruby_scope.is_a?(ModuleDef) && t == "CONSTANTS"
            if name
               newname = current_ruby_scope.add_var(Variable.new(name, var_type)) #just for getting new name
               current_ruby_scope.add_src("#{newname} = #{value}\n")
               current_ruby_scope.add_src("def #{name};#{value};  end\n")

            end
         elsif !(t == "DATA" && current_scope.name == "struct") && name
            current_scope.add_var(Variable.new(name, var_type))

            if var_type
               #s = "#{name} = #{var_type.name}.new\n"
               s = "#{name} = nil \# #{var_type.name}.new\n"
               #src("#"+s)
               src(s)
               if current_scope.is_a?(ClassDef)
                  s = "@#{name} = nil \# #{var_type.name}.new\n"
                  current_scope.add_src(s)
               end
            else
               src("")
            end
         end
         ;

      else
         if @sym==C_LparenSym
            Get()
            Expect(C_identifierSym)

            name=prevString;

            Expect(C_RparenSym)
            Expect(C_EqualSym)
            Expression()

            src("#{name} = #{lus}");

         else
            GenError(748)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def Statement()
      _in_()

      ps();

      case @sym

      when C_DATASym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_CLASSMinusDATASym
         VariableDefineStatement()

      when C_WRITESym
         WriteStatement()

      when C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_regexD1Sym,
         C_identifierSym,
         C_VALUESym,
         C_PARAMETERSym,
         C_TARGETSym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SINGLESym,
         C_FORSym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_CASTINGSym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_STARTINGSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_TIMESSym,
         C_OPTIONALSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_CURSORSym,
         C_HOLDSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_BOUNDSSym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_VIASym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_NOTSym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ASSOCIATIONSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_VARYSym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_ELSESym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_DIALOGSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_NULLSym,
         C_WORKSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_CONTEXTSym,
         C_DISTANCESym,
         C_PAGESSym,
         C_TITLESym,
         C_BACKUPSym,
         C_SQLSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_PERSONSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_ONLYSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_CONTROLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_UPPERSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_REFSym,
         C_SORTEDSym,
         C_EDITSym,
         C_NODESym,
         C_ALLSym,
         C_OTHERSym,
         C_INITIALSym,
         C_ASSIGNINGSym,
         C_REFERENCESym,
         C_EXPORTINGSym,
         C_TRANSPORTINGSym,
         C_HASHEDSym,
         C_RANGESym,
         C_BINARYSym,
         C_IMPORTINGSym,
         C_RETURNINGSym,
         C_LINESSym,
         C_LparenSym,
         C_StarSym,
         C_TildeSym,
         C_PlusSym,
         C_AndSym,
         C_MinusSym,
         C_BangSym
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
         MessageStatement()

      when C_SEARCHSym
         SearchStatement()

      when C_APPENDSym
         stAPPEND()

      when C_SPLITSym
         stSPLIT()

      when C_RAISESym
         stRAISE()

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

      when C_CONTROLSSym
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

      when C_FINDSym
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

      when C_TRANSLATESym
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

      when C_WAITSym
         stWAIT()

      when C_WINDOWSym
         stWINDOW()

      when C_SELECTSym
         stSELECT()

      when C_ENDSELECTSym
         stENDSELECT()

      else
         GenError(749)

      end

      _out_()
   end
   def Type()
      _in_()
      Expect(C_identifierSym)
      _out_()
   end
   def WriteStatement()
      _in_()

      param_hash = {};

      Expect(C_WRITESym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym>=C_STARTINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_SlashSym||@sym>=C_NOMinusGAPSym&&@sym<=C_MMSlashDDSlashYYYYSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         while (@sym==C_numberSym||@sym==C_ATSym||@sym==C_LparenSym||@sym==C_SlashSym)
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
               if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  Expression()
               else
                  if 1
                     Get()
                  else
                     if @sym==C_StarStarSym
                        Get()
                     else
                        GenError(750)
                     end

                  end

               end

               Expect(C_RparenSym)
            end

         end

         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()
         end



         param_hash["s"] = lus;

         while (@sym==C_DECIMALSSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym>=C_NOMinusGAPSym&&@sym<=C_MMSlashDDSlashYYYYSym)
            if @sym==C_UNDERSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_NOMinusGAPSym
               Get()
            end

            if @sym==C_CENTEREDSym||@sym>=C_LEFTMinusJUSTIFIEDSym&&@sym<=C_RIGHTMinusJUSTIFIEDSym
               if @sym==C_LEFTMinusJUSTIFIEDSym
                  Get()
               else
                  if @sym==C_CENTEREDSym
                     Get()
                  else
                     if @sym==C_RIGHTMinusJUSTIFIEDSym
                        Get()
                     else
                        GenError(751)
                     end

                  end

               end

            end

            while (@sym==C_DECIMALSSym||@sym>=C_EXPONENTSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_NOMinusGROUPINGSym&&@sym<=C_NOMinusZEROSym)
               if @sym==C_DECIMALSSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym==C_PointSym||@sym>=C_NOMinusGAPSym&&@sym<=C_MMSlashDDSlashYYYYSym
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
                     if @sym==C_DECIMALSSym||@sym>=C_ASSym&&@sym<=C_USINGSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym==C_STYLESym||@sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym==C_QUICKINFOSym||@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym||@sym==C_PointSym||@sym>=C_NOMinusGAPSym&&@sym<=C_MMSlashDDSlashYYYYSym
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
                           GenError(752)
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
                     GenError(753)
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
                        GenError(754)
                     end

                  end

               end

            end

            if @sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_MMSlashDDSlashYYYYSym
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
                  GenError(755)

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
                  GenError(756)

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
                  GenError(757)
               end

            end

            Expect(C_TOSym)
            Expect(C_identifierSym)
            if @sym==C_CENTEREDSym||@sym>=C_LEFTMinusJUSTIFIEDSym&&@sym<=C_RIGHTMinusJUSTIFIEDSym
               if @sym==C_LEFTMinusJUSTIFIEDSym
                  Get()
               else
                  if @sym==C_CENTEREDSym
                     Get()
                  else
                     if @sym==C_RIGHTMinusJUSTIFIEDSym
                        Get()
                     else
                        GenError(758)
                     end

                  end

               end

            end

            if @sym==C_DECIMALSSym||@sym==C_USINGSym||@sym>=C_EXPONENTSym&&@sym<=C_UNITSym||@sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym==C_PointSym||@sym>=C_NOMinusGROUPINGSym&&@sym<=C_MMSlashDDSlashYYYYSym
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

               if @sym==C_DECIMALSSym||@sym==C_USINGSym||@sym==C_ROUNDSym||@sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym==C_PointSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_MMSlashDDSlashYYYYSym
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
                     GenError(759)
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
                     GenError(760)
                  end

               end

            end

            if @sym>=C_DDMMYYSym&&@sym<=C_YYMMDDSym||@sym>=C_DDSlashMMSlashYYSym&&@sym<=C_MMSlashDDSlashYYYYSym
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
                  GenError(761)

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

      add_src("\n");

      _out_()
   end
   def ContinueStatement()
      _in_()
      Expect(C_CONTINUESym)
      Expect(C_PointSym)

      src("next\n");

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

      stmt="";

      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()

         stmt+=lus;

      end

      Expect(C_ENDDOSym)
      Expect(C_PointSym)


      src("begin\n#{stmt}end while (true)\n")
      ;

      _out_()
   end
   def ForStatement()
      _in_()
      Expect(C_forSym)
      Expect(C_LparenSym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()
      end

      Expect(C_SemicolonSym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
      LogExp()

      exp = lus;

      Expect(C_PointSym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Statement()

            stmts += lus+"\n";

         end

      end


      ret += "if #{exp}\n#{stmts}\n";stmts="";

      while (@sym==C_ELSEIFSym)
         Get()
         LogExp()

         exp = lus;

         Expect(C_PointSym)
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Statement()

               stmts += lus;

            end

         end


         ret += "elsif #{exp}\n#{stmts}\n";stmts="";

      end

      if @sym==C_ELSESym
         Get()
         Expect(C_PointSym)
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Statement()

               stmts += lus;

            end

         end


         ret += "else\n#{stmts}\n";

      end

      Expect(C_ENDIFSym)


      ret += "\nend\n"
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

      replace_src("return");

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()
      end

      Expect(C_SemicolonSym)
      _out_()
   end
   def stWHILE()
      _in_()
      Expect(C_WHILESym)
      LogExp()
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
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()
      end

      Expect(C_ENDWHILESym)
      Expect(C_PointSym)
      _out_()
   end
   def LoopStatement()
      _in_()
      Expect(C_LOOPSym)

      params = {};stmts ="";

      if @sym==C_ATSym
         Get()
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()

               params[:at]=lus;

               if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym||@sym==C_TRANSPORTINGSym||@sym==C_INTOSym
                  case @sym

                  when C_INTOSym
                     Get()
                     Expression()

                     params[:into]=lus;


                  when C_ASSIGNINGSym
                     Get()
                     Var()
                     if @sym==C_CASTINGSym
                        Get()
                     end


                  when C_REFERENCESym
                     Get()
                     Expect(C_INTOSym)
                     Expression()

                     params[:into]=lus;


                  when C_TRANSPORTINGSym
                     Get()
                     Expect(C_NOSym)
                     Expect(C_FIELDSSym)

                  else
                     GenError(762)

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
                        GenError(763)
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
                  LogExp()
               end

               if @sym==C_GROUPSym
                  GroupBy()
               end

            else
               if 1
                  Expression()
                  if @sym==C_VERSIONSym
                     Get()
                     Expect(C_stringD1Sym)
                  end

               else
                  GenError(764)
               end

            end

         else
            if 1
               Get()
               Expression()
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
                  GenError(765)

               end

               if @sym==C_WHERESym
                  Get()
                  LogExp()
               end

               if @sym==C_GROUPSym
                  GroupBy()
               end

            else
               if 1
                  Get()
                  Expect(C_INTOSym)
                  Expect(C_identifierSym)
               else
                  GenError(766)
               end

            end

         end

      end

      Expect(C_PointSym)
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()

         stmts += lus+"\n";

      end

      Expect(C_ENDLOOPSym)
      Expect(C_PointSym)


      src("loop(#{hash_to_params(params)}){\n#{stmts}}\n")
      ;

      _out_()
   end
   def CaseStatement()
      _in_()
      Expect(C_CASESym)

      re("case");

      Expression()
      Expect(C_PointSym)
      while (@sym==C_WHENSym)
         Get()

         re("when");ar=[];

         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()

            ar.push(lus);

            while (@sym==C_ORSym)
               Get()

               re(",");

               Expression()

               ar.push(lus);

            end

         else
            if 1
               Get()

               re("", "else");

            else
               GenError(767)
            end

         end

         Expect(C_PointSym)
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Statement()
         end

      end

      Expect(C_ENDCASESym)

      re("end");

      Expect(C_PointSym)
      _out_()
   end
   def stCALL()
      _in_()
      Expect(C_CALLSym)

      back_src;

      case @sym

      when C_FUNCTIONSym,
         C_PointSym,
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
         C_numberSym,
         C_stringD1Sym,
         C_charSym,
         C_regexD1Sym,
         C_identifierSym,
         C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_PARAMETERSSym,
         C_TARGETSym,
         C_MESSAGESym,
         C_CREATESym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_DELETESym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_ENDFUNCTIONSym,
         C_ENDSELECTSym,
         C_FIELDSSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ONSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SELECTSym,
         C_SINGLESym,
         C_FORSym,
         C_UPDATESym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_TABLESSym,
         C_MOVESym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_APPENDSym,
         C_CASTINGSym,
         C_CONCATENATESym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_SEARCHSym,
         C_STARTINGSym,
         C_ATSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_RAISESym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_TEXTSym,
         C_MEMBERSSym,
         C_LOOPSym,
         C_VERSIONSym,
         C_ENDLOOPSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_WRITESym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_FORMATSym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_CONTINUESym,
         C_CASESym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_ENDCASESym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_DOSym,
         C_TIMESSym,
         C_ENDDOSym,
         C_OPTIONALSym,
         C_EVENTSSym,
         C_MODIFYSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_ENDONSym,
         C_OPENSym,
         C_CURSORSym,
         C_HOLDSym,
         C_INPUTSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_POSITIONSym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_FETCHSym,
         C_BOUNDSSym,
         C_PROVIDESym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ENDPROVIDESym,
         C_READSym,
         C_MAXIMUMSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_SORTSym,
         C_SUBMITSym,
         C_VIASym,
         C_PROGRAMSym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_NOTSym,
         C_FREESym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_RETURNSym,
         C_TRYSym,
         C_CATCHSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ENDTRYSym,
         C_ASSOCIATIONSym,
         C_TYPESSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_SETSym,
         C_WHILESym,
         C_VARYSym,
         C_ENDWHILESym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_IFSym,
         C_ELSEIFSym,
         C_ELSESym,
         C_ENDIFSym,
         C_CLASSSym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_ENDCLASSSym,
         C_ENDMETHODSym,
         C_METHODSSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_ADDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_ALIASESSym,
         C_ASSERTSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_ASSIGNSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_ENDATSym,
         C_BACKSym,
         C_CALLSym,
         C_SKIPSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_CLEARSym,
         C_NULLSym,
         C_CLOSESym,
         C_COLLECTSym,
         C_COMMITSym,
         C_WORKSym,
         C_WAITSym,
         C_COMPUTESym,
         C_CONDENSESym,
         C_CONTROLSSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_CONVERTSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_DEMANDSym,
         C_CONTEXTSym,
         C_DESCRIBESym,
         C_DISTANCESym,
         C_PAGESSym,
         C_DETAILSym,
         C_DIVIDESym,
         C_TITLESym,
         C_BACKUPSym,
         C_EXITSym,
         C_SQLSym,
         C_EXPORTSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_EXTRACTSym,
         C_FINDSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_GENERATESym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_INCLUDESym,
         C_GETSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_HIDESym,
         C_IMPORTSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_INFOTYPESSym,
         C_PERSONSym,
         C_INITIALIZATIONSym,
         C_INSERTSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_INTERFACESym,
         C_ENDINTERFACESym,
         C_INTERFACESSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_LEAVESym,
         C_LOCALSym,
         C_MINIMUMSym,
         C_MODULESym,
         C_ENDMODULESym,
         C_MULTIPLYSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_NODESSym,
         C_OVERLAYSym,
         C_ONLYSym,
         C_PACKSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_PERFORMSym,
         C_ROLLBACKSym,
         C_RANGESSym,
         C_RECEIVESym,
         C_REFRESHSym,
         C_CONTROLSym,
         C_REJECTSym,
         C_REPLACESym,
         C_RESERVESym,
         C_RESUMESym,
         C_RETRYSym,
         C_SCROLLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_SHIFTSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_STOPSym,
         C_SUBTRACTSym,
         C_SUMSym,
         C_SUMMARYSym,
         C_SUMMINGSym,
         C_SUPPLYSym,
         C_SUPPRESSSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_TRANSFERSym,
         C_TRANSLATESym,
         C_UPPERSym,
         C_TRUNCATESym,
         C_ULINESym,
         C_UNASSIGNSym,
         C_UNPACKSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_WINDOWSym,
         C_SPLITSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_REFSym,
         C_SORTEDSym,
         C_EDITSym,
         C_NODESym,
         C_ALLSym,
         C_OTHERSym,
         C_INITIALSym,
         C_ASSIGNINGSym,
         C_REFERENCESym,
         C_EXPORTINGSym,
         C_TRANSPORTINGSym,
         C_HASHEDSym,
         C_RANGESym,
         C_BINARYSym,
         C_IMPORTINGSym,
         C_RETURNINGSym,
         C_LINESSym,
         C_CHECKSym,
         C_LparenSym,
         C_TYPEMinusPOOLSym,
         C_StarSym,
         C_TildeSym,
         C_INTOSym,
         C_TABLESym,
         C_PlusSym,
         C_WITHSym,
         C_MOVEMinusCORRESPONDINGSym,
         C_CLASSMinusDATASym,
         C_AUTHORITYMinusCHECKSym,
         C_forSym,
         C_returnSym,
         C_CLASSMinusMETHODSSym,
         C_ADDMinusCORRESPONDINGSym,
         C_BREAKMinusPOINTSym,
         C_CLASSMinusEVENTSSym,
         C_CLASSMinusPOOLSym,
         C_DIVIDEMinusCORRESPONDINGSym,
         C_EDITORMinusCALLSym,
         C_ENDMinusOFMinusPAGESym,
         C_ENDMinusOFMinusSELECTIONSym,
         C_FIELDMinusGROUPSSym,
         C_FIELDMinusSYMBOLSSym,
         C_FUNCTIONMinusPOOLSym,
         C_INTERFACEMinusPOOLSym,
         C_LOADMinusOFMinusPROGRAMSym,
         C_LOGMinusPOINTSym,
         C_MULTIPLYMinusCORRESPONDINGSym,
         C_NEWMinusLINESym,
         C_NEWMinusPAGESym,
         C_NEWMinusSECTIONSym,
         C_PRINTMinusCONTROLSym,
         C_SELECTMinusOPTIONSSym,
         C_SUBTRACTMinusCORRESPONDINGSym,
         C_SYNTAXMinusCHECKSym,
         C_TESTMinusINJECTIONSym,
         C_ENDMinusTESTMinusINJECTIONSym,
         C_TESTMinusSEAMSym,
         C_ENDMinusTESTMinusSEAMSym,
         C_TOPMinusOFMinusPAGESym,
         C_TYPEMinusPOOLSSym,
         C_AndSym,
         C_MinusSym,
         C_BangSym
         CallTransformation()

      else
         GenError(768)

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


      src("")
      in_scope("Method");

      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()
      end



      p "src:#{src}"

      if current_scope.parentScope
         add_method(current_scope.parentScope, fname, nil, [], src, "", {:pre=>current_scope.pre})
      end
      out_scope();

      Expect(C_ENDMETHODSym)
      Expect(C_PointSym)
      _out_()
   end
   def MethodsStatement()
      _in_()
      if @sym==C_METHODSSym
         Get()
      else
         if @sym==C_CLASSMinusMETHODSSym
            Get()

            static=true;

         else
            GenError(769)
         end

      end

      Expect(C_identifierSym)
      if @sym==C_TildeSym
         Get()
         Expect(C_identifierSym)
      end



      fname = prevString
      if current_scope.is_a?(ModuleDef)
         classdef = current_scope

      end;

      if @sym>=C_ABSTRACTSym&&@sym<=C_FINALSym
         if @sym==C_ABSTRACTSym
            Get()
         else
            if @sym==C_FINALSym
               Get()
            else
               GenError(770)
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
            if @sym==C_DEFAULTSym||@sym==C_EXCEPTIONSSym||@sym==C_RAISINGSym||@sym==C_EXPORTINGSym||@sym>=C_IMPORTINGSym&&@sym<=C_RETURNINGSym||@sym==C_PointSym||@sym==C_CHANGINGSym
               if @sym==C_DEFAULTSym
                  Get()
                  if @sym==C_IGNORESym
                     Get()
                  else
                     if @sym==C_FAILSym
                        Get()
                     else
                        GenError(771)
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

                  impar = [];

                  while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_REFERENCESym)
                     if @sym==C_VALUESym
                        Get()
                        Expect(C_LparenSym)
                        Expect(C_identifierSym)

                        impar.push(prevString);

                        Expect(C_RparenSym)
                     else
                        if @sym==C_REFERENCESym
                           Get()
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)

                           impar.push(prevString);

                           Expect(C_RparenSym)
                        else
                           if @sym==C_identifierSym
                              Get()

                              impar.push(prevString.downcase);

                           else
                              GenError(772)
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
                              Expression()
                           else
                              GenError(773)
                           end

                        end

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

                  exporting = [];

                  while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_LIKESym||@sym==C_REFERENCESym||@sym==C_TYPESym)
                     while (@sym==C_identifierSym||@sym==C_VALUESym||@sym==C_REFERENCESym)
                        if @sym==C_VALUESym
                           Get()
                           Expect(C_LparenSym)
                           Expect(C_identifierSym)

                           exporting.push(prevString);

                           Expect(C_RparenSym)
                        else
                           if @sym==C_REFERENCESym
                              Get()
                              Expect(C_LparenSym)
                              Expect(C_identifierSym)

                              exporting.push(prevString);

                              Expect(C_RparenSym)
                           else
                              if @sym==C_identifierSym
                                 Get()

                                 exporting.push(prevString);

                              else
                                 GenError(774)
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
                              GenError(775)
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
                              Expression()
                           else
                              GenError(776)
                           end

                        end

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

               if @sym==C_EXCEPTIONSSym||@sym==C_RAISINGSym
                  if @sym==C_RAISINGSym||@sym==C_PointSym
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
                              GenError(777)
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
                                 GenError(778)
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
                        GenError(779)
                     end

                  end

               end

            end

         end

      end

      Expect(C_PointSym)


      p "src:#{src}"
      os = origin_src
      doc_lines = os.split("\n")
      doc = ""
      doc_lines.each{|line| doc +="# "+line+"\n"}

      args = nil
      if impar

         for i in 0..impar.size-1
            impar[i] += ":nil"
         end
      else
         impar = []
      end

      args = impar.clone
      impar.push("_i:nil")
      impar.push("_e:nil")
      impar.push("_b:nil")
      pars = impar.join(",")

      if classdef
         dec = ""
         dec = "static" if static
         classdef.add_method(fname, "(*_a,#{pars})", [], nil , dec, {:doc=>doc,:import=>args, :export=>exporting})
      end ;

      _out_()
   end
   def MessageStatement()
      _in_()
      Expect(C_MESSAGESym)
      while (@sym==C_stringD1Sym||@sym==C_identifierSym||@sym==C_IDSym)
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
                  if @sym>=C_TYPESym&&@sym<=C_LparenSym
                     if @sym==C_LparenSym
                        Get()
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     else
                        if @sym==C_TYPESym
                           Get()
                           Expect(C_identifierSym)
                        else
                           GenError(780)
                        end

                     end

                  end

               else
                  GenError(781)
               end

            end

         end

      end

      if @sym==C_DISPLAYSym||@sym==C_RAISINGSym||@sym==C_INTOSym
         if @sym==C_DISPLAYSym||@sym==C_RAISINGSym||@sym==C_PointSym||@sym==C_WITHSym
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
               Name()
            else
               GenError(782)
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
               GenError(783)
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

      params = {};

      if @sym==C_INITIALSym
         Get()
         Expect(C_LINESym)
      else
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_OTHERSym||@sym>=C_ASSIGNINGSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()

            #'LINES' or idf;


            params[:from]=lus;

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
            GenError(784)
         end

      end

      Expect(C_TOSym)
      Name()

      params[:to]=lus;

      while (@sym==C_LbrackSym)
         Get()
         Expect(C_RbrackSym)
      end

      if @sym==C_SORTEDSym
         Get()
         Expect(C_BYSym)
         Expect(C_stringD1Sym)
      end

      if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym
         if @sym==C_ASSIGNINGSym
            Get()
            Var()
            if @sym==C_CASTINGSym
               Get()
            end

         else
            if @sym==C_REFERENCESym
               Get()
               Expect(C_INTOSym)
               Expect(C_identifierSym)
            else
               GenError(785)
            end

         end

      end

      Expect(C_PointSym)



      src("append(#{hash_to_params(params)})\n")
      ;

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
            GenError(786)
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
                  GenError(787)
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
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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

                  exp_type=prevString;

                  if @sym==C_MESSAGESym||@sym==C_IDSym||@sym==C_WITHSym
                     if @sym==C_MESSAGESym
                        Get()
                        Expect(C_identifierSym)
                        Expect(C_LparenSym)
                        Expect(C_identifierSym)
                        Expect(C_RparenSym)
                     else
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_TARGETSym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
                           GenError(788)
                        end

                     end

                  end

                  if @sym==C_EXPORTINGSym
                     Get()
                     Expression()
                     while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                        Expression()
                     end

                  end

               else
                  if @sym==C_identifierSym
                     Get()
                  else
                     GenError(789)
                  end

               end

            end


            src("raise #{exp_type}.new\n");

         else
            if @sym==C_identifierSym
               Get()

               src("raise #{prevString}\n");

            else
               GenError(790)
            end

         end

      end

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
               GenError(791)
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
                  GenError(792)
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

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Var()

         cp[:o]=lus;

         Expect(C_TOSym)
         Var()

         cp[:to]=lus;

         if @sym==C_EXPANDINGSym
            Get()
            Expect(C_NESTEDSym)
            Expect(C_TABLESSym)
         end

      else
         if 1
            Var()

            cp[:o]=lus;

            Expect(C_TOSym)
            Var()

            cp[:to]=lus;

            if @sym==C_EXPANDINGSym
               Get()
               Expect(C_NESTEDSym)
               Expect(C_TABLESSym)
            end

            if @sym==C_KEEPINGSym
               Get()
               Expect(C_TARGETSym)
               Var()
            end

         else
            GenError(793)
         end

      end

      Expect(C_PointSym)


      make();

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
         if @sym==C_identifierSym||@sym==C_FROMSym||@sym>=C_USINGSym&&@sym<=C_CLIENTSym||@sym==C_ORDERSym||@sym==C_WHERESym||@sym>=C_UPSym&&@sym<=C_TOSym||@sym==C_CONNECTIONSym||@sym==C_LparenSym||@sym==C_PointSym||@sym==C_TABLESym
            if @sym==C_identifierSym||@sym==C_FROMSym||@sym>=C_USINGSym&&@sym<=C_CLIENTSym||@sym==C_ORDERSym||@sym==C_WHERESym||@sym>=C_UPSym&&@sym<=C_TOSym||@sym==C_CONNECTIONSym||@sym==C_LparenSym||@sym==C_PointSym
               if @sym==C_FROMSym
                  Get()
                  Expression()
                  if @sym==C_USINGSym
                     Get()
                     Expect(C_CLIENTSym)
                     Expect(C_identifierSym)
                  end

               else
                  if @sym==C_identifierSym||@sym>=C_USINGSym&&@sym<=C_CLIENTSym||@sym==C_ORDERSym||@sym==C_WHERESym||@sym>=C_UPSym&&@sym<=C_TOSym||@sym==C_CONNECTIONSym||@sym==C_LparenSym||@sym==C_PointSym
                     if @sym==C_identifierSym||@sym==C_LparenSym
                        if @sym==C_identifierSym
                           Get()
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
                              GenError(795)
                           end

                        end

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
                        LogExp()
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
                     GenError(796)
                  end

               end

            else
               if @sym==C_TABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  GenError(797)
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
                                 GenError(798)
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
                                    GenError(799)
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
                           GenError(800)
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
                        GenError(801)
                     end

                  end

               else
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

                     if @sym==C_COMPARINGSym||@sym==C_ALLSym
                        if @sym==C_COMPARINGSym
                           Get()
                           Expect(C_identifierSym)
                        else
                           if @sym==C_ALLSym
                              Get()
                              Expect(C_FIELDSSym)
                           else
                              GenError(802)
                           end

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
                                       GenError(803)
                                    end

                                 end

                              else
                                 GenError(804)
                              end

                           end

                        end

                     else
                        GenError(805)
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
                     GenError(806)
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

                  if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym
                     if @sym==C_ASSIGNINGSym
                        Get()
                        Expect(C_identifierSym)
                        if @sym==C_CASTINGSym
                           Get()
                        end

                     else
                        if @sym==C_REFERENCESym
                           Get()
                           Expect(C_INTOSym)
                           Expect(C_identifierSym)
                        else
                           GenError(807)
                        end

                     end

                  end

               else
                  GenError(808)
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
               LogExp()
               Expect(C_RparenSym)
            else
               GenError(809)
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
                     GenError(810)
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
               GenError(811)
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
               GenError(812)
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
                  GenError(813)
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
               GenError(814)
            end

         end


      else
         GenError(815)

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
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
            if 1
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
               GenError(816)
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

         if @sym==C_CONNECTIONSym||@sym==C_LparenSym
            if @sym==C_CONNECTIONSym
               Get()
               Expect(C_identifierSym)
            else
               if @sym==C_LparenSym
                  Get()
                  Expression()
                  Expect(C_RparenSym)
               else
                  GenError(817)
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
               GenError(818)

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
                     if @sym==C_identifierSym
                        Get()

                        is('UTF-8');

                        if @sym==C_SKIPPINGSym||@sym==C_WITHSym
                           if @sym==C_SKIPPINGSym
                              Get()
                           else
                              if @sym==C_WITHSym
                                 Get()
                                 Expect(C_BYTEMinusORDERSym)
                                 Expect(C_MARKSym)
                              else
                                 GenError(819)
                              end

                           end

                        end

                     else
                        if @sym==C_NONMinusUNICODESym
                           Get()
                        else
                           GenError(820)
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
                        GenError(821)

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
                                 GenError(822)
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
                                    GenError(823)
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
                                 GenError(824)

                              end

                              Expect(C_LINEFEEDSym)
                           end

                        else
                           GenError(825)
                        end

                     end

                  else
                     GenError(826)
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
            GenError(827)
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
               GenError(828)
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
                  GenError(829)
               end

            end

         else
            GenError(830)
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

      params ={};

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
                     GenError(831)
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
               GenError(832)
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

         fn="read_table";

         Name()

         params["id"]=lus;

         while (@sym==C_FROMSym||@sym==C_INDEXSym||@sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym||@sym==C_TRANSPORTINGSym||@sym==C_BINARYSym||@sym==C_INTOSym||@sym==C_WITHSym)
            if @sym==C_FROMSym||@sym==C_INDEXSym||@sym==C_WITHSym
               if @sym==C_FROMSym
                  Get()
                  Expect(C_identifierSym)

                  params["from"]=prevString;

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
                     end

                     Expect(C_KEYSym)
                     Name()
                     if @sym==C_COMPONENTSSym
                        Get()
                     else
                        if @sym==C_EqualSym
                           Get()
                           Expression()
                        else
                           GenError(833)
                        end

                     end

                     while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
                        Name()
                        Expect(C_EqualSym)
                        Expression()
                     end

                  else
                     if @sym==C_INDEXSym
                        Get()
                        Expression()

                        params["index"]=lus;

                        if @sym==C_USINGSym
                           Get()
                           Expect(C_KEYSym)
                           Name()
                        end

                     else
                        GenError(834)
                     end

                  end

               end

            end

            if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym||@sym==C_TRANSPORTINGSym||@sym==C_BINARYSym||@sym==C_INTOSym
               case @sym

               when C_INTOSym
                  Get()
                  Var()

                  params["into"]=lus;

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
                              GenError(835)
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
                           GenError(836)
                        end

                     end

                  end


               when C_ASSIGNINGSym
                  Get()
                  Var()
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

               when C_BINARYSym
                  Get()
                  Expect(C_SEARCHSym)

               else
                  GenError(837)

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
         GenError(838)

      end

      Expect(C_PointSym)


      if fn
         src("#{fn}(#{hash_to_params(params)})\n")
      end
      ;

      _out_()
   end
   def stSORT()
      _in_()
      Expect(C_SORTSym)
      Expect(C_identifierSym)
      if @sym==C_STABLESym
         Get()
      end

      if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
         if @sym==C_ASCENDINGSym
            Get()
         else
            if @sym==C_DESCENDINGSym
               Get()
            else
               GenError(839)
            end

         end

      end

      if @sym==C_ASSym
         Get()
         Expect(C_TEXTSym)
      end

      if @sym==C_BYSym
         Get()
         Expression()
         if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
            if @sym==C_ASCENDINGSym
               Get()
            else
               if @sym==C_DESCENDINGSym
                  Get()
               else
                  GenError(840)
               end

            end

         end

         if @sym==C_ASSym
            Get()
            Expect(C_TEXTSym)
         end

         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()
            if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
               if @sym==C_ASCENDINGSym
                  Get()
               else
                  if @sym==C_DESCENDINGSym
                     Get()
                  else
                     GenError(841)
                  end

               end

            end

            if @sym==C_ASSym
               Get()
               Expect(C_TEXTSym)
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
            GenError(842)
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
               GenError(843)

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
                  GenError(844)
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

      if @sym==C_ANDSym||@sym==C_USERSym||@sym==C_VIASym||@sym==C_EXPORTINGSym||@sym==C_PointSym
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

      stmt_try="";stmt_catch="";

      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         Statement()

         stmt_try+=lus;

      end

      while (@sym==C_CATCHSym)
         Get()

         ar=[];

         if @sym==C_BEFORESym
            Get()
            Expect(C_UNWINDSym)
         end

         while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
            Name()

            ar.push(to_ruby_const(lus));

         end

         if @sym==C_INTOSym
            Get()
            Var()

            e=lus;

         end

         Expect(C_PointSym)
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Statement()

            stmt_catch+=lus;

         end

      end

      if @sym==C_CLEANUPSym
         Get()
         if @sym==C_INTOSym
            Get()
            Expect(C_identifierSym)
         end

         Expect(C_PointSym)
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Statement()
         end

      end

      Expect(C_ENDTRYSym)
      Expect(C_PointSym)


      if e
         e = "=>#{e}"
      else
         e = ""
      end
      src("begin\n#{stmt_try}\nrescue #{ar.join(",")}#{e}\n#{stmt_catch}\nend\n");

      _out_()
   end
   def stADD()
      _in_()
      Expect(C_ADDSym)
      Expression()
      if @sym==C_TOSym
         Get()
         Name()
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
                     GenError(845)
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
                  GenError(846)
               end

            end

            if @sym==C_RANGESym
               Get()
               Expression()
            end

         else
            GenError(847)
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
      Name()
      Expect(C_PointSym)
      _out_()
   end
   def stASSERT()
      _in_()
      Expect(C_ASSERTSym)
      if @sym==C_IDSym||@sym==C_FIELDSSym||@sym==C_CONDITIONSym
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)

            cp[:id]=prevString;

            if @sym==C_SUBKEYSym
               Get()
               Expect(C_identifierSym)

               cp[:subkey]=prevString;

            end

         end

         if @sym==C_FIELDSSym
            Get()

            cp[:fields]=[];

            Expect(C_identifierSym)

            cp[:fields].push(prevString);

            while (@sym==C_identifierSym)
               Get()

               cp[:fields].push(prevString);

            end

         end

         Expect(C_CONDITIONSym)
      end

      LogExp()

      cp[:o]=lus;

      Expect(C_PointSym)

      make;

      _out_()
   end
   def stASSIGN()
      _in_()
      Expect(C_ASSIGNSym)

      params={};

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
            Expression()
            Expect(C_OFSym)
            Expect(C_STRUCTURESym)
            Expect(C_identifierSym)
         else
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_INCREMENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
               if @sym==C_INCREMENTSym||@sym==C_LparenSym||@sym==C_EqualGreaterSym||@sym==C_PlusSym||@sym==C_MinusGreaterSym
                  if @sym==C_TOSym||@sym==C_LparenSym||@sym==C_PlusSym
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
                     if @sym==C_EqualGreaterSym||@sym==C_MinusGreaterSym
                        if @sym==C_MinusGreaterSym
                           Get()
                        else
                           if @sym==C_EqualGreaterSym
                              Get()
                           else
                              GenError(848)
                           end

                        end

                        if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym||@sym==C_StarSym
                           if @sym==C_StarSym
                              Get()
                           else
                              if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym
                                 Name()
                              else
                                 GenError(849)
                              end

                           end

                        end

                     else
                        if @sym==C_INCREMENTSym
                           Get()
                           Expect(C_numberSym)
                        else
                           GenError(850)
                        end

                     end

                  end

               end

            else
               GenError(851)
            end

         end

      end

      Expect(C_TOSym)
      Var()

      params[:to]=lus;

      if @sym==C_DECIMALSSym||@sym==C_CASTINGSym||@sym==C_TYPESym
         if @sym==C_CASTINGSym
            Get()
            if @sym==C_DECIMALSSym||@sym==C_LIKESym||@sym==C_TYPESym
               if @sym==C_DECIMALSSym||@sym==C_RANGESym||@sym==C_TYPESym||@sym==C_PointSym
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
                     GenError(852)
                  end

               end

            end

         else
            if @sym==C_DECIMALSSym||@sym==C_RANGESym||@sym==C_TYPESym||@sym==C_PointSym
               if @sym==C_TYPESym
                  Get()
                  Expect(C_identifierSym)
               end

               if @sym==C_DECIMALSSym
                  Get()
                  Expect(C_numberSym)
               end

            else
               GenError(853)
            end

         end

      end

      if @sym==C_RANGESym
         Get()
         Expression()
      end

      Expect(C_PointSym)


      src("assign(#{hash_to_params(params)})\n")
      ;

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
         GenError(854)

      end

      Expect(C_PointSym)
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
      if @sym==C_IDSym||@sym==C_LparenSym
         if @sym==C_IDSym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_LparenSym
               Get()
               Expect(C_stringD1Sym)
               Expect(C_RparenSym)
            else
               GenError(855)
            end

         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCHECK()
      _in_()
      Expect(C_CHECKSym)

      re("check(");

      LogExp()

      add_src(")");

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

      params={};

      Expression()

      params[:id]=lus;

      if @sym==C_WITHSym
         if @sym==C_WITHSym
            Get()
            Expect(C_identifierSym)

            params[:with]=prevString;

            if @sym==C_INSym
               Get()
               if @sym==C_CHARACTERSym
                  Get()
               else
                  if @sym==C_BYTESym
                     Get()
                  else
                     GenError(856)
                  end

               end


               params[:mode]=prevString;

               Expect(C_MODESym)
            end

         else
            if 1
               Get()
               Expect(C_NULLSym)

               params[:withnull]=true;

            else
               GenError(857)
            end

         end

      end

      Expect(C_PointSym)


      src("clear(#{hash_to_params(params)})\n");

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
            GenError(858)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stCOLLECT()
      _in_()
      Expect(C_COLLECTSym)

      params={};

      Name()

      params[:id]=lus;

      Expect(C_INTOSym)
      Name()

      params[:into]=lus;

      if @sym==C_ASSIGNINGSym||@sym==C_PointSym
         if @sym==C_ASSIGNINGSym
            Get()
            Expect(C_identifierSym)
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


      src("collect(#{hash_to_params(params)})\n");

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
            GenError(859)
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

      params={:ar=>[]};

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()

         params[:ar].push(lus);

         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()

            params[:ar].push(lus);

         end

      else
         if 1
            Get()
            Expect(C_OFSym)
            Expect(C_identifierSym)
         else
            GenError(860)
         end

      end

      Expect(C_INTOSym)
      Var()

      params[:into]=lus;

      if @sym==C_INSym
         Get()
         if @sym==C_CHARACTERSym
            Get()
         else
            if @sym==C_BYTESym
               Get()
            else
               GenError(861)
            end

         end

         Expect(C_MODESym)
      end

      if @sym==C_SEPARATEDSym
         Get()
         Expect(C_BYSym)
         Name()
      end

      if @sym==C_RESPECTINGSym
         Get()
         Expect(C_BLANKSSym)
      end

      Expect(C_PointSym)


      src("concatenate(#{hash_to_params(params)})\n");

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
            GenError(862)
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

         varname=prevString;

         if @sym==C_AREASym
            Get()
            Expect(C_HANDLESym)
            Expect(C_identifierSym)
         end

         if @sym==C_LIKESym||@sym==C_TYPESym
            if @sym==C_TYPESym
               TypeDes()

               var_type = @lnv
               p "var_type:#{var_type.inspect}";

            else
               if @sym==C_LIKESym
                  LikeDes()
               else
                  GenError(863)
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

         if @sym==C_EXCEPTIONSSym||@sym==C_EXPORTINGSym||@sym==C_TYPESym
            if @sym==C_TYPESym
               Get()
               TypeName()
            end

            if @sym==C_EXPORTINGSym
               Get()
               Expression()
               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                  Expression()
               end

            end

            if @sym==C_EXCEPTIONSSym
               Get()
               Expression()
               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
         C_PointSym,
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
                  while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                     Expression()
                  end

               end

               if @sym==C_EXCEPTIONSSym
                  Get()
                  Expression()
                  while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
                  GenError(864)
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



      if var_type
         s = "#{fixName(varname)} = #{var_type.name}.new\n"
         src(s)
      else
         src("")
      end;

      Expect(C_PointSym)
      _out_()
   end
   def stDEMAND()
      _in_()
      Expect(C_DEMANDSym)
      Expression()
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
               GenError(865)
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
                  GenError(866)
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
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
            else
               if 1
                  Get()
               else
                  GenError(867)
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

                  if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                     Expression()
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
                  GenError(868)
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
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            if @sym==C_KINDSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
               Expression()
            end

            if @sym==C_OCCURSSym
               Get()
               Expression()
            end

         end


      else
         GenError(869)

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

            if @sym==C_BACKUPSym||@sym==C_DISPLAYMinusMODESym
               if @sym==C_DISPLAYMinusMODESym
                  Get()
               else
                  if @sym==C_BACKUPSym
                     Get()
                     Expect(C_INTOSym)
                     Expect(C_identifierSym)
                  else
                     GenError(870)
                  end

               end

            end

         else
            GenError(871)
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
               GenError(872)
            end

         end

      end

      Expect(C_PointSym)

      src("return");

      _out_()
   end
   def stEXPORT()
      _in_()
      Expect(C_EXPORTSym)
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
               GenError(873)
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
               GenError(874)
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
         GenError(875)

      end

      if @sym==C_COMPRESSIONSym
         Get()
         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(876)
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
      Expect(C_identifierSym)
      if @sym==C_LIKESym||@sym==C_TYPESym
         Typing()
      else
         if @sym==C_STRUCTURESym
            Get()
            Expect(C_identifierSym)
            Expect(C_DEFAULTSym)
            Expect(C_identifierSym)
         else
            GenError(877)
         end

      end

      Expect(C_PointSym)

      src("");

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
      Expect(C_FINDSym)
      if @sym==C_FIRSTSym||@sym==C_ALLSym
         if @sym==C_FIRSTSym
            Get()
            Expect(C_OCCURRENCESym)
         else
            if @sym==C_ALLSym
               Get()
               Expect(C_OCCURRENCESSym)
            else
               GenError(878)
            end

         end

         Expect(C_OFSym)
      end

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         if @sym==C_SUBSTRINGSym
            Get()
         end

         ShiftExp()
      else
         if 1
            Get()
            Expect(C_stringD1Sym)
         else
            GenError(879)
         end

      end

      Expect(C_INSym)
      if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym
         if @sym==C_SECTIONSym
            Get()
            if @sym==C_OFFSETSym
               Get()
               Expect(C_numberSym)
            end

            if @sym==C_LENGTHSym
               Get()
               Expect(C_numberSym)
            end

            Expect(C_OFSym)
         end

         Name()
      else
         if @sym==C_TABLESym
            Get()
            Expression()
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
            GenError(880)
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
               GenError(881)
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
               GenError(882)
            end

         end

         Expect(C_CASESym)
      end

      if @sym==C_MATCHSym
         Get()
         Expect(C_COUNTSym)
         Expect(C_numberSym)
      end

      if @sym==C_MATCHSym||@sym==C_SUBMATCHESSym||@sym==C_PointSym
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
         Var()

         o=lus;

      else
         if @sym==C_OBJECTSym
            Get()
            Var()

            o=lus;

            if @sym==C_NOSym
               Get()
               Expect(C_FLUSHSym)
            end

         else
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_DUMMYSym||@sym>=C_USERSym&&@sym<=C_COMPARINGSym||@sym>=C_SHAREDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Var()

               o=lus;

            else
               GenError(883)
            end

         end

      end

      Expect(C_PointSym)

      src("free(#{o})\n");

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
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end


      when C_identifierSym
         Get()
         Expect(C_TYPESym)
         Expect(C_LparenSym)
         Expect(C_identifierSym)
         Expect(C_RparenSym)
         if @sym==C_FILTERSSym||@sym==C_FILTERMinusTABLESym
            if @sym==C_FILTERSSym
               Get()
               Exps()
            else
               if @sym==C_FILTERMinusTABLESym
                  Get()
                  Expect(C_identifierSym)
               else
                  GenError(884)
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

            if @sym==C_LENGTHSym
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
                        GenError(885)
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

               if @sym==C_LENGTHSym
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
                           GenError(886)
                        end

                     end

                  end

                  Expect(C_OFFSETSym)
                  Expect(C_numberSym)
               end

            else
               GenError(887)
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
         if @sym==C_identifierSym
            Get()
         else
            if @sym==C_stringD1Sym
               Get()
            else
               GenError(888)
            end

         end

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
         if @sym==C_FIELDSym||@sym==C_PointSym
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
               GenError(889)
            end

         end


      else
         GenError(890)

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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
                  GenError(891)
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
                  GenError(892)
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
                  GenError(893)
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
            GenError(894)

         end

         if @sym==C_INSym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym
            if @sym>=C_ENDIANSym&&@sym<=C_CODESym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym||@sym==C_PointSym
               if @sym>=C_ENDIANSym&&@sym<=C_CODESym||@sym==C_IGNORINGSym||@sym==C_ACCEPTINGSym||@sym==C_PointSym
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
                  GenError(895)
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
         if 1
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
            GenError(896)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stINCLUDE()
      _in_()
      Expect(C_INCLUDESym)
      if @sym==C_STRUCTURESym||@sym==C_TYPESym
         if @sym==C_TYPESym
            Get()
            Expect(C_identifierSym)
         else
            if @sym==C_STRUCTURESym
               Get()
               Expect(C_identifierSym)
            else
               GenError(897)
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
            GenError(898)
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

      params={};

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            if @sym==C_INITIALSym
               Get()
               Expect(C_LINESym)
            else
               if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_OTHERSym||@sym>=C_ASSIGNINGSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  Expression()
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

                     params[:id]=prevString;

                  else
                     GenError(899)
                  end

               end

            end

         end

         while (@sym==C_identifierSym||@sym==C_LparenSym||@sym>=C_INTOSym&&@sym<=C_TABLESym)
            if @sym==C_INTOSym
               Get()
            end

            if @sym==C_LparenSym
               Get()
               Expression()

               params[:into]=lus;

               Expect(C_RparenSym)
            else
               if @sym==C_identifierSym||@sym==C_TABLESym
                  if @sym==C_TABLESym
                     Get()
                  end

                  Expect(C_identifierSym)

                  params[:intotable]=prevString;

                  if @sym==C_INDEXSym
                     Get()
                     Expect(C_identifierSym)

                     params[:intoindex]=prevString;

                  end

               else
                  GenError(900)
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
                     GenError(901)
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
                     GenError(902)
                  end

               end

            end

            if @sym==C_VALUESSym
               Get()
               Expect(C_identifierSym)
            end

            if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym
               if @sym==C_ASSIGNINGSym
                  Get()
                  Expect(C_identifierSym)
                  if @sym==C_CASTINGSym
                     Get()
                  end

               else
                  if @sym==C_REFERENCESym
                     Get()
                     Expect(C_INTOSym)
                     Expect(C_identifierSym)
                  else
                     GenError(903)
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
                        GenError(904)
                     end

                  end

               end

            end

         end

      else
         if 1
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

            if @sym==C_KEEPINGSym||@sym==C_PointSym
               if @sym==C_KEEPINGSym
                  Get()
                  Expect(C_DIRECTORYSym)
                  Expect(C_ENTRYSym)
               end

            else
               if @sym==C_VERSIONSym||@sym==C_PROGRAMSym||@sym==C_UNICODESym||@sym==C_FIXEDMinusPOINTSym
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
                           GenError(905)
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
                     GenError(906)
                  end

               end

            end

         else
            if 1
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


      src("insert(#{hash_to_params(params)})\n");

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

      n = prevString;

      if @sym==C_PARTIALLYSym
         Get()
         Expect(C_IMPLEMENTEDSym)
      end

      if @sym==C_DATASym||@sym>=C_ABSTRACTSym&&@sym<=C_FINALSym||@sym==C_PointSym
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
                     GenError(907)
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


      cls = current_scope
      cls.add_src("include #{to_ruby_const(n)}\n")
      cp = current_scope
      out_scope
      load_file("#{n}")
      cls.add_require("#{n.downcase}.rb")
      in_scope(cp);

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
            GenError(908)

         end

         if @sym==C_ANDSym
            Get()
            Expect(C_SKIPSym)
            Expect(C_FIRSTSym)
            Expect(C_SCREENSym)
         end


      else
         GenError(909)

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
         if @sym==C_INPUTSym||@sym==C_PointSym
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
      if @sym==C_SCROLLINGSym||@sym==C_NOMinusSCROLLINGSym
         if @sym==C_NOMinusSCROLLINGSym
            Get()
         else
            if @sym==C_SCROLLINGSym
               Get()
            else
               GenError(910)
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
               GenError(911)
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
               GenError(912)
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
               GenError(913)
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
               GenError(914)
            end

         end

      end

      if @sym==C_LIKESym||@sym==C_TYPESym
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
               GenError(915)
            end

         end

      end

      if @sym==C_ASSym||@sym>=C_OBLIGATORYSym&&@sym<=C_VISIBLESym||@sym==C_RADIOBUTTONSym||@sym==C_NOMinusDISPLAYSym
         if @sym==C_VALUESym||@sym==C_DEFAULTSym||@sym==C_FORSym||@sym==C_MEMORYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_VISIBLESym||@sym>=C_MODIFSym&&@sym<=C_MATCHCODESym||@sym==C_PointSym||@sym==C_NOMinusDISPLAYSym
            if @sym==C_OBLIGATORYSym||@sym==C_NOMinusDISPLAYSym
               if @sym==C_OBLIGATORYSym
                  Get()
               else
                  if @sym==C_NOMinusDISPLAYSym
                     Get()
                  else
                     GenError(916)
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
                     GenError(917)
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
                  GenError(918)
               end

            end

         end

      end

      while (@sym==C_VALUESym||@sym==C_DEFAULTSym||@sym==C_MEMORYSym||@sym>=C_MODIFSym&&@sym<=C_MATCHCODESym)
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
               GenError(919)
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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()
            if @sym==C_INSym
               Get()
               Expect(C_PROGRAMSym)
               if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym
                  Name()
               end

               if @sym==C_IFSym
                  Get()
                  Expect(C_FOUNDSym)
               end

            else
               if @sym==C_USINGSym||@sym==C_TABLESSym||@sym==C_IFSym||@sym==C_PointSym||@sym==C_CHANGINGSym
                  if @sym==C_IFSym
                     Get()
                     Expect(C_FOUNDSym)
                  end

               else
                  GenError(920)
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
                  GenError(921)
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
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         if @sym==C_CHANGINGSym
            Get()
            Expression()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
                  GenError(922)
               end

            end

         else
            GenError(923)
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
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()
            if @sym==C_FROMSym
               Get()
               Expect(C_TABLESym)
               Expect(C_identifierSym)
            end

         else
            GenError(924)
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
      if @sym==C_stringD1Sym||@sym==C_SECTIONSym||@sym==C_FIRSTSym||@sym>=C_SUBSTRINGSym&&@sym<=C_REGEXSym||@sym==C_ALLSym
         if @sym==C_stringD1Sym||@sym==C_FIRSTSym||@sym>=C_SUBSTRINGSym&&@sym<=C_REGEXSym||@sym==C_ALLSym
            if @sym==C_stringD1Sym||@sym==C_FIRSTSym||@sym==C_SUBSTRINGSym||@sym==C_ALLSym
               if @sym==C_FIRSTSym||@sym==C_ALLSym
                  if @sym==C_FIRSTSym
                     Get()
                     Expect(C_OCCURRENCESym)
                  else
                     if @sym==C_ALLSym
                        Get()
                        Expect(C_OCCURRENCESSym)
                        Expect(C_OFSym)
                     else
                        GenError(925)
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
                        GenError(926)
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
                           GenError(927)
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
                           GenError(928)
                        end

                     end

                     Expect(C_CASESym)
                  end

                  if @sym==C_REPLACEMENTSym
                     Get()
                     Expect(C_COUNTSym)
                     Expect(C_numberSym)
                  end

                  if @sym==C_REPLACEMENTSym||@sym==C_PointSym
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
                        GenError(929)
                     end

                  end

               else
                  GenError(930)
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
                        GenError(931)
                     end

                  end

                  Expect(C_MODESym)
               end

            else
               GenError(932)
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
                     GenError(933)
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
            GenError(934)
         end

      end

      Expect(C_PointSym)
      _out_()
   end
   def stRESERVE()
      _in_()
      Expect(C_RESERVESym)
      Expect(C_numberSym)
      Expression()
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

      src("return\n");

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
            GenError(935)
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
                     GenError(936)
                  end

               end

               if @sym==C_BYSym
                  Get()
                  Expect(C_numberSym)
                  Expect(C_PLACESSym)
               end

            else
               GenError(937)
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
                     GenError(938)
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
                     GenError(939)
                  end

               end

               if @sym==C_numberSym
                  Get()
                  Expect(C_PAGESSym)
               end

            else
               GenError(940)
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
      if @sym==C_OBLIGATORYSym||@sym==C_NOMinusDISPLAYSym
         if @sym==C_OBLIGATORYSym
            Get()
         else
            if @sym==C_NOMinusDISPLAYSym
               Get()
            else
               GenError(941)
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
                  GenError(942)
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
                  GenError(943)
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
               GenError(944)
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
         Expression()
         if @sym==C_ONSym
            Get()
         else
            if @sym==C_OFFSym
               Get()
            else
               GenError(945)
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
                        GenError(946)
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
                           GenError(947)
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
                  GenError(948)
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
                  GenError(949)
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
               GenError(950)
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
                  GenError(951)
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
               GenError(952)
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
                  GenError(953)
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
                     GenError(954)
                  end

               end

            else
               GenError(955)
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
         GenError(956)

      end

      Expect(C_PointSym)
      _out_()
   end
   def stSHIFT()
      _in_()
      Expect(C_SHIFTSym)
      Expect(C_identifierSym)
      if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym||@sym==C_BYSym||@sym==C_UPSym||@sym==C_CIRCULARSym
         if @sym>=C_LEFTSym&&@sym<=C_RIGHTSym||@sym==C_BYSym||@sym==C_INSym||@sym==C_UPSym||@sym==C_CIRCULARSym||@sym==C_PointSym
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
                     GenError(957)
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
                     GenError(958)
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
                     GenError(959)
                  end

               end

            else
               GenError(960)
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
               GenError(961)
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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
               GenError(962)
            end

         end

         Expect(C_CASESym)
      else
         if @sym==C_USINGSym
            Get()
            Expect(C_stringD1Sym)
            Expect(C_PointSym)
         else
            GenError(963)
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
            GenError(964)
         end

      end

      _out_()
   end
   def stTYPE_POOLS()
      _in_()
      Expect(C_TYPEMinusPOOLSSym)
      Expect(C_identifierSym)


      n = prevString
      src("include #{to_ruby_const(n)}")
      cp = current_scope
      out_scope
      load_file("#{n}")
      cp.add_require("#{n.downcase}.rb")
      in_scope(cp)
      ;

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
      Var()

      o=lus;

      Expect(C_PointSym)

      src("unassign(#{o})\n");

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
               GenError(965)
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
            LogExp()
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
                  GenError(966)
               end

            end

         else
            GenError(967)
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
            GenError(968)
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

      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_FIELDSSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         sqlFields()
         sqlFrom()
      else
         if 1
            sqlFrom()
            sqlFields()
         else
            GenError(969)
         end

      end

      while (@sym==C_ORDERSym||@sym==C_APPENDINGSym||@sym==C_FORSym||@sym>=C_WHERESym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym==C_CONNECTIONSym||@sym==C_LparenSym||@sym==C_INTOSym)
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

         if @sym==C_GROUPSym||@sym==C_LparenSym
            if @sym==C_GROUPSym
               Get()
               Expect(C_BYSym)
               if @sym==C_identifierSym
                  Get()
               else
                  if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_DATASym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                     Expression()
                  else
                     GenError(970)
                  end

               end

               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym>=C_StarSym&&@sym<=C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                  if @sym==C_CommaSym
                     Get()
                     Expect(C_identifierSym)
                  else
                     if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                        Expression()
                     else
                        GenError(971)
                     end

                  end

               end

            else
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(972)
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
                  GenError(973)
               end

            end

            stSELECT()
         end

         if @sym==C_ORDERSym
            sqlOrderBy()
         end

         if @sym==C_APPENDINGSym||@sym==C_INTOSym
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
                     GenError(974)
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
                              GenError(975)
                           end

                        end

                     end

                     Expect(C_COLUMNSSym)
                  else
                     GenError(976)
                  end

               end

            else
               if @sym==C_LparenSym
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(977)
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
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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

      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
         if @sym==C_StarSym
            Get()
         else
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_TildeSym||@sym==C_aggregateSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
                  GenError(978)
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
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_DATASym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
            else
               GenError(979)
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
         if @sym>=C_INNERSym&&@sym<=C_RIGHTSym||@sym>=C_CROSSSym&&@sym<=C_JOINSym||@sym==C_LparenSym
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
                  GenError(980)
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
               GenError(981)
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
               GenError(982)
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
                  GenError(983)
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
                     GenError(984)
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
                        GenError(985)
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
               GenError(986)
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
            GenError(987)
         end

      end

      if @sym==C_identifierSym||@sym==C_CORRESPONDINGSym||@sym==C_LparenSym||@sym==C_TABLESym
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
               GenError(988)
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
               GenError(989)
            end

         end

      end

      _out_()
   end
   def SQLCondition()
      _in_()
      LogExp()
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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         Expression()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
            GenError(990)
         end

      end

      if @sym>=C_ASCENDINGSym&&@sym<=C_DESCENDINGSym
         if @sym==C_ASCENDINGSym
            Get()
         else
            if @sym==C_DESCENDINGSym
               Get()
            else
               GenError(991)
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

      if @sym>=C_ASSIGNINGSym&&@sym<=C_REFERENCESym||@sym==C_INTOSym
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
                  GenError(992)
               end

            end

         end

      end

      _out_()
   end
   def LogExp()
      _in_()

      no_comments();

      LogLogANDExp()
      while (@sym==C_ORSym||@sym==C_EQUIVSym||@sym==C_BarBarSym)
         if @sym==C_BarBarSym
            Get()
         else
            if @sym==C_ORSym
               Get()

               re("||");

            else
               if @sym==C_EQUIVSym
                  Get()
               else
                  GenError(993)
               end

            end

         end

         LogLogANDExp()
      end


      no_comments(false);

      _out_()
   end
   def TypeDes()
      _in_()
      Expect(C_TYPESym)
      case @sym

      when C_identifierSym,
         C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_PARAMETERSSym,
         C_TARGETSym,
         C_MESSAGESym,
         C_ENDSym,
         C_CREATESym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_DELETESym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_FUNCTIONSym,
         C_ENDFUNCTIONSym,
         C_ENDSELECTSym,
         C_FIELDSSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ONSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SELECTSym,
         C_SINGLESym,
         C_FORSym,
         C_UPDATESym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_TABLESSym,
         C_MOVESym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_APPENDSym,
         C_LINESym,
         C_CASTINGSym,
         C_CONCATENATESym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_SEARCHSym,
         C_STARTINGSym,
         C_ATSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_RAISESym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_INDEXSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_LOOPSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_ENDLOOPSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_WRITESym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_FORMATSym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_CONTINUESym,
         C_CASESym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_ENDCASESym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_DOSym,
         C_TIMESSym,
         C_ENDDOSym,
         C_OPTIONALSym,
         C_EVENTSSym,
         C_MODIFYSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_ENDONSym,
         C_OPENSym,
         C_CURSORSym,
         C_HOLDSym,
         C_INPUTSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_POSITIONSym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_FETCHSym,
         C_BOUNDSSym,
         C_PROVIDESym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ENDPROVIDESym,
         C_READSym,
         C_MAXIMUMSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_SORTSym,
         C_SUBMITSym,
         C_VIASym,
         C_PROGRAMSym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_NOTSym,
         C_FREESym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_RETURNSym,
         C_TRYSym,
         C_CATCHSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ENDTRYSym,
         C_ASSOCIATIONSym,
         C_TYPESSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_SETSym,
         C_WHILESym,
         C_VARYSym,
         C_ENDWHILESym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_IFSym,
         C_ELSEIFSym,
         C_ELSESym,
         C_ENDIFSym,
         C_CLASSSym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_ENDCLASSSym,
         C_METHODSym,
         C_ENDMETHODSym,
         C_ANYSym,
         C_METHODSSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_ADDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_ALIASESSym,
         C_ASSERTSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_ASSIGNSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_ENDATSym,
         C_BACKSym,
         C_CALLSym,
         C_DIALOGSym,
         C_SKIPSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_CLEARSym,
         C_NULLSym,
         C_CLOSESym,
         C_COLLECTSym,
         C_COMMITSym,
         C_WORKSym,
         C_WAITSym,
         C_COMPUTESym,
         C_CONDENSESym,
         C_CONTROLSSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_CONVERTSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_DEMANDSym,
         C_CONTEXTSym,
         C_DESCRIBESym,
         C_DISTANCESym,
         C_PAGESSym,
         C_DETAILSym,
         C_DIVIDESym,
         C_TITLESym,
         C_BACKUPSym,
         C_EXITSym,
         C_SQLSym,
         C_EXPORTSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_EXTRACTSym,
         C_FINDSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_GENERATESym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_INCLUDESym,
         C_GETSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_HIDESym,
         C_IMPORTSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_INFOTYPESSym,
         C_PERSONSym,
         C_INITIALIZATIONSym,
         C_INSERTSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_INTERFACESym,
         C_ENDINTERFACESym,
         C_INTERFACESSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_LEAVESym,
         C_LOCALSym,
         C_MINIMUMSym,
         C_MODULESym,
         C_ENDMODULESym,
         C_MULTIPLYSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_NODESSym,
         C_OVERLAYSym,
         C_ONLYSym,
         C_PACKSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_PERFORMSym,
         C_ROLLBACKSym,
         C_RANGESSym,
         C_RECEIVESym,
         C_REFRESHSym,
         C_CONTROLSym,
         C_REJECTSym,
         C_REPLACESym,
         C_RESERVESym,
         C_RESUMESym,
         C_RETRYSym,
         C_SCROLLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_SHIFTSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_STOPSym,
         C_SUBTRACTSym,
         C_SUMSym,
         C_SUMMARYSym,
         C_SUMMINGSym,
         C_SUPPLYSym,
         C_SUPPRESSSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_TRANSFERSym,
         C_TRANSLATESym,
         C_UPPERSym,
         C_TRUNCATESym,
         C_ULINESym,
         C_UNASSIGNSym,
         C_UNPACKSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_WINDOWSym,
         C_SPLITSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_LparenSym
         if @sym==C_LINESym
            Get()
            Expect(C_OFSym)
         end

         TypeName()

         ret = VarType.new(lus.strip);

         if @sym==C_VALUESym||@sym>=C_LENGTHSym&&@sym<=C_BOXEDSym||@sym==C_OCCURSSym||@sym==C_PointSym||@sym==C_READMinusONLYSym
            if @sym==C_LENGTHSym
               Get()
               Expression()
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
                        GenError(994)
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

               end

            end

         end

         if @sym==C_BOXEDSym
            Get()
         end


      when C_REFSym
         Get()
         Expect(C_TOSym)
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            Expression()
         else
            if 1
               Get()
            else
               GenError(995)
            end

         end


         ret = VarType.new(lus.strip);


      when C_SORTEDSym,
         C_HASHEDSym,
         C_STANDARDSym,
         C_TABLESym
         if @sym==C_SORTEDSym||@sym==C_HASHEDSym||@sym==C_STANDARDSym
            if @sym==C_STANDARDSym
               Get()
            else
               if @sym==C_SORTEDSym
                  Get()
               else
                  if @sym==C_HASHEDSym
                     Get()
                  else
                     GenError(996)
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

         TypeName()

         ret = VarType.new(lus.strip);

         while (@sym==C_WITHSym)
            Get()
            if @sym==C_EMPTYSym
               Get()
               Expect(C_KEYSym)
            else
               if @sym==C_HEADERSym
                  Get()
                  Expect(C_LINESym)
               else
                  if @sym==C_KEYSym||@sym==C_DEFAULTSym||@sym==C_UNIQUESym||@sym==C_SORTEDSym||@sym==C_HASHEDSym||@sym==C_NONMinusUNIQUESym
                     if @sym==C_UNIQUESym||@sym==C_NONMinusUNIQUESym
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(997)
                           end

                        end

                     end

                     if @sym==C_SORTEDSym||@sym==C_HASHEDSym
                        if @sym==C_HASHEDSym
                           Get()
                        else
                           if @sym==C_SORTEDSym
                              Get()
                           else
                              GenError(998)
                           end

                        end

                     end

                     if @sym==C_KEYSym
                        Get()
                        if @sym==C_PRIMARYUnderscoreKEYSym
                           Get()
                           if @sym==C_ALIASSym
                              Get()
                              Name()
                           end

                           Expect(C_COMPONENTSSym)
                        end

                        Name()
                        while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
                           Name()
                        end

                     else
                        if @sym==C_DEFAULTSym
                           Get()
                           Expect(C_KEYSym)
                        else
                           GenError(999)
                        end

                     end

                  else
                     GenError(1000)
                  end

               end

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

         ret = VarType.new(lus.strip);

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
                  GenError(1001)
               end

            end

         end

         Expect(C_COLUMNSSym)

      else
         GenError(1002)

      end


      @lnv = ret;

      _out_()
   end
   def LikeDes()
      _in_()
      Expect(C_LIKESym)
      case @sym

      when C_identifierSym,
         C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_PARAMETERSSym,
         C_TARGETSym,
         C_MESSAGESym,
         C_ENDSym,
         C_CREATESym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_DELETESym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_FUNCTIONSym,
         C_ENDFUNCTIONSym,
         C_ENDSELECTSym,
         C_FIELDSSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ONSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SELECTSym,
         C_SINGLESym,
         C_FORSym,
         C_UPDATESym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_TABLESSym,
         C_MOVESym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_APPENDSym,
         C_LINESym,
         C_CASTINGSym,
         C_CONCATENATESym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_SEARCHSym,
         C_STARTINGSym,
         C_ATSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_RAISESym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_INDEXSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_LOOPSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_ENDLOOPSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_CONSTANTSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_WRITESym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_FORMATSym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_CONTINUESym,
         C_CASESym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_ENDCASESym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_DOSym,
         C_TIMESSym,
         C_ENDDOSym,
         C_OPTIONALSym,
         C_EVENTSSym,
         C_MODIFYSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_ENDONSym,
         C_OPENSym,
         C_CURSORSym,
         C_HOLDSym,
         C_INPUTSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_POSITIONSym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_FETCHSym,
         C_BOUNDSSym,
         C_PROVIDESym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ENDPROVIDESym,
         C_READSym,
         C_MAXIMUMSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_SORTSym,
         C_SUBMITSym,
         C_VIASym,
         C_PROGRAMSym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_NOTSym,
         C_FREESym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_RETURNSym,
         C_TRYSym,
         C_CATCHSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ENDTRYSym,
         C_ASSOCIATIONSym,
         C_TYPESSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_SETSym,
         C_WHILESym,
         C_VARYSym,
         C_ENDWHILESym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_IFSym,
         C_ELSEIFSym,
         C_ELSESym,
         C_ENDIFSym,
         C_CLASSSym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_ENDCLASSSym,
         C_METHODSym,
         C_ENDMETHODSym,
         C_ANYSym,
         C_METHODSSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_ADDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_ALIASESSym,
         C_ASSERTSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_ASSIGNSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_ENDATSym,
         C_BACKSym,
         C_CALLSym,
         C_DIALOGSym,
         C_SKIPSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_CLEARSym,
         C_NULLSym,
         C_CLOSESym,
         C_COLLECTSym,
         C_COMMITSym,
         C_WORKSym,
         C_WAITSym,
         C_COMPUTESym,
         C_CONDENSESym,
         C_CONTROLSSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_CONVERTSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_DEMANDSym,
         C_CONTEXTSym,
         C_DESCRIBESym,
         C_DISTANCESym,
         C_PAGESSym,
         C_DETAILSym,
         C_DIVIDESym,
         C_TITLESym,
         C_BACKUPSym,
         C_EXITSym,
         C_SQLSym,
         C_EXPORTSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_EXTRACTSym,
         C_FINDSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_GENERATESym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_INCLUDESym,
         C_GETSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_HIDESym,
         C_IMPORTSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_INFOTYPESSym,
         C_PERSONSym,
         C_INITIALIZATIONSym,
         C_INSERTSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_INTERFACESym,
         C_ENDINTERFACESym,
         C_INTERFACESSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_LEAVESym,
         C_LOCALSym,
         C_MINIMUMSym,
         C_MODULESym,
         C_ENDMODULESym,
         C_MULTIPLYSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_NODESSym,
         C_OVERLAYSym,
         C_ONLYSym,
         C_PACKSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_PERFORMSym,
         C_ROLLBACKSym,
         C_RANGESSym,
         C_RECEIVESym,
         C_REFRESHSym,
         C_CONTROLSym,
         C_REJECTSym,
         C_REPLACESym,
         C_RESERVESym,
         C_RESUMESym,
         C_RETRYSym,
         C_SCROLLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_SHIFTSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_STOPSym,
         C_SUBTRACTSym,
         C_SUMSym,
         C_SUMMARYSym,
         C_SUMMINGSym,
         C_SUPPLYSym,
         C_SUPPRESSSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_TRANSFERSym,
         C_TRANSLATESym,
         C_UPPERSym,
         C_TRUNCATESym,
         C_ULINESym,
         C_UNASSIGNSym,
         C_UNPACKSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_WINDOWSym,
         C_SPLITSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_LparenSym
         if @sym==C_LINESym
            Get()
            Expect(C_OFSym)
         end

         TypeName()

      when C_REFSym
         Get()
         Expect(C_TOSym)
         TypeName()

      when C_SORTEDSym,
         C_HASHEDSym,
         C_STANDARDSym,
         C_TABLESym
         if @sym==C_SORTEDSym||@sym==C_HASHEDSym||@sym==C_STANDARDSym
            if @sym==C_STANDARDSym
               Get()
            else
               if @sym==C_SORTEDSym
                  Get()
               else
                  if @sym==C_HASHEDSym
                     Get()
                  else
                     GenError(1003)
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

         TypeName()
         if @sym==C_WITHSym
            if @sym==C_WITHSym
               Get()
               if @sym==C_UNIQUESym||@sym==C_NONMinusUNIQUESym
                  if @sym==C_UNIQUESym
                     Get()
                  else
                     if @sym==C_NONMinusUNIQUESym
                        Get()
                     else
                        GenError(1004)
                     end

                  end

               end

               while (@sym==C_KEYSym||@sym==C_DEFAULTSym)
                  if @sym==C_KEYSym
                     Get()
                     if @sym==C_PRIMARYUnderscoreKEYSym
                        Get()
                        if @sym==C_ALIASSym
                           Get()
                           Name()
                        end

                        Expect(C_COMPONENTSSym)
                     end

                     Name()
                     while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
                        Name()
                     end

                  else
                     if @sym==C_DEFAULTSym
                        Get()
                        Expect(C_KEYSym)
                     else
                        GenError(1005)
                     end

                  end

               end

            else
               if 1
                  Get()
                  Expect(C_EMPTYSym)
                  Expect(C_KEYSym)
               else
                  GenError(1006)
               end

            end

         end

         while (@sym==C_KEYSym||@sym==C_UNIQUESym||@sym==C_SORTEDSym||@sym==C_WITHSym||@sym==C_NONMinusUNIQUESym)
            if @sym==C_WITHSym
               Get()
               while (@sym==C_UNIQUESym)
                  Get()
                  Expect(C_HASHEDSym)
               end

            else
               if @sym==C_KEYSym||@sym==C_UNIQUESym||@sym==C_SORTEDSym||@sym==C_NONMinusUNIQUESym
                  while (@sym==C_UNIQUESym||@sym==C_SORTEDSym||@sym==C_NONMinusUNIQUESym)
                     while (@sym==C_UNIQUESym||@sym==C_NONMinusUNIQUESym)
                        if @sym==C_UNIQUESym
                           Get()
                        else
                           if @sym==C_NONMinusUNIQUESym
                              Get()
                           else
                              GenError(1007)
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
                  GenError(1008)
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

         ret = VarType.new(lus.strip);

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
         GenError(1009)

      end

      _out_()
   end
   def Format_options()
      _in_()
      while (@sym==C_INPUTSym||@sym==C_COLORSym||@sym>=C_INTENSIFIEDSym&&@sym<=C_RESETSym)
         if @sym==C_COLORSym
            Get()
            if @sym==C_numberSym||@sym==C_OFFSym||@sym==C_COLUnderscoreBACKGROUNDSym||@sym>=C_COLUnderscoreNORMALSym&&@sym<=C_COLUnderscoreGROUPSym||@sym==C_EqualSym
               if @sym==C_numberSym||@sym==C_COLUnderscoreBACKGROUNDSym||@sym>=C_COLUnderscoreNORMALSym&&@sym<=C_COLUnderscoreGROUPSym||@sym==C_EqualSym
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
                     GenError(1010)

                  end

                  if @sym==C_ONSym
                     Get()
                  end

               else
                  if @sym==C_OFFSym
                     Get()
                  else
                     GenError(1011)
                  end

               end

            else
               if 1
                  Get()
                  Expect(C_stringD1Sym)
               else
                  GenError(1012)
               end

            end

         end

         if @sym==C_INTENSIFIEDSym
            Get()
            if @sym==C_ONSym||@sym==C_OFFSym||@sym==C_EqualSym
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

         if @sym==C_INVERSESym
            Get()
            if @sym==C_ONSym||@sym==C_OFFSym||@sym==C_EqualSym
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

         if @sym==C_HOTSPOTSym
            Get()
            if @sym==C_ONSym||@sym==C_OFFSym||@sym==C_EqualSym
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

         if @sym==C_INPUTSym
            Get()
            if @sym==C_ONSym||@sym==C_OFFSym||@sym==C_EqualSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1019)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1020)
                  end

               end

            end

         end

         if @sym==C_FRAMESSym
            Get()
            if @sym==C_ONSym||@sym==C_OFFSym||@sym==C_EqualSym
               if @sym==C_ONSym||@sym==C_OFFSym
                  if @sym==C_ONSym
                     Get()
                  else
                     if @sym==C_OFFSym
                        Get()
                     else
                        GenError(1021)
                     end

                  end

               else
                  if @sym==C_EqualSym
                     Get()
                     Expression()
                  else
                     GenError(1022)
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
      while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_FUNCTIONSym||@sym>=C_ENDSELECTSym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_TIMESSym||@sym>=C_OPTIONALSym&&@sym<=C_CHANGESym||@sym>=C_OPENSym&&@sym<=C_GAPSSym||@sym>=C_READSym&&@sym<=C_TRYSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym>=C_ASSOCIATIONSym&&@sym<=C_VARYSym||@sym>=C_TASKSym&&@sym<=C_IFSym||@sym==C_ELSESym||@sym>=C_CLASSSym&&@sym<=C_SECTIONSym||@sym==C_METHODSym||@sym>=C_METHODSSym&&@sym<=C_LASTSym||@sym>=C_BACKSym&&@sym<=C_INTERFACESym||@sym>=C_INTERFACESSym&&@sym<=C_MODULESym||@sym>=C_MULTIPLYSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TESTMinusINJECTIONSym||@sym==C_TESTMinusSEAMSym||@sym==C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
            GenError(1023)
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
               GenError(1024)
            end

         end

      end

      _out_()
   end
   def Typing()
      _in_()
      if @sym==C_TYPESym
         Get()
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym>=C_LINESym&&@sym<=C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            if @sym==C_LINESym||@sym==C_REFSym
               if @sym==C_LINESym
                  Get()
                  Expect(C_OFSym)
               else
                  if @sym==C_REFSym
                     Get()
                     Expect(C_TOSym)
                  else
                     GenError(1025)
                  end

               end

            end

            if @sym==C_DATASym
               Get()
            else
               if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym==C_identifierSym||@sym>=C_VALUESym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  Expression()
               else
                  GenError(1026)
               end

            end

         else
            if @sym==C_INDEXSym||@sym==C_ANYSym||@sym==C_STANDARDSym
               if @sym==C_ANYSym
                  Get()
               else
                  if @sym==C_INDEXSym
                     Get()
                  else
                     if @sym==C_STANDARDSym
                        Get()
                     else
                        GenError(1027)
                     end

                  end

               end

               if @sym==C_TABLESym
                  Get()
               end

            else
               GenError(1028)
            end

         end

      else
         if @sym==C_LIKESym
            Get()
            if @sym==C_LINESym||@sym==C_REFSym
               if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym>=C_LINESym&&@sym<=C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  if @sym==C_LINESym
                     Get()
                     Expect(C_OFSym)
                  end

               else
                  if 1
                     Get()
                     Expect(C_TOSym)
                  else
                     GenError(1029)
                  end

               end

            end

            Expression()
         else
            GenError(1030)
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
            GenError(1031)
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
         LogExp()
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
      NameInVarDef()
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
            GenError(1032)
         end

      end

      while (@sym==C_ASSOCIATIONSym)
         Association()
      end

      Expect(C_PointSym)
      _out_()
   end
   def CallFunction()
      _in_()
      if @sym==C_FUNCTIONSym
         Get()
         if @sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym
            Name()
         else
            if @sym==C_stringD1Sym
               Get()
            else
               GenError(1033)
            end

         end

         if @sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym==C_CHANGINGSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               while (@sym==C_INSym)
                  Get()
                  Expect(C_UPDATESym)
                  Expect(C_TASKSym)
               end

            else
               if 1
                  while (@sym==C_INSym||@sym==C_STARTINGSym||@sym==C_DESTINATIONSym)
                     if @sym==C_INSym||@sym==C_STARTINGSym
                        if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym==C_CHANGINGSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
                              GenError(1034)
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
                     GenError(1035)
                  end

               end

            end

         end

         if @sym==C_ONSym||@sym>=C_CALLINGSym&&@sym<=C_PERFORMINGSym
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym==C_CHANGINGSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               while (@sym==C_CALLINGSym)
                  Get()
                  Expect(C_identifierSym)
               end

            else
               if 1
                  while (@sym==C_PERFORMINGSym)
                     Get()
                     Expect(C_identifierSym)
                  end

                  Expect(C_ONSym)
                  Expect(C_ENDSym)
                  Expect(C_OFSym)
                  Expect(C_TASKSym)
               else
                  GenError(1036)
               end

            end

         end

         while (@sym==C_EXCEPTIONSSym||@sym==C_TABLESSym||@sym==C_EXPORTINGSym||@sym==C_IMPORTINGSym||@sym==C_CHANGINGSym)
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
            GenError(1037)
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
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         if @sym==C_IMPORTINGSym
            Get()
            Expression()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         if @sym==C_CHANGINGSym
            Get()
            Expression()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         if @sym==C_RECEIVINGSym
            Get()
            Expression()
         end

         if @sym==C_EXCEPTIONSSym
            Get()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
               GenError(1038)
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
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()
         end

      end

      if @sym==C_IMPORTINGSym
         Get()
         Expression()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()
         end

      end

      if @sym==C_CHANGINGSym
         Get()
         Expression()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()
         end

      end

      if @sym==C_TABLESSym
         Get()
         Expression()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
            Expression()
         end

      end

      if @sym==C_EXCEPTIONSSym
         Get()
         while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
               GenError(1039)
            end

         end

      end

      if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
         if @sym==C_EXPORTINGSym
            Get()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         if @sym==C_IMPORTINGSym
            Get()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
            GenError(1040)
         end

      end

      _out_()
   end
   def CallMethod()
      _in_()
      Expect(C_METHODSym)

      param_hash = {};name = "";

      if @sym==C_stringD1Sym||@sym==C_identifierSym||@sym==C_LparenSym
         MethodName()

         mn1 = lus;name+=lus;name=procName(name);

         while (@sym==C_EqualGreaterSym)
            Get()
            MethodName()


            mn2 = lus
            name+=".#{lus}";

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
            GenError(1041)
         end

      end

      while (@sym==C_NOSym||@sym==C_EXPORTINGSym||@sym==C_IMPORTINGSym||@sym==C_CHANGINGSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_EXCEPTIONMinusTABLESym||@sym>=C_RECEIVINGSym&&@sym<=C_QUEUEMinusONLYSym)
         if @sym==C_PARAMETERMinusTABLESym
            Get()
            Name()

            param_hash["PARAMETER-TABLE"]=lus;

         end

         if @sym==C_EXCEPTIONMinusTABLESym
            Get()
            Name()

            param_hash["EXCEPTION-TABLE"]=lus;

         end

         if @sym==C_EXPORTINGSym
            Get()

            exporting = "{\n";

            while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
               Name()

               idn = lus;

               Expect(C_EqualSym)
               Expression()

               exporting+="\"#{idn}\" => #{lus},\n";

            end


            exporting += "}";

         end

         if @sym==C_IMPORTINGSym
            Get()

            importing = "{\n";

            while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
               Name()

               idn = lus;

               Expect(C_EqualSym)
               Expression()

               importing+="\"#{idn}\" => \"#{lus}\",\n";

            end


            importing += "}";

         end

         if @sym==C_CHANGINGSym
            Get()

            changing = "{\n";

            while (@sym>=C_identifierSym&&@sym<=C_NODESym||@sym>=C_STANDARDSym&&@sym<=C_LparenSym)
               Name()

               idn = lus;

               Expect(C_EqualSym)
               Expression()

               changing+="\"#{idn}\" => #{lus},\n";

            end


            changing += "}";

         end

         if @sym==C_RECEIVINGSym
            Get()
            Expression()

            param_hash["RECEIVING"]=lus;

         end

         if @sym==C_NOSym
            Get()
            Expect(C_FLUSHSym)

            param_hash["noflush"]=true;

         end

         if @sym==C_QUEUEMinusONLYSym
            Get()

            param_hash["QUEUE-ONLY"]=true;

         end

      end



      params = {"_i"=>exporting, "_e"=>importing, "_b"=>"binding"}


      #src("call_method(#{name1}.#{name2}, {#{params}})");
      if mn1.start_with?("super.")
         mname = mn1.gsub("super.","")
         name = "super_method(#{current_ruby_scope.class_name}, :#{mname}).call"
      else

      end
      src("#{name}(#{hash_to_params(params)})\n");

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
            if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
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
                     if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                        if @sym==C_MODESym
                           Get()
                           Expect(C_stringD1Sym)
                        end

                        if @sym==C_UPDATESym
                           Get()
                           Expect(C_identifierSym)
                        end

                     else
                        if 1
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
                  GenError(1042)
               end

            end

         else
            GenError(1043)
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
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                  Expression()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(1044)
               end

            end

         end

         if @sym==C_OBJECTSSym
            Get()
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
                  Expression()
               end

            else
               if 1
                  Get()
                  Expect(C_identifierSym)
                  Expect(C_RparenSym)
               else
                  GenError(1045)
               end

            end

         end

         if @sym==C_OPTIONSSym
            Get()
            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()
            end

         end

         Expect(C_SOURCESym)
         Expect(C_XMLSym)
         Expect(C_identifierSym)
      else
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_MESSAGESSym||@sym>=C_OBJECTSSym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
            if @sym==EOF_Sym||@sym==C_PARAMETERSSym||@sym==C_MESSAGESym||@sym==C_CREATESym||@sym==C_DELETESym||@sym>=C_FUNCTIONSym&&@sym<=C_FIELDSSym||@sym==C_ONSym||@sym==C_SELECTSym||@sym==C_UPDATESym||@sym>=C_TABLESSym&&@sym<=C_MOVESym||@sym==C_APPENDSym||@sym==C_CONCATENATESym||@sym==C_SEARCHSym||@sym==C_ATSym||@sym==C_RAISESym||@sym==C_LOOPSym||@sym==C_ENDLOOPSym||@sym==C_CONSTANTSSym||@sym==C_WRITESym||@sym==C_FORMATSym||@sym>=C_CONTINUESym&&@sym<=C_CASESym||@sym==C_ENDCASESym||@sym==C_DOSym||@sym==C_ENDDOSym||@sym>=C_EVENTSSym&&@sym<=C_MODIFYSym||@sym>=C_ENDONSym&&@sym<=C_OPENSym||@sym==C_INPUTSym||@sym==C_POSITIONSym||@sym==C_FETCHSym||@sym==C_PROVIDESym||@sym>=C_ENDPROVIDESym&&@sym<=C_MAXIMUMSym||@sym>=C_SORTSym&&@sym<=C_SUBMITSym||@sym==C_PROGRAMSym||@sym==C_FREESym||@sym>=C_RETURNSym&&@sym<=C_CATCHSym||@sym==C_ENDTRYSym||@sym==C_TYPESSym||@sym>=C_SETSym&&@sym<=C_WHILESym||@sym==C_ENDWHILESym||@sym>=C_IFSym&&@sym<=C_ELSEIFSym||@sym>=C_ENDIFSym&&@sym<=C_CLASSSym||@sym>=C_ENDCLASSSym&&@sym<=C_ENDMETHODSym||@sym==C_METHODSSym||@sym==C_ADDSym||@sym>=C_ALIASESSym&&@sym<=C_ASSERTSym||@sym==C_ASSIGNSym||@sym>=C_ENDATSym&&@sym<=C_CALLSym||@sym==C_SKIPSym||@sym==C_CLEARSym||@sym>=C_CLOSESym&&@sym<=C_COMMITSym||@sym>=C_WAITSym&&@sym<=C_CONTROLSSym||@sym==C_CONVERTSym||@sym==C_DEMANDSym||@sym==C_DESCRIBESym||@sym>=C_DETAILSym&&@sym<=C_DIVIDESym||@sym==C_EXITSym||@sym==C_EXPORTSym||@sym>=C_EXTRACTSym&&@sym<=C_FINDSym||@sym==C_GENERATESym||@sym>=C_INCLUDESym&&@sym<=C_GETSym||@sym>=C_HIDESym&&@sym<=C_IMPORTSym||@sym==C_INFOTYPESSym||@sym>=C_INITIALIZATIONSym&&@sym<=C_INSERTSym||@sym>=C_INTERFACESym&&@sym<=C_INTERFACESSym||@sym>=C_LEAVESym&&@sym<=C_MULTIPLYSym||@sym>=C_NODESSym&&@sym<=C_OVERLAYSym||@sym==C_PACKSym||@sym>=C_PERFORMSym&&@sym<=C_REFRESHSym||@sym>=C_REJECTSym&&@sym<=C_SCROLLSym||@sym==C_SHIFTSym||@sym>=C_STOPSym&&@sym<=C_SUPPRESSSym||@sym>=C_TRANSFERSym&&@sym<=C_TRANSLATESym||@sym>=C_TRUNCATESym&&@sym<=C_UNPACKSym||@sym>=C_WINDOWSym&&@sym<=C_SPLITSym||@sym==C_CHECKSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym==C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym
               if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_MESSAGESym||@sym>=C_CREATESym&&@sym<=C_APPENDSym||@sym>=C_CASTINGSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_ENDMETHODSym||@sym>=C_METHODSSym&&@sym<=C_LINESSym||@sym==C_CHECKSym||@sym==C_LparenSym||@sym>=C_TYPEMinusPOOLSym&&@sym<=C_PointSym||@sym==C_StarSym||@sym==C_TildeSym||@sym>=C_INTOSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_WITHSym||@sym==C_MOVEMinusCORRESPONDINGSym||@sym==C_CLASSMinusDATASym||@sym==C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym==C_forSym||@sym>=C_returnSym&&@sym<=C_ADDMinusCORRESPONDINGSym||@sym==C_BREAKMinusPOINTSym||@sym>=C_CLASSMinusEVENTSSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_DIVIDEMinusCORRESPONDINGSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_FUNCTIONMinusPOOLSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym==C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym==C_TYPEMinusPOOLSSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
                  while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
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
               GenError(1046)
            end

         end

      end

      _out_()
   end
   def MethodName()
      _in_()
      if @sym==C_stringD1Sym||@sym==C_identifierSym
         if @sym==C_stringD1Sym
            Get()

            name=strInQuote(prevString);

         else
            if @sym==C_identifierSym
               Get()

               name=prevString;

            else
               GenError(1047)
            end

         end

      else
         if @sym==C_LparenSym
            Get()
            if @sym==C_stringD1Sym
               Get()

               name=strInQuote(prevString);

            else
               if @sym==C_identifierSym
                  Get()

                  name=prevString;

               else
                  GenError(1048)
               end

            end

            Expect(C_RparenSym)
         else
            GenError(1049)
         end

      end


      src(name);

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
               GenError(1050)
            end

         end

         AddExp()
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

      when C_LessLessEqualSym
         Get()

      when C_GreaterGreaterEqualSym
         Get()

      when C_QueryEqualSym
         Get()

         re("=");


      else
         GenError(1051)

      end

      _out_()
   end
   def LogORExp()
      _in_()
      LogANDExp()
      while (@sym==C_ORSym||@sym==C_EQUIVSym||@sym==C_BarBarSym)
         if @sym==C_BarBarSym
            Get()
         else
            if @sym==C_ORSym
               Get()

               re("or");

            else
               if @sym==C_EQUIVSym
                  Get()

                  re("or");

               else
                  GenError(1052)
               end

            end

         end

         LogANDExp()
      end

      _out_()
   end
   def LogANDExp()
      _in_()
      LogNOTExp()
      while (@sym==C_ANDSym||@sym==C_AndAndSym)
         if @sym==C_AndAndSym
            Get()
         else
            if @sym==C_ANDSym
               Get()

               re("and");

            else
               GenError(1053)
            end

         end

         LogNOTExp()
      end

      _out_()
   end
   def LogNOTExp()
      _in_()
      if @sym==C_NOTSym
         Get()

         re("!");

      end

      InclORExp()
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
      RelationExp()
      if @sym>=EOF_Sym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_TildeSym||@sym>=C_aggregateSym&&@sym<=C_TABLESym||@sym>=C_PlusSym&&@sym<=C_MOVEMinusCORRESPONDINGSym||@sym>=C_RbrackSym&&@sym<=C_EqualSym||@sym>=C_CLASSMinusDATASym&&@sym<=C_READMinusONLYSym||@sym>=C_NOMinusGAPSym&&@sym<=C_AUTHORITYMinusCHECKSym||@sym==C_SELECTIONMinusSCREENSym||@sym>=C_forSym&&@sym<=C_BREAKMinusPOINTSym||@sym>=C_RECEIVINGSym&&@sym<=C_CLASSMinusPOOLSym||@sym>=C_NOMinusGAPSSym&&@sym<=C_EDITORMinusCALLSym||@sym>=C_ENDMinusOFMinusPAGESym&&@sym<=C_ENDMinusOFMinusSELECTIONSym||@sym>=C_FIELDMinusGROUPSSym&&@sym<=C_SHORTDUMPMinusIDSym||@sym==C_INTERFACEMinusPOOLSym||@sym>=C_LOADMinusOFMinusPROGRAMSym&&@sym<=C_NEWMinusLINESym||@sym==C_NEWMinusPAGESym||@sym==C_NEWMinusSECTIONSym||@sym>=C_HELPMinusREQUESTSym&&@sym<=C_PRINTMinusCONTROLSym||@sym==C_SELECTMinusOPTIONSSym||@sym>=C_SUBTRACTMinusCORRESPONDINGSym&&@sym<=C_TOPMinusOFMinusPAGESym||@sym>=C_TYPEMinusPOOLSSym&&@sym<=C_LessGreaterSym||@sym==C_MinusSym||@sym>=C_StarEqualSym&&@sym<=C_BangSym
         while (@sym==C_LIKESym||@sym>=C_EQSym&&@sym<=C_NESym||@sym==C_LessGreaterSym)
            case @sym

            when C_EQSym
               Get()

               re("==");


            when C_LessGreaterSym
               Get()

               re("!=");


            when C_NESym
               Get()

               re("!=");


            when C_LIKESym
               Get()

            else
               GenError(1054)

            end

            RelationExp()
         end

      else
         if 1
            if @sym==C_NOTSym
               Get()
            end

            Expect(C_BETWEENSym)
            RelationExp()
            Expect(C_ANDSym)
            RelationExp()
         else
            if 1
               Get()

               s=".is";

               if @sym==C_NOTSym
                  Get()

                  s+="Not";

               end

               PredefinedConstant()

               s+=lus;r="#{s}()";src(r);

            else
               GenError(1055)
            end

         end

      end

      _out_()
   end
   def RelationExp()
      _in_()
      ShiftExp()

      r = lus;

      while (@sym==C_INSym||@sym>=C_CPSym&&@sym<=C_GTSym||@sym>=C_COSym&&@sym<=C_NSSym||@sym>=C_LessSym&&@sym<=C_BYTEMinusNSSym)
         case @sym

         when C_INSym
            Get()

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
            GenError(1056)

         end


         op = prevString();

         ShiftExp()


         exp2 = lus
         if op == "IN"
            r = "IN(#{exp2}, #{r})"
         else
            r +=" #{op} #{exp}"
         end;

      end


      src(r);

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
         GenError(1057)

      end

      _out_()
   end
   def AddExp()
      _in_()
      MultExp()
      while (@sym==C_PlusSym||@sym==C_AndAndSym||@sym==C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               if @sym==C_AndAndSym
                  Get()

                  re("+");

               else
                  GenError(1058)
               end

            end

         end

         MultExp()
      end

      _out_()
   end
   def MultExp()
      _in_()
      CastExp()
      while (@sym>=C_DIVSym&&@sym<=C_MODSym||@sym==C_StarSym||@sym>=C_SlashSym&&@sym<=C_StarStarSym||@sym==C_PercentSym)
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
            GenError(1059)

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
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_GTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym
         PostFixExp()
      else
         if @sym==C_NOTSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            UnaryOperator()
            CastExp()
         else
            GenError(1060)
         end

      end

      _out_()
   end
   def PostFixExp()
      _in_()

      no_space;r="";

      Primary()


      pri = lus
      if @sym == C_EqualGreaterSym
         pri = to_ruby_const(pri)
      end
      r += pri;

      PostFix(r)

      r = lus;



      no_space(false)
      if r != ""
         src(r)
      end;

      _out_()
   end
   def UnaryOperator()
      _in_()
      case @sym

      when C_PlusSym
         Get()

      when C_MinusSym
         Get()

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

         re("!");


      when C_INSTANCESym
         Get()
         Expect(C_OFSym)

      when C_INSym
         Get()

      else
         GenError(1061)

      end

      _out_()
   end
   def PostFix(r)
      _in_()

      n=r;

      while (@sym==C_LparenSym||@sym==C_EqualGreaterSym||@sym==C_LbrackSym||@sym==C_MinusGreaterSym||@sym==C_HashSym)
         case @sym

         when C_LbrackSym
            Get()
            if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
               Expression()
            end

            Expect(C_RbrackSym)

            r+="[#{lus}]";


         when C_LparenSym,
            C_HashSym
            if @sym==C_HashSym
               Get()
            end

            FunctionCall(r)


            if r == "DATA" || r == "FIELD-SYMBOL"
               r = lus[1..lus.size-2]
            else
               if n.start_with?("super.")
                  mname = n.gsub("super.","")
                  r = "super_method(#{current_ruby_scope.class_name}, :#{mname}).call"
               else
                  r+="#{lus}"
               end
            end;


         when C_MinusGreaterSym
            Get()
            Expect(C_identifierSym)


            r+=".#{prevString}"
            ;


         when C_EqualGreaterSym
            Get()
            Expect(C_identifierSym)


            r+="::#{to_ruby_const(prevString)}";


         else
            GenError(1062)

         end

      end



      no_space(false)
      if r != ""
         src(r)
      end;

      _out_()
   end
   def FunctionCall(name)
      _in_()
      Expect(C_LparenSym)

      stop_autosrc;no_comments;

      if @sym==C_EXCEPTIONSSym||@sym==C_EXPORTINGSym||@sym==C_IMPORTINGSym||@sym==C_RparenSym||@sym==C_CHANGINGSym||@sym==C_RECEIVINGSym
         while (@sym==C_EXCEPTIONSSym||@sym==C_EXPORTINGSym||@sym==C_IMPORTINGSym||@sym==C_CHANGINGSym||@sym==C_RECEIVINGSym)
            if @sym==C_EXPORTINGSym
               Get()

               exporting = "{\n";

               while (@sym==C_identifierSym)
                  Get()

                  idn = prevString;

                  Expect(C_EqualSym)
                  Expression()

                  exporting+="\"#{idn}\" => \"#{lus}\",\n";

               end


               exporting += "}";

            end

            if @sym==C_IMPORTINGSym
               Get()

               importing = "{\n";

               while (@sym==C_identifierSym)
                  Get()

                  idn = prevString;

                  Expect(C_EqualSym)
                  Expression()

                  importing+="\"#{idn}\" => #{lus},\n";

               end


               importing += "}";

            end

            if @sym==C_CHANGINGSym
               Get()

               changing = "{\n";

               while (@sym==C_identifierSym)
                  Get()

                  idn = prevString;

                  Expect(C_EqualSym)
                  Expression()

                  changing+="\"#{idn}\" => #{lus},\n";

               end


               changing += "}";

            end

            if @sym==C_RECEIVINGSym
               Get()

               receiving = "{\n";

               while (@sym==C_identifierSym)
                  Get()

                  idn = prevString;

                  Expect(C_EqualSym)
                  Expression()

                  receiving+="\"#{idn}\" => #{lus},\n";

               end


               receiving += "}";

            end

            if @sym==C_EXCEPTIONSSym
               Get()

               exceptions = "{\n";

               while (@sym==C_identifierSym)
                  Get()

                  idn = prevString;

                  Expect(C_EqualSym)
                  Expression()

                  exceptions+="\"#{idn}\" => #{lus},\n";

               end


               exceptions += "}";

               if @sym==C_OTHERSSym
                  Get()
                  Expect(C_EqualSym)
                  Expression()
               end

            end

         end



         params= {}
         params[:_i]=importing
         params[:_e]=exporting
         params[:_c]=changing
         params[:_b]="binding"
         src("(#{hash_to_params(params)})");

      else
         if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_COMPONENTSSym||@sym==C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_REFERENCESym||@sym>=C_TRANSPORTINGSym&&@sym<=C_BINARYSym||@sym>=C_RETURNINGSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym

            s="";e={};

            while (@sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_NOTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym)
               Expression()


               l = lut
               if l.size == 3 && l[1] == "="
                  s += "#{l[0]} = #{l[2]},"
                  e[l[0]] = l[2]
               else
                  s += "#{lus},"
               end

               ;

            end



            if e.keys.size>0
               src("(#{hash_to_params(e)})")
            else

               src("(#{s[0..s.size-2]})")

            end;

         end

      end

      Expect(C_RparenSym)

      no_comments(false);

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


      when C_regexD1Sym
         Get()

         src(convert_regex(prevString));


      when C_NEWSym
         Get()

         back();

         Creator()

      when C_charSym
         Get()

      when C_numberSym
         Get()

      when C_LparenSym
         Get()
         Expression()
         Expect(C_RparenSym)

      when C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_INITIALSym
         PredefinedConstant()

      when C_identifierSym,
         C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_TARGETSym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SINGLESym,
         C_FORSym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_CASTINGSym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_STARTINGSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_TIMESSym,
         C_OPTIONALSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_CURSORSym,
         C_HOLDSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_BOUNDSSym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_VIASym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ASSOCIATIONSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_VARYSym,
         C_TASKSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_ELSESym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_DIALOGSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_NULLSym,
         C_WORKSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_CONTEXTSym,
         C_DISTANCESym,
         C_PAGESSym,
         C_TITLESym,
         C_BACKUPSym,
         C_SQLSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_PERSONSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_ONLYSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_CONTROLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_UPPERSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_REFSym,
         C_SORTEDSym,
         C_EDITSym,
         C_NODESym,
         C_ALLSym,
         C_OTHERSym,
         C_ASSIGNINGSym,
         C_REFERENCESym,
         C_EXPORTINGSym,
         C_TRANSPORTINGSym,
         C_HASHEDSym,
         C_RANGESym,
         C_BINARYSym,
         C_IMPORTINGSym,
         C_RETURNINGSym,
         C_LINESSym
         NameInPrimary()

      else
         GenError(1063)

      end

      _out_()
   end
   def Creator()
      _in_()
      Expect(C_identifierSym)

      name=prevString;

      if @sym==C_LparenSym
         FunctionCall(name)
      end


      src("#{name}.new#{lus}");

      _out_()
   end
   def LogLogANDExp()
      _in_()
      LogLogNOTExp()
      while (@sym==C_ANDSym)
         Get()

         re("&&");

         LogLogNOTExp()
      end

      _out_()
   end
   def LogLogNOTExp()
      _in_()
      if @sym==C_NOTSym
         Get()

         re("!");

      end

      LogInclORExp()
      _out_()
   end
   def LogInclORExp()
      _in_()
      LogExclORExp()
      while (@sym==C_BarSym)
         Get()
         LogExclORExp()
      end

      _out_()
   end
   def LogExclORExp()
      _in_()
      LogANDExp2()
      while (@sym==C_UparrowSym)
         Get()
         LogANDExp2()
      end

      _out_()
   end
   def LogANDExp2()
      _in_()
      LogEqualExp()
      while (@sym==C_AndSym)
         Get()
         LogEqualExp()
      end

      _out_()
   end
   def LogEqualExp()
      _in_()
      LogRelationExp()
      if @sym==C_FIELDSSym||@sym==C_ORDERSym||@sym==C_APPENDINGSym||@sym==C_FORSym||@sym>=C_WHERESym&&@sym<=C_EXTENDEDSym||@sym==C_CREATINGSym||@sym>=C_OFFSETSym&&@sym<=C_UPSym||@sym==C_BYPASSINGSym||@sym==C_CONNECTIONSym||@sym==C_ANDSym||@sym==C_LIKESym||@sym==C_BETWEENSym||@sym==C_ORSym||@sym>=C_EQSym&&@sym<=C_NESym||@sym==C_VARYSym||@sym==C_EQUIVSym||@sym>=C_LparenSym&&@sym<=C_RparenSym||@sym==C_PointSym||@sym==C_INTOSym||@sym==C_EqualSym||@sym==C_BarBarSym||@sym>=C_BarSym&&@sym<=C_LessGreaterSym
         while (@sym==C_LIKESym||@sym>=C_EQSym&&@sym<=C_NESym||@sym==C_EqualSym||@sym==C_LessGreaterSym)
            case @sym

            when C_EqualSym
               Get()

               re("==");


            when C_EQSym
               Get()

               re("==");


            when C_LessGreaterSym
               Get()

               re("!=");


            when C_NESym
               Get()

               re("!=");


            when C_LIKESym
               Get()

            else
               GenError(1064)

            end

            LogRelationExp()
         end

      else
         if @sym==C_NOTSym
            if @sym==C_NOTSym
               Get()
            end

            Expect(C_BETWEENSym)
            LogRelationExp()
            Expect(C_ANDSym)
            LogRelationExp()
         else
            if @sym==C_ISSym
               Get()

               back();s=".is";

               if @sym==C_NOTSym
                  Get()

                  back();s+="Not";

               end

               PredefinedConstant()

               back();s+=lus;r="#{s}()";add_src(r);

            else
               GenError(1065)
            end

         end

      end

      _out_()
   end
   def LogRelationExp()
      _in_()
      LogShiftExp()
      while (@sym==C_INSym||@sym>=C_CPSym&&@sym<=C_GTSym||@sym>=C_COSym&&@sym<=C_NSSym||@sym>=C_LessSym&&@sym<=C_BYTEMinusNSSym)

         br=false;

         case @sym

         when C_INSym
            Get()

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

            re(".include?(");br=true;


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
            GenError(1066)

         end

         LogShiftExp()

         re("#{lus})") if br;

      end

      _out_()
   end
   def LogShiftExp()
      _in_()
      LogAddExp()
      while (@sym>=C_LessLessSym&&@sym<=C_GreaterGreaterSym)
         if @sym==C_LessLessSym
            Get()
         else
            if @sym==C_GreaterGreaterSym
               Get()
            else
               GenError(1067)
            end

         end

         LogAddExp()
      end

      _out_()
   end
   def LogAddExp()
      _in_()
      LogMultExp()
      while (@sym==C_PlusSym||@sym==C_AndAndSym||@sym==C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               if @sym==C_AndAndSym
                  Get()

                  re("+");

               else
                  GenError(1068)
               end

            end

         end

         LogMultExp()
      end

      _out_()
   end
   def LogMultExp()
      _in_()
      LogCastExp()
      while (@sym>=C_DIVSym&&@sym<=C_MODSym||@sym==C_StarSym||@sym>=C_SlashSym&&@sym<=C_StarStarSym||@sym==C_PercentSym)
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
            GenError(1069)

         end

         LogCastExp()
      end

      _out_()
   end
   def LogCastExp()
      _in_()
      LogUnaryExp()
      _out_()
   end
   def LogUnaryExp()
      _in_()
      if @sym==C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_regexD1Sym||@sym>=C_identifierSym&&@sym<=C_PARAMETERSym||@sym==C_TARGETSym||@sym>=C_KEYSym&&@sym<=C_KINDSym||@sym>=C_ACTIVATIONSym&&@sym<=C_FUNCTIONALITYSym||@sym>=C_DISTINCTSym&&@sym<=C_JOINSym||@sym>=C_ORDERSym&&@sym<=C_SIZESym||@sym>=C_SINGLESym&&@sym<=C_FORSym||@sym>=C_ENTRIESSym&&@sym<=C_ENDWITHSym||@sym>=C_EXACTSym&&@sym<=C_KEEPINGSym||@sym==C_CASTINGSym||@sym>=C_CHARACTERSym&&@sym<=C_BLANKSSym||@sym==C_STARTINGSym||@sym>=C_ENDINGSym&&@sym<=C_MARKSym||@sym>=C_EVENTSym&&@sym<=C_RAISINGSym||@sym>=C_TEXTSym&&@sym<=C_MEMBERSSym||@sym>=C_VERSIONSym&&@sym<=C_SCREENSym||@sym>=C_LOBSym&&@sym<=C_STATICSSym||@sym>=C_BEGINSym&&@sym<=C_ISSym||@sym>=C_UNDERSym&&@sym<=C_TIMESym||@sym>=C_ZONESym&&@sym<=C_QUICKINFOSym||@sym>=C_WHENSym&&@sym<=C_OTHERSSym||@sym>=C_FIELDSym&&@sym<=C_NEXTSym||@sym==C_TIMESSym||@sym==C_OPTIONALSym||@sym>=C_CURRENTSym&&@sym<=C_CHANGESym||@sym>=C_CURSORSym&&@sym<=C_HOLDSym||@sym>=C_OUTPUTSym&&@sym<=C_CODESym||@sym>=C_FILTERSym&&@sym<=C_REPLACEMENTSym||@sym==C_BOUNDSSym||@sym>=C_INCLUDINGSym&&@sym<=C_GAPSSym||@sym>=C_ACTUALSym&&@sym<=C_LANGUAGESym||@sym==C_VIASym||@sym>=C_EQSym&&@sym<=C_GTSym||@sym>=C_SELECTIONSSym&&@sym<=C_JOBSym||@sym>=C_BEFORESym&&@sym<=C_CLEANUPSym||@sym==C_ASSOCIATIONSym||@sym>=C_ENUMSym&&@sym<=C_MESHSym||@sym==C_VARYSym||@sym>=C_TASKSym&&@sym<=C_PERFORMINGSym||@sym==C_ELSESym||@sym>=C_DEFINITIONSym&&@sym<=C_SECTIONSym||@sym>=C_REDEFINITIONSym&&@sym<=C_PREFERREDSym||@sym>=C_THENSym&&@sym<=C_ACCORDINGSym||@sym>=C_SUBKEYSym&&@sym<=C_CONDITIONSym||@sym>=C_COMPONENTSym&&@sym<=C_LASTSym||@sym==C_DIALOGSym||@sym>=C_PROCEDURESym&&@sym<=C_BADISym||@sym==C_NULLSym||@sym==C_WORKSym||@sym>=C_TABLEVIEWSym&&@sym<=C_TABSTRIPSym||@sym>=C_SORTABLESym&&@sym<=C_SAVINGSym||@sym==C_CONTEXTSym||@sym>=C_DISTANCESym&&@sym<=C_PAGESSym||@sym>=C_TITLESym&&@sym<=C_BACKUPSym||@sym==C_SQLSym||@sym>=C_INTERNALSym&&@sym<=C_OFFSym||@sym>=C_OCCURRENCESym&&@sym<=C_RESETSym||@sym>=C_SUBROUTINESym&&@sym<=C_POOLSym||@sym>=C_FILTERSSym&&@sym<=C_RUNSym||@sym>=C_ACCEPTINGSym&&@sym<=C_FOUNDSym||@sym==C_PERSONSym||@sym>=C_VALUESSym&&@sym<=C_ENABLINGSym||@sym>=C_PARTIALLYSym&&@sym<=C_IMPLEMENTEDSym||@sym>=C_SCROLLINGSym&&@sym<=C_PRINTSym||@sym==C_ONLYSym||@sym>=C_OBLIGATORYSym&&@sym<=C_PATTERNSym||@sym==C_CONTROLSym||@sym>=C_COLUMNSym&&@sym<=C_TITLEBARSym||@sym>=C_CIRCULARSym&&@sym<=C_TRAILINGSym||@sym>=C_SWITCHSTATESSym&&@sym<=C_DURINGSym||@sym==C_UPPERSym||@sym>=C_SECONDSSym&&@sym<=C_PUSHSym||@sym>=C_DIVSym&&@sym<=C_LINESSym||@sym==C_LparenSym
         LogPostFixExp()
      else
         if @sym==C_NOTSym||@sym==C_StarSym||@sym==C_TildeSym||@sym==C_PlusSym||@sym==C_AndSym||@sym==C_MinusSym||@sym==C_BangSym
            UnaryOperator()
            LogCastExp()
         else
            GenError(1070)
         end

      end

      _out_()
   end
   def LogPostFixExp()
      _in_()

      no_space;r="";

      LogPrimary()

      pri = lus
      if curString == "=>"
         pri = to_ruby_const(pri)
      end
      r += pri;

      PostFix(r)

      r = lus;



      no_space(false)
      if r != ""
         src(r)
      end;

      _out_()
   end
   def LogPrimary()
      _in_()
      case @sym

      when C_stringD1Sym
         Get()
         while (@sym==C_stringD1Sym)
            Get()
         end


      when C_regexD1Sym
         Get()

         src(convert_regex(prevString));


      when C_charSym
         Get()

      when C_numberSym
         Get()

      when C_LparenSym
         Get()
         LogExp()
         Expect(C_RparenSym)

      when C_BOUNDSym,
         C_ASSIGNEDSym,
         C_SUPPLIEDSym,
         C_REQUESTEDSym,
         C_INITIALSym
         PredefinedConstant()

      when C_identifierSym,
         C_DATASym,
         C_VALUESym,
         C_PARAMETERSym,
         C_TARGETSym,
         C_KEYSym,
         C_IDSym,
         C_DEFAULTSym,
         C_LENGTHSym,
         C_DECIMALSSym,
         C_BOXEDSym,
         C_SUFFIXSym,
         C_COMPONENTSSym,
         C_EXCEPTIONSSym,
         C_KINDSym,
         C_ACTIVATIONSym,
         C_OFSym,
         C_EOFSym,
         C_REPORTSym,
         C_NOSym,
         C_PAGESym,
         C_HEADINGSym,
         C_DEFININGSym,
         C_DATABASESym,
         C_REDUCEDSym,
         C_FUNCTIONALITYSym,
         C_DISTINCTSym,
         C_FROMSym,
         C_ASSym,
         C_USINGSym,
         C_CLIENTSym,
         C_SPECIFIEDSym,
         C_INNERSym,
         C_LEFTSym,
         C_RIGHTSym,
         C_OUTERSym,
         C_CROSSSym,
         C_JOINSym,
         C_ORDERSym,
         C_BYSym,
         C_PRIMARYSym,
         C_ASCENDINGSym,
         C_DESCENDINGSym,
         C_APPENDINGSym,
         C_CORRESPONDINGSym,
         C_PACKAGESym,
         C_SIZESym,
         C_SINGLESym,
         C_FORSym,
         C_ENTRIESSym,
         C_INSym,
         C_WHERESym,
         C_GROUPSym,
         C_HAVINGSym,
         C_UNIONSym,
         C_EXTENDEDSym,
         C_RESULTSym,
         C_CREATINGSym,
         C_READERSym,
         C_LOCATORSym,
         C_COLUMNSSym,
         C_BLOBSym,
         C_CLOBSym,
         C_OFFSETSym,
         C_UPSym,
         C_TOSym,
         C_ROWSSym,
         C_BYPASSINGSym,
         C_BUFFERSym,
         C_CONNECTIONSym,
         C_ENDWITHSym,
         C_EXACTSym,
         C_PERCENTAGESym,
         C_EXPANDINGSym,
         C_NESTEDSym,
         C_KEEPINGSym,
         C_CASTINGSym,
         C_CHARACTERSym,
         C_BYTESym,
         C_MODESym,
         C_SEPARATEDSym,
         C_RESPECTINGSym,
         C_BLANKSSym,
         C_STARTINGSym,
         C_ENDINGSym,
         C_ABBREVIATEDSym,
         C_ANDSym,
         C_MARKSym,
         C_EVENTSym,
         C_RESUMABLESym,
         C_EXCEPTIONSym,
         C_NUMBERSym,
         C_DISPLAYSym,
         C_LIKESym,
         C_RAISINGSym,
         C_TEXTSym,
         C_WITHOUTSym,
         C_MEMBERSSym,
         C_VERSIONSym,
         C_SCREENSym,
         C_LOBSym,
         C_HANDLESym,
         C_EMPTYSym,
         C_HEADERSym,
         C_UNIQUESym,
         C_PRIMARYUnderscoreKEYSym,
         C_ALIASSym,
         C_STATICSSym,
         C_BEGINSym,
         C_COMMONSym,
         C_PARTSym,
         C_OCCURSSym,
         C_VALIDSym,
         C_BETWEENSym,
         C_ISSym,
         C_UNDERSym,
         C_CENTEREDSym,
         C_EXPONENTSym,
         C_CURRENCYSym,
         C_ROUNDSym,
         C_UNITSym,
         C_ENVIRONMENTSym,
         C_TIMESym,
         C_ZONESym,
         C_STYLESym,
         C_MASKSym,
         C_DDMMYYSym,
         C_MMDDYYSym,
         C_YYMMDDSym,
         C_CHECKBOXSym,
         C_ICONSym,
         C_SYMBOLSym,
         C_QUICKINFOSym,
         C_WHENSym,
         C_ORSym,
         C_OTHERSSym,
         C_FIELDSym,
         C_DUMMYSym,
         C_OBJECTSym,
         C_USERSym,
         C_DATASETSym,
         C_ADJACENTSym,
         C_DUPLICATESSym,
         C_COMPARINGSym,
         C_MEMORYSym,
         C_SHAREDSym,
         C_VARYINGSym,
         C_NEXTSym,
         C_TIMESSym,
         C_OPTIONALSym,
         C_CURRENTSym,
         C_CHANGESym,
         C_CURSORSym,
         C_HOLDSym,
         C_OUTPUTSym,
         C_ENCODINGSym,
         C_SKIPPINGSym,
         C_NATIVESym,
         C_SMARTSym,
         C_UNIXSym,
         C_WINDOWSSym,
         C_LINEFEEDSym,
         C_LEGACYSym,
         C_BIGSym,
         C_LITTLESym,
         C_ENDIANSym,
         C_CODESym,
         C_FILTERSym,
         C_IGNORINGSym,
         C_CONVERSIONSym,
         C_ERRORSSym,
         C_REPLACEMENTSym,
         C_BOUNDSSym,
         C_INCLUDINGSym,
         C_GAPSSym,
         C_ACTUALSym,
         C_WIDTHSym,
         C_TEXTPOOLSym,
         C_LANGUAGESym,
         C_VIASym,
         C_EQSym,
         C_NESym,
         C_CPSym,
         C_NPSym,
         C_GESym,
         C_LTSym,
         C_LESym,
         C_GTSym,
         C_SELECTIONSSym,
         C_LISTSym,
         C_SPOOLSym,
         C_ARCHIVESym,
         C_DYNPROSym,
         C_JOBSym,
         C_BEFORESym,
         C_UNWINDSym,
         C_CLEANUPSym,
         C_ASSOCIATIONSym,
         C_ENUMSym,
         C_STRUCTURESym,
         C_BASESym,
         C_MESHSym,
         C_VARYSym,
         C_TASKSym,
         C_NEWSym,
         C_BACKGROUNDSym,
         C_SEPARATESym,
         C_DESTINATIONSym,
         C_CALLINGSym,
         C_PERFORMINGSym,
         C_ELSESym,
         C_DEFINITIONSym,
         C_DEFERREDSym,
         C_PUBLICSym,
         C_PROTECTEDSym,
         C_PRIVATESym,
         C_INHERITINGSym,
         C_ABSTRACTSym,
         C_FINALSym,
         C_ENABLEDSym,
         C_TESTINGSym,
         C_RISKSym,
         C_LEVELSym,
         C_CRITICALSym,
         C_DANGEROUSSym,
         C_HARMLESSSym,
         C_DURATIONSym,
         C_SHORTSym,
         C_MEDIUMSym,
         C_LONGSym,
         C_GLOBALSym,
         C_FRIENDSSym,
         C_LOADSym,
         C_IMPLEMENTATIONSym,
         C_SECTIONSym,
         C_REDEFINITIONSym,
         C_IGNORESym,
         C_FAILSym,
         C_PREFERREDSym,
         C_THENSym,
         C_UNTILSym,
         C_GIVINGSym,
         C_ACCORDINGSym,
         C_SUBKEYSym,
         C_CONDITIONSym,
         C_COMPONENTSym,
         C_INCREMENTSym,
         C_FIRSTSym,
         C_LASTSym,
         C_DIALOGSym,
         C_PROCEDURESym,
         C_FLUSHSym,
         C_TRANSACTIONSym,
         C_OPTIONSSym,
         C_MESSAGESSym,
         C_TRANSFORMATIONSym,
         C_OBJECTSSym,
         C_SOURCESym,
         C_XMLSym,
         C_AREASym,
         C_BADISym,
         C_NULLSym,
         C_WORKSym,
         C_TABLEVIEWSym,
         C_TABSTRIPSym,
         C_SORTABLESym,
         C_STAMPSym,
         C_DAYLIGHTSym,
         C_SAVINGSym,
         C_CONTEXTSym,
         C_DISTANCESym,
         C_PAGESSym,
         C_TITLESym,
         C_BACKUPSym,
         C_SQLSym,
         C_INTERNALSym,
         C_COMPRESSIONSym,
         C_OFFSym,
         C_OCCURRENCESym,
         C_OCCURRENCESSym,
         C_SUBSTRINGSym,
         C_REGEXSym,
         C_MATCHSym,
         C_COUNTSym,
         C_RESULTSSym,
         C_SUBMATCHESSym,
         C_COLORSym,
         C_COLUnderscoreBACKGROUNDSym,
         C_COLUnderscoreHEADINGSym,
         C_COLUnderscoreNORMALSym,
         C_COLUnderscoreTOTALSym,
         C_COLUnderscoreKEYSym,
         C_COLUnderscorePOSITIVESym,
         C_COLUnderscoreNEGATIVESym,
         C_COLUnderscoreGROUPSym,
         C_INTENSIFIEDSym,
         C_INVERSESym,
         C_HOTSPOTSym,
         C_FRAMESSym,
         C_RESETSym,
         C_SUBROUTINESym,
         C_POOLSym,
         C_FILTERSSym,
         C_BITSym,
         C_ATTRIBUTESSym,
         C_LOCALESym,
         C_COUNTRYSym,
         C_MODIFIERSym,
         C_EXCLUDINGSym,
         C_PROPERTYSym,
         C_RUNSym,
         C_ACCEPTINGSym,
         C_PADDINGSym,
         C_TRUNCATIONSym,
         C_BOUNDARIESSym,
         C_DIRECTORYSym,
         C_RENAMINGSym,
         C_FOUNDSym,
         C_PERSONSym,
         C_VALUESSym,
         C_DUPLICATESym,
         C_KEYSSym,
         C_ENTRYSym,
         C_ARITHMETICSym,
         C_UNICODESym,
         C_ENABLINGSym,
         C_PARTIALLYSym,
         C_IMPLEMENTEDSym,
         C_SCROLLINGSym,
         C_PRINTSym,
         C_ONLYSym,
         C_OBLIGATORYSym,
         C_VISIBLESym,
         C_LISTBOXSym,
         C_RADIOBUTTONSym,
         C_MODIFSym,
         C_LOWERSym,
         C_MATCHCODESym,
         C_PATTERNSym,
         C_CONTROLSym,
         C_COLUMNSym,
         C_PLACESSym,
         C_FORWARDSym,
         C_BACKWARDSym,
         C_INTERVALSSym,
         C_OPTIONSym,
         C_SELECTIONSym,
         C_LOWSym,
         C_HIGHSym,
         C_TABSym,
         C_BLANKSym,
         C_FILESym,
         C_HANDLERSym,
         C_INSTANCESSym,
         C_MARGINSym,
         C_IMMEDIATELYSym,
         C_ANALYZERSym,
         C_CLOCKSym,
         C_RESOLUTIONSym,
         C_TITLEBARSym,
         C_CIRCULARSym,
         C_DELETINGSym,
         C_LEADINGSym,
         C_TRAILINGSym,
         C_SWITCHSTATESSym,
         C_DURINGSym,
         C_UPPERSym,
         C_SECONDSSym,
         C_ASYNCHRONOUSSym,
         C_TASKSSym,
         C_MESSAGINGSym,
         C_CHANNELSSym,
         C_PUSHSym,
         C_DIVSym,
         C_MODSym,
         C_EQUIVSym,
         C_COSym,
         C_CNSym,
         C_CASym,
         C_NASym,
         C_CSSym,
         C_NSSym,
         C_INSTANCESym,
         C_REFSym,
         C_SORTEDSym,
         C_EDITSym,
         C_NODESym,
         C_ALLSym,
         C_OTHERSym,
         C_ASSIGNINGSym,
         C_REFERENCESym,
         C_EXPORTINGSym,
         C_TRANSPORTINGSym,
         C_HASHEDSym,
         C_RANGESym,
         C_BINARYSym,
         C_IMPORTINGSym,
         C_RETURNINGSym,
         C_LINESSym
         NameInPrimary()

      else
         GenError(1071)

      end

      _out_()
   end


end
