*"* components of interface IF_ESF_PROVIDER_ACTION
interface IF_ESF_PROVIDER_ACTION
  public .


  methods EXECUTE_ACTION
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T optional
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods RETRIEVE_DEFAULT_ACTION_PARAM
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
    exporting
      !OUT_ACTION_PARAMETERS type ANY .
endinterface.