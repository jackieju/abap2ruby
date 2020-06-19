class CL_A1FIA_OWL2_CO definition
  public
  inheriting from CL_COUTL_TASK_OWL_SP
  create public

  global friends CL_A1FIA_OVS_CO .

public section.

*"* public components of class CL_A1FIA_OWL2_CO
*"* do not include other source files here!!!
  methods DERIVE_ACCESS_CONTEXT_CODE
    importing
      !IV_WORK_CENTER_NAME type STRING
    exporting
      value(EV_ACCESS_CONTEXT_CODE) type RBAM_ACCESS_CTX_CODE .

  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~QUERY
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
    redefinition .
protected section.

  types:
    BEGIN OF ty_bo_node_query_mapping,
            node_name          TYPE string,
            query_name         TYPE string,
        END OF ty_bo_node_query_mapping .
  types:
    tt_bo_node_query_mapping TYPE SORTED TABLE OF ty_bo_node_query_mapping WITH UNIQUE KEY node_name .
  types:
    BEGIN OF ty_ref_bo_mapping,
           task_node_id TYPE sesf_bo_node_id,
           core_bo_node_id TYPE sesf_bo_node_id,
         END OF ty_ref_bo_mapping .
  types:
    tt_ref_bo_mapping TYPE SORTED TABLE OF ty_ref_bo_mapping
           WITH UNIQUE KEY task_node_id
           WITH NON-UNIQUE SORTED KEY core_bo_node_key COMPONENTS core_bo_node_id .
  types:
    tt_action_name TYPE STANDARD TABLE OF string .

  data MV_ALT_KEY_NAME_ROOT_COMPANY type STRING value 'COMPANY_UUID-CONTENT' ##no_text . "#EC NOTEXT .
  data MV_ALT_KEY_NAME_ROOT type STRING value 'UUID-CONTENT' ##no_text . "#EC NOTEXT .
  class-data CO_QRN_BO_INDICATOR type STRING value 'QRNVIEW' ##no_text . "#EC NOTEXT .
  class-data CO_QRN_TASK_INDICATOR type STRING value 'QRNTASK' ##no_text . "#EC NOTEXT .
  class-data CO_TX_INDICATOR type STRING value 'sap.com/a1s~fin~tx' ##no_text . "#EC NOTEXT .
  constants MC_ACTION_COMPOUND_ACTION type STRING value 'COMPOUND_ACTION' ##no_text . "#EC NOTEXT
  constants MC_ACTION_CO_ONLY_ACTION type STRING value 'CO_ONLY_ACTION' ##no_text . "#EC NOTEXT
  constants MC_ACTION_DELETE_REFERENCE_BO type STRING value 'DELETE_ACTION' ##no_text . "#EC NOTEXT
  constants MC_ACTION_TASK_BO_ACTION type STRING value 'TASK_ACTION' ##no_text . "#EC NOTEXT
  constants MC_ACTION_REFERENCE_BO_ACTION type STRING value 'BO_ACTION' ##no_text . "#EC NOTEXT
  data MO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER .
  data MO_QRS_PROVIDER type ref to CL_FSI_QRS_PROVIDER .
  class CL_A1FIA_OWL_ACTION definition load .
  data MS_PROCESSING_STATUS type CL_A1FIA_OWL_ACTION=>TS_PROCESSING_STATUS .
  data MTS_BUFFER type CL_A1FIA_OWL_ACTION=>TTS_BUFFER .
  data MTS_NOTIFY_AFTER_SAVE type CL_A1FIA_OWL_ACTION=>TTS_NOTIFICATION .
  data MT_BO_NODE_QUERY_MAPPING type TT_BO_NODE_QUERY_MAPPING .
  data MV_FLOOR_PLAN_NAME type STRING .
  data MV_NON_QRN_QUERY_EXECUTED type SESF_BOOLEAN .
  data MV_OWN_PROXY_NAME type STRING .
  data MV_SUPPRESS_SAVE_MESSAGE type SESF_BOOLEAN .
  data MV_TASK_TO_REF_BO_ASSOC_PREFIX type STRING value 'TO_REF_BO' ##no_text . "#EC NOTEXT .
  data MV_WORK_CENTER_NAME type STRING .
  data MV_COMPANY_UUID_OBNVIEW2 type STRING value 'COMPANY_UUID' ##no_text . "#EC NOTEXT .
  data MV_COMPANY_UUID_OBNVIEW type STRING value 'COMPANY_UUID-CONTENT' ##no_text . "#EC NOTEXT .
  data MV_COMPANY_UUID_OBNVIEW3 type STRING value 'UUID_COMPANY-CONTENT' ##no_text . "#EC NOTEXT .
  data MV_COMPANY_UUID_OBNVIEW4 type STRING value 'UUID-COMPANY-CONTENT' ##no_text . "#EC NOTEXT .
  data MV_COMPANY_UUID_OBNVIEW5 type STRING value 'COMPANY-UUID-CONTENT' ##no_text . "#EC NOTEXT .
  data MV_RESOURCE_UUID_OBNVIEW type STRING value 'RESOURCE_UUID-CONTENT' ##no_text . "#EC NOTEXT .
  data GV_EXECUTION_FILTER_TC type MDRO_EXECUTION_FILTER_TC value 1 . "#EC NOTEXT .

  methods ENRICH_REQUESTED_ATTRIBUTES
    importing
      !IN_BO_NODE_NAME type STRING
    changing
      !CT_REQUESTED_ATTRIBUTES type SESF_STRING_TAB .
  methods ADD_BO_NODE_QUERY_MAPPING
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_QUERY_NAME type STRING .
  methods BUFFER_RETRIEVED_DATE_TIME
    importing
      !IN_BO_NODE_NAME type STRING
      !IV_RETRIEVE_TIME type GDT_GLOBAL_DATE_TIME
      !OUT_DATA type INDEX TABLE .
  methods CHECK_ACTION_ENABLED
    importing
      !IN_LCP_FACADE type ref to IF_ESF_LCP_FACADE
      !IN_BO_NAME type STRING
      !IN_BO_NODE_NAME type STRING
      !IN_LCP_BO type ref to IF_ESF_LCP
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_NAME type STRING
    returning
      value(RT_ENABLED) type SESF_BOOLEAN .
  interface IF_ESF_TYPES load .
  methods CHECK_FOR_ERRORS
    importing
      !IN_MESSAGES type IF_ESF_TYPES=>TY_MESSAGES
    returning
      value(RT_HAS_ERRORS) type SESF_BOOLEAN .
  methods DELETE_REFERENCE_BO
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods ENRICH_RETRIEVED_DATA
    importing
      !IN_CO_NODE_NAME type STRING
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
    changing
      !IN_RETRIEVED_DATA type INDEX TABLE .
  methods RETRIEVE_ROOT
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
  methods EXECUTE_ACTION_BO
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T optional
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods EXECUTE_ACTION_QRN_BO
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T optional
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods EXECUTE_COMPOUND_ACTION
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods EXECUTE_TASK_BO_ACTION
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ACTION_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods GET_ACTION_HANDLER
    returning
      value(RO_ACTION_HANDLER) type ref to CL_A1FIA_OWL_ACTION .
  methods GET_ACTION_TYPE
    importing
      !IV_CO_NODE_NAME type STRING
      !IV_ACTION_NAME type STRING
    returning
      value(RV_ACTION_TYPE) type STRING .
  methods GET_ACTION_NAMES
    importing
      !IV_CO_NODE_NAME type STRING
      !IV_COMPOUND_ACTION_NAME type STRING
    exporting
      !ET_ACTION_NAME type TT_ACTION_NAME .
  methods GET_QUERY_FOR_BO_NODE
    importing
      !IN_BO_NODE_NAME type STRING
    returning
      value(RT_QUERY_NAME) type STRING .
  methods GET_REF_BO_METADATA
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_ASSOCIATION_NAME type STRING default 'TO_REFERENCE_BONODE'
    exporting
      !EX_ECO_ERROR type CHAR1
      !EX_REF_BO_NAME type STRING
      !EX_REF_BO_NODE_NAME type STRING
      !EX_REF_BO_LCP type ref to IF_ESF_LCP .
  interface IF_TASK load .
  methods GET_TASK_TO_REF_BO_MAPPING
    importing
      !IV_CO_NODE_NAME type STRING optional
      !IV_ASSOCIATION_NAME type STRING optional
      !IT_TASK_ROOT_NODE_IDS type SESF_BO_NODE_ID_TAB
    exporting
      !ET_TASK_TO_REF_BO_MAPPING type TT_REF_BO_MAPPING
      !ET_REF_BO_NODE_DATA type IF_TASK=>TT_BUSINESS_OBJ_REFERENCE .
  methods HANDLE_EXCEPTION
    importing
      !IX_EXCEPTION type ref to CX_ROOT .
  methods HANDLE_FSI_EXCEPTION
    importing
      !IO_FSI_QUERY type ref to CM_FSI_QUERY
      !IV_BO_NAME type STRING
      !IV_BO_NODE_NAME type STRING .
  methods IMPLEMENT_EXECUTE_ACTION
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_BO_ACTION_NAME type STRING
      !IN_BO_ACTION_PARAMETERS type ANY
      !IN_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T
      !IN_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IO_LCP_BO type ref to IF_ESF_LCP
      !IV_ECO_NODE_NAME type STRING
      !IT_LINK_ECO_TO_BO type SESF_ASSOCIATION_LINK_TAB
      !IV_TASK_ACTION type SESF_BOOLEAN default ABAP_FALSE
    exporting
      !EV_CHANGE_MODE type IF_ESF_TYPES=>TY_CHANGE_MODE
    changing
      !CT_ECO_NODE_ID type SESF_BO_NODE_ID_TAB
      !CTS_FAILED_NODE type CL_A1FIA_OWL_ACTION=>TTS_FAILED_NODE .
  interface IF_ESF_PROVIDER_QUERY load .
  methods QUERY_QRN_BO
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_QUERY_NAME type STRING
      !IN_SELECTION_PARAMETERS type IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS optional
      !IN_QUERY_OPTIONS type IF_ESF_PROVIDER_QUERY=>TY_QUERY_OPTIONS
      !IN_AUTHORIZATION_CONTEXT type IF_ESF_PROVIDER_QUERY=>TY_AUTHORIZATION_CONTEXT optional
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_FILL_DATA type SESF_BOOLEAN default SPACE
      !IN_FILTER_NODE_IDS type SESF_BO_NODE_ID_TAB optional
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
    exporting
      !OUT_NODE_IDS type SESF_BO_NODE_ID_TAB
      !OUT_DATA type INDEX TABLE
      !OUT_QUERY_INFO type IF_ESF_PROVIDER_QUERY=>TY_QUERY_INFO .
  methods QUERY_QRN_TASK
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_QUERY_NAME type STRING
      !IN_SELECTION_PARAMETERS type IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS optional
      !IN_QUERY_OPTIONS type IF_ESF_PROVIDER_QUERY=>TY_QUERY_OPTIONS
      !IN_AUTHORIZATION_CONTEXT type IF_ESF_PROVIDER_QUERY=>TY_AUTHORIZATION_CONTEXT optional
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_FILL_DATA type SESF_BOOLEAN default SPACE
      !IN_FILTER_NODE_IDS type SESF_BO_NODE_ID_TAB optional
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
    exporting
      !OUT_NODE_IDS type SESF_BO_NODE_ID_TAB
      !OUT_DATA type INDEX TABLE
      !OUT_QUERY_INFO type IF_ESF_PROVIDER_QUERY=>TY_QUERY_INFO .
  methods RBA_TARGET_EQUALS_SOURCE
    importing
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB .
  methods RETRIEVE_QRN_BO
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
      !IN_EDIT_MODE type IF_ESF_TYPES=>TY_EDIT_MODE
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_BUFFER_SYNC_HANDLER type ref to IF_ESF_BUFFER_SYNC_HANDLER optional
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
    exporting
      !OUT_DATA type INDEX TABLE
      !OUT_FAILED_NODE_IDS type SESF_BO_NODE_ID_TAB .
  methods RETRIEVE_QRN_TASK
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
      !IN_EDIT_MODE type IF_ESF_TYPES=>TY_EDIT_MODE
      !IN_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IN_BUFFER_SYNC_HANDLER type ref to IF_ESF_BUFFER_SYNC_HANDLER optional
      !IN_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
    exporting
      !OUT_DATA type INDEX TABLE
      !OUT_FAILED_NODE_IDS type SESF_BO_NODE_ID_TAB .

  methods FILL_AUTHORIZATION_CONTEXT
    redefinition .
  methods GET_ASSOC_BO_NODE_NAME
    redefinition .
private section.

  constants MC_DELETE_REFERENCE_BO type STRING value 'DELETE_REFERENCE_BO' ##no_text . "#EC NOTEXT
  constants MC_TASK_ACTION_INDICATOR type STRING value 'TASK_' ##no_text . "#EC NOTEXT
  data MO_ACTION_HANDLER type ref to CL_A1FIA_OWL_ACTION .
  data MV_REJECT_SAVE type BOOLEAN .
ENDCLASS.



CLASS CL_A1FIA_OWL2_CO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->ADD_BO_NODE_QUERY_MAPPING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD ADD_BO_NODE_QUERY_MAPPING.

    DATA: ls_bo_node_query_mapping LIKE LINE OF mt_bo_node_query_mapping.
    FIELD-SYMBOLS: <ls_bo_node_query_mapping> LIKE LINE OF mt_bo_node_query_mapping.

    READ TABLE mt_bo_node_query_mapping WITH KEY node_name = in_bo_node_name
    BINARY SEARCH ASSIGNING <ls_bo_node_query_mapping>.
    IF sy-subrc EQ 0.
      <ls_bo_node_query_mapping>-query_name = in_query_name.
    ELSE.
      ls_bo_node_query_mapping-node_name = in_bo_node_name.
      ls_bo_node_query_mapping-query_name = in_query_name.
      INSERT ls_bo_node_query_mapping INTO mt_bo_node_query_mapping INDEX sy-tabix.
    ENDIF.

  ENDMETHOD.                    "ADD_BO_NODE_QUERY_MAPPING


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->BUFFER_RETRIEVED_DATE_TIME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_RETRIEVE_TIME               TYPE        GDT_GLOBAL_DATE_TIME
* | [--->] OUT_DATA                       TYPE        INDEX TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD BUFFER_RETRIEVED_DATE_TIME.

    DATA:
      ls_buffer     LIKE LINE OF mts_buffer.
    FIELD-SYMBOLS:
      <ls_out_data> TYPE any,
      <lv_node_id>  TYPE sesf_bo_node_id,
      <ls_buffer>   LIKE LINE OF mts_buffer.

* update retrieve_buffer
    LOOP AT out_data ASSIGNING <ls_out_data>.

      ASSIGN COMPONENT 'NODE_ID' OF STRUCTURE <ls_out_data> TO <lv_node_id>.

      READ TABLE mts_buffer
           WITH TABLE KEY node_name = in_bo_node_name
                          node_id   = <lv_node_id>
           ASSIGNING <ls_buffer>.

      IF sy-subrc = 0.
*     update retrieve time
        <ls_buffer>-retrieve_time = iv_retrieve_time.

      ELSE.
        ls_buffer-node_name     = in_bo_node_name.
        ls_buffer-node_id       = <lv_node_id>.
*     insert retrieve time
        ls_buffer-retrieve_time = iv_retrieve_time.

        INSERT ls_buffer INTO TABLE mts_buffer.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.                    "BUFFER_RETRIEVED_DATE_TIME


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->CHECK_ACTION_ENABLED
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_LCP_FACADE                  TYPE REF TO IF_ESF_LCP_FACADE
* | [--->] IN_BO_NAME                     TYPE        STRING
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_LCP_BO                      TYPE REF TO IF_ESF_LCP
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [<-()] RT_ENABLED                     TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD CHECK_ACTION_ENABLED.

    DATA:  lx_root TYPE REF TO cx_root,
           lo_bo_descriptor TYPE REF TO if_esf_bo_desc,
           lo_node_descriptor TYPE REF TO if_esf_bo_node_desc,
           lo_action_descriptor TYPE REF TO if_esf_action_desc,
             ls_property_scope TYPE if_esf_types=>ty_property_scope,
             lt_actions TYPE sesf_string_tab,
             lt_out_properties TYPE if_esf_types=>ty_properties.

    FIELD-SYMBOLS: <node_id>  LIKE LINE OF in_node_ids,
                   <out_properties> TYPE LINE OF if_esf_types=>tt_action_properties.

    TRY.

        APPEND in_action_name TO lt_actions.
        ls_property_scope-requested_actions = lt_actions.

        CALL METHOD in_lcp_bo->retrieve_properties
          EXPORTING
            in_bo_node_name   = in_bo_node_name
            in_node_ids       = in_node_ids
            in_property_scope = ls_property_scope
          IMPORTING
            out_properties    = lt_out_properties.

        LOOP AT in_node_ids ASSIGNING <node_id>.

          READ TABLE lt_out_properties-action_properties WITH KEY
          node_id          = <node_id>
          action_name      = in_action_name
          property_name    = if_esf_desc=>co_property_enabled
          ASSIGNING <out_properties>.

          IF sy-subrc EQ 0.
            IF <out_properties>-property_value IS INITIAL.
              rt_enabled = abap_false.
            ELSE.
              rt_enabled = abap_true.
            ENDIF.
          ELSE. "read attribute from static BO meta data
            lo_bo_descriptor = in_lcp_facade->get_bo_descriptor( in_bo_proxy_name = in_bo_name ).
            lo_node_descriptor = lo_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = in_bo_node_name ).
            lo_action_descriptor = lo_node_descriptor->get_action_descriptor( action_proxy_name = in_action_name ).
            rt_enabled = lo_action_descriptor->if_esf_desc~get_property_value( if_esf_desc=>co_property_enabled ).
          ENDIF.

          IF rt_enabled EQ abap_false.
            EXIT. " if inactive for one node id action is inactive for all node ids
          ENDIF.

        ENDLOOP.

      CATCH cx_root INTO lx_root.                        "#EC CATCH_ALL
        handle_exception( lx_root ).
    ENDTRY.

  ENDMETHOD.                    "CHECK_ACTION_ENABLED


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->CHECK_FOR_ERRORS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_MESSAGES                    TYPE        IF_ESF_TYPES=>TY_MESSAGES
* | [<-()] RT_HAS_ERRORS                  TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD CHECK_FOR_ERRORS.

    FIELD-SYMBOLS: <msg> LIKE LINE OF in_messages.

    rt_has_errors = abap_false.

    LOOP AT in_messages ASSIGNING <msg>.

      IF <msg>->severity = cm_root=>co_severity_error OR
         <msg>->severity = cm_root=>co_severity_abend.

        rt_has_errors = abap_true.
        EXIT.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.                    "CHECK_FOR_ERRORS


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->DELETE_REFERENCE_BO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD delete_reference_bo.

