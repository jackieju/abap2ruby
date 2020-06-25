*"* components of interface IF_BSA_ADAPTATION_HANDLER
interface IF_BSA_ADAPTATION_HANDLER
  public .


  interfaces IF_ESF_LCP .

  aliases CHECK
    for IF_ESF_LCP~CHECK .
  aliases CHECK_AND_DETERMINE
    for IF_ESF_LCP~CHECK_AND_DETERMINE .
  aliases CONVERT_KEYS
    for IF_ESF_LCP~CONVERT_KEYS .
  aliases CONVERT_KEY_TO_NODE_ID
    for IF_ESF_LCP~CONVERT_KEY_TO_NODE_ID .
  aliases EXECUTE_ACTION
    for IF_ESF_LCP~EXECUTE_ACTION .
  aliases MODIFY
    for IF_ESF_LCP~MODIFY .
  aliases QUERY
    for IF_ESF_LCP~QUERY .
  aliases RETRIEVE
    for IF_ESF_LCP~RETRIEVE .
  aliases RETRIEVE_ACTION_CODE_VALUES
    for IF_ESF_LCP~RETRIEVE_ACTION_CODE_VALUES .
  aliases RETRIEVE_ACTION_VALUE_SET
    for IF_ESF_LCP~RETRIEVE_ACTION_VALUE_SET .
  aliases RETRIEVE_BY_ASSOCIATION
    for IF_ESF_LCP~RETRIEVE_BY_ASSOCIATION .
  aliases RETRIEVE_CODE_VALUES
    for IF_ESF_LCP~RETRIEVE_CODE_VALUES .
  aliases RETRIEVE_DEFAULT_ACTION_PARAM
    for IF_ESF_LCP~RETRIEVE_DEFAULT_ACTION_PARAM .
  aliases RETRIEVE_DEFAULT_NODE_VALUES
    for IF_ESF_LCP~RETRIEVE_DEFAULT_NODE_VALUES .
  aliases RETRIEVE_DEFAULT_QUERY_PARAM
    for IF_ESF_LCP~RETRIEVE_DEFAULT_QUERY_PARAM .
  aliases RETRIEVE_PROPERTIES
    for IF_ESF_LCP~RETRIEVE_PROPERTIES .
  aliases RETRIEVE_QUERY_CODE_VALUES
    for IF_ESF_LCP~RETRIEVE_QUERY_CODE_VALUES .
  aliases RETRIEVE_QUERY_VALUE_SET
    for IF_ESF_LCP~RETRIEVE_QUERY_VALUE_SET .
  aliases RETRIEVE_ROOT_NODE_ID
    for IF_ESF_LCP~RETRIEVE_ROOT_NODE_ID .
  aliases RETRIEVE_VALUE_SET
    for IF_ESF_LCP~RETRIEVE_VALUE_SET .

  types:
    ty_buffering_mode TYPE c LENGTH 1 .
  types:
    BEGIN OF ty_node_container ,
    node_name       TYPE string ,
    table_descr     TYPE REF TO cl_abap_tabledescr ,
  END OF ty_node_container .
  types:
    tt_node_container TYPE SORTED TABLE OF ty_node_container WITH UNIQUE KEY node_name .

  constants:
    BEGIN OF co_buffering_mode,
                unspecified TYPE ty_buffering_mode VALUE '?',
                buffered    TYPE ty_buffering_mode VALUE 'B',
                unbuffered  TYPE ty_buffering_mode VALUE '-',
             END OF co_buffering_mode .

  interface IF_ESF_TYPES load .
  methods MAP_MESSAGES
    importing
      !IN_MESSAGES type IF_ESF_TYPES=>TY_MESSAGES
    exporting
      !OUT_MESSAGES type IF_ESF_TYPES=>TY_MESSAGES
    raising
      resumable(CX_BSA_RUNTIME) .
  methods MAP_CHANGE_NOTIFICATIONS
    importing
      !IN_CHANGE_NOTIFICATIONS type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    exporting
      !OUT_CHANGE_NOTIFICATIONS type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    raising
      CX_BSA_RUNTIME .
  methods ON_BO_CHANGED
    importing
      !IN_PUBLISHER_BO_NAME type STRING
      !IN_BO_CHANGES type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    exporting
      !OUT_CHANGE_NOTIFICATIONS type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    raising
      CX_ESF_CORE_SERVICE .
  methods GET_LCP
    importing
      !IN_BO_NAME type STRING
      !IN_BUFFERING_MODE type TY_BUFFERING_MODE default CO_BUFFERING_MODE-UNSPECIFIED
    returning
      value(OUT_LCP) type ref to IF_ESF_LCP
    raising
      CX_BSA_RUNTIME .
  methods PUSH_RUNTIME_BUFFER_USAGE
    importing
      !IV_BO_NAME type STRING
      !IV_BO_NODE_NAME type STRING
      !IT_USED_ATTRIBUTES type SESF_STRING_TAB optional
      !IT_USED_ACTIONS type SESF_STRING_TAB optional .
  methods GET_FIRST_RETRVED_ROOT_NODE_ID
    exporting
      !EV_FIRST_RET_DATA_ROOT_NODE_ID type SESF_BO_NODE_ID
      !EV_FIRST_ROOT_ID_DETERMINED type BOOLEAN .
endinterface.