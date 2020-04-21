class CParser < CRRParser

   def C()
      _in_()
      if @sym==C_REPORTSym
         ReportDef()
      else
         if @sym==C_FUNCTIONSym
            FunctionDef()
         else
            GenError(246)
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

      Expect(C_PointSym)
      while (@sym>=C_PointSym&&@sym<=C_SPLITSym)
         Statement()
      end



      @root_class.add_method(fn_name,"()",[],src,"");

      Expect(EOF_Sym)
      _out_()
   end
   def FunctionDef()
      _in_()
      Expect(C_FUNCTIONSym)

      parseAbap("FunctionDef");

      _out_()
   end
   def Statement()
      _in_()

      ps();

      case @sym

      when C_DATASym
         stDATA()

      when C_WRITESym
         stWRITE()

      when C_CONTINUESym
         stCONTINUE()

      when C_DOSym
         stDO()

      when C_forSym
         ForStatement()

      when C_IFSym
         IfStatement()

      when C_PointSym
         NullStatement()

      when C_WHILESym
         stWHILE()

      when C_LOOPSym
         LOOP()

      when C_CASESym
         CaseStatement()

      when C_CALLSym
         stCALL()

      when C_CLASSSym
         if @sym==C_CLASSSym
            ClassStatement()
         else
            if 1
               ClassImplStatement()
            else
               GenError(247)
            end

         end


      when C_METHODSym
         MethodStatement()

      when C_METHODSSym
         MethodsStatement()

      when C_FUNCTIONSym
         FunctionDef()

      when C_MessageSym
         stMessage()

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

      when C_BACKSym
         stBACK()

      when C_BREAKMinusPOINTSym
         stBREAK_POINT()

      when C_CATCHSym
         stCATCH()

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

      else
         GenError(248)

      end

      _out_()
   end
   def stDATA()
      _in_()
      Expect(C_DATASym)

      parseAbap("DATA");

      _out_()
   end
   def stWRITE()
      _in_()
      Expect(C_WRITESym)

      parseAbap("WRITE");

      _out_()
   end
   def stCONTINUE()
      _in_()
      Expect(C_CONTINUESym)

      parseAbap("CONTINUE");

      _out_()
   end
   def stDO()
      _in_()
      Expect(C_DOSym)

      parseAbap("DO");

      _out_()
   end
   def ForStatement()
      _in_()
      Expect(C_forSym)

      parseAbap("ForStatement");

      _out_()
   end
   def IfStatement()
      _in_()
      Expect(C_IFSym)

      parseAbap("IfStatement");

      _out_()
   end
   def NullStatement()
      _in_()
      Expect(C_PointSym)
      _out_()
   end
   def stWHILE()
      _in_()
      Expect(C_WHILESym)

      parseAbap("WHILE");

      _out_()
   end
   def LOOP()
      _in_()
      Expect(C_LOOPSym)

      parseAbap("LOOP");

      _out_()
   end
   def CaseStatement()
      _in_()
      Expect(C_CASESym)

      parseAbap("CaseStatement");

      _out_()
   end
   def stCALL()
      _in_()
      Expect(C_CALLSym)

      parseAbap("CALL");

      _out_()
   end
   def ClassStatement()
      _in_()
      Expect(C_CLASSSym)

      parseAbap("ClassStatement");

      _out_()
   end
   def ClassImplStatement()
      _in_()
      Expect(C_CLASSSym)

      parseAbap("ClassImplStatement");

      _out_()
   end
   def MethodStatement()
      _in_()
      Expect(C_METHODSym)

      parseAbap("MethodStatement");

      _out_()
   end
   def MethodsStatement()
      _in_()
      Expect(C_METHODSSym)

      parseAbap("MethodsStatement");

      _out_()
   end
   def stMessage()
      _in_()
      Expect(C_MessageSym)

      parseAbap("Message");

      _out_()
   end
   def SearchStatement()
      _in_()
      Expect(C_SEARCHSym)

      parseAbap("SearchStatement");

      _out_()
   end
   def stAPPEND()
      _in_()
      Expect(C_APPENDSym)

      parseAbap("APPEND");

      _out_()
   end
   def stSPLIT()
      _in_()
      Expect(C_SPLITSym)

      parseAbap("SPLIT");

      _out_()
   end
   def stRAISE()
      _in_()
      Expect(C_RAISESym)

      parseAbap("RAISE");

      _out_()
   end
   def stCONSTANTS()
      _in_()
      Expect(C_CONSTANTSSym)

      parseAbap("CONSTANTS");

      _out_()
   end
   def stMOVE()
      _in_()
      Expect(C_MOVESym)

      parseAbap("MOVE");

      _out_()
   end
   def stWITH()
      _in_()
      Expect(C_WITHSym)

      parseAbap("WITH");

      _out_()
   end
   def stTABLES()
      _in_()
      Expect(C_TABLESSym)

      parseAbap("TABLES");

      _out_()
   end
   def stAUTHORITY_CHECK()
      _in_()
      Expect(C_AUTHORITYMinusCHECKSym)

      parseAbap("AUTHORITY_CHECK");

      _out_()
   end
   def stDELETE()
      _in_()
      Expect(C_DELETESym)

      parseAbap("DELETE");

      _out_()
   end
   def stEVENTS()
      _in_()
      Expect(C_EVENTSSym)

      parseAbap("EVENTS");

      _out_()
   end
   def stON()
      _in_()
      Expect(C_ONSym)

      parseAbap("ON");

      _out_()
   end
   def stOPEN()
      _in_()
      Expect(C_OPENSym)

      parseAbap("OPEN");

      _out_()
   end
   def stFETCH()
      _in_()
      Expect(C_FETCHSym)

      parseAbap("FETCH");

      _out_()
   end
   def stPROVIDE()
      _in_()
      Expect(C_PROVIDESym)

      parseAbap("PROVIDE");

      _out_()
   end
   def stREAD()
      _in_()
      Expect(C_READSym)

      parseAbap("READ");

      _out_()
   end
   def stSORT()
      _in_()
      Expect(C_SORTSym)

      parseAbap("SORT");

      _out_()
   end
   def stSUBMIT()
      _in_()
      Expect(C_SUBMITSym)

      parseAbap("SUBMIT");

      _out_()
   end
   def stTRY()
      _in_()
      Expect(C_TRYSym)

      parseAbap("TRY");

      _out_()
   end
   def stADD()
      _in_()
      Expect(C_ADDSym)

      parseAbap("ADD");

      _out_()
   end
   def stADD_CORRESPONDING()
      _in_()
      Expect(C_ADDMinusCORRESPONDINGSym)

      parseAbap("ADD_CORRESPONDING");

      _out_()
   end
   def stALIASES()
      _in_()
      Expect(C_ALIASESSym)

      parseAbap("ALIASES");

      _out_()
   end
   def stASSERT()
      _in_()
      Expect(C_ASSERTSym)

      parseAbap("ASSERT");

      _out_()
   end
   def stASSIGN()
      _in_()
      Expect(C_ASSIGNSym)

      parseAbap("ASSIGN");

      _out_()
   end
   def stBACK()
      _in_()
      Expect(C_BACKSym)

      parseAbap("BACK");

      _out_()
   end
   def stBREAK_POINT()
      _in_()
      Expect(C_BREAKMinusPOINTSym)

      parseAbap("BREAK_POINT");

      _out_()
   end
   def stCATCH()
      _in_()
      Expect(C_CATCHSym)

      parseAbap("CATCH");

      _out_()
   end
   def stCHECK()
      _in_()
      Expect(C_CHECKSym)

      parseAbap("CHECK");

      _out_()
   end
   def stCLASS_DATA()
      _in_()
      Expect(C_CLASSMinusDATASym)

      parseAbap("CLASS_DATA");

      _out_()
   end
   def stCLASS_EVENTS()
      _in_()
      Expect(C_CLASSMinusEVENTSSym)

      parseAbap("CLASS_EVENTS");

      _out_()
   end
   def stCLASS_POOL()
      _in_()
      Expect(C_CLASSMinusPOOLSym)

      parseAbap("CLASS_POOL");

      _out_()
   end
   def stCLEAR()
      _in_()
      Expect(C_CLEARSym)

      parseAbap("CLEAR");

      _out_()
   end
   def stCLOSE()
      _in_()
      Expect(C_CLOSESym)

      parseAbap("CLOSE");

      _out_()
   end
   def stCOLLECT()
      _in_()
      Expect(C_COLLECTSym)

      parseAbap("COLLECT");

      _out_()
   end
   def stCOMMIT()
      _in_()
      Expect(C_COMMITSym)

      parseAbap("COMMIT");

      _out_()
   end
   def stCOMPUTE()
      _in_()
      Expect(C_COMPUTESym)

      parseAbap("COMPUTE");

      _out_()
   end
   def stCONCATENATE()
      _in_()
      Expect(C_CONCATENATESym)

      parseAbap("CONCATENATE");

      _out_()
   end
   def stCONDENSE()
      _in_()
      Expect(C_CONDENSESym)

      parseAbap("CONDENSE");

      _out_()
   end
   def stCONTROLS()
      _in_()
      Expect(C_CONTROLSSym)

      parseAbap("CONTROLS");

      _out_()
   end
   def stCONVERT()
      _in_()
      Expect(C_CONVERTSym)

      parseAbap("CONVERT");

      _out_()
   end
   def stCREATE()
      _in_()
      Expect(C_CREATESym)

      parseAbap("CREATE");

      _out_()
   end
   def stDEMAND()
      _in_()
      Expect(C_DEMANDSym)

      parseAbap("DEMAND");

      _out_()
   end
   def stDESCRIBE()
      _in_()
      Expect(C_DESCRIBESym)

      parseAbap("DESCRIBE");

      _out_()
   end
   def stDETAIL()
      _in_()
      Expect(C_DETAILSym)

      parseAbap("DETAIL");

      _out_()
   end
   def stDIVIDE()
      _in_()
      Expect(C_DIVIDESym)

      parseAbap("DIVIDE");

      _out_()
   end
   def stDIVIDE_CORRESPONDING()
      _in_()
      Expect(C_DIVIDEMinusCORRESPONDINGSym)

      parseAbap("DIVIDE_CORRESPONDING");

      _out_()
   end
   def stEDITOR_CALL()
      _in_()
      Expect(C_EDITORMinusCALLSym)

      parseAbap("EDITOR_CALL");

      _out_()
   end
   def stEND_OF_PAGE()
      _in_()
      Expect(C_ENDMinusOFMinusPAGESym)

      parseAbap("END_OF_PAGE");

      _out_()
   end
   def stEND_OF_SELECTION()
      _in_()
      Expect(C_ENDMinusOFMinusSELECTIONSym)

      parseAbap("END_OF_SELECTION");

      _out_()
   end
   def stEXIT()
      _in_()
      Expect(C_EXITSym)

      parseAbap("EXIT");

      _out_()
   end
   def stEXPORT()
      _in_()
      Expect(C_EXPORTSym)

      parseAbap("EXPORT");

      _out_()
   end
   def stEXTRACT()
      _in_()
      Expect(C_EXTRACTSym)

      parseAbap("EXTRACT");

      _out_()
   end
   def stFIELD_GROUPS()
      _in_()
      Expect(C_FIELDMinusGROUPSSym)

      parseAbap("FIELD_GROUPS");

      _out_()
   end
   def stFIELD_SYMBOLS()
      _in_()
      Expect(C_FIELDMinusSYMBOLSSym)

      parseAbap("FIELD_SYMBOLS");

      _out_()
   end
   def stFIELDS()
      _in_()
      Expect(C_FIELDSSym)

      parseAbap("FIELDS");

      _out_()
   end
   def stFIND()
      _in_()
      Expect(C_FINDSym)

      parseAbap("FIND");

      _out_()
   end
   def stFORMAT()
      _in_()
      Expect(C_FORMATSym)

      parseAbap("FORMAT");

      _out_()
   end
   def stFREE()
      _in_()
      Expect(C_FREESym)

      parseAbap("FREE");

      _out_()
   end
   def stFUNCTION_POOL()
      _in_()
      Expect(C_FUNCTIONMinusPOOLSym)

      parseAbap("FUNCTION_POOL");

      _out_()
   end
   def stGENERATE()
      _in_()
      Expect(C_GENERATESym)

      parseAbap("GENERATE");

      _out_()
   end
   def stGET()
      _in_()
      Expect(C_GETSym)

      parseAbap("GET");

      _out_()
   end
   def stHIDE()
      _in_()
      Expect(C_HIDESym)

      parseAbap("HIDE");

      _out_()
   end
   def stIMPORT()
      _in_()
      Expect(C_IMPORTSym)

      parseAbap("IMPORT");

      _out_()
   end
   def stINCLUDE()
      _in_()
      Expect(C_INCLUDESym)

      parseAbap("TYPES");

      _out_()
   end
   def stINFOTYPES()
      _in_()
      Expect(C_INFOTYPESSym)

      parseAbap("INFOTYPES");

      _out_()
   end
   def stINITIALIZATION()
      _in_()
      Expect(C_INITIALIZATIONSym)

      parseAbap("INITIALIZATION");

      _out_()
   end
   def stINPUT()
      _in_()
      Expect(C_INPUTSym)

      parseAbap("INPUT");

      _out_()
   end
   def stINSERT()
      _in_()
      Expect(C_INSERTSym)

      parseAbap("INSERT");

      _out_()
   end
   def stINTERFACE()
      _in_()
      Expect(C_INTERFACESym)

      parseAbap("INTERFACE");

      _out_()
   end
   def stINTERFACE_POOL()
      _in_()
      Expect(C_INTERFACEMinusPOOLSym)

      parseAbap("INTERFACE_POOL");

      _out_()
   end
   def stINTERFACES()
      _in_()
      Expect(C_INTERFACESSym)

      parseAbap("INTERFACES");

      _out_()
   end
   def stLEAVE()
      _in_()
      Expect(C_LEAVESym)

      parseAbap("LEAVE");

      _out_()
   end
   def stLOAD_OF_PROGRAM()
      _in_()
      Expect(C_LOADMinusOFMinusPROGRAMSym)

      parseAbap("LOAD_OF_PROGRAM");

      _out_()
   end
   def stLOCAL()
      _in_()
      Expect(C_LOCALSym)

      parseAbap("LOCAL");

      _out_()
   end
   def stLOG_POINT()
      _in_()
      Expect(C_LOGMinusPOINTSym)

      parseAbap("LOG_POINT");

      _out_()
   end
   def stMAXIMUM()
      _in_()
      Expect(C_MAXIMUMSym)

      parseAbap("MAXIMUM");

      _out_()
   end
   def stMINIMUM()
      _in_()
      Expect(C_MINIMUMSym)

      parseAbap("MINIMUM");

      _out_()
   end
   def stMODULE()
      _in_()
      Expect(C_MODULESym)

      parseAbap("MODULE");

      _out_()
   end
   def stMULTIPLY()
      _in_()
      Expect(C_MULTIPLYSym)

      parseAbap("MULTIPLY");

      _out_()
   end
   def stMULTIPLY_CORRESPONDING()
      _in_()
      Expect(C_MULTIPLYMinusCORRESPONDINGSym)

      parseAbap("MULTIPLY_CORRESPONDING");

      _out_()
   end
   def stNEW_LINE()
      _in_()
      Expect(C_NEWMinusLINESym)

      parseAbap("NEW_LINE");

      _out_()
   end
   def stNEW_PAGE()
      _in_()
      Expect(C_NEWMinusPAGESym)

      parseAbap("NEW_PAGE");

      _out_()
   end
   def stNEW_SECTION()
      _in_()
      Expect(C_NEWMinusSECTIONSym)

      parseAbap("NEW_SECTION");

      _out_()
   end
   def stNODES()
      _in_()
      Expect(C_NODESSym)

      parseAbap("NODES");

      _out_()
   end
   def stOVERLAY()
      _in_()
      Expect(C_OVERLAYSym)

      parseAbap("OVERLAY");

      _out_()
   end
   def stPACK()
      _in_()
      Expect(C_PACKSym)

      parseAbap("PACK");

      _out_()
   end
   def stPARAMETERS()
      _in_()
      Expect(C_PARAMETERSSym)

      parseAbap("PARAMETERS");

      _out_()
   end
   def stPERFORM()
      _in_()
      Expect(C_PERFORMSym)

      parseAbap("PERFORM");

      _out_()
   end
   def stPOSITION()
      _in_()
      Expect(C_POSITIONSym)

      parseAbap("POSITION");

      _out_()
   end
   def stPRINT_CONTROL()
      _in_()
      Expect(C_PRINTMinusCONTROLSym)

      parseAbap("PRINT_CONTROL");

      _out_()
   end
   def stPROGRAM()
      _in_()
      Expect(C_PROGRAMSym)

      parseAbap("PROGRAM");

      _out_()
   end
   def stRANGES()
      _in_()
      Expect(C_RANGESSym)

      parseAbap("RANGES");

      _out_()
   end
   def stRECEIVE()
      _in_()
      Expect(C_RECEIVESym)

      parseAbap("RECEIVE");

      _out_()
   end
   def stREFRESH()
      _in_()
      Expect(C_REFRESHSym)

      parseAbap("REFRESH");

      _out_()
   end
   def stREJECT()
      _in_()
      Expect(C_REJECTSym)

      parseAbap("REJECT");

      _out_()
   end
   def stREPLACE()
      _in_()
      Expect(C_REPLACESym)

      parseAbap("REPLACE");

      _out_()
   end
   def stRESERVE()
      _in_()
      Expect(C_RESERVESym)

      parseAbap("RESERVE");

      _out_()
   end
   def stRESUME()
      _in_()
      Expect(C_RESUMESym)

      parseAbap("RESUME");

      _out_()
   end
   def stRETRY()
      _in_()
      Expect(C_RETRYSym)

      parseAbap("RETRY");

      _out_()
   end
   def stRETURN()
      _in_()
      Expect(C_RETURNSym)

      parseAbap("RETURN");

      _out_()
   end
   def stROLLBACK()
      _in_()
      Expect(C_ROLLBACKSym)

      parseAbap("ROLLBACK");

      _out_()
   end
   def stSCROLL()
      _in_()
      Expect(C_SCROLLSym)

      parseAbap("SCROLL");

      _out_()
   end
   def stSELECT_OPTIONS()
      _in_()
      Expect(C_SELECTMinusOPTIONSSym)

      parseAbap("SELECT_OPTIONS");

      _out_()
   end
   def stSELECTION_SCREEN()
      _in_()
      Expect(C_SELECTIONMinusSCREENSym)

      parseAbap("SELECTION_SCREEN");

      _out_()
   end
   def stSET()
      _in_()
      Expect(C_SETSym)

      parseAbap("SET");

      _out_()
   end
   def stSHIFT()
      _in_()
      Expect(C_SHIFTSym)

      parseAbap("SHIFT");

      _out_()
   end
   def stSKIP()
      _in_()
      Expect(C_SKIPSym)

      parseAbap("SKIP");

      _out_()
   end
   def stSTOP()
      _in_()
      Expect(C_STOPSym)

      parseAbap("STOP");

      _out_()
   end
   def stSUBTRACT()
      _in_()
      Expect(C_SUBTRACTSym)

      parseAbap("SUBTRACT");

      _out_()
   end
   def stSUBTRACT_CORRESPONDING()
      _in_()
      Expect(C_SUBTRACTMinusCORRESPONDINGSym)

      parseAbap("SUBTRACT_CORRESPONDING");

      _out_()
   end
   def stSUM()
      _in_()
      Expect(C_SUMSym)

      parseAbap("SUM");

      _out_()
   end
   def stSUMMARY()
      _in_()
      Expect(C_SUMMARYSym)

      parseAbap("SUMMARY");

      _out_()
   end
   def stSUMMING()
      _in_()
      Expect(C_SUMMINGSym)

      parseAbap("SUMMING");

      _out_()
   end
   def stSUPPLY()
      _in_()
      Expect(C_SUPPLYSym)

      parseAbap("SUPPLY");

      _out_()
   end
   def stSUPPRESS()
      _in_()
      Expect(C_SUPPRESSSym)

      parseAbap("SUPPRESS");

      _out_()
   end
   def stSYNTAX_CHECK()
      _in_()
      Expect(C_SYNTAXMinusCHECKSym)

      parseAbap("SYNTAX_CHECK");

      _out_()
   end
   def stTEST_INJECTION()
      _in_()
      Expect(C_TESTMinusINJECTIONSym)

      parseAbap("TEST_INJECTION");

      _out_()
   end
   def stTEST_SEAM()
      _in_()
      Expect(C_TESTMinusSEAMSym)

      parseAbap("TEST_SEAM");

      _out_()
   end
   def stTOP_OF_PAGE()
      _in_()
      Expect(C_TOPMinusOFMinusPAGESym)

      parseAbap("TOP_OF_PAGE");

      _out_()
   end
   def stTRANSFER()
      _in_()
      Expect(C_TRANSFERSym)

      parseAbap("TRANSFER");

      _out_()
   end
   def stTRANSLATE()
      _in_()
      Expect(C_TRANSLATESym)

      parseAbap("TRANSLATE");

      _out_()
   end
   def stTRUNCATE()
      _in_()
      Expect(C_TRUNCATESym)

      parseAbap("TRUNCATE");

      _out_()
   end
   def stTYPE_POOL()
      _in_()
      Expect(C_TYPEMinusPOOLSym)

      parseAbap("TYPE_POOL");

      _out_()
   end
   def stTYPE_POOLS()
      _in_()
      Expect(C_TYPEMinusPOOLSSym)

      parseAbap("TYPE_POOLS");

      _out_()
   end
   def stTYPES()
      _in_()
      Expect(C_TYPESSym)

      parseAbap("TYPES");

      _out_()
   end
   def stULINE()
      _in_()
      Expect(C_ULINESym)

      parseAbap("ULINE");

      _out_()
   end
   def stUNASSIGN()
      _in_()
      Expect(C_UNASSIGNSym)

      parseAbap("UNASSIGN");

      _out_()
   end
   def stUNPACK()
      _in_()
      Expect(C_UNPACKSym)

      parseAbap("UNPACK");

      _out_()
   end
   def stUPDATE()
      _in_()
      Expect(C_UPDATESym)

      parseAbap("UPDATE");

      _out_()
   end
   def stWAIT()
      _in_()
      Expect(C_WAITSym)

      parseAbap("WAIT");

      _out_()
   end
   def stWINDOW()
      _in_()
      Expect(C_WINDOWSym)

      parseAbap("WINDOW");

      _out_()
   end
   def stSELECT()
      _in_()
      Expect(C_SELECTSym)

      parseAbap("SELECT");

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
         GenError(249)

      end

      _out_()
   end
   def LogORExp()
      _in_()
      LogANDExp()
      while (@sym>=C_BarBarSym&&@sym<=C_EQUIVSym)
         if @sym==C_BarBarSym
            Get()
         else
            if @sym==C_ORSym
               Get()
            else
               if @sym==C_EQUIVSym
                  Get()
               else
                  GenError(250)
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
      while (@sym>=C_AndAndSym&&@sym<=C_ANDSym)
         if @sym==C_AndAndSym
            Get()
         else
            if @sym==C_ANDSym
               Get()
            else
               GenError(251)
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
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_LparenSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_StarSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_INSTANCESym||@sym>=C_INSym&&@sym<=C_REQUESTEDSym
         RelationExp()
         while (@sym>=C_EqualSym&&@sym<=C_ISSym)
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
               GenError(252)

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
            GenError(253)
         end

      end

      _out_()
   end
   def RelationExp()
      _in_()
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
            GenError(254)

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
               GenError(255)
            end

         end

         AddExp()
      end

      _out_()
   end
   def AddExp()
      _in_()
      MultExp()
      while (@sym>=C_PlusSym&&@sym<=C_MinusSym)
         if @sym==C_PlusSym
            Get()
         else
            if @sym==C_MinusSym
               Get()
            else
               GenError(256)
            end

         end

         MultExp()
      end

      _out_()
   end
   def MultExp()
      _in_()
      CastExp()
      while (@sym>=C_StarSym&&@sym<=C_StarStarSym)
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
            GenError(257)

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
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_LparenSym||@sym>=C_INITIALSym&&@sym<=C_REQUESTEDSym
         PostFixExp()
      else
         if @sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym
            if @sym==C_PlusPlusSym
               Get()
            else
               if @sym==C_MinusMinusSym
                  Get()
               else
                  GenError(258)
               end

            end

            UnaryExp()
         else
            if @sym==C_spaceD1Sym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_StarSym||@sym>=C_BangSym&&@sym<=C_INSTANCESym||@sym==C_INSym
               UnaryOperator()
               CastExp()
            else
               GenError(259)
            end

         end

      end

      _out_()
   end
   def PostFixExp()
      _in_()
      Primary()
      while (@sym==C_LparenSym||@sym>=C_PlusPlusSym&&@sym<=C_LbrackSym||@sym>=C_MinusGreaterSym&&@sym<=C_EqualGreaterSym)
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
            GenError(260)

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
         GenError(261)

      end

      _out_()
   end
   def Primary()
      _in_()
      case @sym

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

      when C_identifierSym
         Get()

      else
         GenError(262)

      end

      _out_()
   end
   def FunctionCall()
      _in_()
      Expect(C_LparenSym)
      if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym==C_LparenSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_StarSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_INSTANCESym||@sym>=C_INSym&&@sym<=C_REQUESTEDSym
         ActualParameters()
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
         GenError(263)

      end

      _out_()
   end
   def ActualParameters()
      _in_()
      Expression()
      while (@sym==C_CommaSym)
         Get()
         Expression()
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
            GenError(264)
         end

      end

      _out_()
   end


end