* Deletes the Reference BO instances
* PreCondition: CO QRN node ID = Core BO Node ID

    DATA:
      lo_lcp_core_bo            TYPE REF TO if_esf_lcp,     "#EC NEEDED

      lv_core_bo_node_name      TYPE string,
      lv_core_bo_name           TYPE string,
      lv_blank_action_name      TYPE string,
      lv_change_mode            TYPE if_esf_types=>ty_change_mode,
      lt_eco_node_id            TYPE sesf_bo_node_id_tab,
      lt_link_eco_to_core       TYPE sesf_association_link_tab,
      lts_failed_node           TYPE cl_a1fia_owl_action=>tts_failed_node,
      lv_eco_error              TYPE c.

    FIELD-SYMBOLS:
      <ls_link>                 TYPE sesf_association_link.

*   get target of association TO_REFERENCE_BONODE
    CALL METHOD get_ref_bo_metadata
      EXPORTING
        in_bo_node_name     = in_bo_node_name
      IMPORTING
        ex_ref_bo_name      = lv_core_bo_name
        ex_ref_bo_node_name = lv_core_bo_node_name
        ex_ref_bo_lcp       = lo_lcp_core_bo
        ex_eco_error        = lv_eco_error.
    IF lv_eco_error IS NOT INITIAL.
      ASSERT ID a1fia_eco_error CONDITION 1 = 0.
      RETURN."Avoid a dump
    ENDIF.

* copy ECO node IDs to work on the list of node IDs
    lt_eco_node_id = in_node_ids.

* create link table from ECO to core BO (same node ID)
    rba_target_equals_source(
      EXPORTING
        in_node_ids = lt_eco_node_id
      IMPORTING
        out_links   = lt_link_eco_to_core ).

*---------------------------------------------------------------------*
*   Check core BO:
*     1. Locks the Core BO instance (exclusive lock)
*     2. Checks if the BO data has changed after it was retrieved
*     3. Checks if the BO instance was deleted in the mean time (after it was retrieved)
*---------------------------------------------------------------------*
    mo_action_handler->check_before_action(
      EXPORTING
        iv_eco_node_name    = in_bo_node_name
        iv_eco_action_name  = in_action_name
        iv_special_action   = cl_a1fia_owl_action=>cv_special_action_bo_delete
        it_link_eco_to_bo   = lt_link_eco_to_core
        io_lcp_facade       = mo_lcp_facade
        io_lcp_bo           = lo_lcp_core_bo
        iv_bo_name          = lv_core_bo_name
        iv_bo_node_name     = lv_core_bo_node_name
        iv_bo_action_name   = lv_blank_action_name
        its_retrieve_buffer = mts_buffer
      CHANGING
        cts_failed_node     = lts_failed_node
        ct_eco_node_id      = lt_eco_node_id ).

*   remove links for deleted ECO node IDs
    IF lines( lt_eco_node_id ) < lines( in_node_ids ).
*     sort for binary search
      SORT lt_eco_node_id.
      LOOP AT lt_link_eco_to_core ASSIGNING <ls_link>.
        READ TABLE lt_eco_node_id
             WITH KEY table_line = <ls_link>-source_node_id
             TRANSPORTING NO FIELDS
             BINARY SEARCH.
        IF sy-subrc <> 0.
          DELETE lt_link_eco_to_core.
        ENDIF.
      ENDLOOP.
    ENDIF.

*---------------------------------------------------------------------*
* Delete Core BO
*---------------------------------------------------------------------*
    IF lt_eco_node_id IS NOT INITIAL.

      mo_action_handler->execute_action_delete_core_bo(
        EXPORTING
          in_bo_node_name              = lv_core_bo_node_name
          io_lcp_bo                    = lo_lcp_core_bo
          iv_eco_node_name             = in_bo_node_name
          it_link_eco_to_bo            = lt_link_eco_to_core
        CHANGING
          ct_eco_node_id               = lt_eco_node_id
          cts_failed_node              = lts_failed_node ).
* Needed for Notifications
      lv_change_mode = if_esf_types=>co_change_mode_delete.

    ENDIF.

*---------------------------------------------------------------------*
* error handling
*---------------------------------------------------------------------*
    mo_action_handler->handle_errors_of_action(
      iv_eco_name          = mv_bo_name
      iv_eco_node_name     = in_bo_node_name
      it_eco_node_id       = in_node_ids
      its_failed_node      = lts_failed_node
      in_message_handler    = in_message_handler
      io_message_manager   = mo_message_manager ).

*---------------------------------------------------------------------*
* Post processing
*---------------------------------------------------------------------*
* determine notifications
    mo_action_handler->get_notifications(
      EXPORTING
        iv_change_mode       = lv_change_mode
        iv_eco_node_name     = in_bo_node_name
        it_processed_node_id = lt_eco_node_id
        its_failed_node      = lts_failed_node
      CHANGING
        cts_notification     = mts_notify_after_save ).

* send notifications
* - in after save
*   sending change notification before the save does not make sense for QRNs

* set processing status
* support multiple changes in several Action or Modify calls => statefull transaction
    IF NOT in_node_ids IS INITIAL.

      ms_processing_status-number_of_steps            =   ms_processing_status-number_of_steps
                                                        + lines( in_node_ids ).
      ms_processing_status-number_of_successful_steps =   ms_processing_status-number_of_successful_steps
                                                        + lines( lt_eco_node_id ).
    ENDIF.

  ENDMETHOD.                    "delete_reference_bo


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->DERIVE_ACCESS_CONTEXT_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_WORK_CENTER_NAME            TYPE        STRING
* | [<---] EV_ACCESS_CONTEXT_CODE         TYPE        RBAM_ACCESS_CTX_CODE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD derive_access_context_code.

    CLEAR ev_access_context_code.

   "Rainer Soltek: Not needed anymore

* WoC Name comes like local.pct.a1s.cashliquidity


*---------------------------------------------------------------------*
* Check if the WoC name Contaisn pattern (e.g., *pct.a1s.cashliquidity*)
*  - excluding the prefix string 'local.' in the WoC Name
*  - Assumption: DWoC names start with the Parent WoC Name as prefix
*                for example (local.pct.a1s.cashliquidity_files)
* and return the corresponding access context code
*---------------------------------------------------------------------*

*    IF     iv_work_center_name CP if_a1fia_access_context=>co_clm_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_clm_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_fa_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_fa_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_gl_woc_name_pattern
** Auditor WoC has same access context code as GL (19)
*      OR   iv_work_center_name CP if_a1fia_access_context=>co_au_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_gl_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_inv_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_inv_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_ap_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_ap_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_pm_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_pm_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_ar_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_ar_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_cm_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_cm_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_tx_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_tx_access_context.
*
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_erm_woc_name_pattern.
*      ev_access_context_code = if_a1fia_access_context=>co_erm_access_context.
*
** TODO: check if any FIN OWLs (e.g., ERM) are used in Control Center,
*    ELSEIF iv_work_center_name CP if_a1fia_access_context=>co_home_woc_name_pattern.
** Return blank access Context code, hard coded access context in individual OWL COs
** should be consisdered to show the correct count in control Center
*
*    ENDIF.

  ENDMETHOD.                    "DERIVE_ACCESS_CONTEXT_CODE


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->ENRICH_REQUESTED_ATTRIBUTES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [<-->] CT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ENRICH_REQUESTED_ATTRIBUTES."#EC NEEDED

* Redefine, if the OWL needs additional attributes which are not
* shown in OWL but are used in Enrich_retrieved_data

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->ENRICH_RETRIEVED_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CO_NODE_NAME                TYPE        STRING
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<-->] IN_RETRIEVED_DATA              TYPE        INDEX TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD ENRICH_RETRIEVED_DATA.                             "#EC NEEDED

* This method shall be redefined, if the data
* from retrieve / Query method has to be modified

*  in_co_node_name contains node name for which the Retrieve was called
*  If the Query was called with in_fill_data = true,
*  in_co_node_name would be same as the node name on which the query was modeled

  ENDMETHOD.                    "ENRICH_RETRIEVED_DATA


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->EXECUTE_ACTION_BO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T(optional)
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD EXECUTE_ACTION_BO.

    DATA: lo_lcp_core_bo            TYPE REF TO if_esf_lcp,
          lt_messages               TYPE if_esf_lcp=>ty_message_list,
          lv_action_enabled         TYPE sesf_boolean,
          ls_change_notifications   TYPE if_esf_types=>ty_change_notifications, "#EC NEEDED
          lo_msg                    TYPE REF TO cm_esi_t100_adapter,
          ls_orig_loc               TYPE cm_esi_root=>ty_message_location,
          ls_msg                    TYPE symsg,
          lv_msg                    TYPE string,            "#EC NEEDED
          lx_root                     TYPE REF TO cx_root,
          lrt_core_bo_out_data      TYPE REF TO  data,
          lv_core_bo_node_name      TYPE string,
          lv_core_bo_name           TYPE string.

    FIELD-SYMBOLS:
                   <lt_core_bo_node_data> TYPE INDEX TABLE.

    TRY.

        CALL METHOD get_ref_bo_metadata
          EXPORTING
            in_bo_node_name     = in_bo_node_name
            in_association_name = gv_assoc_to_core_bo_node
          IMPORTING
            ex_ref_bo_name      = lv_core_bo_name
            ex_ref_bo_node_name = lv_core_bo_node_name
            ex_ref_bo_lcp       = lo_lcp_core_bo.

        TRY.
            lrt_core_bo_out_data = mo_lcp_facade->get_bo_node_table_container(
                     in_bo_name = lv_core_bo_name
                     in_bo_node_name = lv_core_bo_node_name ).
            ASSIGN lrt_core_bo_out_data->* TO <lt_core_bo_node_data>.
          CATCH cx_esf_core_service INTO lx_root.
            handle_exception( lx_root ).
        ENDTRY.

* lock data

        CALL METHOD lo_lcp_core_bo->retrieve
          EXPORTING
            in_bo_node_name     = lv_core_bo_node_name
            in_node_ids         = in_node_ids
            in_edit_mode        = if_esf_types=>co_edit_exclusive
          IMPORTING
*           out_failed_node_ids = lt_out_failed_node_ids
            out_data            = <lt_core_bo_node_data>
            out_messages        = lt_messages.

        CALL METHOD mo_message_manager->add_messages
          EXPORTING
            it_messages = lt_messages.

        IF check_for_errors( lt_messages ) = abap_true.
          mv_suppress_save_message = abap_true.
        ELSE. "no errors continue

          CALL METHOD check_action_enabled
            EXPORTING
              in_lcp_facade   = mo_lcp_facade
              in_bo_name      = lv_core_bo_name
              in_bo_node_name = lv_core_bo_node_name
              in_lcp_bo       = lo_lcp_core_bo
              in_node_ids     = in_node_ids
              in_action_name  = in_action_name
            RECEIVING
              rt_enabled      = lv_action_enabled.

          IF lv_action_enabled EQ abap_false.

            mv_suppress_save_message = abap_true.

            IF 1 = 0.
              MESSAGE e101(a1fia_accounting) INTO lv_msg.
              MESSAGE e102(a1fia_accounting) INTO lv_msg.
            ENDIF.

            ls_msg-msgid = 'A1FIA_ACCOUNTING'.
            ls_msg-msgty = 'E'. "E to stop save

            DESCRIBE TABLE in_node_ids LINES sy-tfill.

            IF sy-tfill GT 1.
              ls_msg-msgno = '102'.
            ELSE.
              ls_msg-msgno = '101'.
            ENDIF.

            ls_orig_loc-bo_name = lv_core_bo_name.

            lo_msg = cm_esi_t100_adapter=>create(
                  symptom               = ''
                  lifetime              = cm_esi_root=>co_lifetime_transition
                  origin_location       = ls_orig_loc
                  symsg                 = ls_msg
                ).

            mo_message_manager->add_message( lo_msg ).

          ELSE.

            CALL METHOD lo_lcp_core_bo->execute_action
              EXPORTING
                in_bo_node_name          = lv_core_bo_node_name
                in_action_name           = in_action_name
                in_node_ids              = in_node_ids
                in_action_parameters     = in_action_parameters
              IMPORTING
                out_change_notifications = ls_change_notifications
                out_messages             = lt_messages.

            CALL METHOD mo_message_manager->add_messages
              EXPORTING
                it_messages = lt_messages.

            IF check_for_errors( lt_messages ) = abap_true.
              mv_suppress_save_message = abap_true.
            ENDIF.

          ENDIF. "action enabled

        ENDIF. "check for errors during retrieve

      CATCH cx_esf_core_service INTO lx_root.
        handle_exception( lx_root ).
    ENDTRY.

  ENDMETHOD.                    "execute_action_bo


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->EXECUTE_ACTION_QRN_BO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T(optional)
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD execute_action_qrn_bo.

    DATA:
      lo_lcp_core_bo       TYPE REF TO if_esf_lcp,          "#EC NEEDED
      lv_core_bo_node_name TYPE string,
      lv_core_bo_name      TYPE string,

      lv_special_action    TYPE cl_a1fia_owl_action=>tv_special_action VALUE cl_a1fia_owl_action=>cv_normal_action,
      lv_change_mode       TYPE if_esf_types=>ty_change_mode,
      lt_eco_node_id       TYPE sesf_bo_node_id_tab,
      lt_link_eco_to_core  TYPE sesf_association_link_tab,
      lts_failed_node      TYPE cl_a1fia_owl_action=>tts_failed_node.

    FIELD-SYMBOLS:
      <ls_link>            TYPE sesf_association_link.

*   get target of association BO_REFERENCE_BONODE
    CALL METHOD get_ref_bo_metadata
      EXPORTING
        in_bo_node_name     = in_bo_node_name
      IMPORTING
        ex_ref_bo_name      = lv_core_bo_name
        ex_ref_bo_node_name = lv_core_bo_node_name
        ex_ref_bo_lcp       = lo_lcp_core_bo.

* copy ECO node IDs to work on the list of node IDs
    lt_eco_node_id = in_node_ids.

* create link table from ECO to core BO (same node ID)
    rba_target_equals_source(
      EXPORTING
        in_node_ids = lt_eco_node_id
      IMPORTING
        out_links   = lt_link_eco_to_core ).

*---------------------------------------------------------------------*
*   Check core BO:
*     1. Locks the Core BO instance (exclusive lock)
*     2. Checks if the BO data has changed after it was retrieved
*     3. Checks if the BO instance was deleted in the mean time (after it was retrieved)
*     4. Checks if action is enabled or not(Retrieve_Properties)
*---------------------------------------------------------------------*
    IF get_action_type( iv_co_node_name = in_bo_node_name
                        iv_action_name  = in_action_name ) = mc_action_co_only_action.
* Must be set to exclude check 4 above.
      lv_special_action = cl_a1fia_owl_action=>cv_special_action_eco_action.
    ENDIF.

    mo_action_handler->check_before_action(
      EXPORTING
        iv_eco_node_name    = in_bo_node_name
        iv_eco_action_name  = in_action_name
        iv_special_action   = lv_special_action
        it_link_eco_to_bo   = lt_link_eco_to_core
        io_lcp_facade       = mo_lcp_facade
        io_lcp_bo           = lo_lcp_core_bo
        iv_bo_name          = lv_core_bo_name
        iv_bo_node_name     = lv_core_bo_node_name
        iv_bo_action_name   = in_action_name "Core BO action name same as CO action
        its_retrieve_buffer = mts_buffer
      CHANGING
        cts_failed_node     = lts_failed_node
        ct_eco_node_id      = lt_eco_node_id ).

