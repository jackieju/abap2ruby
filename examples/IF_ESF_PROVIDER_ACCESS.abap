*"* components of interface IF_ESF_PROVIDER_ACCESS
interface IF_ESF_PROVIDER_ACCESS
  public .


  interface IF_ESF_TYPES load .
  types TY_EDIT_MODE type IF_ESF_TYPES=>TY_EDIT_MODE .
  types TY_CHANGE_MODE type IF_ESF_TYPES=>TY_CHANGE_MODE .
  types TY_MODIFICATIONS type SESF_ACCESS_MODIFY .
  types:
    tt_modifications type standard table of ty_modifications
      with default key .
  types:
    BEGIN OF ty_buffer ,
        node_id           TYPE sesf_bo_node_id,
        parent_node_id    TYPE sesf_bo_node_id,
        data              TYPE REF TO data,
        change_mode       TYPE if_esf_types=>ty_change_mode,
        read_from_db      TYPE abap_bool,
        data_before_image TYPE REF TO data,
      END OF ty_buffer .
  types:
    tt_buffer TYPE SORTED TABLE OF ty_buffer
        WITH UNIQUE KEY primary_key ALIAS node  COMPONENTS node_id
        WITH NON-UNIQUE SORTED KEY parent_node  COMPONENTS parent_node_id .

  constants CO_CHANGE_MODE_CREATE type IF_ESF_TYPES=>TY_CHANGE_MODE value IF_ESF_TYPES=>CO_CHANGE_MODE_CREATE. "#EC NOTEXT
  constants CO_CHANGE_MODE_UPDATE type IF_ESF_TYPES=>TY_CHANGE_MODE value IF_ESF_TYPES=>CO_CHANGE_MODE_UPDATE. "#EC NOTEXT
  constants CO_CHANGE_MODE_DELETE type IF_ESF_TYPES=>TY_CHANGE_MODE value IF_ESF_TYPES=>CO_CHANGE_MODE_DELETE. "#EC NOTEXT
  constants CO_READ_ONLY type TY_EDIT_MODE value 0. "#EC NOTEXT
  constants CO_EDIT type TY_EDIT_MODE value 1. "#EC NOTEXT
  constants CO_EDIT_EXCLUSIVE type TY_EDIT_MODE value 2. "#EC NOTEXT
  constants CO_DEPENDENT_OBJECT_SEPARATOR type C value '.'. "#EC NOTEXT
  constants CO_CREATE_WITH_REF type STRING value 'CREATE_WITH_REFERENCE'. "#EC NOTEXT

  methods CHECK
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_CHECK_SCOPE type IF_ESF_TYPES=>TY_CHECK_SCOPE
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods CHECK_AND_DETERMINE
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_CHECK_SCOPE type IF_ESF_TYPES=>TY_CHECK_SCOPE
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER .
  methods CONVERT_KEY_TO_NODE_ID
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_KEY_NAME type STRING
      !IN_KEYS type INDEX TABLE
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
    exporting
      !OUT_KEY_MAPPING type SESF_ACCESS_KEY_MAPPING_TAB .
  methods CONVERT_KEYS
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_SOURCE_KEY_NAME type STRING
      !IN_TARGET_KEY_NAME type STRING
      !IN_SOURCE_KEYS type INDEX TABLE
    exporting
      !OUT_TARGET_KEYS type INDEX TABLE
      !OUT_FAILED type SESF_BOOLEAN_TAB .
  methods MODIFY
    importing
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
    changing
      !IN_MODIFICATIONS type TT_MODIFICATIONS .
  methods RETRIEVE
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
      !IN_EDIT_MODE type IF_ESF_TYPES=>TY_EDIT_MODE
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_BUFFER_SYNC_HANDLER type ref to IF_ESF_BUFFER_SYNC_HANDLER optional
    exporting
      !OUT_DATA type INDEX TABLE
      !OUT_FAILED_NODE_IDS type SESF_BO_NODE_ID_TAB .
  type-pools ABAP .
  methods RETRIEVE_BY_ASSOCIATION
    importing
      !IN_BO_NAME type STRING
      !IN_BO_NODE_NAME type STRING
      !IN_ASSOCIATION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_FILL_DATA type SESF_BOOLEAN
      !IN_FILL_FAILED_SOURCE_NODE_IDS type SESF_BOOLEAN default ABAP_TRUE
      !IN_FILTER_PARAMETERS type ANY optional
      !IN_FILTERED_ATTRIBUTES type SESF_STRING_TAB optional
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
      !IN_EDIT_MODE type TY_EDIT_MODE
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_BUFFER_SYNC_HANDLER type ref to IF_ESF_BUFFER_SYNC_HANDLER optional
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB
      !OUT_DATA type INDEX TABLE
      !OUT_FAILED_SOURCE_NODE_IDS type SESF_BO_NODE_ID_TAB .
  methods RETRIEVE_PROPERTIES
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_PROPERTY_HANDLER type ref to IF_ESF_PROPERTY_HANDLER
      !IN_PROPERTY_SCOPE type IF_ESF_TYPES=>TY_PROPERTY_SCOPE default IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT .
  methods RETRIEVE_ROOT_NODE_ID
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB .
  methods RETRIEVE_DEFAULT_NODE_VALUES
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_ID_HANDLES type SESF_BO_NODE_ID_TAB
      !IN_ASSOCIATION_NAME type STRING
      !IN_ASSOCIATION_FILTER_STRUCT type ANY
      !IN_ASSOCIATION_FILTER_ATTRIBS type SESF_STRING_TAB
      !IN_SOURCE_BO_NODE_NAME type STRING
      !IN_SOURCE_NODE_ID type SESF_BO_NODE_ID
      !IN_SOURCE_NODE_ID_IS_HANDLE type SESF_BOOLEAN
      !IN_PROPERTY_HANDLER type ref to IF_ESF_PROPERTY_HANDLER optional
    exporting
      !OUT_DATA type INDEX TABLE .
endinterface.