*   remove links for deleted ECO node IDs
    IF lines( lt_eco_node_id ) < lines( in_node_ids ).
*     sort for binary search
      SORT lt_eco_node_id.
      LOOP AT lt_link_eco_to_core ASSIGNING <ls_link>.
        READ TABLE lt_eco_node_id
             WITH KEY table_line = <ls_link>-source_node_id
             TRANSPORTING NO FIELDS
             BINARY SEARCH.
        IF sy-subrc <> 0.
          DELETE lt_link_eco_to_core.
        ENDIF.
      ENDLOOP.
    ENDIF.

*---------------------------------------------------------------------*
* Execute action
*---------------------------------------------------------------------*
    IF lt_eco_node_id IS NOT INITIAL.
      CALL METHOD implement_execute_action
        EXPORTING
          in_bo_node_name              = lv_core_bo_node_name
          in_bo_action_name            = in_action_name "Core BO action name same as CO action
          in_bo_action_parameters      = in_action_parameters
          in_referencing_node_elements = in_referencing_node_elements
          in_change_handler            = in_change_handler
          in_message_handler           = in_message_handler
          io_lcp_bo                    = lo_lcp_core_bo
          iv_eco_node_name             = in_bo_node_name
          it_link_eco_to_bo            = lt_link_eco_to_core
        IMPORTING
          ev_change_mode               = lv_change_mode
        CHANGING
          ct_eco_node_id               = lt_eco_node_id
          cts_failed_node              = lts_failed_node.
    ENDIF.

*---------------------------------------------------------------------*
* error handling
*---------------------------------------------------------------------*
    mo_action_handler->handle_errors_of_action(
      iv_eco_name          = mv_bo_name
      iv_eco_node_name     = in_bo_node_name
      iv_eco_action_name   = in_action_name
      it_eco_node_id       = in_node_ids
      its_failed_node      = lts_failed_node
* if in_message_handler is passed the error message will be raised on execute_action
* itself, which means the UI runtime will not call subsequent SAVE
*  -> multi-select action execution, save will not happen in case there is error
*     for alteast one of the selected row
*      in_message_handler   = in_message_handler
      io_message_manager   = mo_message_manager ).

*---------------------------------------------------------------------*
* Post processing
*---------------------------------------------------------------------*
* determine notifications
    mo_action_handler->get_notifications(
      EXPORTING
        iv_change_mode       = lv_change_mode
        iv_eco_node_name     = in_bo_node_name
        it_processed_node_id = lt_eco_node_id
        its_failed_node      = lts_failed_node
      CHANGING
        cts_notification     = mts_notify_after_save ).




* send notifications
* - in after save
*   sending change notification before the save does not make sense for QRNs

* set processing status
* support multiple changes in several Action or Modify calls => statefull transaction
    IF NOT in_node_ids IS INITIAL.

*   set action name
*   Needed for displaying ESR UI text of the Action in the Messages.
      IF ms_processing_status-eco_name IS INITIAL.
        ms_processing_status-eco_name        = mv_own_proxy_name.
        ms_processing_status-eco_node_name   = in_bo_node_name.
        ms_processing_status-eco_action_name = in_action_name.
      ELSEIF    ms_processing_status-eco_node_name   <> in_bo_node_name
             OR ms_processing_status-eco_action_name <> in_action_name.
*     different action was executed before
        ms_processing_status-eco_action_name = cl_a1fia_owl_action=>cv_multi_actions.
      ENDIF.

      ms_processing_status-number_of_steps            =   ms_processing_status-number_of_steps
                                                        + lines( in_node_ids ).
      ms_processing_status-number_of_successful_steps =   ms_processing_status-number_of_successful_steps
                                                        + lines( lt_eco_node_id ).
    ENDIF.

  ENDMETHOD.                    "execute_action_qrn_bo


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->EXECUTE_COMPOUND_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD execute_compound_action.

  DATA:
    lo_lcp_core_bo       TYPE REF TO if_esf_lcp,            "#EC NEEDED
    lv_core_bo_node_name TYPE string,
    lv_core_bo_name      TYPE string,

    lv_special_action    TYPE cl_a1fia_owl_action=>tv_special_action VALUE cl_a1fia_owl_action=>cv_normal_action,
    lv_change_mode       TYPE if_esf_types=>ty_change_mode,
    lt_eco_node_id       TYPE sesf_bo_node_id_tab,
    lt_link_eco_to_core  TYPE sesf_association_link_tab,
    lts_failed_node      TYPE cl_a1fia_owl_action=>tts_failed_node,

    lt_action_name       TYPE tt_action_name,
    ls_action_name       LIKE LINE OF lt_action_name,
    lv_action_type       TYPE string,

    lv_first_action_success_count TYPE i,
    lv_action_counter    TYPE i.

  CONSTANTS:
    lc_first_action      TYPE i VALUE 1.

  FIELD-SYMBOLS:
    <ls_link>            TYPE sesf_association_link.

* Get target of association BO_REFERENCE_BONODE
  CALL METHOD get_ref_bo_metadata
    EXPORTING
      in_bo_node_name     = in_bo_node_name
    IMPORTING
      ex_ref_bo_name      = lv_core_bo_name
      ex_ref_bo_node_name = lv_core_bo_node_name
      ex_ref_bo_lcp       = lo_lcp_core_bo.

* Copy ECO node IDs to work on the list of node IDs
  lt_eco_node_id = in_node_ids.

* Create link table from ECO to core BO (same node ID)
  rba_target_equals_source(
    EXPORTING
      in_node_ids = lt_eco_node_id
    IMPORTING
      out_links   = lt_link_eco_to_core ).

  get_action_names(
    EXPORTING
      iv_co_node_name         =  in_bo_node_name  " Node Name, on which the action is modeled in the CO
      iv_compound_action_name =  in_action_name   " Compound Action name
    IMPORTING
      et_action_name          =  lt_action_name   " Action Names to be executed for the compound action
  ).

* Assumption: lt_action_name contains Actions in the correct
* sequence in which they have to executed

* Say the Compound Action calls two actions, 'Action1' and then 'Action2' for 6 records
*   'Action1' was successful for 6 records and 'Action2' was successful for only 4 records
*   We need to reject save, since the 'Action1' changes in the BO buffer cannot be rolledback!

  LOOP AT lt_action_name INTO ls_action_name.
    ADD 1 TO lv_action_counter.
    lv_action_type = get_action_type(
                       iv_co_node_name = in_bo_node_name
                       iv_action_name  = ls_action_name ).

    IF   lv_action_type = mc_action_co_only_action
     OR  lv_action_type = mc_action_delete_reference_bo.
* Must be set to exclude check 4 below.
      lv_special_action = cl_a1fia_owl_action=>cv_special_action_eco_action.
      CLEAR ls_action_name.
    ELSE.
      CLEAR lv_special_action.
    ENDIF.

*---------------------------------------------------------------------*
*   Check core BO:
*     1. Locks the Core BO instance (exclusive lock)
*     2. Checks if the BO data has changed after it was retrieved
*     3. Checks if the BO instance was deleted in the mean time (after it was retrieved)
*     4. Checks if action is enabled or not(Retrieve_Properties)
*---------------------------------------------------------------------*
    mo_action_handler->check_before_action(
      EXPORTING
        iv_eco_node_name    = in_bo_node_name
        iv_eco_action_name  = ls_action_name
        iv_special_action   = lv_special_action
        it_link_eco_to_bo   = lt_link_eco_to_core
        io_lcp_facade       = mo_lcp_facade
        io_lcp_bo           = lo_lcp_core_bo
        iv_bo_name          = lv_core_bo_name
        iv_bo_node_name     = lv_core_bo_node_name
        iv_bo_action_name   = ls_action_name "Core BO action name same as CO action
        its_retrieve_buffer = mts_buffer
      CHANGING
        cts_failed_node     = lts_failed_node
        ct_eco_node_id      = lt_eco_node_id ).

*     remove links for deleted ECO node IDs
    IF lines( lt_eco_node_id ) < lines( in_node_ids ).
*       sort for binary search
      SORT lt_eco_node_id.
      LOOP AT lt_link_eco_to_core ASSIGNING <ls_link>.
        READ TABLE lt_eco_node_id
             WITH KEY table_line = <ls_link>-source_node_id
             TRANSPORTING NO FIELDS
             BINARY SEARCH.
        IF sy-subrc <> 0.
          DELETE lt_link_eco_to_core.
        ENDIF.
      ENDLOOP.
    ENDIF.

*---------------------------------------------------------------------*
* Execute action
*---------------------------------------------------------------------*
    IF lt_eco_node_id IS NOT INITIAL.

      IF lv_action_type = mc_action_delete_reference_bo.
* Delete Action
        mo_action_handler->execute_action_delete_core_bo(
         EXPORTING
           in_bo_node_name              = lv_core_bo_node_name
           io_lcp_bo                    = lo_lcp_core_bo
           iv_eco_node_name             = in_bo_node_name
           it_link_eco_to_bo            = lt_link_eco_to_core
         CHANGING
           ct_eco_node_id               = lt_eco_node_id
           cts_failed_node              = lts_failed_node ).
* Needed for Notifications
        lv_change_mode = if_esf_types=>co_change_mode_delete.

      ELSE.
        CALL METHOD implement_execute_action
          EXPORTING
            in_bo_node_name              = lv_core_bo_node_name
            in_bo_action_name            = ls_action_name "Core BO action name same as CO action
            in_bo_action_parameters      = in_action_parameters
            in_referencing_node_elements = in_referencing_node_elements
            in_change_handler            = in_change_handler
            in_message_handler           = in_message_handler
            io_lcp_bo                    = lo_lcp_core_bo
            iv_eco_node_name             = in_bo_node_name
            it_link_eco_to_bo            = lt_link_eco_to_core
          IMPORTING
            ev_change_mode               = lv_change_mode
          CHANGING
            ct_eco_node_id               = lt_eco_node_id
            cts_failed_node              = lts_failed_node.
      ENDIF.
    ENDIF.

*---------------------------------------------------------------------*
* Error handling
*---------------------------------------------------------------------*
    mo_action_handler->handle_errors_of_action(
      iv_eco_name          = mv_bo_name
      iv_eco_node_name     = in_bo_node_name
      iv_eco_action_name   = in_action_name "Send the Compound Action name
      it_eco_node_id       = in_node_ids
      its_failed_node      = lts_failed_node
* if in_message_handler is passed the error message will be raised on execute_action
* itself, which means the UI runtime will not call subsequent SAVE
*  -> multi-select action execution, save will not happen in case there is error
*     for alteast one of the selected row
*      in_message_handler   = in_message_handler
      io_message_manager   = mo_message_manager ).

*---------------------------------------------------------------------*
* Post processing
*---------------------------------------------------------------------*
* determine notifications
    mo_action_handler->get_notifications(
      EXPORTING
        iv_change_mode       = lv_change_mode
        iv_eco_node_name     = in_bo_node_name
        it_processed_node_id = lt_eco_node_id
        its_failed_node      = lts_failed_node
      CHANGING
        cts_notification     = mts_notify_after_save ).

*   Remember the count of instances, for which first action was executed ,
*   Successfully
    IF lv_action_counter     = lc_first_action.
      lv_first_action_success_count = lines( lt_eco_node_id ).
    ENDIF.

*   Check if the current action was successfully executed  for less number of records
*   compared to the first action and do a rollback
    IF lines( lt_eco_node_id ) < lv_first_action_success_count.
* If the last action was executed  or there are no more node_ids to process
      IF lv_action_counter = lines( lt_action_name )
       OR lt_eco_node_id IS INITIAL.

        mv_reject_save = abap_true.
* ms_processing_status should not be set, to suppress the message:
* "Action executed successfully for 4 of 6 selected objects"
        RETURN.
      ENDIF.
    ENDIF.

  ENDLOOP.

* send notifications
* - in after save
*   sending change notification before the save does not make sense for QRNs

* set processing status
* support multiple changes in several Action or Modify calls => statefull transaction
  IF NOT in_node_ids IS INITIAL.

*   set action name
*   Needed for displaying ESR UI text of the Action in the Messages.
    IF ms_processing_status-eco_name IS INITIAL.
      ms_processing_status-eco_name        = mv_own_proxy_name.
      ms_processing_status-eco_node_name   = in_bo_node_name.
      ms_processing_status-eco_action_name = in_action_name.
    ELSEIF    ms_processing_status-eco_node_name   <> in_bo_node_name
           OR ms_processing_status-eco_action_name <> in_action_name.
*     different action was executed before
      ms_processing_status-eco_action_name = cl_a1fia_owl_action=>cv_multi_actions.
    ENDIF.

    ms_processing_status-number_of_steps            =   ms_processing_status-number_of_steps
                                                      + lines( in_node_ids ).
    ms_processing_status-number_of_successful_steps =   ms_processing_status-number_of_successful_steps
                                                      + lines( lt_eco_node_id ).
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->EXECUTE_TASK_BO_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD execute_task_bo_action.
* All action names with prefix TASK_ would be delegated to TASK BO
* e.g., TASK_COMPLETE means COMPLETE action of the TASK BO would be called.

*  Assumption: Task OWL does not have multiselect enabled

*  Checks(Locking, outdated data etc.,) on the reference Business object
*  of the task instance are performed only if action is executed for one node ID

* NOTE: Reference BO in this method means, the BO instance for which the Task BO instance was created.

    DATA:
      lo_lcp_ref_bo         TYPE REF TO if_esf_lcp,         "#EC NEEDED
      lv_ref_bo_node_name   TYPE string,
      lv_ref_bo_name        TYPE string,

      lv_task_action_name   TYPE string,
      lt_ref_bo_mapping     TYPE tt_ref_bo_mapping,
      ls_ref_bo_mapping     TYPE ty_ref_bo_mapping,
      lt_task_ref_bo_node   TYPE if_task=>tt_business_obj_reference,

**      lv_normal_action     TYPE cl_a1fia_owl_action=>tv_special_action VALUE cl_a1fia_owl_action=>cv_normal_action,
      lv_change_mode        TYPE if_esf_types=>ty_change_mode,
      lt_eco_node_id        TYPE sesf_bo_node_id_tab,
      lt_link_eco_to_task   TYPE sesf_association_link_tab,
      lt_link_eco_to_ref_bo TYPE sesf_association_link_tab,
      lts_failed_node       TYPE cl_a1fia_owl_action=>tts_failed_node,
      ls_link               TYPE sesf_association_link,
      lx_root               TYPE REF TO cx_root.

    FIELD-SYMBOLS:
      <ls_link>             TYPE sesf_association_link,
      <ls_task_ref_bo_node> TYPE if_task=>ty_business_obj_reference.


* exclude TASK_ prefix from the action name
    lv_task_action_name = substring_after( val = in_action_name sub = mc_task_action_indicator ).

* copy ECO node IDs to work on the list of node IDs
    lt_eco_node_id = in_node_ids.

* create link table(same node ID) from ECO to core BO(Task BO)
    rba_target_equals_source(
      EXPORTING
        in_node_ids = lt_eco_node_id
      IMPORTING
        out_links   = lt_link_eco_to_task ).

* Check only one Node ID is passed
    IF  lines( in_node_ids ) = 1.

      get_task_to_ref_bo_mapping(
          EXPORTING
            it_task_root_node_ids     = lt_eco_node_id
          IMPORTING
            et_task_to_ref_bo_mapping = lt_ref_bo_mapping
            et_ref_bo_node_data       = lt_task_ref_bo_node ).

* ECO node to Task Reference BO node link
      READ TABLE lt_ref_bo_mapping INTO ls_ref_bo_mapping INDEX 1.
* Nos: This can happen, if nodes got deleted recently.
*      IF sy-subrc <> 0.
*        RAISE EXCEPTION TYPE cx_fatal_exception.
*      ENDIF.
      IF sy-subrc = 0.
        ls_link-source_node_id = ls_ref_bo_mapping-task_node_id.
        ls_link-target_node_id = ls_ref_bo_mapping-core_bo_node_id.
        APPEND ls_link TO lt_link_eco_to_ref_bo.

*   Get Reference BO and BO Node Proxy Names
        READ TABLE lt_task_ref_bo_node ASSIGNING <ls_task_ref_bo_node> INDEX 1.
*  *      DATA lv_ref_bo_esr_name TYPE sesf_md_esr_name.
*  *      lv_ref_bo_esr_name-esr_name = <ls_task_ref_bo_node>-object_node_technical_referenc-object_name.
*  *      lv_ref_bo_esr_name-esr_namespace = <ls_task_ref_bo_node>-object_node_technical_referenc-object_namespace_uri-content.

        TRY .
            lv_ref_bo_name = mo_lcp_facade->get_bo_descriptor( in_bo_esr_name = <ls_task_ref_bo_node>-object_node_technical_referenc-object_name
                                                               in_bo_esr_namespace = <ls_task_ref_bo_node>-object_node_technical_referenc-object_namespace_uri-content
                                         )->get_proxy_name( ).
            lv_ref_bo_node_name  = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = lv_ref_bo_name
                                               )->get_bo_node_descriptor( bo_node_esrname = <ls_task_ref_bo_node>-object_node_technical_referenc-object_node_name
                                               )->get_proxy_name( ).

*   Get LCP for Reference BO of Task instance
            lo_lcp_ref_bo = mo_lcp_facade->get_lcp( lv_ref_bo_name ).

          CATCH cx_esf_core_service   INTO lx_root.
            handle_exception( lx_root ).
          CATCH cx_esf_metadata_error INTO lx_root.
            handle_exception( lx_root ).
        ENDTRY.

*  ---------------------------------------------------------------------*
*     Check reference BO of the Task Instance:
*       1. Locks the ref BO instance (exclusive lock)
*       2. Checks if the BO data has changed after Task instance was retrieved
*       3. Checks if the BO instance was deleted in the mean time (after it was retrieved)
*  ---------------------------------------------------------------------*

*   (action is for task but BO is not task)
*   Set iv_special_action  = cl_a1fia_owl_action=>cv_special_action_task_action
*   Reason: To force the helper class to skip the retrieve_properties check
*   for Task BO action on the Reference BO

        mo_action_handler->check_before_action(
          EXPORTING
            iv_eco_node_name    = in_bo_node_name
            iv_eco_action_name  = in_action_name
            iv_special_action   = cl_a1fia_owl_action=>cv_special_action_task_action
            it_link_eco_to_bo   = lt_link_eco_to_ref_bo
            io_lcp_facade       = mo_lcp_facade
            io_lcp_bo           = lo_lcp_ref_bo
            iv_bo_name          = lv_ref_bo_name
            iv_bo_node_name     = lv_ref_bo_node_name
            iv_bo_action_name   = lv_task_action_name "will be ignored by action handler.
            its_retrieve_buffer = mts_buffer
          CHANGING
            cts_failed_node     = lts_failed_node
            ct_eco_node_id      = lt_eco_node_id ).
      ENDIF.
*   Remove links for deleted ECO node IDs in lt_link_eco_to_task
      IF lines( lt_eco_node_id ) < lines( in_node_ids ).
*     sort for binary search
        SORT lt_eco_node_id.
        LOOP AT lt_link_eco_to_task ASSIGNING <ls_link>.
          READ TABLE lt_eco_node_id
               WITH KEY table_line = <ls_link>-source_node_id
               TRANSPORTING NO FIELDS
               BINARY SEARCH.
          IF sy-subrc <> 0.
            DELETE lt_link_eco_to_task.
          ENDIF.
        ENDLOOP.
      ENDIF.

    ENDIF.

*---------------------------------------------------------------------*
*   Check Task BO:
*     1. Locks the Task BO instance (exclusive lock)
*     2. Checks if the Task BO data has changed after it was retrieved
*     3. Checks if the Task BO instance was deleted in the mean time (after it was retrieved)
*     4. Checks if action is enabled or not(Retrieve_Properties)
*---------------------------------------------------------------------*
    IF lt_eco_node_id IS NOT INITIAL.
      mo_action_handler->check_before_action(
        EXPORTING
          iv_eco_node_name    = in_bo_node_name
          iv_eco_action_name  = in_action_name
          iv_special_action   = cl_a1fia_owl_action=>cv_normal_action
          it_link_eco_to_bo   = lt_link_eco_to_task
          io_lcp_facade       = mo_lcp_facade
          io_lcp_bo           = mo_task_lcp
          iv_bo_name          = if_task=>co_bo_name
          iv_bo_node_name     = if_task=>co_bo_node-root
          iv_bo_action_name   = lv_task_action_name
          its_retrieve_buffer = mts_buffer
        CHANGING
          cts_failed_node     = lts_failed_node
          ct_eco_node_id      = lt_eco_node_id ).

*   remove links for deleted ECO node IDs
      IF lines( lt_eco_node_id ) < lines( in_node_ids ).
*     sort for binary search
        SORT lt_eco_node_id.
        LOOP AT lt_link_eco_to_task ASSIGNING <ls_link>.
          READ TABLE lt_eco_node_id
               WITH KEY table_line = <ls_link>-source_node_id
               TRANSPORTING NO FIELDS
               BINARY SEARCH.
          IF sy-subrc <> 0.
            DELETE lt_link_eco_to_task.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDIF.

*---------------------------------------------------------------------*
* Execute action on the Task BO
*---------------------------------------------------------------------*
    IF lt_eco_node_id IS NOT INITIAL.
      CALL METHOD implement_execute_action
        EXPORTING
          in_bo_node_name              = if_task=>co_bo_node-root
          in_bo_action_name            = lv_task_action_name
          in_bo_action_parameters      = in_action_parameters
          in_referencing_node_elements = in_referencing_node_elements
          in_change_handler            = in_change_handler
          in_message_handler           = in_message_handler
          io_lcp_bo                    = mo_task_lcp
          iv_eco_node_name             = in_bo_node_name
          it_link_eco_to_bo            = lt_link_eco_to_task
          iv_task_action               = abap_true
        IMPORTING
          ev_change_mode               = lv_change_mode
        CHANGING
          ct_eco_node_id               = lt_eco_node_id
          cts_failed_node              = lts_failed_node.
    ENDIF.

    IF  lv_task_action_name = if_task=>co_action-root-complete
     OR lv_task_action_name = if_task=>co_action-root-cancel.
* Delete notifications for Complete & Canceled instances, so that they are removed from the UI.
      lv_change_mode = if_esf_provider_access=>co_change_mode_delete.
    ENDIF.

*---------------------------------------------------------------------*
* error handling
*---------------------------------------------------------------------*
    mo_action_handler->handle_errors_of_action(
      iv_eco_name          = mv_bo_name
      iv_eco_node_name     = in_bo_node_name
      iv_eco_action_name   = in_action_name
      it_eco_node_id       = in_node_ids
      its_failed_node      = lts_failed_node
* if in_message_handler is passed the error message will be raised on execute_action
* itself, which means the UI runtime will not call subsequent SAVE
*  -> multi-select action execution, save will not happen in case there is error
*     for alteast one of the selected row
*      in_message_handler   = in_message_handler
      io_message_manager   = mo_message_manager ).

*---------------------------------------------------------------------*
* Post processing
*---------------------------------------------------------------------*
* determine notifications
    mo_action_handler->get_notifications(
      EXPORTING
        iv_change_mode       = lv_change_mode
        iv_eco_node_name     = in_bo_node_name
        it_processed_node_id = lt_eco_node_id
        its_failed_node      = lts_failed_node
      CHANGING
        cts_notification     = mts_notify_after_save ).

* send notifications
* - in after save
*   sending change notification before the save does not make sense for QRNs

* set processing status
* support multiple changes in several Action or Modify calls => statefull transaction
    IF NOT in_node_ids IS INITIAL.

*   set action name
*   Needed for displaying ESR UI text of the Action in the Messages.
      IF ms_processing_status-eco_name IS INITIAL.
        ms_processing_status-eco_name        = mv_own_proxy_name.
        ms_processing_status-eco_node_name   = in_bo_node_name.
        ms_processing_status-eco_action_name = in_action_name.
      ELSEIF    ms_processing_status-eco_node_name   <> in_bo_node_name
             OR ms_processing_status-eco_action_name <> in_action_name.
*     different action was executed before
        ms_processing_status-eco_action_name = cl_a1fia_owl_action=>cv_multi_actions.
      ENDIF.

      ms_processing_status-number_of_steps            =   ms_processing_status-number_of_steps
                                                        + lines( in_node_ids ).
      ms_processing_status-number_of_successful_steps =   ms_processing_status-number_of_successful_steps
                                                        + lines( lt_eco_node_id ).
    ENDIF.

  ENDMETHOD.                    "EXECUTE_TASK_BO_ACTION


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->FILL_AUTHORIZATION_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_NODE_NAME                   TYPE        STRING
* | [--->] IV_QUERY_NAME                  TYPE        STRING
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<---] ES_AUTHORIZATION_CONTEXT       TYPE        IF_ESF_TYPES=>TY_AUTHORIZATION_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD fill_authorization_context.
    DATA:
      lv_bo_name             TYPE string,
      lv_bo_node_name        TYPE string,
*      lv_access_context_code TYPE rbam_access_ctx_code,
*      lv_operation           TYPE rbam_esf_operation_s,
*      lx_rbam_restrictions   TYPE REF TO cx_rbam_restrictions,
      lx_esf_core_service    TYPE REF TO cx_esf_core_service,
      lr_node_data           TYPE REF TO  data,
      lv_error_occured       TYPE syboolean.


    CONSTANTS: lc_new_attribute_location TYPE i VALUE 5.

    FIELD-SYMBOLS :
       <lv_node_data> TYPE any,
       <lv_temp> TYPE any.


    IF iv_node_name CS co_qrn_task_indicator.
* QRN TASK OWL

* If BO attributes are shown in the Task OWL, then the ACL of the
* reference BO should be used.

* Reuse Structure for QRNTaskView node will have only 4 attributes
*  at runtime as follows:
* NODE_ID, PARENT_NODE_ID, CONTROLLER, TASK

* If there are additional attributes in the QRNTaskView node, we
* treat this as Task OWL with reference BO attributes shown

      TRY.
          lr_node_data = mo_lcp_facade->get_bo_node_struct_container(
                              in_bo_name = mv_own_proxy_name
                              in_bo_node_name = iv_node_name ).
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      ASSIGN lr_node_data->* TO <lv_node_data>.

* Check if there are additional attributes
      ASSIGN COMPONENT lc_new_attribute_location OF STRUCTURE <lv_node_data> TO <lv_temp>.
      IF sy-subrc EQ 0.
* Reference BO attributes are shown in Task OWL, use
* ACL of the Reference BO
        CALL METHOD me->get_assoc_bo_node_name
          EXPORTING
            iv_bo_node_name     = iv_node_name
            iv_association_name = gv_assoc_to_ref_bo_node
          IMPORTING
            ev_bo_name          = lv_bo_name
            ev_bo_node_name     = lv_bo_node_name.
      ELSE.
* Use Task BO ACL
        lv_bo_name =  if_task=>co_bo_name.
        lv_bo_node_name = if_task=>co_bo_node-root.
      ENDIF.

    ELSEIF iv_node_name CS co_qrn_bo_indicator.
* QRN BO OWL (Non-Task)

* Get Core BO name and the node name for the association ToReferenceBoNode
      CALL METHOD me->get_assoc_bo_node_name
        EXPORTING
          iv_bo_node_name     = iv_node_name
          iv_association_name = gv_assoc_to_ref_bo_node
        IMPORTING
          ev_bo_name          = lv_bo_name
          ev_bo_node_name     = lv_bo_node_name.

    ELSE.

* Non QRN OWLs
* Get Core BO name and the node name for the association ToCoreBO
      CALL METHOD me->get_assoc_bo_node_name
        EXPORTING
          iv_bo_node_name     = iv_node_name
          iv_association_name = gv_assoc_to_core_bo_node
        IMPORTING
          ev_bo_name          = lv_bo_name
          ev_bo_node_name     = lv_bo_node_name.

    ENDIF.

*    CALL METHOD derive_access_context_code
*      EXPORTING
*        iv_work_center_name    = mv_work_center_name
*      IMPORTING
*        ev_access_context_code = lv_access_context_code.
*
*    IF mv_work_center_name CP if_a1fia_access_context=>co_au_woc_name_pattern.
** For Auditor WoC, only retrieve is allowed
*      lv_operation = if_rbam_esf_constants=>co_operation_pattern_retrieve.
*    ELSE.
*      lv_operation = if_rbam_esf_constants=>co_operation_pattern_save.
*    ENDIF.

*    TRY.

    cl_ap_rbam_runtime_api=>get_query_restrictions(
      EXPORTING
        iv_bo_name               = lv_bo_name
        io_message_handler       = io_message_handler
      IMPORTING
        ev_error_occurred        = lv_error_occured
        es_authorization_context = es_authorization_context
    ).

*        CALL METHOD cl_rbam_restrictions_api=>get_restrictions_esf
*          EXPORTING
*            if_bo_name            = lv_bo_name
*            if_bo_node_name       = lv_bo_node_name
*            is_operation          = lv_operation
*            if_user               = sy-uname
*            if_access_context     = lv_access_context_code
*          IMPORTING
*            ef_grant_rule_found   = es_authorization_context-grant_rule_found
*            et_grant_restrictions = es_authorization_context-grant_restrictions
*            ef_deny_rule_found    = es_authorization_context-deny_rule_found
*            et_deny_restrictions  = es_authorization_context-deny_restrictions.

    es_authorization_context-is_filled = abap_true.

* New RBAM API above does not raise cx_rbam_restrictions, hence the exeption handling below is obsolete
*--------------------------------------------------------------------*
*      CATCH cx_rbam_restrictions INTO lx_rbam_restrictions.
**no_static_check exception as workaround
**because method defined in super class can not be changed (other dev unit)
*        RAISE EXCEPTION TYPE no_check_exception
*          EXPORTING
*            previous = lx_rbam_restrictions.
*    ENDTRY.


  ENDMETHOD.                    "FILL_AUTHORIZATION_CONTEXT


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_ACTION_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RO_ACTION_HANDLER              TYPE REF TO CL_A1FIA_OWL_ACTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD get_action_handler.
* Action handler is already initialised in INIT
  ro_action_handler = mo_action_handler.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_ACTION_NAMES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_CO_NODE_NAME                TYPE        STRING
* | [--->] IV_COMPOUND_ACTION_NAME        TYPE        STRING
* | [<---] ET_ACTION_NAME                 TYPE        TT_ACTION_NAME
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD get_action_names. "#EC NEEDED
* Do not write your Code here !

* Must redefine this method to return the list of actions
* to be executed for a compound action

* Append the action Names in the SAME order, in which they
* have to be executed.

* e.g., If first 'SUBMIT_FOR_ACTIVATION' and then 'ACTIVATE' should be
* executed
*  APPEND 'SUBMIT_FOR_ACTIVATION' TO et_action_name.
*  APPEND 'ACTIVATE' TO et_action_name.

ENDMETHOD.                    "GET_ACTION_NAMES


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_ACTION_TYPE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_CO_NODE_NAME                TYPE        STRING
* | [--->] IV_ACTION_NAME                 TYPE        STRING
* | [<-()] RV_ACTION_TYPE                 TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_action_type.                                   "#EC NEEDED
* Do not write your code here!

* Must be redefined for following cases:

* 1. CO only action, which should not be delegated to the BO.
*     set rv_action_type as below and you must redifine the
*     IMPLEMENT_EXECUTE_ACTION method
*
*    rv_action_type =  cl_a1fia_owl2_co=>mc_action_co_only_action

* 2. Compound action, which should call multiple actions on the BO
*     set rv_action_type as below and you must redifine the
*     GET_ACTION_NAMES
*
*    rv_action_type =  cl_a1fia_owl2_co=>mc_action_compound_action.

    IF iv_action_name = mc_delete_reference_bo.
* Action to Delete the Core BO instance
      rv_action_type = mc_action_delete_reference_bo.
    ELSEIF iv_action_name CS mc_task_action_indicator.
* Action to be delegated to the Task BO
      rv_action_type = mc_action_task_bo_action.
    ELSE.
* Action to be delegated to the Reference BO
      rv_action_type = mc_action_reference_bo_action.
    ENDIF.

  ENDMETHOD.                    "is_co_only_action


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_ASSOC_BO_NODE_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_ASSOCIATION_NAME            TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD get_assoc_bo_node_name.


  DATA:
      ex TYPE REF TO cx_root,
      lo_this_bo_descriptor TYPE REF TO if_esf_bo_desc,
      lo_bo_node_descriptor TYPE REF TO if_esf_bo_node_desc,
      lo_association_descriptor TYPE REF TO if_esf_association_desc.

  TRY.
      lo_this_bo_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = mv_bo_name ).
      lo_bo_node_descriptor = lo_this_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = iv_bo_node_name ).
      lo_association_descriptor = lo_bo_node_descriptor->get_association_descriptor( association_proxy_name = iv_association_name ).
    CATCH cx_esf_core_service
          cx_esf_metadata_error
      INTO ex.

* This is only to fin artifical dumps during unit tests.
* If a dump or exception occurs here, the eCO does not follow
* the guidelines of for using CL_A1FIA_OWL2_CO.
* What to do: Check if the controller has unused nodes (OWLVIEW)
* or misses mandatory association.

      ASSERT ID a1fia_eco_error CONDITION 1 = 0.
      ASSERT 1 = 0.

  ENDTRY.

  CALL METHOD super->get_assoc_bo_node_name
    EXPORTING
      iv_bo_node_name     = iv_bo_node_name
      iv_association_name = iv_association_name
    IMPORTING
      ev_bo_name          = ev_bo_name
      ev_bo_node_name     = ev_bo_node_name.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_QUERY_FOR_BO_NODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [<-()] RT_QUERY_NAME                  TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_query_for_bo_node.

    DATA lt_query_descriptor TYPE if_esf_query_desc=>ty_descriptor_table.
    DATA lo_query_descriptor TYPE REF TO if_esf_query_desc.

    FIELD-SYMBOLS: <ls_bo_node_query_mapping> LIKE LINE OF mt_bo_node_query_mapping.

    READ TABLE mt_bo_node_query_mapping WITH KEY node_name = in_bo_node_name
    BINARY SEARCH ASSIGNING <ls_bo_node_query_mapping>.
    IF <ls_bo_node_query_mapping> IS ASSIGNED."nos: prevent dump in unit test tool.
      rt_query_name = <ls_bo_node_query_mapping>-query_name.
    ELSE.
* Give it one try: If there is only one Query for the BO Node --> Take this
      TRY.
          lt_query_descriptor = mo_lcp_facade->get_bo_descriptor(
            in_bo_proxy_name = mv_bo_name )->get_bo_node_descriptor(
              bo_node_proxy_name    = in_bo_node_name )->get_query_descriptors( ).
          CHECK lines( lt_query_descriptor ) = 1.
          READ TABLE lt_query_descriptor INDEX 1 INTO lo_query_descriptor.
          rt_query_name = lo_query_descriptor->get_proxy_name( ).
          IF rt_query_name IS NOT INITIAL.
            add_bo_node_query_mapping(
              EXPORTING
                in_bo_node_name = in_bo_node_name
                in_query_name   = rt_query_name
            ).
          ENDIF.
        CATCH cx_esf_core_service cx_esf_metadata_error.  " Exception for signaling ESF metadata problems
* No Dump --> Should only occur in wrong usage of tool unit test BO
* Test for failed node IDs, which is not supported...
      ENDTRY.
    ENDIF.

  ENDMETHOD.                    "GET_QUERY_FOR_BO_NODE


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_REF_BO_METADATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ASSOCIATION_NAME            TYPE        STRING (default ='TO_REFERENCE_BONODE')
* | [<---] EX_ECO_ERROR                   TYPE        CHAR1
* | [<---] EX_REF_BO_NAME                 TYPE        STRING
* | [<---] EX_REF_BO_NODE_NAME            TYPE        STRING
* | [<---] EX_REF_BO_LCP                  TYPE REF TO IF_ESF_LCP
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD GET_REF_BO_METADATA.

    DATA:
            lo_ex TYPE REF TO cx_root,
            lo_own_bo_descriptor TYPE REF TO if_esf_bo_desc,
            lo_node_descriptor TYPE REF TO if_esf_bo_node_desc,
            lo_association_descriptor TYPE REF TO if_esf_association_desc.

    TRY.
        lo_own_bo_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = mv_own_proxy_name ).
        lo_node_descriptor = lo_own_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = in_bo_node_name ).
        lo_association_descriptor = lo_node_descriptor->get_association_descriptor( association_proxy_name = in_association_name ).
        ex_ref_bo_name = lo_association_descriptor->get_target_bo_proxy_name( ).
        ex_ref_bo_node_name = lo_association_descriptor->get_target_bo_node_proxy_name( ).
        ex_ref_bo_lcp = mo_lcp_facade->get_lcp( in_bo_name = ex_ref_bo_name ).
        ex_eco_error = ''.

*      CATCH cx_esf_core_service INTO lo_ex.
*        RAISE EXCEPTION TYPE cx_fatal_exception
*          EXPORTING
*            previous = lo_ex.
*      CATCH cx_esf_metadata_error INTO lo_ex.
*        RAISE EXCEPTION TYPE cx_fatal_exception
*          EXPORTING
*            previous = lo_ex.

      CATCH cx_esf_core_service
            cx_esf_metadata_error
        INTO lo_ex.


* This is only to avoid artifical dumps during unit tests.
* If a dump or exception occurs here, the eCO does not follow
* the guidelines of for using CL_A1FIA_OWL2_CO.
* What to do: Check if the controller has unused nodes (OWLVIEW)
* or misses mandatory association.
* The logpoint shall get replaced in a later release by a fatal exception!
        assert id a1fia_eco_error CONDITION 1 = 0.
        IF cl_abap_aab_utilities=>is_active(
            id                = 'A1FIA_ECO_ERROR'
            mode_breakpoint   = 'X'
            mode_logpoint     = 'X'
            mode_assert_break = 'X'
            mode_assert_dump  = 'X'
            mode_assert_log   = 'X'
          ) is not INITIAL.
* This log point shall only be active in systems for unit testing (QAF...)
          ex_eco_error = 'X'.
          return.
        ELSE.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lo_ex.
       ENDIF.

    ENDTRY.

  ENDMETHOD.                    "GET_REF_BO_METADATA


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->GET_TASK_TO_REF_BO_MAPPING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_CO_NODE_NAME                TYPE        STRING(optional)
* | [--->] IV_ASSOCIATION_NAME            TYPE        STRING(optional)
* | [--->] IT_TASK_ROOT_NODE_IDS          TYPE        SESF_BO_NODE_ID_TAB
* | [<---] ET_TASK_TO_REF_BO_MAPPING      TYPE        TT_REF_BO_MAPPING
* | [<---] ET_REF_BO_NODE_DATA            TYPE        IF_TASK=>TT_BUSINESS_OBJ_REFERENCE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_task_to_ref_bo_mapping.

* Returns a link table of Task_bo_node_id & the core_bo_node_id for which the task was created

* If iv_co_node_name & iv_association_name are passed, then  the
* business_obj_reference node is checked whether the task really belongs
* to the BO & Node pointed by the associaion iv_association_name

    DATA:
      lt_ref_bo_node_data  TYPE if_task=>tt_business_obj_reference,
      ls_ref_bo_mapping    TYPE ty_ref_bo_mapping,
      lx_esf_core_service  TYPE REF TO cx_esf_core_service,
      lv_core_bo_name      TYPE sesf_md_esr_name,
      lv_core_bo_node_name TYPE sesf_md_esr_name,

      lx_esf_metadata_error TYPE REF TO cx_esf_metadata_error,
      lo_own_bo_descriptor  TYPE REF TO if_esf_bo_desc,
      lo_node_descriptor    TYPE REF TO if_esf_bo_node_desc,
      lo_association_descriptor TYPE REF TO if_esf_association_desc.

    FIELD-SYMBOLS:
      <ls_ref_bo_node_data>  LIKE LINE OF lt_ref_bo_node_data.

* Clear export variables
    CLEAR:
      et_task_to_ref_bo_mapping,
      et_ref_bo_node_data.

* get Reference BO Node Data
    TRY.

        CALL METHOD mo_task_lcp->retrieve_by_association
          EXPORTING
            in_bo_node_name     = if_task=>co_bo_node-root
            in_association_name = if_task=>co_assoc-root-business_obj_reference
            in_node_ids         = it_task_root_node_ids
            in_fill_data        = abap_true
          IMPORTING
*           out_links           = lt_links
            out_data            = lt_ref_bo_node_data.

      CATCH cx_esf_core_service INTO lx_esf_core_service.
        handle_exception( lx_esf_core_service ).
    ENDTRY.

    IF iv_association_name IS NOT INITIAL.
* Get ESR Name of Reference BO and Node
      TRY.
          lo_own_bo_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = mv_own_proxy_name ).
          lo_node_descriptor = lo_own_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = iv_co_node_name ).
          lo_association_descriptor = lo_node_descriptor->get_association_descriptor( association_proxy_name = iv_association_name ).
          lv_core_bo_name = lo_association_descriptor->get_target_bo_esr_name( ).
          lv_core_bo_node_name = lo_association_descriptor->get_target_bo_node_esr_name( ).

        CATCH cx_esf_core_service INTO lx_esf_core_service.
          handle_exception( lx_esf_core_service ).
        CATCH cx_esf_metadata_error INTO lx_esf_metadata_error.
          handle_exception( lx_esf_metadata_error ).
      ENDTRY.

    ENDIF.

    LOOP AT lt_ref_bo_node_data ASSIGNING <ls_ref_bo_node_data>.
      IF iv_association_name IS INITIAL OR
* If Association Name is provided, Check if the ESR Name of the BO and node pointed by
* the assciation matches with the BO and Node Name stored in Task instance
         ( <ls_ref_bo_node_data>-object_node_technical_referenc-object_name EQ lv_core_bo_name-esr_name
         AND <ls_ref_bo_node_data>-object_node_technical_referenc-object_node_name EQ lv_core_bo_node_name-esr_name ).

        ls_ref_bo_mapping-task_node_id = <ls_ref_bo_node_data>-parent_node_id.
        ls_ref_bo_mapping-core_bo_node_id = <ls_ref_bo_node_data>-object_node_technical_referenc-object_node_technical_id.
        INSERT ls_ref_bo_mapping INTO TABLE et_task_to_ref_bo_mapping.
        APPEND <ls_ref_bo_node_data> TO et_ref_bo_node_data.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.                    "GET_TASK_TO_REF_BO_MAPPING


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->HANDLE_EXCEPTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IX_EXCEPTION                   TYPE REF TO CX_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD HANDLE_EXCEPTION.

    RAISE EXCEPTION TYPE cx_fatal_exception
      EXPORTING
        previous = ix_exception.

  ENDMETHOD.                    "HANDLE_EXCEPTION


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->HANDLE_FSI_EXCEPTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_FSI_QUERY                   TYPE REF TO CM_FSI_QUERY
* | [--->] IV_BO_NAME                     TYPE        STRING
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD HANDLE_FSI_EXCEPTION.

    DATA:
      lv_attr1 TYPE symsgv,
      lv_attr2 TYPE symsgv,
      lv_attr3 TYPE symsgv,
      lv_attr4 TYPE symsgv,

      lo_msg        TYPE REF TO cm_esi_t100_adapter,
      ls_msg        TYPE symsg,
      ls_orig_loc   TYPE cm_esi_root=>ty_message_location.

    FIELD-SYMBOLS:
      <fs_attr1> TYPE any,
      <fs_attr2> TYPE any,
      <fs_attr3> TYPE any,
      <fs_attr4> TYPE any.

* Handle FSI Exception
    IF    io_fsi_query->symptom EQ cm_fsi_query=>co_search_load_state
       OR io_fsi_query->symptom EQ cm_fsi_query=>co_search_queued_updates.

      IF io_fsi_query->if_t100_message~t100key-attr1 IS NOT INITIAL.
        ASSIGN io_fsi_query->(io_fsi_query->if_t100_message~t100key-attr1) TO <fs_attr1>.
        lv_attr1 = <fs_attr1>.
      ENDIF.
      IF io_fsi_query->if_t100_message~t100key-attr2 IS NOT INITIAL.
        ASSIGN io_fsi_query->(io_fsi_query->if_t100_message~t100key-attr2) TO <fs_attr2>.
        lv_attr2 = <fs_attr2>.
      ENDIF.
      IF io_fsi_query->if_t100_message~t100key-attr3 IS NOT INITIAL.
        ASSIGN io_fsi_query->(io_fsi_query->if_t100_message~t100key-attr3) TO <fs_attr3>.
        lv_attr3 = <fs_attr3>.
      ENDIF.
      IF io_fsi_query->if_t100_message~t100key-attr4 IS NOT INITIAL.
        ASSIGN io_fsi_query->(io_fsi_query->if_t100_message~t100key-attr4) TO <fs_attr4>.
        lv_attr4 = <fs_attr4>.
      ENDIF.

      ls_msg-msgty = 'E'.
      ls_msg-msgid = io_fsi_query->if_t100_message~t100key-msgid.
      ls_msg-msgno = io_fsi_query->if_t100_message~t100key-msgno.
      ls_msg-msgv1 = lv_attr1.
      ls_msg-msgv2 = lv_attr2.
      ls_msg-msgv3 = lv_attr3.
      ls_msg-msgv4 = lv_attr4.

      ls_orig_loc-bo_name       = iv_bo_name.
      ls_orig_loc-bo_node_name  = iv_bo_node_name.

      lo_msg = cm_esi_t100_adapter=>create(
        symptom               = ''
        lifetime              = cm_esi_root=>co_lifetime_transition
        origin_location       = ls_orig_loc
        symsg                 = ls_msg
      ).

      mo_message_manager->add_message( lo_msg ).

    ELSE.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = io_fsi_query.

    ENDIF.

  ENDMETHOD.                    "HANDLE_FSI_EXCEPTION


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [--->] IN_EDIT_MODE                   TYPE        IF_ESF_TYPES=>TY_EDIT_MODE
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_BUFFER_SYNC_HANDLER         TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER(optional)
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_FAILED_NODE_IDS            TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve.

    IF in_bo_node_name CS co_qrn_task_indicator.

      CALL METHOD retrieve_qrn_task
        EXPORTING
          in_bo_node_name        = in_bo_node_name
          in_node_ids            = in_node_ids
          in_requested_image     = in_requested_image
          in_edit_mode           = in_edit_mode
          in_message_handler     = in_message_handler
          in_buffer_sync_handler = in_buffer_sync_handler
          in_requested_attributes = in_requested_attributes
        IMPORTING
          out_data               = out_data
          out_failed_node_ids    = out_failed_node_ids.

    ELSEIF in_bo_node_name CS co_qrn_bo_indicator.

      CALL METHOD retrieve_qrn_bo
        EXPORTING
          in_bo_node_name        = in_bo_node_name
          in_node_ids            = in_node_ids
          in_requested_image     = in_requested_image
          in_edit_mode           = in_edit_mode
          in_message_handler     = in_message_handler
          in_buffer_sync_handler = in_buffer_sync_handler
          in_requested_attributes = in_requested_attributes
        IMPORTING
          out_data               = out_data
          out_failed_node_ids    = out_failed_node_ids.

    ELSEIF in_bo_node_name = gv_bo_node_root.

      CALL METHOD retrieve_root
        EXPORTING
          in_bo_node_name         = in_bo_node_name
          in_node_ids             = in_node_ids
          in_requested_image      = in_requested_image
          in_edit_mode            = in_edit_mode
          in_requested_attributes = in_requested_attributes
          in_message_handler      = in_message_handler
          in_buffer_sync_handler  = in_buffer_sync_handler
        IMPORTING
          out_data                = out_data
          out_failed_node_ids     = out_failed_node_ids.

    ELSE.

      CALL METHOD super->if_esf_provider_access~retrieve
        EXPORTING
          in_bo_node_name        = in_bo_node_name
          in_node_ids            = in_node_ids
          in_requested_image     = in_requested_image
          in_edit_mode           = in_edit_mode
          in_message_handler     = in_message_handler
          in_buffer_sync_handler = in_buffer_sync_handler
          in_requested_attributes = in_requested_attributes
        IMPORTING
          out_data               = out_data
          out_failed_node_ids    = out_failed_node_ids.

    ENDIF.

  ENDMETHOD.                    "IF_ESF_PROVIDER_ACCESS~RETRIEVE


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NAME                     TYPE        STRING
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ASSOCIATION_NAME            TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_FILL_DATA                   TYPE        SESF_BOOLEAN
* | [--->] IN_FILL_FAILED_SOURCE_NODE_IDS TYPE        SESF_BOOLEAN (default =ABAP_TRUE)
* | [--->] IN_FILTER_PARAMETERS           TYPE        ANY(optional)
* | [--->] IN_FILTERED_ATTRIBUTES         TYPE        SESF_STRING_TAB(optional)
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [--->] IN_EDIT_MODE                   TYPE        TY_EDIT_MODE
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_BUFFER_SYNC_HANDLER         TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER(optional)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_FAILED_SOURCE_NODE_IDS     TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve_by_association.

    DATA:
      ls_link                    LIKE LINE OF out_links,
      ls_task_to_ref_bo_mapping  TYPE ty_ref_bo_mapping,
      lts_task_to_ref_bo_mapping TYPE tt_ref_bo_mapping,
      lt_ref_bo_node_data        TYPE if_task=>tt_business_obj_reference,
      lrs_out_data               TYPE REF TO data,
      lv_ref_bo_name             TYPE string,
      lv_ref_bo_node_name        TYPE string,
      lo_lcp_bo                  TYPE REF TO if_esf_lcp,
      lt_message                 TYPE if_esf_types=>ty_messages,

      lx_exception               TYPE REF TO cx_esf_core_service.


    FIELD-SYMBOLS:
          <fs_data> TYPE any,
          <fs_out_data> TYPE any,
          <ls_link>   LIKE LINE OF out_links.

    IF in_bo_node_name CS co_qrn_bo_indicator.

      IF in_association_name EQ gv_assoc_to_ref_bo_node.
        rba_target_equals_source(
          EXPORTING
            in_node_ids = in_node_ids
          IMPORTING
            out_links   = out_links ).

        IF in_fill_data  = abap_true.
          get_assoc_bo_node_name(
            EXPORTING
              iv_bo_node_name     =  in_bo_node_name
              iv_association_name =  in_association_name
            IMPORTING
              ev_bo_name          = lv_ref_bo_name
              ev_bo_node_name     = lv_ref_bo_node_name
          ).

          TRY.
              lo_lcp_bo =   mo_lcp_facade->get_lcp( lv_ref_bo_name ).

              lo_lcp_bo->retrieve(
                EXPORTING
                  in_bo_node_name         = lv_ref_bo_node_name
                  in_node_ids             = in_node_ids "Since source = target
                  in_edit_mode            = in_edit_mode
                  in_requested_image      = in_requested_image
                  in_requested_attributes = in_requested_attributes
                IMPORTING
                  out_failed_node_ids     = out_failed_source_node_ids
                  out_data                = out_data
                  out_messages            = lt_message

              ).

              IF lines( out_failed_source_node_ids ) > 0. "in case of rba to task
                SORT out_failed_source_node_ids.
                DELETE ADJACENT DUPLICATES FROM out_failed_source_node_ids.
              ENDIF.

              IF lines( out_failed_source_node_ids ) > 0.
                LOOP AT out_links ASSIGNING <ls_link>.
                  READ TABLE out_failed_source_node_ids TRANSPORTING NO FIELDS
                    WITH KEY table_line = <ls_link>-source_node_id BINARY SEARCH.
                  IF sy-subrc = 0.
                    DELETE out_links.
                  ENDIF.
                ENDLOOP.
              ENDIF.

              mo_message_manager->add_messages( it_messages = lt_message ).
              CLEAR lt_message.

            CATCH cx_esf_core_service INTO lx_exception.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_exception.
          ENDTRY.

        ENDIF.
      ENDIF.

    ELSEIF in_bo_node_name CS co_qrn_task_indicator
           AND in_association_name CS mv_task_to_ref_bo_assoc_prefix.

      get_task_to_ref_bo_mapping(
       EXPORTING
         iv_co_node_name           = in_bo_node_name
         iv_association_name       = in_association_name
         it_task_root_node_ids     = in_node_ids
       IMPORTING
         et_task_to_ref_bo_mapping = lts_task_to_ref_bo_mapping
         et_ref_bo_node_data       = lt_ref_bo_node_data ). "YSB27072010

      LOOP AT lts_task_to_ref_bo_mapping INTO ls_task_to_ref_bo_mapping.
        ls_link-source_node_id = ls_task_to_ref_bo_mapping-task_node_id.
        ls_link-target_node_id = ls_task_to_ref_bo_mapping-core_bo_node_id.
        APPEND ls_link TO out_links.
      ENDLOOP.

      IF in_fill_data = abap_true.

        CREATE DATA lrs_out_data LIKE LINE OF out_data.
        ASSIGN lrs_out_data->* TO <fs_out_data>.

        LOOP AT lt_ref_bo_node_data ASSIGNING <fs_data>.
          MOVE-CORRESPONDING <fs_data> TO <fs_out_data>.
          APPEND <fs_out_data> TO out_data.
        ENDLOOP.

      ENDIF.


    ELSE.
      CALL METHOD super->if_esf_provider_access~retrieve_by_association
        EXPORTING
          in_bo_name                 = in_bo_name
          in_bo_node_name            = in_bo_node_name
          in_association_name        = in_association_name
          in_node_ids                = in_node_ids
          in_fill_data               = in_fill_data
          in_filter_parameters       = in_filter_parameters
          in_filtered_attributes     = in_filtered_attributes
          in_requested_image         = if_esf_types=>co_image_transactional_buffer
          in_edit_mode               = in_edit_mode
          in_message_handler         = in_message_handler
          in_buffer_sync_handler     = in_buffer_sync_handler
        IMPORTING
          out_links                  = out_links
          out_data                   = out_data
          out_failed_source_node_ids = out_failed_source_node_ids.
    ENDIF.

  ENDMETHOD.                    "IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_access~retrieve_root_node_id.

  DATA lo_message_handler TYPE REF TO if_esf_message_handler.
  DATA lr_data TYPE REF TO data.
  DATA lx_ex TYPE REF TO cx_esf_core_service.
  DATA ls_link TYPE sesf_association_link.
  DATA lt_req_attr TYPE sesf_string_tab.
  DATA lt_obnview_attr TYPE sesf_string_tab.
  DATA lv_obnview_attr TYPE string.
  DATA lt_failed TYPE sesf_string_tab.

  DATA lr_bo_descriptor        TYPE REF TO if_esf_bo_desc.
  DATA lr_root_node_descriptor TYPE REF TO if_esf_bo_node_desc.
  DATA lv_root_node_name       TYPE string.
  DATA lx_esf_metadata_error   TYPE REF TO cx_esf_metadata_error.

  FIELD-SYMBOLS <lt_data> TYPE ANY TABLE.
  FIELD-SYMBOLS <ls_data> TYPE any.
  FIELD-SYMBOLS <lv_node_id> TYPE any.
  FIELD-SYMBOLS <lv_alt_key> TYPE any.

  TRY.
      lr_bo_descriptor = cl_esf_descriptor_factory=>get_bo_descriptor( in_bo_proxy_name = mv_bo_name ).
      lr_root_node_descriptor = lr_bo_descriptor->get_root_bo_node_descriptor( ).
      lv_root_node_name = lr_root_node_descriptor->get_proxy_name( ).

      lr_data = mo_lcp_facade->get_bo_node_table_container(
          in_bo_name                  =  mv_bo_name
          in_bo_node_name             =  in_bo_node_name ).
      ASSIGN lr_data->* TO <lt_data>.

    CATCH cx_esf_core_service INTO lx_ex.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_ex.

    CATCH cx_esf_metadata_error INTO lx_esf_metadata_error.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_metadata_error.
  ENDTRY.

  CREATE DATA lr_data LIKE LINE OF <lt_data>.
  ASSIGN lr_data->* TO <ls_data>.

  IF in_bo_node_name CS co_qrn_bo_indicator.
    CLEAR out_links.

    IF lv_root_node_name = in_bo_node_name.
*     "QRNVIEW" Node of the OWL is already the "Root" Node
      ASSIGN COMPONENT gv_node_id OF STRUCTURE <ls_data> TO <lv_node_id>.
      IF sy-subrc = 0.
        if_esf_provider_access~retrieve(
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_node_ids             = in_node_ids
            in_requested_image      = in_requested_image
            in_edit_mode            = if_esf_types=>co_read_only
            in_message_handler      = lo_message_handler"Dummy!
          IMPORTING
            out_data                = <lt_data>
            out_failed_node_ids     = lt_failed
            ).

        ASSERT lines( in_node_ids ) = lines( <lt_data> ) + lines( lt_failed ).

        LOOP AT <lt_data> INTO <ls_data>.
          ls_link-source_node_id = <lv_node_id>.
          ls_link-target_node_id = <lv_node_id>.
          INSERT ls_link INTO  TABLE out_links.
        ENDLOOP.
      ENDIF.

    ELSE.

      APPEND mv_company_uuid_obnview  TO lt_obnview_attr.
      APPEND mv_company_uuid_obnview2 TO lt_obnview_attr.
      APPEND mv_company_uuid_obnview3 TO lt_obnview_attr.
      APPEND mv_company_uuid_obnview4 TO lt_obnview_attr.
      APPEND mv_resource_uuid_obnview TO lt_obnview_attr.
      APPEND mv_company_uuid_obnview5 TO lt_obnview_attr.

      LOOP AT lt_obnview_attr INTO lv_obnview_attr.
        ASSIGN COMPONENT lv_obnview_attr OF STRUCTURE <ls_data> TO <lv_alt_key>.
        IF <lv_alt_key> IS ASSIGNED.
          INSERT lv_obnview_attr INTO TABLE lt_req_attr.
          EXIT.
        ENDIF.
      ENDLOOP.

      IF <lv_alt_key> IS ASSIGNED.
        ASSIGN COMPONENT gv_node_id OF STRUCTURE <ls_data> TO <lv_node_id>.
        IF sy-subrc = 0.
          INSERT mv_company_uuid_obnview2 INTO TABLE lt_req_attr.

          if_esf_provider_access~retrieve(
            EXPORTING
              in_bo_node_name         = in_bo_node_name
              in_node_ids             = in_node_ids
              in_requested_image      = in_requested_image
              in_edit_mode            = if_esf_types=>co_read_only
              in_requested_attributes = lt_req_attr
              in_message_handler      = lo_message_handler"Dummy!
            IMPORTING
              out_data                = <lt_data>
              out_failed_node_ids     = lt_failed
              ).

          ASSERT lines( in_node_ids ) = lines( <lt_data> ) + lines( lt_failed ).
* If you get this Dump: Your OWL is not calling Super->Retrieve for Root Nodes


        ENDIF.
      ENDIF.

      LOOP AT <lt_data> INTO <ls_data>.

        ls_link-source_node_id = <lv_node_id>.
        ls_link-target_node_id = <lv_alt_key>.
        INSERT ls_link INTO  TABLE out_links.

      ENDLOOP.
    ENDIF.
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T(optional)
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_action~execute_action.

    DATA: lv_action_type TYPE string.


    lv_action_type = get_action_type( iv_co_node_name = in_bo_node_name
                                      iv_action_name  = in_action_name ).


    IF lv_action_type = mc_action_delete_reference_bo.
* Action to Delete the Core BO instance
      CALL METHOD delete_reference_bo
        EXPORTING
          in_bo_node_name              = in_bo_node_name
          in_action_name               = in_action_name
          in_node_ids                  = in_node_ids
          in_action_parameters         = in_action_parameters
          in_referencing_node_elements = in_referencing_node_elements
          in_change_handler            = in_change_handler
          in_message_handler           = in_message_handler.

    ELSE.

      IF in_bo_node_name CS co_qrn_task_indicator.
* QRN Task OWL

        IF lv_action_type = mc_action_task_bo_action.
* All action names with prefix TASK_ would be delegated to TASK BO
* e.g., TASK_COMPLETE means COMPLETE action of the TASK BO should be called.
          CALL METHOD execute_task_bo_action
            EXPORTING
              in_bo_node_name              = in_bo_node_name
              in_action_name               = in_action_name
              in_node_ids                  = in_node_ids
              in_action_parameters         = in_action_parameters
              in_referencing_node_elements = in_referencing_node_elements
              in_change_handler            = in_change_handler
              in_message_handler           = in_message_handler.
        ELSE.
* BO / CO only Actions on a Task Based OWL
* Currently No usecase exists..

* Nos:
*  There are some COs with task actions, but no Task prefix.
*  But some Task Action names are to long for an additional prefix.
*  (the actions seem to be unused and popup only in the eco unit test tool
*  So: Check if the action is a Task action.
          DATA lv_task_action LIKE in_action_name.
          DATA lx_ex TYPE REF TO cx_root.
          TRY.
              FIND FIRST OCCURRENCE OF in_action_name IN TABLE
                  mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = if_task=>co_bo_name
                  )->get_bo_node_descriptor( bo_node_proxy_name = if_task=>co_bo_node-root
                  )->get_action_proxy_names( ).
            CATCH cx_esf_core_service cx_esf_metadata_error INTO lx_ex.
              ASSERT ID a1fia_eco_error CONDITION 2 = 0.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_ex.
          ENDTRY.
          IF sy-subrc = 0.
            CONCATENATE mc_action_task_bo_action in_action_name INTO lv_task_action.
            CALL METHOD execute_task_bo_action
              EXPORTING
                in_bo_node_name              = in_bo_node_name
                in_action_name               = lv_task_action
                in_node_ids                  = in_node_ids
                in_action_parameters         = in_action_parameters
                in_referencing_node_elements = in_referencing_node_elements
                in_change_handler            = in_change_handler
                in_message_handler           = in_message_handler.
          ELSE.
            ASSERT ID a1fia_eco_error CONDITION 2 = 0.
            ASSERT 1 = 0.

*   If you have a usecase please contact: Srinivasa Raghavan V (I034273)
            RAISE EXCEPTION TYPE cx_fatal_exception.
          ENDIF.
        ENDIF.
      ELSEIF in_bo_node_name CS co_qrn_bo_indicator.
* QRN BO OWL

        IF lv_action_type = mc_action_compound_action.
* Compound Action
          CALL METHOD execute_compound_action
            EXPORTING
              in_bo_node_name              = in_bo_node_name
              in_action_name               = in_action_name
              in_node_ids                  = in_node_ids
              in_action_parameters         = in_action_parameters
              in_referencing_node_elements = in_referencing_node_elements
              in_change_handler            = in_change_handler
              in_message_handler           = in_message_handler.
        ELSE.
          CALL METHOD execute_action_qrn_bo
            EXPORTING
              in_bo_node_name              = in_bo_node_name
              in_action_name               = in_action_name
              in_node_ids                  = in_node_ids
              in_action_parameters         = in_action_parameters
              in_referencing_node_elements = in_referencing_node_elements
              in_change_handler            = in_change_handler
              in_message_handler           = in_message_handler.
        ENDIF.

      ELSE.
* Non-QRN OWL
        CALL METHOD execute_action_bo
          EXPORTING
            in_bo_node_name              = in_bo_node_name
            in_action_name               = in_action_name
            in_node_ids                  = in_node_ids
            in_action_parameters         = in_action_parameters
            in_referencing_node_elements = in_referencing_node_elements
            in_change_handler            = in_change_handler
            in_message_handler           = in_message_handler.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "if_esf_provider_action~execute_action


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_ACTION_PARAMETERS          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_action~retrieve_default_action_param.
    DATA:
      lv_action_type        TYPE string,
      lv_action_name        LIKE in_action_name,
      lv_bo_node_name       LIKE in_bo_node_name,

      lo_lcp_bo             TYPE REF TO if_esf_lcp,
      lx_esf_core_service   TYPE REF TO cx_esf_core_service,
      lx_root               TYPE REF TO cx_root,

      lo_bo_descriptor      TYPE REF TO if_esf_bo_desc,
      lo_bo_node_descriptor TYPE REF TO if_esf_bo_node_desc,
      lt_action_proxy_names TYPE sesf_string_tab.


    get_action_type(
      EXPORTING
        iv_co_node_name =  in_bo_node_name   " Node Name, on which the action is modeled in the CO
        iv_action_name  =  in_action_name   " Action name
      RECEIVING
        rv_action_type  =  lv_action_type   " Action Type
    ).


    IF lv_action_type <> mc_action_delete_reference_bo. " Ignore the special action for Delete
*  Task BO ations on QRN Task OWL
      IF in_bo_node_name CS co_qrn_task_indicator AND
         lv_action_type  = mc_action_task_bo_action.

* exclude TASK_ prefix from the action name, assumption for delegating actions to the Task BO.
        lv_action_name  = substring_after( val = in_action_name sub = mc_task_action_indicator ).
        lo_lcp_bo       = mo_task_lcp.
        lv_bo_node_name = if_task=>co_bo_node-root.

* BO actions on  QRN BO /Task OWL
      ELSEIF in_bo_node_name CS co_qrn_bo_indicator OR
             in_bo_node_name CS co_qrn_task_indicator. "Task OWLs with Core BO actions

        CALL METHOD get_ref_bo_metadata
          EXPORTING
            in_bo_node_name     = in_bo_node_name
          IMPORTING
*           ex_ref_bo_name      = lv_core_bo_name
            ex_ref_bo_node_name = lv_bo_node_name
            ex_ref_bo_lcp       = lo_lcp_bo.
        lv_action_name = in_action_name.

      ENDIF.

      IF lo_lcp_bo IS BOUND.

        TRY.
            lo_bo_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = lo_lcp_bo->bo_name ).
            lo_bo_node_descriptor = lo_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = lv_bo_node_name ).
            lt_action_proxy_names = lo_bo_node_descriptor->get_action_proxy_names( ).

            READ TABLE lt_action_proxy_names WITH KEY table_line = lv_action_name
            TRANSPORTING NO FIELDS.

* In case of CO only action, prevent delegation to BO
            IF sy-subrc = 0.
              CALL METHOD lo_lcp_bo->retrieve_default_action_param
                EXPORTING
                  in_bo_node_name       = lv_bo_node_name
                  in_action_name        = lv_action_name
                  in_node_ids           = in_node_ids
                IMPORTING
                  out_action_parameters = out_action_parameters.
            ENDIF.

          CATCH cx_esf_metadata_error INTO lx_root.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_root.

          CATCH cx_esf_core_service INTO lx_esf_core_service.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_core_service.
        ENDTRY.
      ELSE.
* Non QRN OWL
        CALL METHOD super->if_esf_provider_action~retrieve_default_action_param
          EXPORTING
            in_bo_node_name       = in_bo_node_name
            in_action_name        = in_action_name
            in_node_ids           = in_node_ids
          IMPORTING
            out_action_parameters = out_action_parameters.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_init~init.

    DATA:
      ls_transactional_pattern  TYPE if_esf_provider_init=>ty_transaction_pattern,
      lt_out_context_parameters TYPE if_esf_types=>tt_context_parameters,
      ls_out_context_parameter  TYPE if_esf_types=>ty_context_parameter.

    ls_transactional_pattern = inout_preferred_trx_pattern.

    CALL METHOD super->if_esf_provider_init~init
      EXPORTING
        in_provider_context         = in_provider_context
        in_bo_name                  = in_bo_name
      CHANGING
        inout_preferred_trx_pattern = ls_transactional_pattern.

    ls_transactional_pattern = inout_preferred_trx_pattern.

* Initialise QRS Provider
    CREATE OBJECT mo_qrs_provider.
    mo_qrs_provider->if_esf_provider_init~init(
       EXPORTING
        in_provider_context         = in_provider_context
        in_bo_name                  = in_bo_name
      CHANGING
        inout_preferred_trx_pattern = ls_transactional_pattern ).

* Store change_handler for notifications
    mo_change_handler = in_provider_context->change_handler.
* Store Proxy Name
    mv_own_proxy_name = in_bo_name.
* Initialise Action handler helper
    CREATE OBJECT mo_action_handler.


* Store Work Center name, required to derive access context code later
    CALL METHOD in_provider_context->get_context_parameters
      RECEIVING
        out_context_parameters = lt_out_context_parameters.

    READ TABLE lt_out_context_parameters
    INTO ls_out_context_parameter
    WITH KEY name = 'WORKCENTER_NAME'.

    mv_work_center_name = ls_out_context_parameter-value.

  ENDMETHOD.                    "IF_ESF_PROVIDER_INIT~INIT


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_QUERY~QUERY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        TT_SELECTION_PARAMETERS(optional)
* | [--->] IN_QUERY_OPTIONS               TYPE        TY_QUERY_OPTIONS
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        TY_AUTHORIZATION_CONTEXT(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_FILL_DATA                   TYPE        SESF_BOOLEAN (default =SPACE)
* | [--->] IN_FILTER_NODE_IDS             TYPE        SESF_BO_NODE_ID_TAB(optional)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [--->] IN_EXECUTE_OVER_SQL            TYPE        SESF_BOOLEAN (default =SPACE)
* | [<---] OUT_NODE_IDS                   TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_QUERY_INFO                 TYPE        TY_QUERY_INFO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_query~query.

    DATA:
      ls_authorization_context    LIKE in_authorization_context,
      lx_catched_exception        TYPE REF TO no_check_exception,
*      lx_rbam_restrictions        TYPE REF TO cx_rbam_restrictions,
      lo_message                  TYPE REF TO cm_a1fia_owl_co,
      lv_access_context           TYPE string,
      ls_origin_location          TYPE cm_esi_root=>ty_message_location,
      lv_rbam_error_no_query      TYPE sesf_boolean VALUE abap_false,
      lt_requested_attribute      TYPE sesf_string_tab.


*  Needed for OWL having QRN and NON-QRN queries
    CLEAR mv_non_qrn_query_executed.


*    TRY.

* Replacement of RBAM API:
        IF in_bo_node_name CS co_qrn_bo_indicator.
          ls_authorization_context = in_authorization_context.
        ELSE.
          CALL METHOD fill_authorization_context
            EXPORTING
              iv_node_name             = in_bo_node_name
              iv_query_name            = in_query_name
              io_message_handler       = in_message_handler
            IMPORTING
              es_authorization_context = ls_authorization_context.
        ENDIF.
*      CATCH no_check_exception INTO lx_catched_exception.
*        TRY.
*            lx_rbam_restrictions ?= lx_catched_exception->previous.
*            IF lx_rbam_restrictions IS NOT INITIAL.
*              CASE lx_rbam_restrictions->textid.
*                WHEN cx_rbam_restrictions=>exc_inconsistent_access_ctx.
*                  lv_access_context = lx_rbam_restrictions->access_context.
*                  ls_origin_location-bo_name = mv_own_proxy_name.
*                  CREATE OBJECT lo_message
*                    EXPORTING
*                      textid            = cm_a1fia_owl_co=>rbam_policy_missing
*                      previous          = lx_rbam_restrictions
*                      severity          = cm_root=>co_severity_error
*                      lifetime          = cm_esi_root=>co_lifetime_transition
*                      origin_location   = ls_origin_location
*                      mv_operation      = lx_rbam_restrictions->operation
*                      mv_resource       = lx_rbam_restrictions->resource
*                      mv_access_context = lv_access_context.
*                  mo_message_manager->add_message( lo_message ).
*                  lv_rbam_error_no_query = abap_true.
*                  " CSN: 0002891959 2008
*                WHEN cx_rbam_restr_policy_update=>cx_rbam_restr_policy_update.
*                  ls_origin_location-bo_name = mv_own_proxy_name.
*                  CREATE OBJECT lo_message
*                    EXPORTING
*                      textid          = cm_a1fia_owl_co=>rbam_restr_policy_update
*                      previous        = lx_rbam_restrictions
*                      severity        = cm_root=>co_severity_error
*                      lifetime        = cm_esi_root=>co_lifetime_transition
*                      origin_location = ls_origin_location.
*                  mo_message_manager->add_message( lo_message ).
*                  lv_rbam_error_no_query = abap_true.
*
*              ENDCASE.
*            ENDIF.
*
*          CATCH cx_sy_move_cast_error.                  "#EC NO_HANDLER
**lx_catched_exception->previous not of correct typ. just dump
*        ENDTRY.
*
*        IF lv_rbam_error_no_query <> abap_true. "normal exception => just dump
*          RAISE EXCEPTION TYPE cx_fatal_exception
*            EXPORTING
*              previous = lx_catched_exception->previous.
*        ENDIF.
*    ENDTRY.

    IF lv_rbam_error_no_query = abap_true.
* do nothing
    ELSEIF in_bo_node_name CS co_qrn_task_indicator.

      CALL METHOD query_qrn_task
        EXPORTING
          in_bo_node_name          = in_bo_node_name
          in_query_name            = in_query_name
          in_selection_parameters  = in_selection_parameters
          in_query_options         = in_query_options
          in_message_handler       = in_message_handler
          in_fill_data             = in_fill_data
          in_filter_node_ids       = in_filter_node_ids
          in_authorization_context = ls_authorization_context
          in_requested_attributes  = in_requested_attributes
        IMPORTING
          out_node_ids             = out_node_ids
          out_data                 = out_data
          out_query_info           = out_query_info.

    ELSEIF in_bo_node_name CS co_qrn_bo_indicator.

      CALL METHOD query_qrn_bo
        EXPORTING
          in_bo_node_name          = in_bo_node_name
          in_query_name            = in_query_name
          in_selection_parameters  = in_selection_parameters
          in_query_options         = in_query_options
          in_message_handler       = in_message_handler
          in_fill_data             = in_fill_data
          in_filter_node_ids       = in_filter_node_ids
          in_authorization_context = ls_authorization_context
          in_requested_attributes  = in_requested_attributes
        IMPORTING
          out_node_ids             = out_node_ids
          out_data                 = out_data
          out_query_info           = out_query_info.

    ELSE.
* There should be no NON-QRN Based OWL any longer
* This dump is introduced to detect if we still have any NON-QRN OWL
* If you have a usecase please contact: Srinivasa Raghavan V (I034273)
      ASSERT ID a1fia_eco_error CONDITION 2 = 0.
* This is only to avoid artifical dumps during unit tests.

      IF cl_abap_aab_utilities=>is_active(
          id                = 'A1FIA_ECO_ERROR'
          mode_breakpoint   = 'X'
          mode_logpoint     = 'X'
          mode_assert_break = 'X'
          mode_assert_dump  = 'X'
          mode_assert_log   = 'X'
        ) IS NOT INITIAL.
*This log point shall only be active in systems for unit testing (QAF...)
* --> Prevent Dumps for sake of reduced number of mails from managment...
      ELSE.
        ASSERT 1 = 0.
      ENDIF.


      mv_non_qrn_query_executed = abap_true.
***      CALL METHOD super->if_esf_provider_query~query
***        EXPORTING
***          in_bo_node_name          = in_bo_node_name
***          in_query_name            = in_query_name
***          in_selection_parameters  = in_selection_parameters
***          in_query_options         = in_query_options
***          in_message_handler       = in_message_handler
***          in_fill_data             = in_fill_data
***          in_filter_node_ids       = in_filter_node_ids
***          in_authorization_context = ls_authorization_context
***        IMPORTING
***          out_node_ids             = out_node_ids
***          out_data                 = out_data
***          out_query_info           = out_query_info.

    ENDIF.

  ENDMETHOD.                    "IF_ESF_PROVIDER_QUERY~QUERY


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [<---] OUT_SELECTION_PARAMETERS       TYPE        SESF_SELECTION_PARAMETERS_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM.

    IF in_bo_node_name CS co_qrn_task_indicator OR
       in_bo_node_name CS co_qrn_bo_indicator.
*no default values possible. Method has to be redefined if needed for QRN
    ELSE.

      CALL METHOD super->if_esf_provider_query~retrieve_default_query_param
        EXPORTING
          in_bo_node_name          = in_bo_node_name
          in_query_name            = in_query_name
        IMPORTING
          out_selection_parameters = out_selection_parameters.
    ENDIF.
  ENDMETHOD.                    "IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION.
* call super method
    super->if_esf_provider_transact_ctrl~on_after_cleanup_transaction(
      CHANGING
        inout_messages = inout_messages ).

    CLEAR:
*   cleanup buffer
      mts_buffer,
*   clear processing status
      ms_processing_status.

* Reset Reject save
    mv_reject_save = abap_false.

  ENDMETHOD.                    "if_esf_provider_transact_ctrl~on_after_cleanup_transaction


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_save_transaction.

*  mts_buffer is not cleared to support session continue

    IF mv_non_qrn_query_executed = abap_true.

      IF mv_suppress_save_message EQ abap_false.

        CALL METHOD super->if_esf_provider_transact_ctrl~on_after_save_transaction
          EXPORTING
            in_rejected    = in_rejected
          CHANGING
            inout_messages = inout_messages.
      ELSE.
        mv_suppress_save_message = abap_false.
      ENDIF.

    ELSE.
*---------------------------------------------------------------------*
* Send message after save:
*   1.  only one object was processed and was successful
*       "Action executed successfully"
*   2.  Multiple objects were processed
*     "&1 of &2 actions executed successfully"
*---------------------------------------------------------------------*
      mo_action_handler->send_message_after_save(
        EXPORTING
          iv_rejected_save     = in_rejected
          io_message_manager   = mo_message_manager
        CHANGING
          cs_processing_status = ms_processing_status ).

*---------------------------------------------------------------------*
* send change notifications
*---------------------------------------------------------------------*
      mo_action_handler->send_notifications(
        iv_bo_name        = mv_bo_name
        its_notification  = mts_notify_after_save
        io_change_handler = mo_change_handler ).

*   clear notifications
      CLEAR mts_notify_after_save.

    ENDIF.
  ENDMETHOD.                    "if_esf_provider_transact_ctrl~on_after_save_transaction


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL2_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_transact_ctrl~on_before_save_transaction.

  CALL METHOD super->if_esf_provider_transact_ctrl~on_before_save_transaction
    IMPORTING
      out_rejected = out_rejected
      out_messages = out_messages.

  IF mv_reject_save = abap_true.
    out_rejected = abap_true.
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->IMPLEMENT_EXECUTE_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_BO_ACTION_NAME              TYPE        STRING
* | [--->] IN_BO_ACTION_PARAMETERS        TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IO_LCP_BO                      TYPE REF TO IF_ESF_LCP
* | [--->] IV_ECO_NODE_NAME               TYPE        STRING
* | [--->] IT_LINK_ECO_TO_BO              TYPE        SESF_ASSOCIATION_LINK_TAB
* | [--->] IV_TASK_ACTION                 TYPE        SESF_BOOLEAN (default =ABAP_FALSE)
* | [<---] EV_CHANGE_MODE                 TYPE        IF_ESF_TYPES=>TY_CHANGE_MODE
* | [<-->] CT_ECO_NODE_ID                 TYPE        SESF_BO_NODE_ID_TAB
* | [<-->] CTS_FAILED_NODE                TYPE        CL_A1FIA_OWL_ACTION=>TTS_FAILED_NODE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD implement_execute_action.
* redefine and implement CO only actions here (only necessary when they are not supposed to be delegated to CoreBO/Task)

* adjust (delete) CT_ECO_NODE_ID for not executed actions!
* add error and warning messages to CTS_FAILED_NODE
*  - each not processed node should have an entry here
*  - set correctg failure type, e.g. CV_FAILURE_NOT_FOUND
*  - field message SHALL be filled
*  - field ECO_NODE_ID should be filled
*  - field BO... can be filled
* set EV_CHANGE_MODE depending on how the CO nodes have changed (Update / Delete / Create(?))
* EV_CHANGE_MODE is used to do the notifications for the CO node later
* Do not send any notifications for the CO Node (e.g., QRNVIEW) here !!

    mo_action_handler->execute_action(
      EXPORTING
        in_bo_node_name              = in_bo_node_name
        in_bo_action_name            = in_bo_action_name  "Core BO action must be same as CO action for delegation case
        in_bo_action_parameters      = in_bo_action_parameters
        in_referencing_node_elements = in_referencing_node_elements
        in_change_handler            = in_change_handler
        in_message_handler           = in_message_handler
        io_lcp_bo                    = io_lcp_bo
        iv_eco_node_name             = iv_eco_node_name
        it_link_eco_to_bo            = it_link_eco_to_bo
        iv_task_action               = iv_task_action
      CHANGING
        ct_eco_node_id               = ct_eco_node_id
        cts_failed_node              = cts_failed_node ).

    ev_change_mode = if_esf_types=>co_change_mode_update.

  ENDMETHOD.                    "impl_execute_action


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->QUERY_QRN_BO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS(optional)
* | [--->] IN_QUERY_OPTIONS               TYPE        IF_ESF_PROVIDER_QUERY=>TY_QUERY_OPTIONS
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        IF_ESF_PROVIDER_QUERY=>TY_AUTHORIZATION_CONTEXT(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_FILL_DATA                   TYPE        SESF_BOOLEAN (default =SPACE)
* | [--->] IN_FILTER_NODE_IDS             TYPE        SESF_BO_NODE_ID_TAB(optional)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_NODE_IDS                   TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_QUERY_INFO                 TYPE        IF_ESF_PROVIDER_QUERY=>TY_QUERY_INFO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD QUERY_QRN_BO.

    DATA:
      lo_fsi_query      TYPE REF TO cm_fsi_query,
      lo_sy_no_handler  TYPE REF TO cx_sy_no_handler.

    CALL METHOD add_bo_node_query_mapping
      EXPORTING
        in_bo_node_name = in_bo_node_name
        in_query_name   = in_query_name.

    TRY.
        CALL METHOD mo_qrs_provider->if_esf_provider_query~query
          EXPORTING
            in_bo_node_name          = in_bo_node_name
            in_query_name            = in_query_name
            in_selection_parameters  = in_selection_parameters
            in_query_options         = in_query_options
            in_message_handler       = in_message_handler
            in_fill_data             = in_fill_data
            in_filter_node_ids       = in_filter_node_ids
            in_authorization_context = in_authorization_context
            IN_REQUESTED_ATTRIBUTES  = in_requested_attributes
          IMPORTING
            out_node_ids             = out_node_ids
            out_data                 = out_data
            out_query_info           = out_query_info.

      CATCH cm_fsi_query INTO lo_fsi_query.

* Clear to prevent any inconsistent data from being shown in the OWL
        CLEAR:
          out_node_ids,
          out_data.

        CALL METHOD handle_fsi_exception
          EXPORTING
            io_fsi_query    = lo_fsi_query
            iv_bo_name      = mv_own_proxy_name
            iv_bo_node_name = in_bo_node_name.

* In some cases, we get cx_sy_no_handler exception, though the FSI raises cm_fsi_query
* so, we catch this exception check if the Previous exception is of type cm_fsi_query
      CATCH cx_sy_no_handler INTO lo_sy_no_handler.

        TRY.
            lo_fsi_query ?= lo_sy_no_handler->previous.
* Clear to prevent any inconsistent data from being shown in the OWL
            CLEAR:
              out_node_ids,
              out_data.

            CALL METHOD handle_fsi_exception
              EXPORTING
                io_fsi_query    = lo_fsi_query
                iv_bo_name      = mv_own_proxy_name
                iv_bo_node_name = in_bo_node_name.

          CATCH cx_sy_move_cast_error.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lo_sy_no_handler.
        ENDTRY.
    ENDTRY.

  ENDMETHOD.                    "QUERY_QRN_BO


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->QUERY_QRN_TASK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS(optional)
* | [--->] IN_QUERY_OPTIONS               TYPE        IF_ESF_PROVIDER_QUERY=>TY_QUERY_OPTIONS
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        IF_ESF_PROVIDER_QUERY=>TY_AUTHORIZATION_CONTEXT(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_FILL_DATA                   TYPE        SESF_BOOLEAN (default =SPACE)
* | [--->] IN_FILTER_NODE_IDS             TYPE        SESF_BO_NODE_ID_TAB(optional)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_NODE_IDS                   TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_QUERY_INFO                 TYPE        IF_ESF_PROVIDER_QUERY=>TY_QUERY_INFO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD QUERY_QRN_TASK.

    DATA:
      lo_fsi_query      TYPE REF TO cm_fsi_query,
      lo_sy_no_handler  TYPE REF TO cx_sy_no_handler.

    CALL METHOD add_bo_node_query_mapping
      EXPORTING
        in_bo_node_name = in_bo_node_name
        in_query_name   = in_query_name.

    TRY.
        CALL METHOD mo_qrs_provider->if_esf_provider_query~query
          EXPORTING
            in_bo_node_name          = in_bo_node_name
            in_query_name            = in_query_name
            in_selection_parameters  = in_selection_parameters
            in_query_options         = in_query_options
            in_message_handler       = in_message_handler
            in_fill_data             = in_fill_data
            in_filter_node_ids       = in_filter_node_ids
            in_authorization_context = in_authorization_context
            IN_REQUESTED_ATTRIBUTES  = in_requested_attributes
          IMPORTING
            out_node_ids             = out_node_ids
            out_data                 = out_data
            out_query_info           = out_query_info.

      CATCH cm_fsi_query INTO lo_fsi_query.

* Clear to prevent any inconsistent data from being shown in the OWL
        CLEAR:
          out_node_ids,
          out_data.

        CALL METHOD handle_fsi_exception
          EXPORTING
            io_fsi_query    = lo_fsi_query
            iv_bo_name      = mv_own_proxy_name
            iv_bo_node_name = in_bo_node_name.

* In some cases, we get cx_sy_no_handler exception, though the FSI raises cm_fsi_query
* so, we catch this exception check if the Previous exception is of type cm_fsi_query
      CATCH cx_sy_no_handler INTO lo_sy_no_handler.

        TRY.
            lo_fsi_query ?= lo_sy_no_handler->previous.
* Clear to prevent any inconsistent data from being shown in the OWL
            CLEAR:
              out_node_ids,
              out_data.

            CALL METHOD handle_fsi_exception
              EXPORTING
                io_fsi_query    = lo_fsi_query
                iv_bo_name      = mv_own_proxy_name
                iv_bo_node_name = in_bo_node_name.

          CATCH cx_sy_move_cast_error.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lo_sy_no_handler.
        ENDTRY.
    ENDTRY.


*    IF in_fill_data EQ abap_true.
*      CALL METHOD if_esf_provider_access~retrieve
*        EXPORTING
*          in_bo_node_name    = in_bo_node_name
*          in_node_ids        = out_node_ids
*          in_edit_mode       = if_esf_types=>co_read_only
*          in_message_handler = in_message_handler
*        IMPORTING
*          out_data           = out_data.
*    ENDIF.

  ENDMETHOD.                    "QUERY_QRN_TASK


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->RBA_TARGET_EQUALS_SOURCE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD RBA_TARGET_EQUALS_SOURCE.
    DATA:
    ls_link      LIKE LINE OF out_links.
    FIELD-SYMBOLS:
      <lv_node_id> LIKE LINE OF in_node_ids.

* clear exporting data
    CLEAR out_links.

    LOOP AT in_node_ids ASSIGNING <lv_node_id>.
      ls_link-source_node_id = <lv_node_id>.
      ls_link-target_node_id = <lv_node_id>.
      APPEND ls_link TO out_links.
    ENDLOOP.


  ENDMETHOD.                    "RBA_TARGET_EQUALS_SOURCE


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->RETRIEVE_QRN_BO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [--->] IN_EDIT_MODE                   TYPE        IF_ESF_TYPES=>TY_EDIT_MODE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_BUFFER_SYNC_HANDLER         TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER(optional)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_FAILED_NODE_IDS            TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD retrieve_qrn_bo.
    DATA:
      ls_query_options      TYPE sesf_query_options,
      lv_query_name         TYPE string,
      lt_sorted_node_id     LIKE in_node_ids,
      lv_retrieve_date_time TYPE gdt_global_date_time,
      lt_requested_attributes  TYPE sesf_string_tab.


    FIELD-SYMBOLS:
      <lv_node_id>  LIKE LINE OF in_node_ids,
      <ls_out_data> TYPE any.

* Clear export variables
    CLEAR:
      out_data,
      out_failed_node_ids.

* correction due to CSN 6386071
    ls_query_options-maximum_rows = -1.

    lv_query_name = get_query_for_bo_node( in_bo_node_name ).
    if lv_query_name IS INITIAL."--> No Query --> No Nodes
      out_failed_node_ids = in_node_ids.
      RETURN.
    ENDIF.

    lt_requested_attributes = in_requested_attributes.
    if lt_requested_attributes is NOT INITIAL.
      enrich_requested_attributes( EXPORTING in_bo_node_name = in_bo_node_name
                                   CHANGING ct_requested_attributes = lt_requested_attributes ).
      SORT lt_requested_attributes.
      DELETE ADJACENT DUPLICATES FROM lt_requested_attributes.
    ENDIF.

    GET TIME STAMP FIELD lv_retrieve_date_time.

* FSI implementation guideline: at least on query of this node

    CALL METHOD mo_qrs_provider->retrieve_by_node_ids
      EXPORTING
        in_bo_node_name         = in_bo_node_name
        in_query_name           = lv_query_name
        in_node_ids             = in_node_ids
        in_query_options        = ls_query_options
        in_message_handler      = in_message_handler
        in_requested_attributes = lt_requested_attributes
      IMPORTING
        out_data                = out_data.

    IF lines( out_data ) <> lines( in_node_ids ).
      lt_sorted_node_id = in_node_ids.

      SORT lt_sorted_node_id.

      LOOP AT out_data ASSIGNING <ls_out_data>.
        ASSIGN COMPONENT 'NODE_ID' OF STRUCTURE <ls_out_data> TO <lv_node_id>.
        READ TABLE lt_sorted_node_id WITH KEY table_line = <lv_node_id>
          TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE lt_sorted_node_id INDEX sy-tabix.
        ENDIF.
      ENDLOOP.

      out_failed_node_ids = lt_sorted_node_id.
    ENDIF.

    CALL METHOD enrich_retrieved_data
      EXPORTING
        in_co_node_name   = in_bo_node_name
        in_requested_attributes = in_requested_attributes
      CHANGING
        in_retrieved_data = out_data.

*   buffer retrieved date time
    buffer_retrieved_date_time(
      EXPORTING
        in_bo_node_name  = in_bo_node_name
        iv_retrieve_time = lv_retrieve_date_time
        out_data         = out_data ).

  ENDMETHOD.                    "retrieve_qrn_bo


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->RETRIEVE_QRN_TASK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [--->] IN_EDIT_MODE                   TYPE        IF_ESF_TYPES=>TY_EDIT_MODE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_BUFFER_SYNC_HANDLER         TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER(optional)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_FAILED_NODE_IDS            TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD retrieve_qrn_task.

    DATA:
      ls_query_options      TYPE sesf_query_options,
      lv_retrieve_date_time TYPE gdt_global_date_time,
      lr_out_data           TYPE REF TO data,
      lsr_out_data          TYPE REF TO data,
      lv_where_cond         TYPE string,
      lv_query_name         TYPE string,
      lt_sorted_node_id     LIKE in_node_ids,
      lt_requested_attributes  TYPE sesf_string_tab.


** BEGIN: For Action Properties
    TYPES:
    BEGIN OF ty_action_indicators,
      task_type_uuid TYPE a1fia_qrntask_view_elements-task_type_uuid-content,
      forward_enabled_indicator TYPE a1fia_qrntask_view_elements-forward_enabled_indicator,
      escalation_enabled_indicator TYPE  a1fia_qrntask_view_elements-escalation_enabled_indicator,
    END OF ty_action_indicators.

    DATA:
      ls_action_indicators TYPE ty_action_indicators,
      lt_action_indicators TYPE TABLE OF ty_action_indicators,

      lt_task_type         TYPE sbtm_typ_tt_id,
      lt_task_type_attrib  TYPE sbtm_api_task_type_attrib_tab.
** END: For Action Properties

    FIELD-SYMBOLS:
      <ls_out_data>         TYPE any,
      <lt_out_data>         TYPE INDEX TABLE,
      <lv_node_id>          TYPE sesf_bo_node_id,
      <lv_parent_node_id>   TYPE sesf_bo_node_id,
      <ls_task_field>       TYPE a1fia_qrntask_view_elements,
      <lt_temp_out_data>    TYPE STANDARD TABLE,
      <ls_temp_out_data>    TYPE any,
      <ls_task_type>        TYPE a1fia_qrntask_view_elements-task_type_uuid-content, "sbtm_task_type_id,
      <ls_task_type_attrib> TYPE sbtm_api_task_type_attribs.

* Clear export variables
    CLEAR:
      out_data,
      out_failed_node_ids.

    CREATE DATA:
      lr_out_data  LIKE out_data,
      lsr_out_data LIKE LINE OF out_data.
    ASSIGN:
     lr_out_data->*  TO <lt_temp_out_data>,
     lsr_out_data->* TO <ls_temp_out_data>.

    CONSTANTS:
      lc_node_id                   TYPE string VALUE 'NODE_ID',
      lc_parent_node_id            TYPE string VALUE 'PARENT_NODE_ID',
      lc_task_field                TYPE string VALUE 'TASK',
      lc_task_type_uuid            TYPE string VALUE 'TASK-TASK_TYPE_UUID-CONTENT',
      lc_forward_enabled_indicator TYPE string VALUE 'TASK-FORWARD_ENABLED_INDICATOR',
      lc_escalation_enabled        TYPE string VALUE 'TASK-ESCALATION_ENABLED_INDICATOR',
      lc_task_message              TYPE string VALUE 'TaskMessage'. "#EC NOTEXT

    lt_requested_attributes = in_requested_attributes.
    if lt_requested_attributes IS NOT INITIAL.
      enrich_requested_attributes( EXPORTING in_bo_node_name = in_bo_node_name
                                   CHANGING ct_requested_attributes = lt_requested_attributes ).
      SORT lt_requested_attributes.
      DELETE ADJACENT DUPLICATES FROM lt_requested_attributes.
    ENDIF.

* correction due to CSN 6386071
    ls_query_options-maximum_rows = -1.

    lv_query_name = get_query_for_bo_node( in_bo_node_name ).
    GET TIME STAMP FIELD lv_retrieve_date_time.

    CALL METHOD mo_qrs_provider->retrieve_by_node_ids
      EXPORTING
        in_bo_node_name    = in_bo_node_name
        in_query_name      = lv_query_name
        in_node_ids        = in_node_ids
        in_query_options   = ls_query_options
        in_message_handler = in_message_handler
        in_requested_attributes = lt_requested_attributes
      IMPORTING
        out_data           = out_data.

    IF lines( out_data ) <> lines( in_node_ids ).
      lt_sorted_node_id = in_node_ids.

      SORT lt_sorted_node_id.

      LOOP AT out_data ASSIGNING <ls_out_data>.
        ASSIGN COMPONENT 'NODE_ID' OF STRUCTURE <ls_out_data> TO <lv_node_id>.
        READ TABLE lt_sorted_node_id WITH KEY table_line = <lv_node_id>
          TRANSPORTING NO FIELDS BINARY SEARCH.
        IF sy-subrc = 0.
          DELETE lt_sorted_node_id INDEX sy-tabix.
        ENDIF.
      ENDLOOP.

      out_failed_node_ids = lt_sorted_node_id.

      IF <ls_out_data> IS ASSIGNED.
        UNASSIGN <ls_out_data>.
      ENDIF.
      IF <lv_node_id> IS ASSIGNED.
        UNASSIGN <lv_node_id>.
      ENDIF.

    ENDIF.

    ASSIGN out_data TO  <lt_out_data>.
*  Update the task status
    LOOP AT <lt_out_data> ASSIGNING <ls_out_data>.

      ASSIGN COMPONENT:
       lc_node_id        OF STRUCTURE <ls_out_data> TO <lv_node_id>,
       lc_parent_node_id OF STRUCTURE <ls_out_data> TO <lv_parent_node_id>,
       lc_task_field     OF STRUCTURE <ls_out_data> TO <ls_task_field>.
      <lv_parent_node_id> = <lv_node_id>.

* Set the action indicators as enabled by default
* disabling based on task type metadata done below
      <ls_task_field>-forward_enabled_indicator = 'X'.
      <ls_task_field>-escalation_enabled_indicator = 'X'.
      <ls_task_field>-icon_id = lc_task_message.
      CASE <ls_task_field>-life_cycle_status_code.
        WHEN 'W'  OR 'R' OR 'P'.
          <ls_task_field>-life_cycle_status_code = 1.
        WHEN 'S'.
          <ls_task_field>-life_cycle_status_code = 2.
        WHEN 'C' OR 'X'.
          <ls_task_field>-life_cycle_status_code = 3.
        WHEN OTHERS.
          <ls_task_field>-life_cycle_status_code = 0.
      ENDCASE.
    ENDLOOP.

* Get distinct task type IDs
    <lt_temp_out_data> = out_data.
    SORT <lt_temp_out_data> BY (lc_task_type_uuid).
    DELETE ADJACENT DUPLICATES FROM <lt_temp_out_data> COMPARING (lc_task_type_uuid).
    LOOP AT <lt_temp_out_data> ASSIGNING <ls_out_data>.
      ASSIGN COMPONENT lc_task_type_uuid OF STRUCTURE <ls_out_data> TO <ls_task_type>.
      APPEND <ls_task_type> TO lt_task_type.
    ENDLOOP.

* Get Task type metadata
    CALL FUNCTION 'SBTM_API_GET_TASK_TYPES'
      EXPORTING
        task_types           = lt_task_type
      IMPORTING
        task_type_attributes = lt_task_type_attrib.

    LOOP AT lt_task_type_attrib ASSIGNING <ls_task_type_attrib>
      WHERE ( forward_flag = abap_false OR escalation_task_type_id IS INITIAL ).

      ls_action_indicators-task_type_uuid = <ls_task_type_attrib>-task_type_id.
      ls_action_indicators-forward_enabled_indicator = <ls_task_type_attrib>-forward_flag.

      IF  <ls_task_type_attrib>-escalation_task_type_id IS INITIAL.
        ls_action_indicators-escalation_enabled_indicator = abap_false.
      ELSE.
        ls_action_indicators-escalation_enabled_indicator = abap_true.
      ENDIF.

      APPEND ls_action_indicators TO lt_action_indicators.
    ENDLOOP.

* Set the Action Indicators to disabled based on the metadata,
* Action Indicators were set to enabled by default in loop above
    CONCATENATE lc_task_type_uuid ' = LS_ACTION_INDICATORS-TASK_TYPE_UUID' INTO lv_where_cond. "#EC NOTEXT
    LOOP AT lt_action_indicators INTO ls_action_indicators.
      ASSIGN COMPONENT lc_task_field OF STRUCTURE <ls_temp_out_data> TO <ls_task_field>.
      <ls_task_field>-forward_enabled_indicator = ls_action_indicators-forward_enabled_indicator.
      <ls_task_field>-escalation_enabled_indicator =  ls_action_indicators-escalation_enabled_indicator.
      MODIFY out_data FROM <ls_temp_out_data> TRANSPORTING (lc_forward_enabled_indicator) (lc_escalation_enabled)
      WHERE  (lv_where_cond).
    ENDLOOP.

    CALL METHOD enrich_retrieved_data
      EXPORTING
        in_co_node_name   = in_bo_node_name
        in_requested_attributes = in_requested_attributes
      CHANGING
        in_retrieved_data = out_data.

*   buffer retrieved datae time
    buffer_retrieved_date_time(
      EXPORTING
        in_bo_node_name  = in_bo_node_name
        iv_retrieve_time = lv_retrieve_date_time
        out_data         = out_data ).

  ENDMETHOD.                    "RETRIEVE_QRN_TASK


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_OWL2_CO->RETRIEVE_ROOT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [--->] IN_EDIT_MODE                   TYPE        IF_ESF_TYPES=>TY_EDIT_MODE
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_BUFFER_SYNC_HANDLER         TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER(optional)
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_FAILED_NODE_IDS            TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD retrieve_root.

    DATA lr_data TYPE REF TO data.

    FIELD-SYMBOLS <ls_root> TYPE any.
    FIELD-SYMBOLS <lv_node_id> TYPE any.
    FIELD-SYMBOLS <lv_alt_key> TYPE any.

    CLEAR out_data.
    CLEAR out_failed_node_ids.

    CREATE DATA lr_data LIKE LINE OF out_data.

    ASSIGN lr_data->* TO <ls_root>.
    IF <ls_root> IS NOT ASSIGNED.
      out_failed_node_ids = in_node_ids.
      RETURN.
    ENDIF.

    ASSIGN COMPONENT gv_node_id OF STRUCTURE <ls_root> TO <lv_node_id>.
    CHECK <lv_node_id> IS ASSIGNED.

    ASSIGN COMPONENT mv_alt_key_name_root OF STRUCTURE <ls_root> TO <lv_alt_key>.
    IF sy-subrc NE 0.
      ASSIGN COMPONENT mv_alt_key_name_root_company OF STRUCTURE <ls_root> TO <lv_alt_key>.
      IF sy-subrc NE 0.
        ASSIGN COMPONENT gv_node_id OF STRUCTURE <ls_root> TO <lv_alt_key>.
        ASSERT sy-subrc = 0.
      ENDIF.
    ENDIF.

    LOOP AT in_node_ids INTO <lv_node_id>.
      <lv_alt_key> = <lv_node_id>."Alternate key an node_id are equal by definition!
      APPEND <ls_root> TO out_data.
    ENDLOOP.

  ENDMETHOD.                    "IF_ESF_PROVIDER_ACCESS~RETRIEVE
ENDCLASS.