class CL_A1FIA_AAR_CREATE_QAF_ECO definition
  public
  inheriting from CL_A1FIA_COMMON_ECO
  create public .

public section.

  interfaces IF_A1FIA_AAR_CREATE_QAF_ECO .
  interfaces IF_BSA_CB_MESSAGE_MAPPING .
  interfaces IF_BSA_CB_PATH .

  class-data MO_SOB_LCP type ref to IF_ESF_LCP .
  constants GC_BPVT_CODE_DIR_PROJECTS type STRING value '91' ##no_text .
  constants GC_BPVT_CODE_OVH_PROJECTS type STRING value '90' ##no_text .
  data MV_BGJOB_SCHEDULED_NODE_ID type SESF_BO_NODE_ID .
  data MO_ECO_DESCRIPTOR type ref to IF_ESF_BO_DESC .
  constants GC_BPVT_CODE_GRF_PROJECTS type STRING value '546' ##no_text .

  interface IF_A1FIA_AAR_CREATE_QAF_ECO load .
  methods MODIFY_CORE_BO_FROM_ECO_ROOT
    importing
      !IT_CHANGED_ATTRIBUTES type SESF_STRING_TAB
      !IS_ECO_ROOT type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT
      !IO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .

  methods IF_ESF_PROVIDER_ACCESS~CHECK
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~MODIFY
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_DEFAULT_NODE_VALUES
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
    redefinition .
  methods IF_ESF_PROVIDER_SUBSCRIPTION~ON_BO_CHANGED
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_CODE_VALUES
    redefinition .
  methods IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_VALUE_SET
    redefinition .
protected section.

  methods GET_SUB_CONTEXT
    redefinition .
  methods GET_TASK_REGION_BO_DETAILS
    redefinition .
private section.

  types:
    BEGIN OF ty_attribute_map,
              eco_attr_name     TYPE string,
              is_dedicated      TYPE syboolean,
              dedicated_exit    TYPE REF TO lcl_dedic_attr_default_exit,
              core_bo_node_name TYPE string,
              core_bo_attr_name TYPE string,
              core_bo_node_id   TYPE sesf_bo_node_id,
            END OF ty_attribute_map .
  types:
    tt_attribute_map TYPE SORTED TABLE OF ty_attribute_map
           WITH UNIQUE KEY primary_key COMPONENTS eco_attr_name
           WITH NON-UNIQUE SORTED KEY core_bo_node_key COMPONENTS core_bo_node_name .
  types:
    BEGIN OF ty_attribute_pair,
          eco_attr_name TYPE string,
          core_bo_attr_name TYPE string,
        END OF ty_attribute_pair .
  types:
    tt_attribute_pair TYPE SORTED TABLE OF ty_attribute_pair WITH UNIQUE KEY core_bo_attr_name .

  data MC_ACTIVATE_ACTION_ENABLED type SESF_BOOLEAN value 'X' ##no_text .
  data MC_EXECUTE_ACTION_ENABLED type SESF_BOOLEAN value 'X' ##no_text .
  data MO_LCP_BO type ref to IF_ESF_LCP .
  data MO_MDRO_SCHEDULE_IMMEDIATELY type ref to CL_AP_MDRO_SCHED_IMMED_WAIT .
  data MO_TASK_REGION_HELPER type ref to IF_COUTL_TASK_REGION_HELPER .
  interface IF_A1FIA_AAR_CREATE_QAF_ECO load .
  data MS_READONLY_ECO_ROOT type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT .
  data MT_ATTRIBUTE_MAP type TT_ATTRIBUTE_MAP .
  data:
    mt_eco_root_attributes TYPE SORTED TABLE OF string WITH UNIQUE KEY table_line .
  data MT_RUN_SPECIFIC_NODE type SESF_STRING_TAB .
  data MS_ACTION_PARAMETERS type A1FIA_RUN_SCHEDULE_DIRECTLY_AC .
  data MV_CALL_AFTER_SAVE type STRING .
  data MV_ECO_ROOT_NODE_ID type SESF_BO_NODE_ID .
  data MO_LCP_FACADE type ref to IF_ESF_LCP_FACADE .
  data MT_DEDICATED_ATTRIBUTES type SESF_STRING_TAB .
  type-pools ABAP .
*  type-pools ABAP . " obsolete
  data MV_HAS_SYNC_NOTIFICATIONS type SESF_BOOLEAN value ABAP_FALSE .

  class CM_ESI_ROOT definition load .
  methods ADD_MAPPED_MESSAGES_INT
    importing
      !IT_MESSAGE type CM_ESI_ROOT=>TT_ESI_ROOT
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER optional
    exporting
      !ET_ECO_MESSAGE type CM_ESI_ROOT=>TT_ESI_ROOT .
  interface IF_BSA_CB_MESSAGE_MAPPING load .
  methods ADJUST_MESSAGES_INT
    exporting
      !ET_ECO_MESSAGE type CM_ESI_ROOT=>TT_ESI_ROOT
    changing
      !CT_MESSAGE_MAP type IF_BSA_CB_MESSAGE_MAPPING=>TT_MESSAGE_MAPPING .
  methods CHECK_ACTIVATE_ENABLED
    importing
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
    returning
      value(RT_ENABLED) type SESF_BOOLEAN .
  methods CHECK_AND_FILL_SOB_COMP
    importing
      !IR_ROOT_MODIFICATION type ref to SESF_ACCESS_MODIFY
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  interface IF_ESF_TYPES load .
  methods CHECK_FOR_ERRORS
    importing
      !IN_MESSAGES type IF_ESF_TYPES=>TY_MESSAGES
    returning
      value(RT_HAS_ERRORS) type SESF_BOOLEAN .
  methods CHECK_MANDATORY_ATTR_FILLED
    changing
      !CV_SAVE_REJECTED type SYBOOLEAN
      !CT_MESSAGE type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods CLEAR_BUFFERS .
  methods DERIVE_AFFECTED_ASSOCIATIONS
    importing
      !IS_CHANGE_NOTIFICATION type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    returning
      value(RT_AFFECTED_ASSOCIATIONS) type SESF_STRING_TAB .
  methods EXTRACT_EDITABLE_NON_INIT_ATTR
    importing
      !IS_CO_ATTR_STRUCT type ANY
      !IS_NODE_DATA type ANY
      !IV_BO_NODE_NAME type STRING
    changing
      !CT_CHANGED_ATTRIBUTES type SESF_STRING_TAB .
  methods GET_AFFECTED_CORE_BO_NODES
    importing
      !IS_CHANGE_NOTIFICATION type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
    returning
      value(RT_AFFECTED_CORE_NODES) type SESF_STRING_TAB .
  class-methods GET_BO_NAME_FROM_MDRO_TYPE
    importing
      !IV_MDRO_TYPE_CODE type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ACTION_P-ROOT-CREATE-MDRO_TYPE_CODE
    returning
      value(RV_BO_NAME) type STRING
    raising
      CX_A1FIA_AAR_CREATE_QAF_ECO .
  methods GET_ECO_CORE_ATTR_PAIR_FOR_NOD
    importing
      !IV_CORE_BO_NODE_NAME type STRING
    exporting
      !ET_ECO_CORE_ATTR_PAIR type TT_ATTRIBUTE_PAIR
      !ET_ECO_ATTR_NAME type SESF_STRING_TAB
      !ET_CORE_BO_ATTR_NAME type SESF_STRING_TAB .
  methods GET_ROOT_DEDICATED_ATTR_NAMES
    returning
      value(RT_ROOT_DEDICATED_ATTRIBUTES) type SESF_STRING_TAB .
  methods GET_ROOT_MAPED_ATTR_FOR_DEDICA
    importing
      !IT_REQUESTED_ATTRIBUTES type SESF_STRING_TAB
    exporting
      !ET_MAPPED_REQ_ATTRIBUTES type SESF_STRING_TAB .
  class-methods GET_UUID
    returning
      value(RV_UUID) type SYSUUID_C32 .
  methods HANDLE_CREATE_WITH_REF_ACTIONS
    importing
      !IV_FOR_CANCELLATION type SESF_BOOLEAN
      !IT_NODE_ID type SESF_BO_NODE_ID_TAB
      !IT_REFERENCING_NODE_ELEMENTS type SESF_BO_NODE_REFERENCE_T
      !IO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IV_IS_TEST_RUN type SESF_BOOLEAN
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods HANDLE_DEDICATED_ATTR_MODIFIC
    changing
      !CS_ROOT type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT
      !CT_CHANGED_ATTR type SESF_STRING_TAB .
  methods HANDLE_NOTIFICATIONS
    importing
      !IS_CHANGE_NOTIFICATION type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
      !IO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER .
  methods HANDLE_ROOT_DEDICATED_FIELDS
    importing
      !IT_REQUESTED_ATTRIBUTES type SESF_STRING_TAB optional
      !IV_MODE_GET_ALL_DEDICATED_ATTR type SESF_BOOLEAN optional
      !IV_MODE_GET_RELEVNT_MAPED_ATTR type SESF_BOOLEAN optional
      !IV_MODE_FILL_DEDICTED_ATTR_VAL type SESF_BOOLEAN optional
    exporting
      !ET_ECO_ATTRIBUTES type SESF_STRING_TAB
    changing
      !CS_ECO_ROOT type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT optional .
  methods INIT_BUFFERS
    raising
      CX_A1FIA_AAR_CREATE_QAF_ECO .
  methods POPULATE_ATTRIBUTE_MAP .
  methods POPULATE_DEDICATED_ATTRIB .
  methods POPULATE_ECO_ROOT_ATTR_NAMES
    importing
      !IS_CO_ATTR_STRUCT type ANY optional
    changing
      !CT_ECO_NODE_ATTRIBUTES type SESF_STRING_TAB optional
    raising
      CX_A1FIA_AAR_CREATE_QAF_ECO .
  methods POPULATE_RUN_SPECIFIC_NODES
    raising
      CX_A1FIA_AAR_CREATE_QAF_ECO .
  methods PREPARE_CORE_VAL_HELP_RETRIEVE
    importing
      !IV_ECO_ATTR_NAME type STRING
      !IV_ECO_NODE_NAME type STRING
      !IV_ECO_NODE_ID type SESF_BO_NODE_ID
    exporting
      !EV_CORE_BO_NODE_NAME type STRING
      !EV_CORE_BO_NODE_ID type SESF_BO_NODE_ID
      !EV_CORE_BO_NODE_ID_IS_HANDLE type SESF_BOOLEAN
      !EV_CORE_BO_ATTR_NAME type STRING .
  interface IF_FIA_SET_OF_BOOKS load .
  methods QUERY_SOB_BY_COMP_SOB
    importing
      !IT_SELECTION_PARAM type SESF_SELECTION_PARAMETERS_TAB
      !IT_REQUESTED_ATTR type SESF_STRING_TAB optional
    exporting
      !ET_DATA_COMP_ACTIVATION_STAT type IF_FIA_SET_OF_BOOKS=>TT_COMPANY_ASSIGNMENT .
  methods RAISE_STOP_MESSAGE
    importing
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods RESTRICT_PROJECTID_VALUE_SET
    importing
      !IN_SELECTION_PARAMETERS type SESF_SELECTION_PARAMETERS_TAB
    returning
      value(OUT_VALUE_SET_NODE_IDS) type SESF_BO_NODE_ID_TAB .
  methods RETRIVE_SOB_ROOT_ID_BY_NODE_ID
    importing
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
    exporting
      !ET_DATA_SOB_ROOT type IF_FIA_SET_OF_BOOKS=>TT_ROOT .
  methods ROOT_NODE_ID_EXISTS
    importing
      !IV_ROOT_NODE_ID type SESF_BO_NODE_ID
    returning
      value(RV_ROOT_NODE_ID_EXISTS) type SESF_BOOLEAN .
  methods SET_ATTR_PROPERTIES
    importing
      !IT_ECO_ATTR_NAME type SESF_STRING_TAB
      !IO_PROPERTY_HANDLER type ref to IF_ESF_PROPERTY_HANDLER
      !IV_PROPERTY_NAME type STRING
      !IV_PROPERTY_VALUE type SESF_BOOLEAN
      !IV_ECO_NODE_ID type SESF_BO_NODE_ID .
  methods SET_ROOT_DEDICATED_ATTRIBUTES
    importing
      !IT_REQUESTED_ATTRIBUTES type SESF_STRING_TAB
    changing
      !CS_ECO_ROOT type IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT .
  methods TRANSLATE_MESSAGE_LOCATION
    importing
      !IS_MESSAGE_LOCATION type CM_ESI_ROOT=>TY_MESSAGE_LOCATION
    returning
      value(RS_NEW_MESSAGE_LOCATION) type CM_ESI_ROOT=>TY_MESSAGE_LOCATION .
  methods SET_NODE_N_ASSOC_READ_ONLY
    importing
      !IO_PROPERTY_HANDLER type ref to IF_ESF_PROPERTY_HANDLER
      !IT_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IV_NODE_NAME type STRING .
  methods IS_FLOORPLAN_EDITABLE
    returning
      value(RV_IS_EDITABLE) type SYBOOLEAN .
ENDCLASS.



CLASS CL_A1FIA_AAR_CREATE_QAF_ECO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->ADD_MAPPED_MESSAGES_INT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_MESSAGE                     TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER(optional)
* | [<---] ET_ECO_MESSAGE                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD add_mapped_messages_int.
* If et_eco_message IS REQUESTED then the eco mapped messages wont be added to message handler/message manager.
* else if message handler is provided the eco mapped messages are put into the handler
* else the eco mapped messages are put into message manager
    DATA lo_message TYPE REF TO cm_esi_root.
    DATA lt_message_map TYPE if_bsa_cb_message_mapping=>tt_message_mapping.
    DATA ls_message_map LIKE LINE OF lt_message_map.

    DATA lx_esf_message_handler TYPE REF TO cx_esf_message_handler.

    IF it_message IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT it_message INTO lo_message.
      CLEAR ls_message_map.
      ls_message_map-original_message = lo_message.
      APPEND ls_message_map TO lt_message_map.
    ENDLOOP.

    adjust_messages_int(
      IMPORTING
        et_eco_message = et_eco_message
      CHANGING
        ct_message_map = lt_message_map
    ).

    IF et_eco_message IS NOT REQUESTED.
      IF io_message_handler IS SUPPLIED.
        TRY.
            io_message_handler->add_messages( et_eco_message ).
          CATCH cx_esf_message_handler INTO lx_esf_message_handler.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_message_handler.
        ENDTRY.
      ELSE.
        mo_message_manager->add_messages( et_eco_message ).
      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->ADJUST_MESSAGES_INT
* +-------------------------------------------------------------------------------------------------+
* | [<---] ET_ECO_MESSAGE                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* | [<-->] CT_MESSAGE_MAP                 TYPE        IF_BSA_CB_MESSAGE_MAPPING=>TT_MESSAGE_MAPPING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD adjust_messages_int.

    DATA lo_original_msg TYPE REF TO cm_esi_root.
    DATA lo_source_for_copying TYPE REF TO cm_esi_root.
    DATA ls_new_msg_origin_loc TYPE cm_esi_root=>ty_message_location.
    DATA ls_new_msg_envr_location TYPE cm_esi_root=>ty_message_location.
    DATA lr_location TYPE REF TO cm_esi_root=>ty_message_location.
    DATA lt_new_msg_envr_location TYPE cm_esi_root=>tt_message_locations.

    FIELD-SYMBOLS <lo_message_map>  LIKE LINE OF ct_message_map.

    CLEAR et_eco_message.

    IF mv_eco_root_node_id IS INITIAL.
      RETURN.
    ENDIF.

    LOOP AT ct_message_map ASSIGNING <lo_message_map>.

      lo_original_msg = <lo_message_map>-original_message.
      ls_new_msg_origin_loc = translate_message_location( lo_original_msg->origin_location ).

      CLEAR lt_new_msg_envr_location.
      LOOP AT lo_original_msg->environment_locations REFERENCE INTO lr_location.
        ls_new_msg_envr_location = translate_message_location( lr_location->* ).
        IF ls_new_msg_envr_location IS NOT INITIAL.
          APPEND ls_new_msg_envr_location TO lt_new_msg_envr_location.
        ENDIF.
      ENDLOOP.

      IF ls_new_msg_origin_loc IS INITIAL.
        ls_new_msg_origin_loc-bo_name = if_a1fia_aar_create_qaf_eco=>co_bo_name.
        ls_new_msg_origin_loc-bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
        ls_new_msg_origin_loc-bo_node_id = mv_eco_root_node_id.
      ENDIF.

      IF <lo_message_map>-mapped_message IS NOT INITIAL.
        lo_source_for_copying = <lo_message_map>-mapped_message.
      ELSE.
        lo_source_for_copying = <lo_message_map>-original_message. "This occurs when called internally (NOT from IF_BSA_CB_MESSAGE_MAPPING~ADJUST_MESSAGES)
      ENDIF.

      <lo_message_map>-mapped_message =  lo_source_for_copying->copy_with_new_location(
                                          new_origin_location       =  ls_new_msg_origin_loc
                                          new_environment_locations =  lt_new_msg_envr_location
                                          new_message_lifetime      =  lo_source_for_copying->lifetime
                                      ).
    ENDLOOP.

    IF et_eco_message IS REQUESTED.
      CLEAR et_eco_message.
      LOOP AT ct_message_map ASSIGNING <lo_message_map>.
        APPEND <lo_message_map>-mapped_message TO et_eco_message.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->CHECK_ACTIVATE_ENABLED
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<-()] RT_ENABLED                     TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_activate_enabled.

    DATA:
          lo_ex                       TYPE REF TO         cx_esf_core_service,
           ls_property_scope          TYPE                if_esf_types=>ty_property_scope,
           lt_actions                 TYPE                sesf_string_tab,
           lt_out_properties          TYPE                if_esf_types=>ty_properties.

    FIELD-SYMBOLS: <node_id>  LIKE LINE OF in_node_ids,
                   <out_properties> TYPE LINE OF if_esf_types=>tt_action_properties.

    TRY.

        APPEND if_fia_acc_adjustment_run=>co_action-root-activate TO lt_actions.
        ls_property_scope-requested_actions = lt_actions.

        CALL METHOD mo_lcp_bo->retrieve_properties
          EXPORTING
            in_bo_node_name   = if_fia_acc_adjustment_run=>co_bo_node-root
            in_node_ids       = in_node_ids
            in_property_scope = ls_property_scope
          IMPORTING
            out_properties    = lt_out_properties.

        READ TABLE in_node_ids INDEX 1 ASSIGNING <node_id>.

        READ TABLE lt_out_properties-action_properties WITH KEY
        node_id          = <node_id>
        action_name      = if_fia_acc_adjustment_run=>co_action-root-activate
        property_name    = if_esf_desc=>co_property_enabled
        ASSIGNING <out_properties>.

        IF sy-subrc EQ 0.
          IF <out_properties>-property_value IS INITIAL.
            rt_enabled = abap_false.
          ELSE.
            rt_enabled = abap_true.
          ENDIF.
        ELSE.
          rt_enabled = mc_activate_action_enabled.
        ENDIF.

      CATCH cx_esf_core_service INTO lo_ex.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lo_ex.
    ENDTRY.
  ENDMETHOD.                    "check_activate_enabled


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->CHECK_AND_FILL_SOB_COMP
* +-------------------------------------------------------------------------------------------------+
* | [--->] IR_ROOT_MODIFICATION           TYPE REF TO SESF_ACCESS_MODIFY
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_and_fill_sob_comp.
* If company has been changed then check whether there is only one SOB active for this Company and default the same
* Same if the SOB has been changed
    DATA lv_sob_changed            TYPE sesf_boolean VALUE abap_false.
    DATA lv_company_changed        TYPE sesf_boolean VALUE abap_false.
    DATA lv_partially_active_assgn TYPE sesf_boolean.
    DATA lt_sob_id                 TYPE if_fia_set_of_books=>tt_key-root-id.
    DATA lt_company_id             TYPE /mom/if_organisational_centre=>tt_key-root-id.

    FIELD-SYMBOLS <ls_eco_root>    TYPE if_a1fia_aar_create_qaf_eco=>ty_root.

    ASSIGN ir_root_modification->data->* TO <ls_eco_root>.
    CHECK sy-subrc = 0.

    READ TABLE ir_root_modification->changed_attributes TRANSPORTING NO FIELDS
      WITH TABLE KEY table_line = if_a1fia_aar_create_qaf_eco=>co_attr-root-company_id.
    IF sy-subrc = 0.
      lv_company_changed = abap_true.
    ENDIF.

    READ TABLE ir_root_modification->changed_attributes TRANSPORTING NO FIELDS
      WITH TABLE KEY table_line = if_a1fia_aar_create_qaf_eco=>co_attr-root-set_of_books_id-content.
    IF sy-subrc = 0.
      lv_sob_changed = abap_true.
    ENDIF.

    IF lv_company_changed = abap_true AND lv_sob_changed = abap_true."Both have been changed by the user. No need to default
      RETURN.
    ENDIF.

    IF lv_company_changed = abap_true AND <ls_eco_root>-company_id IS NOT INITIAL
      OR lv_sob_changed = abap_true AND <ls_eco_root>-set_of_books_id-content IS NOT INITIAL.

      IF ms_readonly_eco_root-projection_bo_name = 'FIA_FIXED_ASSET_DEPR'.
        lv_partially_active_assgn = abap_true.
      ENDIF.

*    IF lines( lt_data_comp_activation_stat ) <> 1.
*      RETURN. "Either Zero or More than one SOB assignment found active for the given company. Hence no defaulting is to be done for SOB
*    ENDIF.

      IF lv_company_changed = abap_true.
        "Default/Change the company if it is not the same as already existing one

        CALL METHOD cl_a1fia_aar_util=>get_sob_for_company_id
          EXPORTING
            iv_company_id             = <ls_eco_root>-company_id
            iv_partially_active_assgn = lv_partially_active_assgn
            io_adaption_handler       = mo_adaptation_handler
          IMPORTING
            et_sob_id                 = lt_sob_id.

        READ TABLE lt_sob_id TRANSPORTING NO FIELDS
          WITH KEY content = ms_readonly_eco_root-set_of_books_id-content.
        IF sy-subrc <> 0."If the current SOB is already a valid one do not clear it
          IF lines( lt_sob_id ) = 1.
            READ TABLE lt_sob_id INTO <ls_eco_root>-set_of_books_id INDEX 1.
          ELSE.
            CLEAR <ls_eco_root>-set_of_books_id.
          ENDIF.
          APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-set_of_books_id-content TO ir_root_modification->changed_attributes.
        ENDIF.
      ELSE.
        "Default the SOB (first get it from root node)
        CALL METHOD cl_a1fia_aar_util=>get_company_for_sob_id
          EXPORTING
            iv_sob_id                 = <ls_eco_root>-set_of_books_id
            iv_partially_active_assgn = lv_partially_active_assgn
            io_adaption_handler       = mo_adaptation_handler
          IMPORTING
            et_company_id             = lt_company_id.

        READ TABLE lt_company_id TRANSPORTING NO FIELDS
          WITH KEY table_line = ms_readonly_eco_root-company_id.
        IF sy-subrc <> 0."If the current company is already a valid one do not clear it
*         Default/Change the SOB to the only active one just found if it is not as already existing one
          IF lines( lt_company_id ) = 1.
            READ TABLE lt_company_id INTO <ls_eco_root>-company_id INDEX 1.
          ELSE.
            CLEAR <ls_eco_root>-company_id.
          ENDIF.
          APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-company_id TO ir_root_modification->changed_attributes.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->CHECK_FOR_ERRORS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_MESSAGES                    TYPE        IF_ESF_TYPES=>TY_MESSAGES
* | [<-()] RT_HAS_ERRORS                  TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_for_errors.
    FIELD-SYMBOLS: <msg> LIKE LINE OF in_messages.

    rt_has_errors = abap_false.

    LOOP AT in_messages ASSIGNING <msg>.

      IF <msg>->severity = cm_root=>co_severity_error OR
         <msg>->severity = cm_root=>co_severity_abend.

        rt_has_errors = abap_true.
        EXIT.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.                    "check_for_errors


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->CHECK_MANDATORY_ATTR_FILLED
* +-------------------------------------------------------------------------------------------------+
* | [<-->] CV_SAVE_REJECTED               TYPE        SYBOOLEAN
* | [<-->] CT_MESSAGE                     TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_mandatory_attr_filled.
    CONSTANTS lc_msg_class TYPE string VALUE 'A1FIA_AAR_CREATE_QAF'.

    cv_save_rejected = abap_false.
* Mandatory fields check on Root node

    IF ms_readonly_eco_root-projection_bo_name = 'FIA_FIXED_ASSET_DEPR'.
"      Rainer Soltek: this is NOT mandatory

*      CASE ms_readonly_eco_root-assignment_type.
*        WHEN if_fia_cfg_cost_object_type_c=>gc_cost_center.
*          IF ms_readonly_eco_root-cost_centre_id IS INITIAL.
*            cv_save_rejected = abap_true.
*            cl_a1fia_aar_util=>create_message(
*             EXPORTING
*               iv_message_class  = lc_msg_class
*               iv_message_number = '026'
*               iv_severity       = cm_esi_root=>co_severity_error
*               iv_lifetime       = cm_esi_root=>co_lifetime_transition
*             CHANGING
*               ct_message        = ct_message
*         ).
*          ENDIF.
*        WHEN if_fia_cfg_cost_object_type_c=>gc_project_task_ohc.
*          IF ms_readonly_eco_root-project_task_id IS INITIAL.
*            cv_save_rejected = abap_true.
*            cl_a1fia_aar_util=>create_message(
*             EXPORTING
*               iv_message_class  = lc_msg_class
*               iv_message_number = '027'
*               iv_severity       = cm_esi_root=>co_severity_error
*               iv_lifetime       = cm_esi_root=>co_lifetime_transition
*             CHANGING
*               ct_message        = ct_message
*           ).
*          ENDIF.
*        WHEN OTHERS.
*          "Do nothing
*      ENDCASE.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->CLEAR_BUFFERS
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD clear_buffers.
    CLEAR ms_action_parameters.
    CLEAR mt_eco_root_attributes.
    CLEAR mv_eco_root_node_id.
    CLEAR mt_attribute_map.
    CLEAR mo_lcp_bo.
    CLEAR mv_call_after_save.
    CLEAR mt_run_specific_node.
    CLEAR mo_task_region_helper.
    CLEAR ms_readonly_eco_root.
    CLEAR mo_mdro_schedule_immediately.
  ENDMETHOD.                    "clear_buffers


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->DERIVE_AFFECTED_ASSOCIATIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [<-()] RT_AFFECTED_ASSOCIATIONS       TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD derive_affected_associations.
    DATA lt_affected_core_nodes TYPE sesf_string_tab.
    DATA lv_affected_core_node TYPE string.

    CLEAR rt_affected_associations.
    lt_affected_core_nodes = get_affected_core_bo_nodes( is_change_notification ).

    LOOP AT lt_affected_core_nodes INTO lv_affected_core_node.
      CASE lv_affected_core_node.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_company.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-comp_fin_proc_ctrl TO rt_affected_associations.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-company TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_set_of_books.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-set_of_books TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_business_partner.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-bupa TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_cost_centre.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-cost_centre TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_production_lot.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-production_lot TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_cust_srvorg.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-cust_ser_org TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_fixed_asset.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-fixed_asset TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_house_bank.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-house_bank TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_ohc_asses_rule.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-ovh_asses_rule TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_permest.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-permanent_establishment TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_project.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-project TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_sales_org.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-sales_organisation TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-execution.
          APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-to_open_task TO rt_affected_associations.
        WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
          CASE ms_readonly_eco_root-mdro_type_code.
            WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_grir_clearing_run.
              APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-purchase_doc TO rt_affected_associations.
            WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_slsla_accruals_run
              OR if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_slsla_overhead_run.
              APPEND if_a1fia_aar_create_qaf_eco=>co_assoc-root-sal_ser_doc TO rt_affected_associations.
          ENDCASE.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->EXTRACT_EDITABLE_NON_INIT_ATTR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CO_ATTR_STRUCT              TYPE        ANY
* | [--->] IS_NODE_DATA                   TYPE        ANY
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<-->] CT_CHANGED_ATTRIBUTES          TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD extract_editable_non_init_attr.

    DATA: lx_esf_metadata_error         TYPE REF TO cx_esf_metadata_error,
          lo_bo_desc      TYPE REF TO if_esf_bo_desc,
          lo_bo_node_desc TYPE REF TO if_esf_bo_node_desc,
          lv_is_read_only TYPE sesf_boolean.

    FIELD-SYMBOLS: <lv_co_attr_field_struct> TYPE any,
                   <lv_field_value>          TYPE any.

    ASSERT ms_readonly_eco_root-projection_bo_name IS NOT INITIAL AND iv_bo_node_name IS NOT INITIAL.

* Whichever field has been set as not-initial from core BO would be added to changed attributes
    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE is_co_attr_struct TO <lv_co_attr_field_struct>.
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      ASSIGN COMPONENT 1 OF STRUCTURE <lv_co_attr_field_struct> TO <lv_field_value>.

      IF sy-subrc = 0.
*         <lv_co_attr_field_struct> is again a deep structure - recursive call
        extract_editable_non_init_attr(
          EXPORTING
            is_co_attr_struct         = <lv_co_attr_field_struct>
            is_node_data              = is_node_data
            iv_bo_node_name           = iv_bo_node_name
          CHANGING
            ct_changed_attributes     = ct_changed_attributes ).

      ELSE.
*     <lv_co_attr_field_struct> is char like so represents the field name (might be with hyphen)
*     Field exists then extract the field name if the field value is not initial
        UNASSIGN <lv_field_value>.
        ASSIGN COMPONENT <lv_co_attr_field_struct> OF STRUCTURE is_node_data TO <lv_field_value>.
        IF ( sy-subrc          = 0            ) AND
           ( <lv_field_value> IS NOT INITIAL  ).

          TRY.
              lo_bo_desc      = mo_provider_context->get_business_object_descriptor( ms_readonly_eco_root-projection_bo_name ).
              lo_bo_node_desc = lo_bo_desc->get_bo_node_descriptor( bo_node_proxy_name = iv_bo_node_name ).

              lv_is_read_only = lo_bo_node_desc->get_attribute_property_value(
                                attribute_proxy_name = <lv_co_attr_field_struct>
                                property_name = if_esf_desc=>co_property_read_only ).
*            This should always be an enabled attribute as the default value is non-initial for this. If it fails here the BO impl is wrong
*            lv_is_enabled = lo_bo_node_desc->get_attribute_property_value(
*                              attribute_proxy_name = <lv_co_attr_field_struct>
*                              property_name = if_esf_desc=>co_property_enabled ).

            CATCH cx_esf_metadata_error INTO lx_esf_metadata_error.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_metadata_error.
          ENDTRY.


*       set changed attribute only if "static" READ_ONLY property value is NOT true
          IF lv_is_read_only = abap_false." AND lv_is_enabled = abap_true.
            APPEND <lv_co_attr_field_struct> TO ct_changed_attributes.
          ENDIF.
        ENDIF.
      ENDIF.

    ENDDO.


  ENDMETHOD.                    "extract_editable_non_init_attr


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_AFFECTED_CORE_BO_NODES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [<-()] RT_AFFECTED_CORE_NODES         TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_affected_core_bo_nodes.
* Get the core BO nodes which are part of change notifications
    DATA ls_create_notify TYPE if_esf_types=>ty_create_notification.
    DATA ls_suc_create_notify TYPE if_esf_types=>ty_suc_create_notification.
    DATA ls_delete_notify TYPE if_esf_types=>ty_delete_notification.
    DATA ls_update_notify TYPE if_esf_types=>ty_update_notification.
    DATA ls_sync_notify TYPE if_esf_types=>ty_sync_notifications.

    CLEAR rt_affected_core_nodes.
    LOOP AT is_change_notification-create_notifications INTO ls_create_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE rt_affected_core_nodes TRANSPORTING NO FIELDS FROM ls_create_notify-bo_node_name.
      IF sy-subrc <> 0.
        APPEND ls_create_notify-bo_node_name TO rt_affected_core_nodes.
      ENDIF.
    ENDLOOP.

    LOOP AT is_change_notification-suc_create_notifications INTO ls_suc_create_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE rt_affected_core_nodes TRANSPORTING NO FIELDS FROM ls_suc_create_notify-bo_node_name.
      IF sy-subrc <> 0.
        APPEND ls_suc_create_notify-bo_node_name TO rt_affected_core_nodes.
      ENDIF.
    ENDLOOP.

    LOOP AT is_change_notification-delete_notifications INTO ls_delete_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE rt_affected_core_nodes TRANSPORTING NO FIELDS FROM ls_delete_notify-bo_node_name.
      IF sy-subrc <> 0.
        APPEND ls_delete_notify-bo_node_name TO rt_affected_core_nodes.
      ENDIF.
    ENDLOOP.

    LOOP AT is_change_notification-update_notifications INTO ls_update_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE rt_affected_core_nodes TRANSPORTING NO FIELDS FROM ls_update_notify-bo_node_name.
      IF sy-subrc <> 0.
        APPEND ls_update_notify-bo_node_name TO rt_affected_core_nodes.
      ENDIF.
    ENDLOOP.

    LOOP AT is_change_notification-sync_notifications INTO ls_sync_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE rt_affected_core_nodes TRANSPORTING NO FIELDS FROM ls_sync_notify-bo_node_name.
      IF sy-subrc <> 0.
        APPEND ls_sync_notify-bo_node_name TO rt_affected_core_nodes.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method CL_A1FIA_AAR_CREATE_QAF_ECO=>GET_BO_NAME_FROM_MDRO_TYPE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_MDRO_TYPE_CODE              TYPE        IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ACTION_P-ROOT-CREATE-MDRO_TYPE_CODE
* | [<-()] RV_BO_NAME                     TYPE        STRING
* | [!CX!] CX_A1FIA_AAR_CREATE_QAF_ECO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_bo_name_from_mdro_type.
    CASE iv_mdro_type_code.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_arpla_rgrp_run."11
        rv_bo_name = 'FIA_ARPLA_RGRP_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_arp_ledger_acct_rem."10
        rv_bo_name = 'FIA_ARP_LEDGER_ACCT_REM'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_bal_carfwd_run."13
        rv_bo_name = 'FIA_BAL_CARFWD_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_cashla_fcr_run."19
        rv_bo_name = 'FIA_CASHLA_FCR_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_fixed_asset_depr."52
        rv_bo_name = 'FIA_FIXED_ASSET_DEPR'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_grir_clearing_run."57
        rv_bo_name = 'FIA_GRIR_CLEARING_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_odcla_overhead_run."444
        rv_bo_name = 'FIA_ODCLA_OVERHEAD_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_ohcla_overhead_run."78
        rv_bo_name = 'FIA_OHCLA_OVERHEAD_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_ohc_asses_run."425
        rv_bo_name = 'FIA_OHC_ASSES_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_prdla_overhead_run."95
        rv_bo_name = 'FIA_PRDLA_OVERHEAD_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_slsla_accruals_run."112
        rv_bo_name = 'FIA_SLSLA_ACCRUALS_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_slsla_overhead_run."113
        rv_bo_name = 'FIA_SLSLA_OVERHEAD_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_wip_clearing_run."135
        rv_bo_name = 'FIA_WIP_CLEARING_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_settlment_run. "1436
        rv_bo_name = 'FIA_COB_SETTLEMENT_RUN'.
      WHEN if_a1fia_aar_create_qaf_eco_c=>mc_mdro_type_code-fia_fixed_asset_setlmnt_run. "1807
        rv_bo_name = 'FIA_FIXED_ASSET_SETLMNT_RUN'.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco.
    ENDCASE.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_ECO_CORE_ATTR_PAIR_FOR_NOD
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_CORE_BO_NODE_NAME           TYPE        STRING
* | [<---] ET_ECO_CORE_ATTR_PAIR          TYPE        TT_ATTRIBUTE_PAIR
* | [<---] ET_ECO_ATTR_NAME               TYPE        SESF_STRING_TAB
* | [<---] ET_CORE_BO_ATTR_NAME           TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_eco_core_attr_pair_for_nod.

    DATA ls_attribute_pair LIKE LINE OF et_eco_core_attr_pair.
    DATA ls_attribute_map LIKE LINE OF mt_attribute_map.

    CLEAR et_eco_core_attr_pair.
    CLEAR et_core_bo_attr_name.
    CLEAR et_eco_attr_name.

    LOOP AT mt_attribute_map INTO ls_attribute_map
      USING KEY core_bo_node_key WHERE core_bo_node_name = iv_core_bo_node_name.
      CLEAR ls_attribute_pair.

      ls_attribute_pair-core_bo_attr_name = ls_attribute_map-core_bo_attr_name.
      ls_attribute_pair-eco_attr_name = ls_attribute_map-eco_attr_name.
      INSERT ls_attribute_map-core_bo_attr_name INTO TABLE et_core_bo_attr_name.
      INSERT ls_attribute_map-eco_attr_name INTO TABLE et_eco_attr_name.
      INSERT ls_attribute_pair INTO TABLE et_eco_core_attr_pair.
    ENDLOOP.

  ENDMETHOD.                    "get_eco_core_attr_pair_for_nod


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_ROOT_DEDICATED_ATTR_NAMES
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RT_ROOT_DEDICATED_ATTRIBUTES   TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_root_dedicated_attr_names.
    handle_root_dedicated_fields(
      EXPORTING
        iv_mode_get_all_dedicated_attr = abap_true
      IMPORTING
        et_eco_attributes              = rt_root_dedicated_attributes
    ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_ROOT_MAPED_ATTR_FOR_DEDICA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* | [<---] ET_MAPPED_REQ_ATTRIBUTES       TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_root_maped_attr_for_dedica.
* Fill the mapped attributes for corresponding dedicated attributes into et_mapped_req_attributes
*    IF sy-uname <> 'LA'.
*      handle_root_dedicated_fields(
*        EXPORTING
*          it_requested_attributes        = it_requested_attributes
*          iv_mode_get_relevnt_maped_attr = abap_true
*        IMPORTING
*          et_eco_attributes              = et_mapped_req_attributes
*      ).
*
*    ELSE.
    DATA lv_dedic_attr_name TYPE string.
    DATA lr_attribute_map   TYPE REF TO ty_attribute_map.
    DATA lt_mapped_eco_attr TYPE sesf_string_tab.

    et_mapped_req_attributes = it_requested_attributes.
    LOOP AT it_requested_attributes INTO lv_dedic_attr_name.
      CLEAR lr_attribute_map.
      READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
        WITH TABLE KEY eco_attr_name = lv_dedic_attr_name.
      IF sy-subrc = 0 AND lr_attribute_map->is_dedicated = abap_true.

        lr_attribute_map->dedicated_exit->get_related_mapped_eco_attrib(
          IMPORTING
            et_eco_attributes = lt_mapped_eco_attr
        ).

        IF lines( lt_mapped_eco_attr ) > 0.
          APPEND LINES OF lt_mapped_eco_attr TO et_mapped_req_attributes.
        ENDIF.
      ENDIF.
    ENDLOOP.
*    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_SUB_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_SUB_CONTEXT                 TYPE        IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_sub_context.
    rv_sub_context = ms_readonly_eco_root-mdro_type_code.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_AAR_CREATE_QAF_ECO->GET_TASK_REGION_BO_DETAILS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ECO_NAME                    TYPE        STRING
* | [<---] EV_HAS_TASK_REGION             TYPE        SESF_BOOLEAN
* | [<---] EV_ECO_ROOT_NODE_NAME          TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_task_region_bo_details.
    ev_has_task_region = abap_false. " ToOpenTask is NOT to be handled in the generic service provider. Will be handled in this class itself
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method CL_A1FIA_AAR_CREATE_QAF_ECO=>GET_UUID
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_UUID                        TYPE        SYSUUID_C32
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_uuid.

    STATICS lr_uuid_generator TYPE REF TO if_system_uuid.
    DATA lx_uuid_error TYPE REF TO cx_uuid_error.

    IF NOT lr_uuid_generator IS BOUND.
      lr_uuid_generator = cl_uuid_factory=>create_system_uuid( ).
    ENDIF.

    TRY.
        rv_uuid = lr_uuid_generator->create_uuid_c32( ).
      CATCH cx_uuid_error INTO lx_uuid_error.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_uuid_error.
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->HANDLE_CREATE_WITH_REF_ACTIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_FOR_CANCELLATION            TYPE        SESF_BOOLEAN
* | [--->] IT_NODE_ID                     TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IT_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T
* | [--->] IO_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IV_IS_TEST_RUN                 TYPE        SESF_BOOLEAN
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_create_with_ref_actions.
    DATA lt_can_mdro_rt_node_id TYPE sesf_bo_node_id_tab.
    DATA ls_can_mdro_root TYPE if_fia_acc_adjustment_run=>ty_root.
    DATA lt_can_mdro_root TYPE if_fia_acc_adjustment_run=>tt_root.
    DATA ls_can_mdro_descr TYPE if_fia_acc_adjustment_run=>ty_description.
    DATA lt_can_mdro_descr TYPE if_fia_acc_adjustment_run=>tt_description.
    DATA lv_create_with_ref_action TYPE string.
    DATA ls_eco_change_notify TYPE if_esf_types=>ty_change_notifications.
    DATA ls_change_notification TYPE if_esf_types=>ty_change_notifications.
    DATA lt_message TYPE cm_esi_root=>tt_esi_root.
    DATA ls_action_parameters_create TYPE if_fia_acc_adjustment_run=>ty_action_p-root-create_with_reference.
    DATA ls_action_parameters_cancel TYPE if_fia_acc_adjustment_run=>ty_action_p-root-create_with_ref_for_canc.
    DATA ls_referencing_node_elements LIKE LINE OF it_referencing_node_elements.
    DATA ls_descr_assoc_param TYPE if_fia_acc_adjustment_run=>ty_assoc_p-root-description.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    FIELD-SYMBOLS <ls_action_parameters> TYPE any.

    ASSERT ID a1fia_aar_create_qaf_eco CONDITION lines( it_referencing_node_elements ) = 1. "Are there use cases for lines > 1?

    READ TABLE it_referencing_node_elements INTO ls_referencing_node_elements INDEX 1.

    IF iv_for_cancellation = abap_true.
      lv_create_with_ref_action = if_fia_acc_adjustment_run=>co_action-root-create_with_ref_for_canc.

      "Get the Description of MDRO which is to be cancelled
      APPEND ls_referencing_node_elements-bo_node_id TO lt_can_mdro_rt_node_id.
      TRY.
          mo_lcp_bo->retrieve(
            EXPORTING
              in_bo_node_name         = if_fia_acc_adjustment_run=>co_bo_node-root
              in_node_ids             = lt_can_mdro_rt_node_id
            IMPORTING
              out_data                = lt_can_mdro_root
          ).

          READ TABLE lt_can_mdro_root INTO ls_can_mdro_root INDEX 1.
          IF sy-subrc = 0.
            ms_readonly_eco_root-can_mdro_log_section_uuid = ls_can_mdro_root-log_section_uuid.

            ls_descr_assoc_param-language_code = sy-langu.
            mo_lcp_bo->retrieve_by_association(
              EXPORTING
                in_bo_node_name            = if_fia_acc_adjustment_run=>co_bo_node-root
                in_association_name        = if_fia_acc_adjustment_run=>co_assoc-root-description
                in_node_ids                = lt_can_mdro_rt_node_id
                in_filter_parameters       = ls_descr_assoc_param
                in_fill_data               = abap_true
              IMPORTING
                out_data                   = lt_can_mdro_descr ).
          ENDIF.
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      READ TABLE lt_can_mdro_descr INTO ls_can_mdro_descr INDEX 1.
      IF sy-subrc = 0.
        ms_readonly_eco_root-can_mdro_description = ls_can_mdro_descr-description.
      ENDIF.

      "Assign the action parameters
      ASSIGN ls_action_parameters_cancel TO <ls_action_parameters>.
    ELSE.
      lv_create_with_ref_action = if_fia_acc_adjustment_run=>co_action-root-create_with_reference.

      IF ls_referencing_node_elements-bo_name = if_fia_set_of_books=>co_bo_name.
        ms_readonly_eco_root-is_period_end_close_triggered = abap_true.
        "Only for period end close the test run indicator is to be considered
        ls_action_parameters_create-test_run_indicator = iv_is_test_run.
      ELSE.
        ms_readonly_eco_root-is_period_end_close_triggered = abap_false.
      ENDIF.

      "Assign the action parameters
      ASSIGN ls_action_parameters_create TO <ls_action_parameters>.
    ENDIF.


    TRY.
        mo_lcp_bo->execute_action(
          EXPORTING
            in_bo_node_name              = if_fia_acc_adjustment_run=>co_bo_node-root
            in_action_name               = lv_create_with_ref_action
            in_node_ids                  = it_node_id
            in_referencing_node_elements = it_referencing_node_elements
            in_action_parameters         = <ls_action_parameters>
          IMPORTING
            out_change_notifications     = ls_change_notification
            out_messages                 = lt_message
        ).
      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

    CLEAR ls_eco_change_notify.
    io_change_handler->get_change_notifications(
      EXPORTING
        in_bo_name               = if_a1fia_aar_create_qaf_eco=>co_bo_name
        in_bo_node_name          = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
      IMPORTING
        out_change_notifications = ls_eco_change_notify
    ).

    IF ls_eco_change_notify IS INITIAL.  "If the notification is already sent out in ON_BO_CHANGED nothing to do here
      handle_notifications(
        EXPORTING
          is_change_notification = ls_change_notification
          io_change_handler      = io_change_handler
      ).
    ENDIF.

    "Notifications handled in ON_BO_CHANGED
    add_mapped_messages_int(
        it_message = lt_message
        io_message_handler = io_message_handler ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->HANDLE_DEDICATED_ATTR_MODIFIC
* +-------------------------------------------------------------------------------------------------+
* | [<-->] CS_ROOT                        TYPE        IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT
* | [<-->] CT_CHANGED_ATTR                TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_dedicated_attr_modific.

*    IF sy-uname <> 'LA'.
*      DATA lv_attr_name      TYPE string.
**------------------------------------------------------------------------*
** For QAF dedicated attribute - assignment type (used by FXA Depr run)   *
**------------------------------------------------------------------------*
** Special logic to handle assignment_type (which is a dedicated attrib in root)
*      ms_readonly_eco_root-assignment_type = cs_root-assignment_type.                       "this is for retrieve since assignment type is a dedicated
*
*      LOOP AT ct_changed_attr INTO lv_attr_name.
*        IF lv_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type.
*          CASE cs_root-assignment_type.
*            WHEN if_fia_cfg_cost_object_type_c=>gc_cost_center.
*              CLEAR: cs_root-key-cost_object_id,
*                     cs_root-key-cost_object_type_code,
*                     cs_root-project_task_id.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-project_task_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code TO ct_changed_attr.
*
*            WHEN if_fia_cfg_cost_object_type_c=>gc_project_task_ohc.
*              CLEAR: cs_root-key-cost_object_id,
*                     cs_root-key-cost_object_type_code,
*                     cs_root-cost_centre_id.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-cost_centre_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code TO ct_changed_attr.
*
*            WHEN ' '.   " no selection -> initial
*              CLEAR: cs_root-key-cost_object_id,
*                     cs_root-key-cost_object_type_code,
*                     cs_root-project_task_id,
*                     cs_root-cost_centre_id.
*
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-project_task_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-cost_centre_id TO ct_changed_attr.
*
*            WHEN OTHERS. "Cost Object Type
*              CLEAR: cs_root-project_task_id,
*                     cs_root-cost_centre_id.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-cost_centre_id TO ct_changed_attr.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-project_task_id TO ct_changed_attr.
*              "add modifications on the COB => this is a bo attribute so need to assign value unlike cost centre and project task
*              cs_root-key-cost_object_type_code = cs_root-assignment_type.
*              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code TO ct_changed_attr.
*          ENDCASE.
*
**       no core bo modify possible for dedicated attributes, hence am removing it from change_attrib
*          DELETE ct_changed_attr WHERE table_line = lv_attr_name.
*
*        ELSEIF lv_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code.
*          CASE cs_root-sales_obj_sel_code.
*            WHEN '01'.
*              cs_root-multi_customer_proj_indicator = abap_true.
*            WHEN '00'.
*              cs_root-multi_customer_proj_indicator = abap_false.
*          ENDCASE.
*
*          APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-multi_customer_proj_indicator TO ct_changed_attr.
**       no core bo modify possible for dedicated attributes, hence am removing it from change_attrib
*          DELETE ct_changed_attr WHERE table_line = lv_attr_name.
*        ENDIF.
*
*      ENDLOOP.
*
*    ELSE.

    DATA lv_dedicated_attr TYPE string.
    DATA lr_attribute_map  TYPE REF TO ty_attribute_map.

    LOOP AT ct_changed_attr INTO lv_dedicated_attr.
      READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
        WITH KEY eco_attr_name = lv_dedicated_attr.
      IF sy-subrc = 0 AND lr_attribute_map->is_dedicated = abap_true.

        lr_attribute_map->dedicated_exit->modif_mapped_attrib_frm_dedic(
          CHANGING
            cs_modif_eco_root = cs_root
            ct_changed_attr   = ct_changed_attr
        ).

        DELETE ct_changed_attr WHERE table_line = lv_dedicated_attr.
      ENDIF.
    ENDLOOP.

*    ENDIF.

  ENDMETHOD.   "HANDLE_DEDICATED_ATTR_MODIFIC


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->HANDLE_NOTIFICATIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IO_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_notifications.
    DATA ls_suc_create_notify LIKE LINE OF is_change_notification-suc_create_notifications.
    DATA ls_failed_create_notification LIKE LINE OF is_change_notification-failed_create_notifications.
    DATA ls_delete_notify LIKE LINE OF is_change_notification-delete_notifications.
    DATA ls_update_notify LIKE LINE OF is_change_notification-update_notifications.
    DATA ls_create_notify LIKE LINE OF is_change_notification-create_notifications.
    DATA ls_sync_notify LIKE LINE OF is_change_notification-sync_notifications.
    DATA ls_attribute_map LIKE LINE OF mt_attribute_map.
    DATA lv_notify_update TYPE sesf_boolean.
    DATA lv_notify_create TYPE sesf_boolean.
    DATA lv_notify_sync TYPE sesf_boolean.
    DATA lv_sync_scope TYPE if_esf_types=>ty_scope.
    DATA lv_node_name  TYPE string.
    DATA lt_affected_associations TYPE sesf_string_tab.
    DATA lv_associations_changed TYPE sesf_boolean.
    DATA lt_node_id TYPE sesf_bo_node_id_tab.
    DATA lt_bo_root_data_dummy TYPE if_fia_acc_adjustment_run=>tt_root.

    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lx_esf_change_handler TYPE REF TO cx_esf_change_handler.
    DATA lx_esf_sync_handler TYPE REF TO cx_esf_sync_handler.

    lv_notify_update = abap_false.
    lv_notify_create = abap_false.
    lv_notify_sync   = abap_false.

    LOOP AT is_change_notification-suc_create_notifications INTO ls_suc_create_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      CLEAR ls_attribute_map.
      ls_attribute_map-core_bo_node_id = ls_suc_create_notify-node_id.

      MODIFY mt_attribute_map FROM ls_attribute_map
        USING KEY core_bo_node_key
        TRANSPORTING core_bo_node_id
        WHERE core_bo_node_name = ls_suc_create_notify-bo_node_name.

      IF ls_suc_create_notify-bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
        lv_notify_create = abap_true.
        mv_eco_root_node_id = ls_suc_create_notify-node_id.
      ELSE.
        lv_notify_update = abap_true.
      ENDIF.
    ENDLOOP.

    LOOP AT is_change_notification-create_notifications INTO ls_create_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      CLEAR ls_attribute_map.
      ls_attribute_map-core_bo_node_id = ls_create_notify-node_id.

      MODIFY mt_attribute_map FROM ls_attribute_map
        USING KEY core_bo_node_key
        TRANSPORTING core_bo_node_id
          WHERE core_bo_node_name = ls_create_notify-bo_node_name.

      IF ls_create_notify-bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
        lv_notify_create = abap_true.
        mv_eco_root_node_id = ls_create_notify-node_id.
      ELSE.
        lv_notify_update = abap_true.
      ENDIF.
    ENDLOOP.

    "Special handling for EXECUTION node create as only sync notifications are sent by the BO and no create/suc_create
    READ TABLE is_change_notification-sync_notifications INTO ls_sync_notify
      WITH KEY bo_name = ms_readonly_eco_root-projection_bo_name bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-execution.
    IF sy-subrc = 0.
      CLEAR ls_attribute_map.
      ls_attribute_map-core_bo_node_id = ls_sync_notify-node_id.

      MODIFY mt_attribute_map FROM ls_attribute_map
        USING KEY core_bo_node_key
        TRANSPORTING core_bo_node_id
          WHERE core_bo_node_name = ls_sync_notify-bo_node_name.

      lv_notify_sync = abap_true.
      lv_sync_scope = if_esf_types=>co_scope_local. "Only re-read root node.
    ELSE.
      LOOP AT mt_run_specific_node INTO lv_node_name.
        READ TABLE is_change_notification-sync_notifications
          TRANSPORTING NO FIELDS
          WITH KEY bo_name = ms_readonly_eco_root-projection_bo_name bo_node_name = lv_node_name.
        IF sy-subrc = 0.
          lv_notify_sync = abap_true.
          lv_sync_scope = if_esf_types=>co_scope_substructure. "don't know which node has been changed, read all sub nodes as well. Shouldn't occur usually.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF.

    "Check the delete notification and update the buffer
    LOOP AT is_change_notification-delete_notifications INTO ls_delete_notify
      WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

      READ TABLE mt_attribute_map INTO ls_attribute_map
        WITH KEY core_bo_node_key COMPONENTS core_bo_node_name = ls_delete_notify-bo_node_name
                 core_bo_node_id = ls_delete_notify-node_id.

      IF sy-subrc = 0.
        CLEAR ls_attribute_map-core_bo_node_id. "Clear the Node ID in the attribute map table so that we create the node anew during further updates
        MODIFY mt_attribute_map FROM ls_attribute_map "Update all rows for this core BO node
          USING KEY core_bo_node_key
          TRANSPORTING core_bo_node_id
          WHERE core_bo_node_name = ls_delete_notify-bo_node_name.

        lv_notify_update = abap_true. "Do not Exit here as the clearing has to be done for all deleted nodes
      ENDIF.
    ENDLOOP.

    "Check the Update notifications if required
    IF lv_notify_update = abap_false AND lv_notify_create = abap_false.
      LOOP AT is_change_notification-update_notifications INTO ls_update_notify
        WHERE bo_name = ms_readonly_eco_root-projection_bo_name.

        READ TABLE mt_attribute_map
          TRANSPORTING NO FIELDS
          WITH KEY core_bo_node_key COMPONENTS core_bo_node_name = ls_update_notify-bo_node_name
                   core_bo_node_id = ls_update_notify-node_id.

        IF sy-subrc = 0.
          lv_notify_update = abap_true.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDIF."IF lv_notify_update = abap_false AND lv_notify_create = abap_false.

    IF lv_notify_create = abap_true.
      TRY.
          CALL METHOD io_change_handler->notify_create
            EXPORTING
              in_bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
              in_bo_node_id   = mv_eco_root_node_id
            .            "in_create_key_handle = lv_eco_root_node_id_handle  "No handle currently as the create is always through CreateWithReference actions
        CATCH cx_esf_change_handler INTO lx_esf_change_handler.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_change_handler.
      ENDTRY.
    ELSEIF lv_notify_update = abap_true.
      lt_affected_associations = derive_affected_associations( is_change_notification ).
      IF lines( lt_affected_associations ) > 0.
        lv_associations_changed = abap_true.
      ELSE.
        lv_associations_changed = abap_false.
      ENDIF.

      CALL METHOD io_change_handler->notify_update
        EXPORTING
          in_bo_node_id            = mv_eco_root_node_id
          in_bo_node_name          = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
          in_associations_changed  = lv_associations_changed
          in_affected_associations = lt_affected_associations.
    ELSEIF lv_notify_sync = abap_true.
      TRY.
          io_change_handler->notify_buffer_sync(
            EXPORTING
              in_bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
              in_bo_node_id   = mv_eco_root_node_id
              in_sync_scope   = lv_sync_scope
              in_is_deleted   = abap_false
              in_sync_type    = if_esf_types=>co_buffer_change
          ).

        CATCH cx_esf_sync_handler INTO lx_esf_sync_handler.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_change_handler.
      ENDTRY.

      mv_has_sync_notifications = abap_true.

*      TRY. "As the EXECUTE action happens as a background job BOPF buffer would not have been updated hence force a retrieve of current image to update BOPF buffer
*          CLEAR lt_node_id.
*          APPEND mv_eco_root_node_id TO lt_node_id.
*
*          mo_lcp_bo->retrieve(
*            EXPORTING
*              in_bo_node_name         = if_fia_acc_adjustment_run=>co_bo_node-root
*              in_node_ids             = lt_node_id
*              in_requested_image      = if_esf_types=>co_image_current_data
*            IMPORTING
*              out_data                = lt_bo_root_data_dummy
*          ).
*        CATCH cx_esf_core_service INTO lx_esf_core_service.
*          RAISE EXCEPTION TYPE cx_fatal_exception
*            EXPORTING
*              previous = lx_esf_core_service.
*      ENDTRY.
    ENDIF.

  ENDMETHOD.                    "handle_notifications


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->HANDLE_ROOT_DEDICATED_FIELDS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [--->] IV_MODE_GET_ALL_DEDICATED_ATTR TYPE        SESF_BOOLEAN(optional)
* | [--->] IV_MODE_GET_RELEVNT_MAPED_ATTR TYPE        SESF_BOOLEAN(optional)
* | [--->] IV_MODE_FILL_DEDICTED_ATTR_VAL TYPE        SESF_BOOLEAN(optional)
* | [<---] ET_ECO_ATTRIBUTES              TYPE        SESF_STRING_TAB
* | [<-->] CS_ECO_ROOT                    TYPE        IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_root_dedicated_fields.
**This method could be called in 3 ways:
**IV_MODE_GET_ALL_DEDICATED_ATTR = abap_true: Get all the ROOT dedicated attribute names into et_eco_attributes
**IV_MODE_GET_RELEVNT_MAPED_ATTR = abap_true: For filling the "mapped" attributes needed for calculation of dedicated attribute (attr not found in mt_attribute_map) into et_eco_attributes
**IV_MODE_FILL_DEDICTED_ATTR_VAL = abap_true: For filling the values for dedicated attributes (attr not found in mt_attribute_map) into cs_eco_data
*
*    IF sy-uname = 'LA'.
*      RETURN.
*    ENDIF.
*
*    DATA lv_eco_attr TYPE string.
*    DATA lt_eco_requested_attributes TYPE sesf_string_tab.
*
** Exactly one of the mode specifying boolean parameters can be set to true at any point in time
*    IF iv_mode_fill_dedicted_attr_val = abap_true AND iv_mode_get_all_dedicated_attr = abap_true
*      OR iv_mode_fill_dedicted_attr_val = abap_true AND iv_mode_get_relevnt_maped_attr = abap_true
*      OR iv_mode_get_all_dedicated_attr = abap_true AND iv_mode_get_relevnt_maped_attr = abap_true
*      OR iv_mode_get_all_dedicated_attr = abap_false AND iv_mode_get_relevnt_maped_attr = abap_false AND iv_mode_fill_dedicted_attr_val = abap_false.
*      RAISE EXCEPTION TYPE cx_fatal_exception. "Illegal call
*    ENDIF.
*
*    CLEAR et_eco_attributes.
*
*    IF iv_mode_get_all_dedicated_attr = abap_true.
*
*      IF cs_eco_root IS SUPPLIED OR et_eco_attributes IS NOT SUPPLIED.
*        RAISE EXCEPTION TYPE cx_fatal_exception.
*      ENDIF.
*
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-projection_bo_name TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-mdro_type_code TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-is_period_end_close_triggered TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_log_section_uuid-content TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-content TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-language_code TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-enable_diplay_log TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-ap_or_ar TO et_eco_attributes.
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type TO et_eco_attributes. "depr
*      APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code TO et_eco_attributes.
***    APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-process_type TO et_eco_attributes.    "grir
*      "If any new attribute is to be added here this might require similar addition in the below IF clauses as well
*
*    ELSEIF iv_mode_get_relevnt_maped_attr = abap_true.
*
*      IF cs_eco_root IS SUPPLIED OR et_eco_attributes IS NOT SUPPLIED OR it_requested_attributes IS NOT SUPPLIED.
*        RAISE EXCEPTION TYPE cx_fatal_exception.
*      ENDIF.
*
*      et_eco_attributes = it_requested_attributes.
*
*      LOOP AT it_requested_attributes INTO lv_eco_attr.
*        CASE lv_eco_attr.
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-enable_diplay_log.
*            APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-processing_status-processing_status_code TO et_eco_attributes.
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-ap_or_ar.
*            APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-party_role_category_code TO et_eco_attributes.
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type.   "DEPR
*            APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code TO et_eco_attributes.
****        WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-process_type.   "GRIR
****          APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-process_type TO et_eco_attributes.
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code .
*            APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-multi_customer_proj_indicator TO et_eco_attributes.
*        ENDCASE.
*      ENDLOOP.
*
*    ELSEIF iv_mode_fill_dedicted_attr_val = abap_true.
*
*      IF cs_eco_root IS NOT SUPPLIED OR et_eco_attributes IS SUPPLIED."This is a call to set the dedicated fields but data to be changed is not provided
*        RAISE EXCEPTION TYPE cx_fatal_exception.
*      ENDIF.
*
*      lt_eco_requested_attributes = it_requested_attributes.
*      IF lt_eco_requested_attributes IS INITIAL.
*        lt_eco_requested_attributes = mt_eco_root_attributes. "All attributes are requested
*      ENDIF.
*
*      LOOP AT lt_eco_requested_attributes INTO lv_eco_attr.
*
*        CASE lv_eco_attr.
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-projection_bo_name.
*            cs_eco_root-projection_bo_name = ms_readonly_eco_root-projection_bo_name.
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-mdro_type_code.
*            cs_eco_root-mdro_type_code = ms_readonly_eco_root-mdro_type_code. "Initially set in ms_readonly_eco_root in EXECUTE_ACTION
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-is_period_end_close_triggered.
*            cs_eco_root-is_period_end_close_triggered = ms_readonly_eco_root-is_period_end_close_triggered. "Initially set in ms_readonly_eco_root in EXECUTE_ACTION
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_log_section_uuid-content.
*            cs_eco_root-can_mdro_log_section_uuid-content = ms_readonly_eco_root-can_mdro_log_section_uuid-content. "Initially set in ms_readonly_eco_root in HANDLE_CREATE_WITH_REF_ACTIONS
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-content.
*            cs_eco_root-can_mdro_description-content = ms_readonly_eco_root-can_mdro_description-content. "Initially set in ms_readonly_eco_root in HANDLE_CREATE_WITH_REF_ACTIONS
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-language_code.
*            cs_eco_root-can_mdro_description-language_code = ms_readonly_eco_root-can_mdro_description-language_code. "Initially set in ms_readonly_eco_root in HANDLE_CREATE_WITH_REF_ACTIONS
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-enable_diplay_log.
*            IF cs_eco_root-processing_status-processing_status_code IS INITIAL.
*              cs_eco_root-enable_diplay_log = abap_false.
*            ELSE.
*              cs_eco_root-enable_diplay_log = abap_true.
*            ENDIF.
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-ap_or_ar.
*            IF cs_eco_root-party_role_category_code = if_ap_party_role_cat_code_c=>gc_creditor.
*              cs_eco_root-ap_or_ar = if_a1fia_aar_create_qaf_eco_c=>co_ap_or_ar_code-ap.
*            ELSEIF cs_eco_root-party_role_category_code = if_ap_party_role_cat_code_c=>gc_debtor.
*              cs_eco_root-ap_or_ar = if_a1fia_aar_create_qaf_eco_c=>co_ap_or_ar_code-ar.
*            ELSE.
*              CLEAR cs_eco_root-ap_or_ar .
*            ENDIF.
**       DEPR
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type.
*            cs_eco_root-assignment_type = ms_readonly_eco_root-assignment_type."When the user has selected only the assignment type and not selected ID let it be same
*
*            IF cs_eco_root-cost_centre_id IS NOT INITIAL.
*              cs_eco_root-assignment_type = if_fia_cfg_cost_object_type_c=>gc_cost_center.
*            ENDIF.
*
*            IF cs_eco_root-project_task_id IS NOT INITIAL.
*              cs_eco_root-assignment_type = if_fia_cfg_cost_object_type_c=>gc_project_task_ohc.
*            ENDIF.
*
*            IF cs_eco_root-key-cost_object_type_code IS NOT INITIAL.
*              cs_eco_root-assignment_type = cs_eco_root-key-cost_object_type_code.
*            ENDIF.
*
*          WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code.
*            IF if_a1fia_aar_create_qaf_eco=>co_attr-root-multi_customer_proj_indicator EQ abap_true .
*              cs_eco_root-sales_obj_sel_code = '01'.
*            ELSEIF if_a1fia_aar_create_qaf_eco=>co_attr-root-multi_customer_proj_indicator EQ abap_false.
*              cs_eco_root-sales_obj_sel_code = '00'.
*            ENDIF.
*
****       GRIR
***        WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-process_type.
***          cs_eco_root-process_type = ms_readonly_eco_root-process_type.
*
*        ENDCASE.
*
*      ENDLOOP.
*
*    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_BSA_CB_MESSAGE_MAPPING~ADJUST_MESSAGES
* +-------------------------------------------------------------------------------------------------+
* | [<-->] INOUT_MESSAGES                 TYPE        TT_MESSAGE_MAPPING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_bsa_cb_message_mapping~adjust_messages.
    adjust_messages_int(
      CHANGING
        ct_message_map = inout_messages
    ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_BSA_CB_PATH~RESOLVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PATH_CALLBACK_ID            TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_DATA                        TYPE        INDEX TABLE
* | [--->] IN_EDIT_MODE                   TYPE        IF_ESF_TYPES=>TY_EDIT_MODE
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE
* | [--->] IN_FILL_DATA                   TYPE        SESF_BOOLEAN (default =ABAP_TRUE)
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* | [--->] IN_BUFFER_MODE                 TYPE        BSA_PATH_BUFFER_MODE
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* | [<---] OUT_MESSAGES                   TYPE        IF_ESF_TYPES=>TY_MESSAGES
* | [<---] OUT_SYNC_NOTIFICATIONS         TYPE        IF_ESF_TYPES=>TT_SYNC_NOTIFICATIONS
* | [!CX!] CX_ESF_CORE_SERVICE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_bsa_cb_path~resolve.
    DATA: ls_link                                     TYPE         sesf_association_link,
          lt_fia_fav_sls_srv_data                     TYPE         if_fia_fav_sls_srv_doc=>tt_root,
          lr_fia_fav_sls_srv_data                     TYPE REF TO  if_fia_fav_sls_srv_doc=>ty_root,
          lo_lcp                                      TYPE REF TO  if_esf_lcp,
          lt_sngle_trgt_node_id                       TYPE         sesf_bo_node_id_tab,
          lt_single_uuid_key                          LIKE         TABLE OF lr_fia_fav_sls_srv_data->uuid,"To store SalesOrder/ServiceOrder..UUID
          lv_source_node_id                           TYPE         sesf_bo_node_id,
          lv_target_node_id                           TYPE         sesf_bo_node_id,
          lv_object_type_code                         LIKE         lr_fia_fav_sls_srv_data->operational_document_reference-object_type_code-content,
          lv_bo_name                                  TYPE         string,
          lt_message                                  TYPE         cm_esi_root=>tt_esi_root.

    FIELD-SYMBOLS <lt_data>           TYPE          ANY TABLE.
    DATA  lr_table_data  TYPE REF TO   data.
    DATA  lt_eco_message TYPE cm_esi_root=>tt_esi_root.

    CLEAR out_data.
    CLEAR out_links.
    CLEAR out_messages.
    CLEAR out_sync_notifications.

    CASE in_path_callback_id.
      WHEN 'SAL_ORD'.
        lv_object_type_code = if_ap_object_type_code_c=>gc_sales_order.
        lv_bo_name = 'SALES_ORDER'.
      WHEN 'SER_ORD'.
        lv_object_type_code = if_ap_object_type_code_c=>gc_service_order.
        lv_bo_name = 'SERVICE_ORDER'.
      WHEN 'CUST_RET'.
        lv_object_type_code = if_ap_object_type_code_c=>gc_customer_return.
        lv_bo_name = 'CUSTOMER_RETURN'.
      WHEN 'SER_CONF'.
        lv_object_type_code = if_ap_object_type_code_c=>gc_service_confirmation.
        lv_bo_name = 'SERVICE_CONFIRMATION'.
    ENDCASE.

    APPEND LINES OF in_data TO lt_fia_fav_sls_srv_data.
    READ TABLE lt_fia_fav_sls_srv_data REFERENCE INTO lr_fia_fav_sls_srv_data
      WITH KEY operational_document_reference-object_type_code-content = lv_object_type_code.

    IF sy-subrc EQ 0.
      READ TABLE in_node_ids INTO lv_source_node_id INDEX 1.

      READ TABLE lt_fia_fav_sls_srv_data REFERENCE INTO lr_fia_fav_sls_srv_data
        WITH KEY node_id = lv_source_node_id.
      IF sy-subrc = 0.
        APPEND lr_fia_fav_sls_srv_data->operational_document_reference-uuid TO lt_single_uuid_key.
      ENDIF.

      IF lt_single_uuid_key IS NOT INITIAL.
        TRY.
            IF in_fill_data = abap_true AND out_data IS SUPPLIED. "Don't do much dynamic create of table type unnecessarily
              ASSIGN out_data TO <lt_data>.
            ELSE.
              CREATE DATA lr_table_data TYPE ('if_apcrm_ctd_template=>tt_root'). ":-( To avoid package error. Just for this we don't want to add it in A1FIA..CMN
              ASSIGN lr_table_data->* TO <lt_data>.
            ENDIF.

            CALL METHOD mo_adaptation_handler->get_lcp
              EXPORTING
                in_bo_name = lv_bo_name
              RECEIVING
                out_lcp    = lo_lcp.

            CALL METHOD lo_lcp->convert_keys
              EXPORTING
                in_bo_node_name    = 'ROOT'
                in_source_key_name = 'UUID'
                in_target_key_name = if_esf_types=>co_node_id_proxy_name
                in_source_keys     = lt_single_uuid_key
              IMPORTING
                out_target_keys    = lt_sngle_trgt_node_id.

            READ TABLE lt_sngle_trgt_node_id INTO lv_target_node_id INDEX 1.

            IF lv_target_node_id IS NOT INITIAL.
              CALL METHOD lo_lcp->retrieve
                EXPORTING
                  in_bo_node_name = 'ROOT'
                  in_node_ids     = lt_sngle_trgt_node_id
                IMPORTING
                  out_data        = <lt_data>
                  out_messages    = lt_message.

              IF <lt_data> IS INITIAL. "Could be because of RBAM instance restrictions we got no data
                CLEAR out_links.
              ELSE.
                CLEAR ls_link.
                ls_link-source_node_id = lv_source_node_id.
                ls_link-target_node_id = lv_target_node_id.
                APPEND ls_link TO out_links.
              ENDIF.

              add_mapped_messages_int(
                EXPORTING
                  it_message = lt_message
                IMPORTING
                  et_eco_message = lt_eco_message ).

              APPEND LINES OF lt_eco_message TO out_messages.
            ENDIF.
          CATCH cx_sy_create_data_error."Do nothing carry on without out_links filled
            CLEAR out_data.
            CLEAR out_links.
        ENDTRY.
      ENDIF. "IF lt_sngle_trgt_node_id IS NOT INITIAL.
    ENDIF. "IF sy-subrc EQ 0.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~check.
    DATA lv_core_bo_node_name TYPE string.
    DATA lo_message TYPE REF TO cm_esi_root.
    DATA lr_attribute_map TYPE REF TO ty_attribute_map.
    DATA lt_node_id TYPE sesf_bo_node_id_tab.
    DATA lt_core_message TYPE cm_esi_root=>tt_esi_root.
    DATA lt_core_message_aggregated TYPE cm_esi_root=>tt_esi_root.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lx_esf_message_handler TYPE REF TO cx_esf_message_handler.
    DATA lx_a1fia_aar_create_qaf_eco TYPE REF TO cx_a1fia_aar_create_qaf_eco.



    IF mv_eco_root_node_id IS INITIAL.
      RETURN.
    ENDIF.

    TRY.
        DATA(lo_node_desc) = mo_eco_descriptor->get_bo_node_descriptor( bo_node_proxy_name = in_bo_node_name ).
        DATA(lv_is_node_upd_enabled)  = lo_node_desc->get_property_value( property_name = if_esf_desc=>co_property_update_enabled ).
        DATA(lv_is_upd_enabled_final) = lo_node_desc->is_property_value_final( property_name = if_esf_desc=>co_property_update_enabled ).

      CATCH cx_esf_metadata_error INTO DATA(lx_esf_metadata_error).
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_metadata_error.
    ENDTRY.

    IF ( lv_is_node_upd_enabled = abap_false AND lv_is_upd_enabled_final = abap_true ). "Only editable nodes for CHECK
      RETURN.
    ENDIF.

    IF in_bo_node_name <> if_a1fia_aar_create_qaf_eco=>co_bo_node-root."Only root node has special logic all other nodes are BSA mapped
      super->if_esf_provider_access~check(
        EXPORTING
          in_bo_node_name    = in_bo_node_name
          in_node_ids        = in_node_ids
          in_check_scope     = in_check_scope
          in_message_handler = in_message_handler
      ).
      RETURN.">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ENDIF.

    TRY.
        IF mt_attribute_map IS INITIAL.
          init_buffers( ).
        ENDIF.

        LOOP AT mt_run_specific_node INTO lv_core_bo_node_name.
          READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map   "We assume one node instance per core bo node in mt_attribute_map
            WITH TABLE KEY core_bo_node_key
            COMPONENTS core_bo_node_name = lv_core_bo_node_name.

          IF sy-subrc <> 0. "The node has to be present in attribute map
            RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco.
          ENDIF.

          IF lr_attribute_map->core_bo_node_id IS INITIAL. "Leave out not-yet-created nodes
            CONTINUE.
          ENDIF.

          CLEAR lt_node_id.
          CLEAR lt_core_message.
          APPEND lr_attribute_map->core_bo_node_id TO lt_node_id.
          TRY.
              mo_lcp_bo->check(
                EXPORTING
                  in_bo_node_name = lv_core_bo_node_name
                  in_node_ids     = lt_node_id
                  in_check_scope  = in_check_scope
                IMPORTING
                  out_messages    = lt_core_message
                  ). "#EC CI_LCP_LOOP  "No single BO node is being checked-on more than once
            CATCH cx_esf_core_service INTO lx_esf_core_service.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_core_service.
          ENDTRY.

          APPEND LINES OF lt_core_message TO lt_core_message_aggregated.
        ENDLOOP.

      CATCH cx_a1fia_aar_create_qaf_eco INTO lx_a1fia_aar_create_qaf_eco.
        cl_a1fia_aar_util=>create_message(
          EXPORTING
            iv_message_class  = 'A1FIA_AAR_CREATE_QAF_ECO'
            iv_message_number = '018'
            iv_severity       = cm_esi_root=>co_severity_error
            iv_lifetime       = cm_esi_root=>co_lifetime_transition
          IMPORTING
            eo_message        = lo_message
        ).

        TRY.
            in_message_handler->add_message( lo_message ).
          CATCH cx_esf_message_handler INTO lx_esf_message_handler.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_message_handler.
        ENDTRY.
    ENDTRY.

    add_mapped_messages_int(
        it_message = lt_core_message_aggregated
        io_message_handler = in_message_handler ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<-->] IN_MODIFICATIONS               TYPE        TT_MODIFICATIONS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~modify.
    DATA lr_modification TYPE REF TO if_esf_provider_access=>ty_modifications.
    DATA lx_a1fia_aar_create_qaf_eco TYPE REF TO cx_a1fia_aar_create_qaf_eco.
    DATA lo_message TYPE REF TO cm_esi_root.
    DATA lx_esf_message_handler TYPE REF TO cx_esf_message_handler.
    DATA lt_changed_attributes TYPE sesf_string_tab.
    DATA lt_sub_node_modify TYPE if_esf_provider_access=>tt_modifications.
    DATA lt_modification    TYPE if_esf_provider_access=>tt_modifications..

    FIELD-SYMBOLS <ls_eco_root> TYPE if_a1fia_aar_create_qaf_eco=>ty_root.
    FIELD-SYMBOLS <ls_attribute_map> TYPE ty_attribute_map.
    FIELD-SYMBOLS <lv_eco_attr_name> TYPE string.

    lt_modification = in_modifications.
    LOOP AT lt_modification REFERENCE INTO lr_modification WHERE bo_node_name <> if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
      APPEND lr_modification->* TO lt_sub_node_modify.
      DELETE lt_modification.
    ENDLOOP.

    READ TABLE lt_modification REFERENCE INTO lr_modification INDEX 1.

    IF sy-subrc = 0 AND lr_modification->bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
      ASSERT lr_modification->change_mode = if_esf_provider_access=>co_change_mode_update.


      TRY.
          IF mt_attribute_map IS INITIAL.
            init_buffers( ).
          ENDIF.

          IF mv_eco_root_node_id IS INITIAL.
            RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco.
          ENDIF.

          ASSIGN lr_modification->data->* TO <ls_eco_root>.
          ASSERT sy-subrc = 0.
          <ls_eco_root>-node_id = mv_eco_root_node_id.

          DELETE lr_modification->changed_attributes WHERE table_line CP '*SCHEME*ID'.
          check_and_fill_sob_comp(
              ir_root_modification = lr_modification
              io_message_handler   = in_message_handler ).

          handle_dedicated_attr_modific(
            CHANGING
              cs_root         = <ls_eco_root>
              ct_changed_attr = lr_modification->changed_attributes ).

          "Create or update the core BO nodes
          modify_core_bo_from_eco_root(
            EXPORTING
              it_changed_attributes = lr_modification->changed_attributes
              is_eco_root           = <ls_eco_root>
              io_change_handler     = in_change_handler
              io_message_handler    = in_message_handler
          ).
        CATCH cx_a1fia_aar_create_qaf_eco INTO lx_a1fia_aar_create_qaf_eco.

          cl_a1fia_aar_util=>create_message(
            EXPORTING
              iv_message_class  = 'A1FIA_AAR_CREATE_QAF_ECO'
              iv_message_number = '018'
              iv_severity       = cm_esi_root=>co_severity_error
              iv_lifetime       = cm_esi_root=>co_lifetime_transition
            IMPORTING
              eo_message        = lo_message
          ).

          TRY.
              in_message_handler->add_message( lo_message ).
            CATCH cx_esf_message_handler INTO lx_esf_message_handler.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_message_handler.
          ENDTRY.
      ENDTRY.
    ENDIF.

    IF lt_sub_node_modify IS NOT INITIAL.
      super->if_esf_provider_access~modify(
        EXPORTING
          in_change_handler  = in_change_handler
          in_message_handler = in_message_handler
        CHANGING
          in_modifications   = lt_sub_node_modify
      ).
    ENDIF.

  ENDMETHOD.                    "if_esf_provider_access~modify


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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
    DATA lt_requested_core_attr TYPE sesf_string_tab.
    DATA lt_eco_attr_for_cur_core_node TYPE sesf_string_tab.
    DATA lv_core_bo_node_id TYPE sesf_bo_node_id.
    DATA lv_eco_attr TYPE string.
    DATA lt_node_id TYPE sesf_string_tab.
    DATA lv_core_bo_node_name TYPE string.
    DATA lv_core_bo_table_type TYPE string.
    DATA lr_table TYPE REF TO data.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lx_a1fia_aar_create_qaf_eco TYPE REF TO cx_a1fia_aar_create_qaf_eco.
    DATA lo_message TYPE REF TO cm_esi_root.
    DATA lv_get_all_attributes TYPE sesf_boolean.
    DATA lr_attribute_map TYPE REF TO ty_attribute_map.
    DATA lt_requested_attributes TYPE sesf_string_tab.
    DATA lt_eco_req_attr TYPE sesf_string_tab.
    DATA lv_request_has_valid_node_id TYPE sesf_boolean.

    FIELD-SYMBOLS <ls_core_bo_data> TYPE any.
    FIELD-SYMBOLS <lv_eco_attr_val_buffer> TYPE any.
    FIELD-SYMBOLS <ls_eco_root_data> TYPE if_a1fia_aar_create_qaf_eco=>ty_root.
    FIELD-SYMBOLS <ls_eco_sub_node_data> TYPE any.
    FIELD-SYMBOLS <lv_eco_attr_val> TYPE any.
    FIELD-SYMBOLS <lv_core_attr_val> TYPE any.
    FIELD-SYMBOLS <lv_parent_node_id> TYPE sesf_bo_node_id.
    FIELD-SYMBOLS <lt_core_bo_data> TYPE INDEX TABLE.

    IF mv_has_sync_notifications = abap_true.
      CLEAR lt_node_id.
      APPEND mv_eco_root_node_id TO lt_node_id.
      lv_core_bo_table_type = 'IF_FIA_ACC_ADJUSTMENT_RUN=>TT_ROOT'.
      CREATE DATA lr_table TYPE (lv_core_bo_table_type).
      ASSIGN lr_table->* TO <lt_core_bo_data>.
      TRY.
          mo_lcp_bo->retrieve(
            EXPORTING
              in_bo_node_name         = if_fia_acc_adjustment_run=>co_bo_node-root
              in_node_ids             = lt_node_id
              in_requested_image      = if_esf_types=>co_image_current_data
            IMPORTING
              out_data                = <lt_core_bo_data>
          ).
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      CLEAR mv_has_sync_notifications.
    ENDIF.

    CASE in_bo_node_name.
      WHEN if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
        TRY.
            IF mt_attribute_map IS INITIAL.
              init_buffers( ) .
            ENDIF.

            out_failed_node_ids = in_node_ids.
            lv_request_has_valid_node_id = abap_false.

            IF mv_eco_root_node_id IS INITIAL.
              READ TABLE in_node_ids INTO mv_eco_root_node_id INDEX 1.
              IF root_node_id_exists( mv_eco_root_node_id ) = abap_false.
                CLEAR mv_eco_root_node_id.
              ENDIF.
            ENDIF.

            IF mv_eco_root_node_id IS NOT INITIAL.
              DELETE out_failed_node_ids WHERE table_line =  mv_eco_root_node_id.
              IF sy-subrc = 0.
                lv_request_has_valid_node_id = abap_true.
              ENDIF.
            ENDIF.

            IF lv_request_has_valid_node_id = abap_true.
              APPEND INITIAL LINE TO out_data ASSIGNING <ls_eco_root_data>.

              IF in_requested_attributes IS NOT INITIAL.
                lt_eco_req_attr = in_requested_attributes.
                APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-acl_company_uuid-content TO lt_eco_req_attr.
                get_root_maped_attr_for_dedica(
                  EXPORTING
                    it_requested_attributes  = lt_eco_req_attr
                  IMPORTING
                    et_mapped_req_attributes = lt_requested_attributes
                ).
              ENDIF.

*             For every node of the core BO trigger an LCP only if it is already created and the attribute is requested now
              LOOP AT mt_run_specific_node INTO lv_core_bo_node_name. "#EC CI_LCP_LOOP  "No single BO node is being retrieved on more than once

                CLEAR lt_requested_core_attr.
                CLEAR lt_eco_attr_for_cur_core_node.
                CLEAR lv_core_bo_node_id.
                LOOP AT mt_attribute_map REFERENCE INTO lr_attribute_map   "We assume one node instance per core bo node in mt_attribute_map
                  USING KEY core_bo_node_key
                  WHERE core_bo_node_name = lv_core_bo_node_name AND core_bo_node_id IS NOT INITIAL. "Leave out not-created node fields and dedicated fields

                  "Check whether the ECO attribute is present in the requested attributes, if not present leave it
                  IF lt_requested_attributes IS NOT INITIAL.
                    READ TABLE lt_requested_attributes TRANSPORTING NO FIELDS WITH TABLE KEY table_line = lr_attribute_map->eco_attr_name.
                    IF sy-subrc <> 0.
                      CONTINUE. "Current attribute is not requested by consumer. Hence skip it.
                    ENDIF.
                  ENDIF.

                  APPEND lr_attribute_map->core_bo_attr_name TO lt_requested_core_attr.
                  APPEND lr_attribute_map->eco_attr_name TO lt_eco_attr_for_cur_core_node.
                  lv_core_bo_node_id = lr_attribute_map->core_bo_node_id.
                ENDLOOP.

                IF lt_requested_core_attr IS INITIAL. "the node is not yet created or none of the node attributes is requested
                  CONTINUE.
                ENDIF.

                CONCATENATE 'if_fia_acc_adjustment_run=>tt_' lv_core_bo_node_name INTO lv_core_bo_table_type.
                CREATE DATA lr_table TYPE (lv_core_bo_table_type).
                ASSIGN lr_table->* TO <lt_core_bo_data>.

                CLEAR lt_node_id.
                APPEND lv_core_bo_node_id TO lt_node_id.
                TRY.
                    mo_lcp_bo->retrieve(
                      EXPORTING
                        in_bo_node_name         = lv_core_bo_node_name
                        in_node_ids             = lt_node_id
                        in_edit_mode            = in_edit_mode
                        in_requested_attributes = lt_requested_core_attr
                      IMPORTING
                        out_data                = <lt_core_bo_data>
                        ). "#EC CI_LCP_LOOP  "No single BO node is being retrieved on more than once
                  CATCH cx_esf_core_service INTO lx_esf_core_service.
                    RAISE EXCEPTION TYPE cx_fatal_exception
                      EXPORTING
                        previous = lx_esf_core_service.
                ENDTRY.

                READ TABLE <lt_core_bo_data> ASSIGNING <ls_core_bo_data> INDEX 1.
                IF sy-subrc <> 0.
                  RAISE EXCEPTION TYPE cx_fatal_exception.
                ENDIF.

                LOOP AT lt_eco_attr_for_cur_core_node INTO lv_eco_attr.
                  READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
                    WITH TABLE KEY eco_attr_name = lv_eco_attr.

                  UNASSIGN <lv_eco_attr_val>.
                  UNASSIGN <lv_core_attr_val>.

                  ASSIGN COMPONENT lv_eco_attr OF STRUCTURE <ls_eco_root_data> TO <lv_eco_attr_val>.
                  ASSIGN COMPONENT lr_attribute_map->core_bo_attr_name OF STRUCTURE <ls_core_bo_data> TO <lv_core_attr_val>.
                  <lv_eco_attr_val> = <lv_core_attr_val>.
                ENDLOOP.

                FREE <lt_core_bo_data>.
                UNASSIGN <lt_core_bo_data>.
              ENDLOOP.

              <ls_eco_root_data>-node_id = mv_eco_root_node_id.
              set_root_dedicated_attributes(
                EXPORTING
                  it_requested_attributes = lt_eco_req_attr
                CHANGING
                  cs_eco_root             = <ls_eco_root_data>
              ).

              "Buffer root structure for use in associations
              IF lines( lt_requested_attributes ) > 0.
                LOOP AT lt_requested_attributes INTO lv_eco_attr.
                  ASSIGN COMPONENT lv_eco_attr OF STRUCTURE <ls_eco_root_data> TO <lv_eco_attr_val>.
                  ASSIGN COMPONENT lv_eco_attr OF STRUCTURE ms_readonly_eco_root TO <lv_eco_attr_val_buffer>.
                  <lv_eco_attr_val_buffer> = <lv_eco_attr_val>.
                ENDLOOP.
              ELSE.
                ms_readonly_eco_root = <ls_eco_root_data>.
              ENDIF.
            ELSE.
              CLEAR out_data.
            ENDIF. "IF out_failed_node_ids IS INITIAL.
          CATCH cx_a1fia_aar_create_qaf_eco INTO lx_a1fia_aar_create_qaf_eco.
            CLEAR out_data.
            APPEND LINES OF in_node_ids TO out_failed_node_ids.
            cl_a1fia_aar_util=>create_message(
              EXPORTING
                iv_message_class  = 'A1FIA_AAR_CREATE_QAF_ECO'
                iv_message_number = '018'
                iv_severity       = cm_esi_root=>co_severity_error
                iv_lifetime       = cm_esi_root=>co_lifetime_transition
              IMPORTING
                eo_message        = lo_message
            ).

            mo_message_manager->add_message( lo_message ).
        ENDTRY.
      WHEN OTHERS.
        CALL METHOD super->if_esf_provider_access~retrieve
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

        TRY.
            DATA(lv_parent_node_name) = mo_eco_descriptor->get_bo_node_descriptor( bo_node_proxy_name = in_bo_node_name )->get_parent_bo_node_descriptor( )->get_proxy_name( ).
          CATCH cx_esf_metadata_error INTO DATA(lx_esf_metadata).
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_metadata.
        ENDTRY.

        IF lv_parent_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
          LOOP AT out_data ASSIGNING <ls_eco_sub_node_data>.
            ASSIGN COMPONENT 'PARENT_NODE_ID' OF STRUCTURE <ls_eco_sub_node_data> TO <lv_parent_node_id>.
            <lv_parent_node_id> = mv_eco_root_node_id.
          ENDLOOP.
        ENDIF.
    ENDCASE.
  ENDMETHOD.                    "if_esf_provider_access~retrieve


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
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

    DATA lt_favpro_task TYPE if_fia_fav_project=>tt_task .
    DATA ls_favpro_task TYPE if_fia_fav_project=>ty_task.

    DATA lv_bo_name TYPE string.
    DATA lv_bo_root_node_name  TYPE string.
    DATA lv_eco_attr TYPE string.
    DATA lv_eco_node_name TYPE string.
    DATA lv_source_key_name TYPE string.
    DATA lv_target_node_id TYPE sesf_bo_node_id.
    DATA lv_failed TYPE sesf_boolean.
    DATA ls_link TYPE sesf_association_link.
    DATA ls_sel_params TYPE sesf_selection_parameter.
    DATA lt_sel_by_bupa_node_id TYPE sesf_bo_node_id_tab.
    DATA lv_is_key_based_assoc TYPE syboolean. "Do we need convert keys call?

    DATA lo_lcp TYPE REF TO if_esf_lcp.

    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.

    DATA lt_target_node_id TYPE sesf_bo_node_id_tab.
    DATA lt_failed TYPE sesf_boolean_tab.
    DATA lt_sel_params TYPE sesf_selection_parameters_tab.

    DATA lr_source_key_table TYPE REF TO data.
    DATA lr_source_key TYPE REF TO data.
    FIELD-SYMBOLS <ls_source_key> TYPE any.
    FIELD-SYMBOLS <lt_source_key> TYPE INDEX TABLE.

    CLEAR out_links.
    CLEAR out_data.
    CLEAR out_failed_source_node_ids.

    IF in_bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.

      lv_eco_node_name = in_association_name. " For composition associations node name is same as association name.
      lv_is_key_based_assoc = abap_true. "Overridden for places where the association does not require convert keys call.

      CASE in_association_name .
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-to_open_task.
          CALL METHOD mo_task_region_helper->retrieve_by_association
            EXPORTING
              in_source_node_ids = in_node_ids
            CHANGING
              out_links          = out_links.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-bupa.
          lv_bo_name = 'BUSINESS_PARTNER'.
          lv_bo_root_node_name = if_sp_bupa_template=>co_bo_node-root.
          lv_source_key_name = if_sp_bupa_template=>co_key-root-internal_id.
          CREATE DATA lr_source_key TYPE if_sp_bupa_template=>ty_key-root-internal_id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-business_partner_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-company.
          lv_bo_name = '/MOM/COMPANY'.
          lv_bo_root_node_name = /mom/if_organisational_centre=>co_bo_node-root.
          lv_source_key_name = /mom/if_organisational_centre=>co_key-root-id.
          CREATE DATA lr_source_key TYPE /mom/if_organisational_centre=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-company_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-cost_centre.
          lv_bo_name = '/MOM/COST_CENTRE'.
          lv_bo_root_node_name = /mom/if_organisational_centre=>co_bo_node-root.
          lv_source_key_name = /mom/if_organisational_centre=>co_key-root-id.
          CREATE DATA lr_source_key TYPE /mom/if_organisational_centre=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-cost_centre_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-cust_ser_org.
          lv_bo_name = '/MOM/FUNCTIONAL_UNIT'.
          lv_bo_root_node_name = /mom/if_organisational_centre=>co_bo_node-root.
          lv_source_key_name =  /mom/if_organisational_centre=>co_key-root-id.
          CREATE DATA lr_source_key TYPE  /mom/if_organisational_centre=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-cust_ser_org_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-fixed_asset.
          lv_bo_name = if_fia_fixed_asset=>co_bo_name.
          lv_bo_root_node_name = if_fia_fixed_asset=>co_bo_node-root.
          lv_source_key_name = if_fia_fixed_asset=>co_key-root-key.
          CREATE DATA lr_source_key TYPE if_fia_fixed_asset=>ty_key-root-key.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          ms_readonly_eco_root-fixed_asset_key-company_uuid-content = ms_readonly_eco_root-acl_company_uuid-content.
          <ls_source_key> = ms_readonly_eco_root-fixed_asset_key.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-house_bank.
          lv_bo_name = 'HOUSE_BANK'.
          lv_bo_root_node_name = if_sp_bupa_template=>co_bo_node-root.
          lv_source_key_name = if_sp_bupa_template=>co_key-root-internal_id.
          CREATE DATA lr_source_key TYPE if_sp_bupa_template=>ty_key-root-internal_id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-house_bank_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-ovh_asses_rule.
          lv_bo_name = 'FIA_OHC_ASSES_RULE'.
          lv_bo_root_node_name = if_fia_asses_distr_rule=>co_bo_node-root.
          lv_source_key_name = if_fia_asses_distr_rule=>co_key-root-id.
          CREATE DATA lr_source_key TYPE if_fia_asses_distr_rule=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-ovh_assess_rule_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-permanent_establishment.
          lv_bo_name = '/MOM/PERM_ESTABLISHMENT'.
          lv_bo_root_node_name = /mom/if_organisational_centre=>co_bo_node-root.
          lv_source_key_name = /mom/if_organisational_centre=>co_key-root-id.
          CREATE DATA lr_source_key TYPE /mom/if_organisational_centre=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-permanent_establishment_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-project.
          lv_bo_name = if_pro_project=>co_bo_name.
          lv_bo_root_node_name = if_pro_project=>co_bo_node-root.
          lv_source_key_name = if_pro_project=>co_key-root-project_id.
          CREATE DATA lr_source_key TYPE if_pro_project=>ty_key-root-project_id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-project_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-sales_organisation.
          lv_bo_name = '/MOM/FUNCTIONAL_UNIT'.
          lv_bo_root_node_name = /mom/if_organisational_centre=>co_bo_node-root.
          lv_source_key_name =  /mom/if_organisational_centre=>co_key-root-id.
          CREATE DATA lr_source_key TYPE  /mom/if_organisational_centre=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-sales_organisation_id.

        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-fav_cost_object.
          IF ms_readonly_eco_root-key-cost_object_id IS NOT INITIAL.
            lv_bo_name = if_fia_fav_cost_object=>co_bo_name.
            lv_bo_root_node_name = if_fia_fav_cost_object=>co_bo_node-root.
            lv_source_key_name =  if_fia_fav_cost_object=>co_key-root-key.
            CREATE DATA lr_source_key TYPE  if_fia_fav_cost_object=>ty_key-root-key.
            ASSIGN lr_source_key->* TO <ls_source_key>.
            <ls_source_key> = ms_readonly_eco_root-key.
          ENDIF.

        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-set_of_books.
          lv_bo_name = if_fia_set_of_books=>co_bo_name.
          lv_bo_root_node_name = if_fia_set_of_books=>co_bo_node-root.
          lv_source_key_name = if_fia_set_of_books=>co_key-root-id.
          CREATE DATA lr_source_key TYPE if_fia_set_of_books=>ty_key-root-id.
          ASSIGN lr_source_key->* TO <ls_source_key>.
          <ls_source_key> = ms_readonly_eco_root-set_of_books_id.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-production_lot.
          IF ms_readonly_eco_root-production_lot_formatted_id-formatted_id IS NOT INITIAL.
            TRY.
                lo_lcp = mo_adaptation_handler->get_lcp( if_fia_fav_production_doc=>co_bo_name ).
              CATCH cx_bsa_runtime INTO lx_bsa_runtime.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_bsa_runtime.
            ENDTRY.
            ls_sel_params-attribute_name = if_fia_fav_production_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-formatted_id.
            ls_sel_params-option = 'EQ'.
            ls_sel_params-sign = 'I'.
            ls_sel_params-low = ms_readonly_eco_root-production_lot_formatted_id-formatted_id.
            APPEND ls_sel_params TO lt_sel_params.
            TRY.
                CALL METHOD lo_lcp->query
                  EXPORTING
                    in_bo_node_name         = if_fia_fav_production_doc=>co_bo_node-root
                    in_query_name           = if_fia_fav_production_doc=>co_query-root-query_by_operational_doc
                    in_selection_parameters = lt_sel_params
                    in_fill_data            = abap_false
                  IMPORTING
                    out_node_ids            = lt_target_node_id.
                .
              CATCH cx_esf_core_service INTO lx_esf_core_service.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_core_service.
            ENDTRY.
            READ TABLE lt_target_node_id INTO lv_target_node_id INDEX 1.
            IF sy-subrc = 0.
              ls_link-source_node_id = mv_eco_root_node_id.
              ls_link-target_node_id = lv_target_node_id.
              APPEND ls_link TO out_links.
            ENDIF.
          ENDIF.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-sal_ser_doc.
          IF ms_readonly_eco_root-cust_ser_document_id-formatted_id IS NOT INITIAL.
            TRY.
                lo_lcp = mo_adaptation_handler->get_lcp( if_fia_fav_sls_srv_doc=>co_bo_name ).
              CATCH cx_bsa_runtime INTO lx_bsa_runtime.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_bsa_runtime.
            ENDTRY.
            ls_sel_params-option = 'EQ'.
            ls_sel_params-sign = 'I'.
            IF ms_readonly_eco_root-cust_ser_document_id-uuid IS NOT INITIAL. "Preferred: Select by UUID to get a single hit
              ls_sel_params-attribute_name = if_fia_fav_sls_srv_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-uuid-content.
              ls_sel_params-low = ms_readonly_eco_root-cust_ser_document_id-uuid-content.
            ELSE.
              IF ms_readonly_eco_root-cust_ser_document_type-content IS NOT INITIAL. "Include type to get less hits
                ls_sel_params-attribute_name = if_fia_fav_sls_srv_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-object_type_code-content.
                ls_sel_params-low = ms_readonly_eco_root-cust_ser_document_type-content.
                APPEND ls_sel_params TO lt_sel_params.
              ENDIF.
              ls_sel_params-attribute_name = if_fia_fav_sls_srv_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-formatted_id.
              ls_sel_params-low = ms_readonly_eco_root-cust_ser_document_id-formatted_id.
            ENDIF.
            APPEND ls_sel_params TO lt_sel_params.
            TRY.
                CALL METHOD lo_lcp->query
                  EXPORTING
                    in_bo_node_name         = if_fia_fav_sls_srv_doc=>co_bo_node-root
                    in_query_name           = if_fia_fav_sls_srv_doc=>co_query-root-query_by_operational_doc
                    in_selection_parameters = lt_sel_params
                    in_fill_data            = abap_false
                  IMPORTING
                    out_node_ids            = lt_target_node_id.
                .
              CATCH cx_esf_core_service INTO lx_esf_core_service.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_core_service.
            ENDTRY.
            LOOP AT lt_target_node_id INTO lv_target_node_id.
              ls_link-source_node_id = mv_eco_root_node_id.
              ls_link-target_node_id = lv_target_node_id.
              APPEND ls_link TO out_links.
            ENDLOOP.
          ENDIF.
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-purchase_doc or if_a1fia_aar_create_qaf_eco=>co_assoc-root-purchase_doc_upb.
          IF ms_readonly_eco_root-purchase_doc_id-formatted_id IS NOT INITIAL OR
            ms_readonly_eco_root-purchase_doc_id_upb-formatted_id IS NOT INITIAL.
            TRY.
                lo_lcp = mo_adaptation_handler->get_lcp( if_fia_fav_purchasing_doc=>co_bo_name ).
              CATCH cx_bsa_runtime INTO lx_bsa_runtime.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_bsa_runtime.
            ENDTRY.

            ls_sel_params-option = 'EQ'.
            ls_sel_params-sign = 'I'.
            IF ms_readonly_eco_root-purchase_doc_id-uuid IS NOT INITIAL. "Preferred: Select by UUID to get a single hit
              ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-uuid-content.
              ls_sel_params-low = ms_readonly_eco_root-purchase_doc_id-uuid-content.
            ELSE.
              IF ms_readonly_eco_root-purchase_doc_type-content IS NOT INITIAL. "Include type to get less hits
                ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-object_type_code-content.
                ls_sel_params-low = ms_readonly_eco_root-purchase_doc_type-content.
                APPEND ls_sel_params TO lt_sel_params.
              ENDIF.
              ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-object_id-content.
              ls_sel_params-low = ms_readonly_eco_root-purchase_doc_id-object_id-content.
            ENDIF.
            APPEND ls_sel_params TO lt_sel_params.
            IF ms_readonly_eco_root-purchase_doc_id_upb-uuid IS NOT INITIAL. "Preferred: Select by UUID to get a single hit
              ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-uuid-content.
              ls_sel_params-high = ms_readonly_eco_root-purchase_doc_id_upb-uuid-content.
            ELSE.
              IF ms_readonly_eco_root-purchase_doc_type-content IS NOT INITIAL. "Include type to get less hits
                ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-object_type_code-content.
                ls_sel_params-high = ms_readonly_eco_root-purchase_doc_type-content.
                APPEND ls_sel_params TO lt_sel_params.
              ENDIF.
              ls_sel_params-attribute_name = if_fia_fav_purchasing_doc=>co_query_p_attr-root-query_by_operational_doc-operational_document_reference-object_id-content.
              ls_sel_params-high = ms_readonly_eco_root-purchase_doc_id_upb-object_id-content.
            ENDIF.
            APPEND ls_sel_params TO lt_sel_params.

            TRY.
                CALL METHOD lo_lcp->query
                  EXPORTING
                    in_bo_node_name         = if_fia_fav_purchasing_doc=>co_bo_node-root
                    in_query_name           = if_fia_fav_purchasing_doc=>co_query-root-query_by_operational_doc
                    in_selection_parameters = lt_sel_params
                    in_fill_data            = abap_false
                  IMPORTING
                    out_node_ids            = lt_target_node_id.
                .
              CATCH cx_esf_core_service INTO lx_esf_core_service.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_core_service.
            ENDTRY.
            LOOP AT lt_target_node_id INTO lv_target_node_id.
              ls_link-source_node_id = mv_eco_root_node_id.
              ls_link-target_node_id = lv_target_node_id.
              APPEND ls_link TO out_links.
            ENDLOOP.
          ENDIF.

        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-project_task.
          IF ms_readonly_eco_root-project_task_id IS NOT INITIAL.
            TRY.
                lo_lcp = mo_adaptation_handler->get_lcp( if_fia_fav_project=>co_bo_name ).
              CATCH cx_bsa_runtime INTO lx_bsa_runtime.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_bsa_runtime.
            ENDTRY.
            ls_sel_params-attribute_name = if_fia_fav_project=>co_query_p_attr-task-query_by_task-task_reference-formatted_id.
            ls_sel_params-option = 'EQ'.
            ls_sel_params-sign = 'I'.
            ls_sel_params-low = ms_readonly_eco_root-project_task_id.
            APPEND ls_sel_params TO lt_sel_params.
            TRY.
                CALL METHOD lo_lcp->query
                  EXPORTING
                    in_bo_node_name         = if_fia_fav_project=>co_bo_node-task
                    in_query_name           = if_fia_fav_project=>co_query-task-query_by_task
                    in_selection_parameters = lt_sel_params
                    in_fill_data            = abap_true
                  IMPORTING
*                   out_node_ids            = lt_target_node_id
                    out_data                = lt_favpro_task.

              CATCH cx_esf_core_service INTO lx_esf_core_service.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_core_service.
            ENDTRY.
*          READ TABLE lt_target_node_id INTO lv_target_node_id INDEX 1.
            READ TABLE lt_favpro_task INTO ls_favpro_task INDEX 1.
            IF sy-subrc = 0.
              lv_target_node_id = ls_favpro_task-task_reference-uuid-content .
              APPEND lv_target_node_id TO lt_target_node_id .
              ls_link-source_node_id = mv_eco_root_node_id.
              ls_link-target_node_id = lv_target_node_id.
              APPEND ls_link TO out_links.
            ENDIF.
          ENDIF.

********FCRE Execlution Logic*******************************************************
        WHEN if_a1fia_aar_create_qaf_eco=>co_assoc-root-fcre_root.
          lv_is_key_based_assoc = abap_false.

          IF mv_eco_root_node_id IS NOT INITIAL.
            APPEND INITIAL LINE TO out_links ASSIGNING FIELD-SYMBOL(<ls_link>).
            <ls_link>-source_node_id = <ls_link>-target_node_id = mv_eco_root_node_id.

            IF in_fill_data = abap_true.
              APPEND INITIAL LINE TO out_data ASSIGNING FIELD-SYMBOL(<ls_eco_node_fcre_root>).
              ASSERT sy-subrc = 0.
              ASSIGN COMPONENT if_a1fia_aar_create_qaf_eco=>co_attr-fcre_root-uuid-content OF STRUCTURE <ls_eco_node_fcre_root> TO FIELD-SYMBOL(<lv_uuid_content>).
              ASSIGN COMPONENT if_esf_types=>co_parent_node_id_proxy_name OF STRUCTURE <ls_eco_node_fcre_root> TO FIELD-SYMBOL(<lv_parent_node_id>).
              ASSIGN COMPONENT if_esf_types=>co_node_id_proxy_name OF STRUCTURE <ls_eco_node_fcre_root> TO FIELD-SYMBOL(<lv_node_id>).

              <lv_node_id> = <lv_parent_node_id> = <lv_uuid_content> = mv_eco_root_node_id.
              UNASSIGN <lv_node_id>.
              UNASSIGN <lv_parent_node_id>.
              UNASSIGN <lv_uuid_content>.
              UNASSIGN <ls_eco_node_fcre_root>.
            ENDIF.
          ELSE.
            "Shouldn't occur
            CLEAR out_links.
            CLEAR out_data.
            CLEAR out_failed_source_node_ids.
          ENDIF.

        WHEN OTHERS.
          RAISE EXCEPTION TYPE cx_fatal_exception. "Unknown association
      ENDCASE.

*   Call the convert keys method to get the target node id
      IF lv_is_key_based_assoc = abap_true AND out_links IS INITIAL.

        IF mv_eco_root_node_id IS NOT INITIAL
           AND lv_eco_node_name IS NOT INITIAL
           AND lv_bo_name IS NOT INITIAL AND lv_bo_root_node_name IS NOT INITIAL
           AND lv_source_key_name IS NOT INITIAL AND <ls_source_key> IS NOT INITIAL.

          TRY.
              lo_lcp = mo_adaptation_handler->get_lcp( lv_bo_name ).
            CATCH cx_bsa_runtime INTO lx_bsa_runtime.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_bsa_runtime.
          ENDTRY.

          CREATE DATA lr_source_key_table LIKE TABLE OF <ls_source_key>.
          ASSIGN lr_source_key_table->* TO <lt_source_key>.
          ASSERT sy-subrc = 0.
          APPEND <ls_source_key> TO <lt_source_key>.

          TRY.
              lo_lcp->convert_keys(
                EXPORTING
                  in_bo_node_name    = lv_bo_root_node_name
                  in_source_key_name = lv_source_key_name
                  in_target_key_name = if_esf_types=>co_node_id_proxy_name
                  in_source_keys     = <lt_source_key>
                IMPORTING
                  out_target_keys    = lt_target_node_id
                  out_failed         = lt_failed
              ).
            CATCH cx_esf_core_service INTO lx_esf_core_service.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_core_service.
          ENDTRY.

          lv_failed = abap_true.
          READ TABLE lt_failed INTO lv_failed INDEX 1.

          IF lv_failed = abap_false.
            READ TABLE lt_target_node_id INTO lv_target_node_id INDEX 1.

            CLEAR ls_link.
            ls_link-source_node_id = mv_eco_root_node_id.
            ls_link-target_node_id = lv_target_node_id.
            APPEND ls_link TO out_links.
          ENDIF.
        ELSE.
          CLEAR out_links.
        ENDIF.
      ENDIF.

      IF lv_is_key_based_assoc = abap_true AND in_fill_data = abap_true AND out_links IS NOT INITIAL AND out_data IS INITIAL.
        if_esf_provider_access~retrieve(
          EXPORTING
            in_bo_node_name         = lv_eco_node_name
            in_node_ids             = lt_target_node_id
            in_edit_mode            = if_esf_types=>co_read_only
            in_requested_attributes = in_requested_attributes
            in_message_handler      = in_message_handler
            in_buffer_sync_handler  = in_buffer_sync_handler
          IMPORTING
            out_data                = out_data
        ).

        IF out_data IS INITIAL."RBAM restricted?
          CLEAR out_links.
        ENDIF.
      ENDIF.

    ELSE.
*     Associations arising out of non-root nodes (BSA mapped)
      super->if_esf_provider_access~retrieve_by_association(
        EXPORTING
          in_bo_name                     = in_bo_name
          in_bo_node_name                = in_bo_node_name
          in_association_name            = in_association_name
          in_node_ids                    = in_node_ids
          in_fill_data                   = in_fill_data
          in_fill_failed_source_node_ids = in_fill_failed_source_node_ids
          in_filter_parameters           = in_filter_parameters
          in_filtered_attributes         = in_filtered_attributes
          in_requested_image             = in_requested_image
          in_edit_mode                   = in_edit_mode
          in_requested_attributes        = in_requested_attributes
          in_message_handler             = in_message_handler
          in_buffer_sync_handler         = in_buffer_sync_handler
        IMPORTING
          out_links                      = out_links
          out_data                       = out_data
          out_failed_source_node_ids     = out_failed_source_node_ids
      ).

    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_DEFAULT_NODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_ID_HANDLES             TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ASSOCIATION_NAME            TYPE        STRING
* | [--->] IN_ASSOCIATION_FILTER_STRUCT   TYPE        ANY
* | [--->] IN_ASSOCIATION_FILTER_ATTRIBS  TYPE        SESF_STRING_TAB
* | [--->] IN_SOURCE_BO_NODE_NAME         TYPE        STRING
* | [--->] IN_SOURCE_NODE_ID              TYPE        SESF_BO_NODE_ID
* | [--->] IN_SOURCE_NODE_ID_IS_HANDLE    TYPE        SESF_BOOLEAN
* | [--->] IN_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER(optional)
* | [<---] OUT_DATA                       TYPE        INDEX TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve_default_node_values.
    "For the ROOT node Delegation to retrieve default node values happens in the method : MODIFY_CORE_BO_FROM_ECO_ROOT
    IF in_bo_node_name <> if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
      super->if_esf_provider_access~retrieve_default_node_values(
        EXPORTING
          in_bo_node_name               =  in_bo_node_name
          in_node_id_handles            =  in_node_id_handles
          in_association_name           =  in_association_name
          in_association_filter_struct  =  in_association_filter_struct
          in_association_filter_attribs =  in_association_filter_attribs
          in_source_bo_node_name        =  in_source_bo_node_name
          in_source_node_id             =  in_source_node_id
          in_source_node_id_is_handle   =  in_source_node_id_is_handle
          in_property_handler           =  in_property_handler
        IMPORTING
          out_data                      =  out_data
      ).
    ENDIF.
  ENDMETHOD.                    "if_esf_provider_access~retrieve_default_node_values


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IN_PROPERTY_SCOPE              TYPE        IF_ESF_TYPES=>TY_PROPERTY_SCOPE (default =IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve_properties.
    DATA lt_requested_attributes TYPE sesf_string_tab.
    DATA lt_already_retrieved_nodes TYPE sesf_string_tab.
    DATA lt_core_bo_attr_name TYPE sesf_string_tab.
    DATA ls_property_scope TYPE if_esf_types=>ty_property_scope.
    DATA ls_property TYPE if_esf_types=>ty_properties.
    DATA ls_attr_property LIKE LINE OF ls_property-attribute_properties.
    DATA ls_node_elem_property TYPE if_esf_types=>ty_node_element_property.
    DATA lr_attr_map TYPE REF TO ty_attribute_map.
    DATA lt_attr_pair_for_node TYPE tt_attribute_pair.
    DATA lt_node_id TYPE sesf_bo_node_id_tab.
    DATA lv_eco_attr_name TYPE string.
    DATA ls_attr_pair TYPE ty_attribute_pair.
    DATA lv_attr_readonly_set TYPE sesf_boolean.
    DATA lv_prop_value TYPE sesf_boolean.
    DATA lt_eco_attr_name TYPE sesf_string_tab.
    DATA lt_requested_actions TYPE sesf_string_tab.
    DATA lv_action_enabled TYPE sesf_boolean.
    DATA lv_action_name TYPE string.
    DATA lv_is_read_only_attr TYPE syboolean.

    DATA lx_esf_property_handler TYPE REF TO cx_esf_property_handler.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    IF mv_eco_root_node_id IS NOT INITIAL.
      CASE in_bo_node_name.
        WHEN if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
          "Set action properties
          IF abap_true = abap_true. " WORKAROUND: Should be "IF in_property_scope-all_action_props_requested = abap_true.", but somehow doesnt work with this
            APPEND if_a1fia_aar_create_qaf_eco=>co_action-root-compound_schedule TO lt_requested_actions.
            APPEND if_a1fia_aar_create_qaf_eco=>co_action-root-execute TO lt_requested_actions.
          ELSEIF in_property_scope-requested_actions IS NOT INITIAL.
            lt_requested_actions = in_property_scope-requested_actions.
          ENDIF.

          CLEAR lv_action_enabled.

          IF ms_readonly_eco_root-processing_status-processing_status_code IS INITIAL
            AND is_floorplan_editable( ) = abap_true.
            lv_action_enabled = abap_true.
          ELSE.
            lv_action_enabled = abap_false.
          ENDIF.

          LOOP AT lt_requested_actions INTO lv_action_name.
            TRY.
                in_property_handler->set_action_enabled(
                  EXPORTING
                    in_action_name = lv_action_name
                    in_value       = lv_action_enabled
                    in_bo_node_id  = mv_eco_root_node_id
                ).
              CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_property_handler.
            ENDTRY.
          ENDLOOP.

          "Set attribute properties
          "IF ms_readonly_eco_root-life_cycle_status <> mc_life_cycle_status-in_preparation."If not in_preparation set update enabled = false
          IF is_floorplan_editable( ) = abap_false.

            TRY.
                in_property_handler->set_node_elem_update_enabled(
                  EXPORTING
                    in_bo_node_id = mv_eco_root_node_id
                    in_value      = abap_false
                ).
              CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_property_handler.
            ENDTRY.

          ELSE.

            IF in_property_scope-all_attribute_props_requested = abap_true.
              lt_requested_attributes = mt_eco_root_attributes.
            ELSEIF in_property_scope-requested_attributes IS NOT INITIAL.
              lt_requested_attributes = in_property_scope-requested_attributes.
              DELETE lt_requested_attributes WHERE table_line = if_esf_types=>co_node_id_proxy_name.
            ENDIF.

            LOOP AT lt_requested_attributes INTO lv_eco_attr_name.
*             Description is always enabled even if it is opened from period end close OIF
              IF ( lv_eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-description-content ).
                CONTINUE.
              ENDIF.

              lv_is_read_only_attr = abap_false.
              CLEAR lr_attr_map.

              IF ms_readonly_eco_root-is_period_end_close_triggered = abap_true.
                lv_is_read_only_attr = abap_true.
              ELSE.
                READ TABLE mt_attribute_map REFERENCE INTO lr_attr_map
                  WITH KEY eco_attr_name = lv_eco_attr_name.

                IF lr_attr_map->is_dedicated = abap_true AND lr_attr_map->dedicated_exit->is_editable( ) = abap_false.
                  lv_is_read_only_attr = abap_true.
                ENDIF.
              ENDIF.

              "Field is not editable in UI or not enabled in core BO, set it to read only
              "Also if the QAF has been opened from the closing cockpit set all fields to readonly except description
              IF ( lv_is_read_only_attr = abap_true ).

                TRY.
                    in_property_handler->set_attribute_property(
                      EXPORTING
                        in_attribute_name = lv_eco_attr_name
                        in_property_name  = if_esf_desc=>co_property_read_only
                        in_value          = abap_true
                        in_bo_node_id     = mv_eco_root_node_id
                    ).
                  CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                    RAISE EXCEPTION TYPE cx_fatal_exception
                      EXPORTING
                        previous = lx_esf_property_handler.
                ENDTRY.

              ELSE.

                IF lr_attr_map->core_bo_node_id IS INITIAL. "core BO node is not yet created or the field is dedicated: No changes to backend properties
                  CONTINUE.
                ENDIF.

                READ TABLE lt_already_retrieved_nodes TRANSPORTING NO FIELDS
                  FROM lr_attr_map->core_bo_node_name.

                IF sy-subrc = 0.  "Properties for the eco attributes corresponding to this core bo node are already set
                  CONTINUE.
                ENDIF.

                get_eco_core_attr_pair_for_nod( "Looping inside
                  EXPORTING
                    iv_core_bo_node_name = lr_attr_map->core_bo_node_name
                  IMPORTING
                    et_eco_core_attr_pair = lt_attr_pair_for_node
                    et_core_bo_attr_name  = lt_core_bo_attr_name ).

                CLEAR lt_node_id.
                CLEAR ls_property.
                CLEAR ls_property_scope.
                APPEND lr_attr_map->core_bo_node_id TO lt_node_id.
                ls_property_scope-requested_attributes = lt_core_bo_attr_name.
                ls_property_scope-all_node_props_requested = abap_true.

                TRY.
                    mo_lcp_bo->retrieve_properties(
                      EXPORTING
                        in_bo_node_name   = lr_attr_map->core_bo_node_name
                        in_node_ids       = lt_node_id
                        in_property_scope = ls_property_scope
                      IMPORTING
                        out_properties    = ls_property ). "#EC CI_LCP_LOOP  "No single BO node is being retrieved-on more than once
                  CATCH cx_esf_core_service INTO lx_esf_core_service.
                    RAISE EXCEPTION TYPE cx_fatal_exception
                      EXPORTING
                        previous = lx_esf_core_service.
                ENDTRY.

                APPEND lr_attr_map->core_bo_node_name TO lt_already_retrieved_nodes.

*               If the node itself is not enabled or is not update enabled then set all the fields of the node to disabled or readonly accordingly.
                lv_attr_readonly_set = abap_false.
                READ TABLE ls_property-node_element_properties
                   INTO ls_node_elem_property
                   WITH KEY property_name = if_esf_desc=>co_property_update_enabled. "We are not interested in other node properties
                IF sy-subrc = 0.
                  lv_prop_value = ls_node_elem_property-property_value.

                  "IF the property is for the core BO ROOT set it to ECO root as well
                  IF lr_attr_map->core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
                    TRY."TODO should we consider in_property_scope-all_node_properties_required = abap_true?
                        in_property_handler->set_node_elem_update_enabled(
                          EXPORTING
                            in_bo_node_id = mv_eco_root_node_id
                            in_value      = lv_prop_value
                        ).
                      CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                        RAISE EXCEPTION TYPE cx_fatal_exception
                          EXPORTING
                            previous = lx_esf_property_handler.
                    ENDTRY.
                  ELSE.
                    "Set the Read only property for the fields.

                    IF lv_prop_value = abap_true."If the node is update enabled, then read_only is false.
                      lv_prop_value = abap_false.
                    ELSE.
                      lv_prop_value = abap_true.
                    ENDIF.

                    set_attr_properties(
                      EXPORTING
                        it_eco_attr_name = lt_eco_attr_name
                        iv_eco_node_id = mv_eco_root_node_id
                        io_property_handler = in_property_handler
                        iv_property_name = if_esf_desc=>co_property_read_only
                        iv_property_value = lv_prop_value
                     ).

                    lv_attr_readonly_set = abap_true.

                  ENDIF.
                ENDIF.

*               There could be other properties to be set for the fields even if the lv_all_read_only = abap_true
                LOOP AT ls_property-attribute_properties INTO ls_attr_property.

                  IF lv_attr_readonly_set = abap_true"If already set continue
                     AND ls_attr_property-property_name = if_esf_desc=>co_property_read_only.
                    CONTINUE.
                  ENDIF.

                  READ TABLE lt_attr_pair_for_node INTO ls_attr_pair
                    WITH TABLE KEY core_bo_attr_name = ls_attr_property-attribute_name.

                  IF sy-subrc = 0.
                    TRY.
                        in_property_handler->set_attribute_property(
                          EXPORTING
                            in_attribute_name = ls_attr_pair-eco_attr_name
                            in_property_name  = ls_attr_property-property_name
                            in_value          = ls_attr_property-property_value
                            in_bo_node_id     = mv_eco_root_node_id
                        ).
                      CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                        RAISE EXCEPTION TYPE cx_fatal_exception
                          EXPORTING
                            previous = lx_esf_property_handler.
                    ENDTRY.
                  ENDIF.
                ENDLOOP."LOOP AT ls_property-attribute_properties INTO ls_attr_property.
              ENDIF. "Field is not found in the mt_attribute_map
            ENDLOOP.

*           Enable the FCRE BO specific associations & nodes when it's FCRE projection
            IF ms_readonly_eco_root-mdro_type_code = if_ap_object_type_code_c=>gc_arpl_acc_for_cur_rem_run.
              TRY.
                  in_property_handler->set_association_enabled(
                    EXPORTING
                      in_association_name     = if_a1fia_aar_create_qaf_eco=>co_assoc-root-fcre_root
                      in_value                = abap_true
                      in_bo_node_id           = mv_eco_root_node_id
                  ).
                CATCH cx_esf_property_handler INTO lx_esf_property_handler.
                  RAISE EXCEPTION TYPE cx_fatal_exception
                    EXPORTING
                      previous = lx_esf_property_handler.
              ENDTRY.
            ENDIF.
          ENDIF. "IF ms_eco_root-life_cycle_status <> mc_life_cycle_status-in_preparation.

        WHEN OTHERS.

          super->if_esf_provider_access~retrieve_properties(
            EXPORTING
              in_bo_node_name     = in_bo_node_name
              in_node_ids         = in_node_ids
              in_property_handler = in_property_handler
              in_property_scope   = in_property_scope
          ).

          IF is_floorplan_editable( ) = abap_false.
            set_node_n_assoc_read_only(
              EXPORTING
                iv_node_name        = in_bo_node_name
                io_property_handler = in_property_handler
                it_node_ids         = in_node_ids
            ).

          ENDIF.
      ENDCASE."CASE in_bo_node_name.
    ENDIF."IF mv_eco_root_node_id IS NOT INITIAL.
  ENDMETHOD.                    "if_esf_provider_access~retrieve_properties


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve_root_node_id.
    DATA lv_node_id TYPE sesf_bo_node_id.
    DATA ls_link TYPE sesf_association_link.

    IF mv_eco_root_node_id IS NOT INITIAL.
      LOOP AT in_node_ids INTO lv_node_id .
        CLEAR ls_link.
        ls_link-source_node_id = lv_node_id.
        ls_link-target_node_id = mv_eco_root_node_id.
        APPEND ls_link TO out_links.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
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
    DATA: ls_change_notification TYPE if_esf_types=>ty_change_notifications ##NEEDED , "#EC NEEDED
          lv_has_errors TYPE sesf_boolean,
          lt_message TYPE if_esf_lcp=>ty_message_list,
          ls_eco_root TYPE if_a1fia_aar_create_qaf_eco=>ty_root,
          lt_eco_root TYPE if_a1fia_aar_create_qaf_eco=>tt_root,
          lt_changed_attributes TYPE sesf_string_tab,
          lt_requested_attributes  TYPE  sesf_string_tab,
          lt_failed_node_ids   TYPE sesf_bo_node_id_tab,
          lx_bsa_runtime  TYPE REF TO cx_bsa_runtime,
          ls_create_action_param TYPE if_a1fia_aar_create_qaf_eco=>ty_action_p-root-create,
          "lv_ap_or_ar_code TYPE if_a1fia_aar_create_qaf_eco=>ty_action_p-root-create-ap_or_ar,
          lt_eco_root_node_id TYPE sesf_bo_node_id_tab,
          ls_referencing_node_elements LIKE LINE OF in_referencing_node_elements,
          lx_a1fia_aar_create_qaf_eco TYPE REF TO cx_a1fia_aar_create_qaf_eco,
          lo_message TYPE REF TO cm_esi_root,
          lx_esf_message_handler TYPE REF TO cx_esf_message_handler,
          lx_uuid_error TYPE REF TO cx_uuid_error,
          lv_tab_count TYPE i,
          ls_create_notification TYPE if_esf_types=>ty_create_notification,
          ls_mdro_root_node_id TYPE sesf_bo_node_id.



    DATA lx_message_handler TYPE REF TO cx_esf_message_handler.

    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    IF in_action_name = if_a1fia_aar_create_qaf_eco=>co_action-root-create." If this is Create With Reference action, get the LCP to the BO
      TRY.
          IF mv_eco_root_node_id IS NOT INITIAL.
            RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco. "This is unexpected, could be malicious?
          ENDIF.

          ls_create_action_param = in_action_parameters.
          ms_readonly_eco_root-mdro_type_code = ls_create_action_param-mdro_type_code.
          ms_readonly_eco_root-ap_or_ar = ls_create_action_param-ap_or_ar.
          ms_readonly_eco_root-projection_bo_name = get_bo_name_from_mdro_type( ls_create_action_param-mdro_type_code ).
          ASSERT ms_readonly_eco_root-projection_bo_name IS NOT INITIAL.

          TRY.
              mo_lcp_bo = mo_adaptation_handler->get_lcp( ms_readonly_eco_root-projection_bo_name ).
            CATCH cx_bsa_runtime INTO lx_bsa_runtime.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_bsa_runtime.
          ENDTRY.

          init_buffers( ).

          READ TABLE in_referencing_node_elements INTO ls_referencing_node_elements INDEX 1.

          IF ls_referencing_node_elements-bo_name IS INITIAL
             OR ls_referencing_node_elements-bo_node_name IS INITIAL
             OR ls_referencing_node_elements-bo_node_id IS INITIAL.

            "The ID is NOT changed. But the same is added to changed attributes.!!!!!!!!!!!
            "We need this for creation of Root as the creation method is based on changed attributes!!!!!!!!!!
            APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-id-content TO lt_changed_attributes.

            ls_eco_root-node_id = get_uuid( ).

            "If it is Regrouping Run or the Remeasurement Run then populate the party role category code as well
            IF ms_readonly_eco_root-projection_bo_name = 'FIA_ARPLA_RGRP_RUN' OR ms_readonly_eco_root-projection_bo_name = 'FIA_ARP_LEDGER_ACCT_REM'.
              ms_readonly_eco_root-ap_or_ar = ls_create_action_param-ap_or_ar.

              CASE ms_readonly_eco_root-ap_or_ar.
                WHEN if_a1fia_aar_create_qaf_eco_c=>co_ap_or_ar_code-ap.
                  ls_eco_root-party_role_category_code = if_ap_party_role_cat_code_c=>gc_creditor.
                WHEN if_a1fia_aar_create_qaf_eco_c=>co_ap_or_ar_code-ar.
                  ls_eco_root-party_role_category_code = if_ap_party_role_cat_code_c=>gc_debtor.
                WHEN OTHERS.
                  RAISE EXCEPTION TYPE cx_fatal_exception. "Should be either AP or AR
              ENDCASE.

              APPEND if_a1fia_aar_create_qaf_eco=>co_attr-root-party_role_category_code TO lt_changed_attributes.
            ENDIF.

            "Create or update the core BO nodes
            modify_core_bo_from_eco_root(
              EXPORTING
                it_changed_attributes = lt_changed_attributes
                is_eco_root           = ls_eco_root
                io_change_handler     = in_change_handler
                io_message_handler           = in_message_handler
            ).
          ELSE.
            handle_create_with_ref_actions(
              EXPORTING
                iv_for_cancellation          = ls_create_action_param-cancellation_run_indicator
                iv_is_test_run               = ls_create_action_param-test_run_indicator
                it_node_id                   = in_node_ids
                it_referencing_node_elements = in_referencing_node_elements
                io_change_handler            = in_change_handler
                io_message_handler           = in_message_handler
            ).
          ENDIF.

          IF mv_eco_root_node_id IS INITIAL.
            RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco.
          ENDIF.

        CATCH cx_a1fia_aar_create_qaf_eco INTO lx_a1fia_aar_create_qaf_eco.
          cl_a1fia_aar_util=>create_message(
            EXPORTING
              iv_message_class  = 'A1FIA_AAR_CREATE_QAF_ECO'
              iv_message_number = '018'
              iv_severity       = cm_esi_root=>co_severity_error
              iv_lifetime       = cm_esi_root=>co_lifetime_transition
            IMPORTING
              eo_message        = lo_message
          ).

          TRY.
              in_message_handler->add_message( lo_message ).
            CATCH cx_esf_message_handler INTO lx_esf_message_handler.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_message_handler.
          ENDTRY.
      ENDTRY.

    ELSEIF in_action_name = if_a1fia_aar_create_qaf_eco~co_action-root-execute OR
           in_action_name = if_a1fia_aar_create_qaf_eco~co_action-root-compound_schedule.

      lv_has_errors = abap_false.

      IF lines( in_node_ids ) <> 1. "cardinality of compound actions is one row only
        RAISE EXCEPTION TYPE cx_fatal_exception.
      ENDIF.

*     store data for after save
      mv_call_after_save = in_action_name.

      IF in_action_name = if_a1fia_aar_create_qaf_eco=>co_action-root-compound_schedule.
        ms_action_parameters = in_action_parameters.
      ENDIF.

      TRY.
          IF check_activate_enabled( in_node_ids ) = abap_true.
            CALL METHOD mo_lcp_bo->execute_action
              EXPORTING
                in_bo_node_name          = if_fia_acc_adjustment_run=>co_bo_node-root
                in_action_name           = if_fia_acc_adjustment_run=>co_action-root-activate
                in_node_ids              = in_node_ids
              IMPORTING
                out_change_notifications = ls_change_notification
                out_messages             = lt_message.
          ENDIF.
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      add_mapped_messages_int(
        it_message = lt_message
        io_message_handler = in_message_handler ).

      IF check_for_errors( lt_message ) = abap_true.
        CLEAR mv_call_after_save.
        lv_has_errors = abap_true.
        me->raise_stop_message(
          EXPORTING
            io_message_handler = in_message_handler
        ).
      ENDIF.
***************************************************************
* Changes for Activate, Schedule_directly and Save            *
***************************************************************
      IF in_action_name = if_a1fia_aar_create_qaf_eco=>co_action-root-compound_schedule AND
           lv_has_errors EQ abap_false.

        CLEAR mv_call_after_save.

        TRY.
            CALL METHOD mo_lcp_bo->execute_action
              EXPORTING
                in_bo_node_name          = if_fia_acc_adjustment_run=>co_bo_node-root
                in_action_name           = if_fia_acc_adjustment_run=>co_action-root-schedule_directly
                in_action_parameters     = ms_action_parameters
                in_node_ids              = in_node_ids
              IMPORTING
                out_change_notifications = ls_change_notification
                out_messages             = lt_message.
          CATCH cx_esf_core_service INTO lx_esf_core_service.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_core_service.
        ENDTRY.

        READ TABLE ls_change_notification-create_notifications INTO ls_create_notification
          WITH KEY
            bo_name = if_background_job_schedule=>co_bo_name
            bo_node_name = if_background_job_schedule=>co_bo_node-root.
        IF sy-subrc = 0.
          MV_BGJOB_SCHEDULED_NODE_ID = ls_create_notification-node_id.
        ENDIF.

        IF check_for_errors( lt_message ) = abap_true.
          me->raise_stop_message(
            EXPORTING
              io_message_handler = in_message_handler
          ).
        ENDIF.
**********************************************************************************

        add_mapped_messages_int(
          it_message = lt_message
          io_message_handler = in_message_handler ).
      ENDIF.

      IF in_action_name = if_a1fia_aar_create_qaf_eco~co_action-root-execute AND lv_has_errors EQ abap_false.
        " the direct Action Call is forbidden due to RBAM issues
        " therefore we try to achieve this by using a sequence Backgound_Job_Schedule, Save and Wait for Job completion
        IF mo_mdro_schedule_immediately IS NOT BOUND.
          mo_mdro_schedule_immediately = cl_ap_mdro_sched_immed_wait=>get_instance(
            iv_mdro_proxy_name     = mo_lcp_bo->bo_name
            it_mdro_root_node_id   = in_node_ids
          ).
        ENDIF.

        mo_mdro_schedule_immediately->schedule_immediately(
          EXPORTING
            io_facade   = me->mo_provider_context->get_lcp_facade( )
          IMPORTING
            et_messages = lt_message "Don't add this to message handler as we are not interested in TechO's messages
            et_mdro_root_to_bgjobsch_map = DATA(lt_mdro_root_to_bgjobsch_map)
        ).
        READ TABLE lt_mdro_root_to_bgjobsch_map INTO DATA(ls_mdro_root_to_bgjobsch_map)
          WITH KEY mdro_root_node_id = mv_eco_root_node_id.
        IF sy-subrc = 0.
          mv_bgjob_scheduled_node_id = ls_mdro_root_to_bgjobsch_map-bgjob_schedule_node_id.
        ELSE.
          CLEAR mv_bgjob_scheduled_node_id.
        ENDIF.

        IF check_for_errors( lt_message ) = abap_true.
          me->raise_stop_message(
            EXPORTING
              io_message_handler = in_message_handler
          ).
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "if_esf_provider_action~execute_action


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_ACTION_PARAMETERS          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_action~retrieve_default_action_param.
*CALL METHOD SUPER->IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
*  EXPORTING
*    IN_BO_NODE_NAME       =
*    IN_ACTION_NAME        =
*    IN_NODE_IDS           =
**  IMPORTING
**    out_action_parameters =
*    .
  ENDMETHOD.                    "IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_init~init.

    CALL METHOD super->if_esf_provider_init~init
      EXPORTING
        in_provider_context         = in_provider_context
        in_bo_name                  = in_bo_name
      CHANGING
        inout_preferred_trx_pattern = inout_preferred_trx_pattern.

    "Get LCP facade
    mo_lcp_facade = in_provider_context->get_lcp_facade( ).

    TRY.
        mo_eco_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = if_a1fia_aar_create_qaf_eco=>co_bo_name ).
      CATCH cx_esf_core_service INTO DATA(lx_esf_core_service).
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

  ENDMETHOD.                    "if_esf_provider_init~init


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_OVERRULING_CODE             TYPE        IF_ESF_TYPES=>TY_OVERRULING_CODE(optional)
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_interact_ctrl~do_post_processing.
    CALL METHOD super->if_esf_provider_interact_ctrl~do_post_processing
      EXPORTING
        in_overruling_code = in_overruling_code
      CHANGING
        inout_messages     = inout_messages.

    cl_a1fia_aar_util=>chk_for_fy_vrnt_msg_n_add_info(
      CHANGING
        ct_message = inout_messages
    ).
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_SUBSCRIPTION~ON_BO_CHANGED
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PUBLISHER_BO_NAME           TYPE        STRING
* | [--->] IN_BO_CHANGES                  TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_subscription~on_bo_changed.

    CALL METHOD super->if_esf_provider_subscription~on_bo_changed
      EXPORTING
        in_publisher_bo_name = in_publisher_bo_name
        in_bo_changes        = in_bo_changes
        in_change_handler    = in_change_handler.

    IF in_publisher_bo_name = ms_readonly_eco_root-projection_bo_name.
      handle_notifications(
        EXPORTING
          is_change_notification = in_bo_changes
          io_change_handler = in_change_handler
          ).
    ENDIF.

  ENDMETHOD.                    "if_esf_provider_subscription~on_bo_changed


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_cleanup_transaction.
    CALL METHOD super->if_esf_provider_transact_ctrl~on_after_cleanup_transaction
      CHANGING
        inout_messages = inout_messages.

    clear_buffers( ).
  ENDMETHOD.                    "if_esf_provider_transact_ctrl~on_after_cleanup_transaction


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_save_transaction.
    DATA:
          lv_rejected TYPE sesf_boolean,
          lt_change_notifications TYPE if_esf_types=>ty_change_notifications ##NEEDED , "#EC NEEDED
          lt_message TYPE if_esf_lcp=>ty_message_list,
          ls_attribute_map TYPE ty_attribute_map.

    DATA lv_index LIKE sy-tabix.
    DATA lt_eco_message TYPE cm_esi_root=>tt_esi_root.
    DATA lo_esi_t100 TYPE REF TO cm_esi_t100.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    FIELD-SYMBOLS <lo_esi_root> LIKE LINE OF inout_messages.

*  break schellerd.

    lv_rejected = in_rejected.

    IF lv_rejected IS INITIAL.

      IF mv_call_after_save = if_a1fia_aar_create_qaf_eco=>co_action-root-execute.

        CLEAR mv_call_after_save.
        IF mo_mdro_schedule_immediately IS BOUND.
          mo_mdro_schedule_immediately->wait_for_job(
            EXPORTING
              io_facade                = me->mo_provider_context->get_lcp_facade( )
              iv_max_wait_time         = 300
            IMPORTING
              et_messages              = lt_message
              es_change_notification   = lt_change_notifications
          ).
        ENDIF.

        READ TABLE mt_attribute_map INTO ls_attribute_map
          WITH TABLE KEY core_bo_node_key COMPONENTS core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-execution.
        IF ls_attribute_map-core_bo_node_id IS INITIAL. "Workaround if ON_BO_CHANGED had not been called in the above LCP call
          handle_notifications(
            EXPORTING
              is_change_notification = lt_change_notifications
              io_change_handler      = mo_change_handler
          ).
        ENDIF.

        add_mapped_messages_int(
          EXPORTING
            it_message = lt_message
          IMPORTING
            et_eco_message = lt_eco_message ).

        APPEND LINES OF lt_eco_message TO inout_messages.
      ENDIF.

    ENDIF.

    CALL METHOD super->if_esf_provider_transact_ctrl~on_after_save_transaction
      EXPORTING
        in_rejected    = in_rejected
      CHANGING
        inout_messages = inout_messages.

  ENDMETHOD.                    "if_esf_provider_transact_ctrl~on_after_save_transaction


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_before_save_transaction.

    CALL METHOD super->if_esf_provider_transact_ctrl~on_before_save_transaction
      IMPORTING
        out_rejected = out_rejected
        out_messages = out_messages.

* Any "mandatory fields missing" - raise msgs below
    CALL METHOD me->check_mandatory_attr_filled
      CHANGING
        cv_save_rejected = out_rejected
        ct_message       = out_messages.

    cl_a1fia_aar_util=>prevent_inconsistent_save(
      EXPORTING
        iv_core_root_node_id       = mv_eco_root_node_id
        io_lcp_core_bo             = mo_lcp_bo
        iv_scheduled_bgjob_node_id = mv_bgjob_scheduled_node_id
      CHANGING
        cv_rejected          = out_rejected
        ct_message           = out_messages
    ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_ID                     TYPE        SESF_BO_NODE_ID
* | [--->] IN_NODE_ID_IS_HANDLE           TYPE        SESF_BOOLEAN(optional)
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_code_values.
    DATA lv_core_bo_node_id TYPE sesf_bo_node_id.
    DATA lv_context_attr TYPE string. "Only for dump analysis
    DATA lv_core_bo_node_name TYPE string.
    DATA lv_core_bo_attr_name TYPE string.
    DATA lv_is_node_id_handle TYPE sesf_boolean.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lv_attribute_name   TYPE string.
    DATA lv_bo_node_name     TYPE string.
    DATA lt_code_values      TYPE if_esf_types=>tt_code_values.
    DATA ls_code_value       LIKE LINE OF lt_code_values.

    IF mv_eco_root_node_id IS NOT INITIAL.

      IF in_bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
        READ TABLE in_context_attributes INTO lv_context_attr INDEX 1. "Read into lv_context_attr
        ASSERT ID a1fia_aar_create_qaf_eco CONDITION sy-subrc <> 0 AND ( in_context_parameters IS NOT SUPPLIED OR in_context_parameters IS INITIAL ).

*     RETREIVE_CODE_VALUES for dedicated attrib "Assignment Type" is called. Get the values from the util class and return
        IF in_attribute_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type.
          cl_fia_cost_object_type_util=>get_cost_object_types_by_usage(
            EXPORTING
              iv_usage            = if_fia_costobj_type_usage_c=>gc_depreciation
              iv_free_co_only     = abap_false
            IMPORTING
              et_cost_object_type = DATA(lt_cost_object_type_list)
          ).

          LOOP AT lt_cost_object_type_list ASSIGNING FIELD-SYMBOL(<ls_cost_object_type_list>).
            CLEAR ls_code_value.
            ls_code_value-content = <ls_cost_object_type_list>-cost_object_type.
            APPEND ls_code_value TO out_code_values.
          ENDLOOP.
        ELSE.
          lv_attribute_name  = in_attribute_name.

          prepare_core_val_help_retrieve(
           EXPORTING
             iv_eco_node_name = in_bo_node_name
             iv_eco_attr_name = lv_attribute_name
             iv_eco_node_id = in_node_id
           IMPORTING
             ev_core_bo_node_name = lv_core_bo_node_name
             ev_core_bo_node_id = lv_core_bo_node_id
             ev_core_bo_node_id_is_handle = lv_is_node_id_handle
             ev_core_bo_attr_name = lv_core_bo_attr_name ).

          IF lv_core_bo_node_id IS NOT INITIAL.
            TRY.
                mo_lcp_bo->retrieve_code_values(
                  EXPORTING
                    in_bo_node_name       = lv_core_bo_node_name
                    in_node_id            = lv_core_bo_node_id
                    in_node_id_is_handle  = lv_is_node_id_handle
                    in_attribute_name     = lv_core_bo_attr_name
                  IMPORTING
                    out_code_values       = out_code_values
                ).
              CATCH cx_esf_core_service INTO lx_esf_core_service.
                RAISE EXCEPTION TYPE cx_fatal_exception
                  EXPORTING
                    previous = lx_esf_core_service.
            ENDTRY.
          ENDIF.
        ENDIF.

      ELSE.
        super->if_esf_provider_value_set~retrieve_code_values(
          EXPORTING
            in_bo_node_name       = in_bo_node_name
            in_node_id            = in_node_id
            in_node_id_is_handle  = in_node_id_is_handle
            in_attribute_name     = in_attribute_name
            in_context_parameters = in_context_parameters
            in_context_attributes = in_context_attributes
          IMPORTING
            out_code_values       = out_code_values
        ).
      ENDIF."Node Name = ROOT?

    ENDIF."ECO Root NODE ID Not INITIAL?

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_VALUE_SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_ID                     TYPE        SESF_BO_NODE_ID
* | [--->] IN_NODE_ID_IS_HANDLE           TYPE        SESF_BOOLEAN(optional)
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [--->] IN_QUERY_OPTIONS               TYPE        SESF_QUERY_OPTIONS(optional)
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        TY_AUTHORIZATION_CONTEXT(optional)
* | [<-()] OUT_VALUE_SET_NODE_IDS         TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_value_set.
    DATA lv_core_bo_node_id TYPE sesf_bo_node_id.
    DATA lv_context_attr TYPE string. "Only for dump analysis
    DATA lv_core_bo_node_name TYPE string.
    DATA lv_core_bo_attr_name TYPE string.
    DATA lv_is_node_id_handle TYPE sesf_boolean.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.


    IF mv_eco_root_node_id IS NOT INITIAL.
      IF in_bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.

      prepare_core_val_help_retrieve(
       EXPORTING
         iv_eco_node_name = in_bo_node_name
         iv_eco_attr_name = in_attribute_name
         iv_eco_node_id = in_node_id
       IMPORTING
         ev_core_bo_node_name = lv_core_bo_node_name
         ev_core_bo_node_id = lv_core_bo_node_id
         ev_core_bo_node_id_is_handle = lv_is_node_id_handle
         ev_core_bo_attr_name = lv_core_bo_attr_name ).

      IF lv_core_bo_node_id IS NOT INITIAL.

        IF in_attribute_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-project_id-content.
          restrict_projectid_value_set(
             EXPORTING
               in_selection_parameters = in_selection_parameters
             RECEIVING
               out_value_set_node_ids   = out_value_set_node_ids

          ).

*        ELSEIF in_attribute_name =  if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-formatted_id OR
*           in_attribute_name =  if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-formatted_id OR
*           in_attribute_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-formatted_id.
*
*          DATA lv_doc_type_attr_name TYPE string.
*          DATA lt_sel_param LIKE in_selection_parameters.
*          DATA ls_sel_param LIKE LINE OF in_selection_parameters.
*          DATA lo_doc_eco TYPE REF TO if_esf_lcp.
*
*          lt_sel_param = in_selection_parameters.
*
*          READ TABLE lt_sel_param ASSIGNING FIELD-SYMBOL(<ls_sel_param>)
*            WITH KEY attribute_name = 'OPERATIONAL_DOCUMENT_REFERENCE-OBJECT_TYPE_CODE-CONTENT'.
*          IF sy-subrc <> 0 OR <ls_sel_param>-low IS INITIAL.
*            CASE in_attribute_name.
*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-formatted_id.
*                lv_doc_type_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_type-content.
*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-formatted_id.
*                lv_doc_type_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_type-content.
*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-formatted_id.
*                lv_doc_type_attr_name  = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_type-content.
*            ENDCASE.
*
*            me->if_esf_provider_value_set~retrieve_code_values(
*              EXPORTING
*                in_bo_node_name       = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
*                in_node_id            = mv_eco_root_node_id
*                in_attribute_name     = lv_doc_type_attr_name
*              IMPORTING
*                out_code_values       = lt_out_code_values
*            ).
*
*            ls_sel_param-attribute_name = 'OPERATIONAL_DOCUMENT_REFERENCE-OBJECT_TYPE_CODE-CONTENT'.
*            ls_sel_param-sign = if_esf_types=>co_select_option_including.
*            ls_sel_param-option = if_esf_types=>co_select_option_equal.
*            LOOP AT lt_out_code_values ASSIGNING FIELD-SYMBOL(<ls_code_val>).
*              ls_sel_param-low = <ls_code_val>-content.
*              APPEND ls_sel_param TO lt_sel_param.
*            ENDLOOP.
*          ENDIF.
*
*          TRY.
*              lo_doc_eco = mo_lcp_facade->get_lcp( if_a1fia_fav_ssd_vhelp_co=>co_bo_name ).
*            CATCH cx_esf_core_service INTO lx_esf_core_service.
*              RAISE EXCEPTION TYPE cx_fatal_exception
*                EXPORTING
*                  previous = lx_esf_core_service.
*          ENDTRY.
*
*          TRY.
*              lo_doc_eco->query(
*                EXPORTING
*                  in_bo_node_name          = if_a1fia_fav_ssd_vhelp_co=>co_bo_node-qrnview_ssd
*                  in_query_name            = if_a1fia_fav_ssd_vhelp_co=>co_query-qrnview_ssd-query_by_elements
*                  in_query_options         = in_query_options
*                  in_selection_parameters  = lt_sel_param
*                  in_authorization_context = in_authorization_context
*                IMPORTING
*                  out_node_ids             = out_value_set_node_ids
*              ).
*            CATCH cx_esf_core_service INTO lx_esf_core_service.
*              RAISE EXCEPTION TYPE cx_fatal_exception
*                EXPORTING
*                  previous = lx_esf_core_service.
*          ENDTRY.
        ELSE.
          TRY.
              mo_lcp_bo->retrieve_value_set(
                EXPORTING
                  in_bo_node_name          = lv_core_bo_node_name
                  in_node_id               = lv_core_bo_node_id
                  in_node_id_is_handle     = lv_is_node_id_handle
                  in_attribute_name        = lv_core_bo_attr_name
                  in_selection_parameters  = in_selection_parameters
                  in_query_options         = in_query_options
                  in_authorization_context = in_authorization_context
                  in_fill_data             = abap_false
                IMPORTING
                  out_value_set_node_ids   = out_value_set_node_ids
              ).
            CATCH cx_esf_core_service INTO lx_esf_core_service.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_core_service.
          ENDTRY.

        ENDIF.
      ENDIF.

      ELSE.
        super->if_esf_provider_value_set~retrieve_value_set(
          EXPORTING
            in_bo_node_name          = in_bo_node_name
            in_node_id               = in_node_id
            in_node_id_is_handle     = in_node_id_is_handle
            in_attribute_name        = in_attribute_name
            in_selection_parameters  = in_selection_parameters
            in_query_options         = in_query_options
            in_authorization_context = in_authorization_context
          RECEIVING
            out_value_set_node_ids   = out_value_set_node_ids
        ).
      ENDIF."Node Name = ROOT?
    ENDIF."Root Node ID filled?

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->INIT_BUFFERS
* +-------------------------------------------------------------------------------------------------+
* | [!CX!] CX_A1FIA_AAR_CREATE_QAF_ECO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD init_buffers.
    IF ms_readonly_eco_root-projection_bo_name IS INITIAL.
      RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco."Please set the projection_bo_name prior to this call.
    ENDIF.

    mo_provider_context->register_on_bo_changes( ms_readonly_eco_root-projection_bo_name ).
    mo_provider_context->register_on_bo_changes( if_background_job=>co_bo_name ).

    populate_run_specific_nodes( ).
    populate_attribute_map( ).
    populate_dedicated_attrib( ).
    populate_eco_root_attr_names( ).


    IF mo_task_region_helper IS NOT BOUND.
      mo_task_region_helper = cl_coutl_task_region_helper=>create_task_region_helper(
        in_bo_name = ms_readonly_eco_root-projection_bo_name
        in_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root
        in_lcp_facade = mo_provider_context->get_lcp_facade( )
      ).
    ENDIF.
  ENDMETHOD.                    "init_buffers


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->IS_FLOORPLAN_EDITABLE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_IS_EDITABLE                 TYPE        SYBOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD is_floorplan_editable.
  IF ms_readonly_eco_root-id-content IS INITIAL."After save ID would be generated. After save we dont allow modifications
    rv_is_editable = abap_true.
  ELSE.
    rv_is_editable = abap_false.
  ENDIF.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_AAR_CREATE_QAF_ECO->MODIFY_CORE_BO_FROM_ECO_ROOT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_CHANGED_ATTRIBUTES          TYPE        SESF_STRING_TAB
* | [--->] IS_ECO_ROOT                    TYPE        IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT
* | [--->] IO_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD modify_core_bo_from_eco_root.
    DATA lt_core_modification                   TYPE                                if_esf_provider_access=>tt_modifications.
    DATA lr_attribute_map                       TYPE REF TO                         ty_attribute_map. "For MODIFY statement
    DATA ls_attribute_map                       TYPE                                ty_attribute_map.
    DATA lv_eco_attr_name                       TYPE                                string.
    DATA lv_core_bo_node_type                   TYPE                                string.
    DATA lt_node_id TYPE sesf_bo_node_id_tab.
    DATA lv_core_bo_table_type TYPE string.
    DATA lv_core_attr_struc_name TYPE string.
    DATA lr_table TYPE REF TO data.
    DATA lx_uuid_error TYPE REF TO cx_uuid_error.
    DATA lv_clear_cob_tc TYPE syboolean.
    DATA lv_clear_proj_id TYPE syboolean.
    DATA lv_clear_cost_id TYPE syboolean.
    DATA lt_message TYPE cm_esi_root=>tt_esi_root.
    DATA ls_change_notification TYPE if_esf_types=>ty_change_notifications.
    DATA ls_eco_change_notify LIKE ls_change_notification.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.


    FIELD-SYMBOLS <ls_core_modification>                  TYPE                               if_esf_provider_access=>ty_modifications.
    FIELD-SYMBOLS <ls_core_bo_data>                       TYPE                                any.
    FIELD-SYMBOLS <lv_core_bo_attr_val>                   TYPE                                any.
    FIELD-SYMBOLS <lv_eco_attr_name_val>                  TYPE                                any.
    FIELD-SYMBOLS <lv_node_id>                            TYPE                                sesf_bo_node_id.
    FIELD-SYMBOLS <lt_core_bo_defaulted_data>             TYPE INDEX TABLE.
    FIELD-SYMBOLS <ls_core_bo_defaulted_data>             TYPE any.
    FIELD-SYMBOLS <ls_core_bo_attr_struct>                TYPE any.

    LOOP AT it_changed_attributes INTO lv_eco_attr_name.
      READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
        WITH TABLE KEY eco_attr_name = lv_eco_attr_name.

      IF sy-subrc <> 0.
*        IF sy-uname <> 'LA'.
*          READ TABLE mt_dedicated_attributes TRANSPORTING NO FIELDS WITH KEY table_line = lv_eco_attr_name.
*          IF sy-subrc <> 0.
*            RAISE EXCEPTION TYPE cx_fatal_exception. "If it dumps here then the ECO-CORE BO attribute mapping is missing in populate_attribute_map
*            "Also take care to check populate_run_specific_nodes
*          ENDIF.
*        ELSE.
        RAISE EXCEPTION TYPE cx_fatal_exception.
*        ENDIF.
      ENDIF.

      IF lr_attribute_map->is_dedicated = abap_true.
        CONTINUE.
      ENDIF.

      READ TABLE lt_core_modification ASSIGNING <ls_core_modification>"If already an entry in the modifications table is present for this node update that
        WITH KEY bo_node_name = lr_attribute_map->core_bo_node_name.

      IF sy-subrc <> 0.
        APPEND INITIAL LINE TO lt_core_modification ASSIGNING <ls_core_modification>.
        <ls_core_modification>-bo_node_name = lr_attribute_map->core_bo_node_name.
        CONCATENATE 'IF_FIA_ACC_ADJUSTMENT_RUN=>TY_' lr_attribute_map->core_bo_node_name INTO lv_core_bo_node_type.
        CREATE DATA <ls_core_modification>-data TYPE (lv_core_bo_node_type).

        IF lr_attribute_map->core_bo_node_id IS INITIAL. "If the node is not created in the core BO yet, create it
          <ls_core_modification>-change_mode = if_esf_provider_access=>co_change_mode_create.
          IF lr_attribute_map->core_bo_node_name <> if_fia_acc_adjustment_run=>co_bo_node-root."If creation of subnode, fill the source info
            <ls_core_modification>-node_id = get_uuid( ). "Handle
            <ls_core_modification>-source_node_id = is_eco_root-node_id. "ECO root node ID is same as core BO ROOT node id (could be handle too!)
            <ls_core_modification>-source_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root. "Assumption that the core bo node is directly under Root
            <ls_core_modification>-association_name = lr_attribute_map->core_bo_node_name. "Assumption that the core bo node is directly under Root

            "Root is the source node ID for all the sel by nodes and parameter and description
            IF mv_eco_root_node_id IS NOT INITIAL. "If the root of core BO is already created
              <ls_core_modification>-source_node_id_is_handle = abap_false."Assumption that the core bo node is directly under Root
            ELSE.
              <ls_core_modification>-source_node_id_is_handle = abap_true."Assumption that the core bo node is directly under Root
            ENDIF.
          ELSE.
            <ls_core_modification>-node_id = is_eco_root-node_id.
          ENDIF.

          ASSIGN <ls_core_modification>-data->* TO <ls_core_bo_data>.

          "Get the defaulted values and default them while creating new node instances
          TRY.
              CLEAR lt_node_id.
              APPEND <ls_core_modification>-node_id TO lt_node_id.

              CONCATENATE 'IF_FIA_ACC_ADJUSTMENT_RUN=>TT_' <ls_core_modification>-bo_node_name INTO lv_core_bo_table_type.
              CREATE DATA lr_table TYPE (lv_core_bo_table_type).
              ASSIGN lr_table->* TO <lt_core_bo_defaulted_data>.

              mo_lcp_bo->retrieve_default_node_values(
                EXPORTING
                  in_bo_node_name               = <ls_core_modification>-bo_node_name
                  in_node_id_handles            = lt_node_id
                  in_association_name           = <ls_core_modification>-association_name
                  in_source_bo_node_name        = <ls_core_modification>-source_bo_node_name
                  in_source_node_id             = <ls_core_modification>-source_node_id
                  in_source_node_id_is_handle   = <ls_core_modification>-source_node_id_is_handle
                IMPORTING
                  out_data                      = <lt_core_bo_defaulted_data>
              ).

              READ TABLE <lt_core_bo_defaulted_data> ASSIGNING <ls_core_bo_defaulted_data> INDEX 1.
              IF sy-subrc = 0.
                CONCATENATE 'IF_FIA_ACC_ADJUSTMENT_RUN=>CO_ATTR-' <ls_core_modification>-bo_node_name INTO lv_core_attr_struc_name.
                ASSIGN (lv_core_attr_struc_name) TO <ls_core_bo_attr_struct>.

                ASSERT sy-subrc = 0.

                extract_editable_non_init_attr(
                  EXPORTING
                    is_co_attr_struct     = <ls_core_bo_attr_struct>
                    is_node_data          = <ls_core_bo_defaulted_data>
                    iv_bo_node_name       = <ls_core_modification>-bo_node_name
                  CHANGING
                    ct_changed_attributes = <ls_core_modification>-changed_attributes
                ).

                "Fill up the defaulted attributes in the modifications structure
                MOVE-CORRESPONDING <ls_core_bo_defaulted_data> TO <ls_core_bo_data>.
              ENDIF.


              FREE <lt_core_bo_defaulted_data>.
              UNASSIGN <lt_core_bo_defaulted_data>.
            CATCH cx_esf_core_service INTO lx_esf_core_service.
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_core_service.
          ENDTRY.

          "Set the NODE_ID correctly in the data part of modifications structure
          ASSIGN COMPONENT if_esf_types=>co_node_id_proxy_name OF STRUCTURE <ls_core_bo_data> TO <lv_node_id>.
          <lv_node_id> = <ls_core_modification>-node_id. " Fill the node_id handle, which was created above

        ELSE.
          <ls_core_modification>-change_mode = if_esf_provider_access=>co_change_mode_update.
          <ls_core_modification>-node_id = lr_attribute_map->core_bo_node_id.
        ENDIF.
      ENDIF.

      "If this is create of the core BO Root itself and the ID is set as changed don't add to changed attr
      IF lr_attribute_map->core_bo_attr_name <> if_fia_acc_adjustment_run=>co_attr-root-id-content.
        APPEND lr_attribute_map->core_bo_attr_name TO <ls_core_modification>-changed_attributes.
        ASSIGN <ls_core_modification>-data->* TO <ls_core_bo_data>.
        ASSIGN COMPONENT lr_attribute_map->core_bo_attr_name OF STRUCTURE <ls_core_bo_data> TO <lv_core_bo_attr_val>.
        ASSIGN COMPONENT lv_eco_attr_name OF STRUCTURE is_eco_root TO <lv_eco_attr_name_val>.
        <lv_core_bo_attr_val> = <lv_eco_attr_name_val>.
      ENDIF.


*     GR/IR Specific Check: Raise warning if recalculate all items is selected
      IF lv_eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-correction_run_indicator AND
        is_eco_root-correction_run_indicator EQ abap_true.
        IF ms_readonly_eco_root-purchase_doc_id IS INITIAL.
          CALL METHOD cl_a1fia_aar_util=>create_message
            EXPORTING
              iv_message_class  = 'A1FIA_AAR_CREATE_QAF'
              iv_message_number = '030'
              iv_severity       = cm_esi_root=>co_severity_warning
              iv_lifetime       = cm_esi_root=>co_lifetime_transition
            IMPORTING
              eo_message        = DATA(lo_msg_grir).
          TRY.
              io_message_handler->add_message( in_message = lo_msg_grir ).
            CATCH cx_esf_message_handler INTO DATA(lx_esf_message_handler).
              RAISE EXCEPTION TYPE cx_fatal_exception
                EXPORTING
                  previous = lx_esf_message_handler.
          ENDTRY.
        ENDIF. "Purchase doc ID is INITIAL?
      ENDIF.

    ENDLOOP.

    TRY.
        mo_lcp_bo->modify(
          EXPORTING
            in_modifications         = lt_core_modification
          IMPORTING
            out_change_notifications = ls_change_notification
            out_messages             = lt_message
        ).
      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

    CLEAR ls_eco_change_notify.
    io_change_handler->get_change_notifications(
      EXPORTING
        in_bo_name               = if_a1fia_aar_create_qaf_eco=>co_bo_name
        in_bo_node_name          = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
      IMPORTING
        out_change_notifications = ls_eco_change_notify
    ).

    IF ls_eco_change_notify IS INITIAL.  "If the notification is already sent out in ON_BO_CHANGED nothing to do here
      handle_notifications(
        EXPORTING
          is_change_notification = ls_change_notification
          io_change_handler      = io_change_handler
      ).
    ENDIF.

    "Notifications handled in ON_BO_CHANGED
    add_mapped_messages_int(
      it_message = lt_message
      io_message_handler = io_message_handler ).
  ENDMETHOD.                    "modify_core_bo_from_eco_root


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->POPULATE_ATTRIBUTE_MAP
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD populate_attribute_map.
    DATA ls_attribute_map TYPE ty_attribute_map.
    CLEAR mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-acl_company_uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-root-company_uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-accounting_closing_step_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-accounting_closing_step_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-accounting_period_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_time.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_time-lowb_accounting_period_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-business_partner_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_business_partner.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_business_partner-lowb_business_partner_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_aar_for_cancel.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_aar_for_cancel-cancel_mdro_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_aar_for_cancel.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_aar_for_cancel-cancellation_mass_data_run_obj-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-chart_of_accounts_code.
*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_glacct.
*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_glacct-chart_of_accounts_code.
*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-chart_of_accounts_item_code-content.
*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_glacct.
*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_glacct-lowb_chart_of_accounts_item_c-content.
*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-company_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_company.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_company-lowb_company_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cost_centre_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_cost_centre.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_cost_centre-lowb_cost_centre_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-currency_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_currency.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_currency-lowb_currency_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_org_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_cust_srvorg.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_cust_srvorg-lower_boundary_customer_servi1.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-description-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-description.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-description-description-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-description-language_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-description.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-description-description-language_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fiscal_year_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_time.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_time-lowb_fiscal_year_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fixed_asset_class.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_fixed_asset_class.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_fixed_asset_class-lowb_fixed_asset_class_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fixed_asset_key-company_uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_fixed_asset.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_fixed_asset-lower_boundary_fixed_asset_key-company_uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fixed_asset_key-id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_fixed_asset.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_fixed_asset-lower_boundary_fixed_asset_key-id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fixed_asset_key-master_fixed_asset_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_fixed_asset.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_fixed_asset-lower_boundary_fixed_asset_key-master_fixed_asset_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-house_bank_id.
*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_house_bank.
*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_house_bank-lowb_house_bank_id.
*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-root-id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-life_cycle_status.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-root-status-life_cycle_status_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-ovh_assess_rule_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_ohc_asses_rule.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_ohc_asses_rule-lowb_ohc_asses_rule_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-party_role_category_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_party_role.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_party_role-lowb_party_role_category_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-permanent_establishment_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_permest.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_permest-lowb_permest_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-processing_status-processing_status_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-execution.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-execution-status-processing_status_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-production_lot_formatted_id-formatted_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_production_lot.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_production_lot-lowb_prod_lot_formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-production_lot_formatted_id-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_production_lot.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_production_lot-lowb_prod_lot_uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-project_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_project.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_project-lowb_project_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-project_task_id .
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_project.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_project-lowb_taskref_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_organisation_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_sales_org.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_sales_org-lowb_sales_organisation_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-set_of_books_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_set_of_books.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_set_of_books-lowb_set_of_books_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-test_run_indicator.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-test_run_indicator.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sob_asset_valuation_view_key-set_of_books_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_valuation_view.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_valuation_view-lower_boundary_sob_asset_vv_k-set_of_books_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sob_asset_valuation_view_key-sob_asset_valuation_view_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_valuation_view.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_valuation_view-lower_boundary_sob_asset_vv_k-sob_asset_valuation_view_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-formatted_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-object_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-object_id-scheme_agency_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_agency_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-object_id-scheme_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-object_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-object_node_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_node_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

*--> Start of Changes (1802)
    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-formatted_id..
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-object_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-object_id-scheme_agency_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_agency_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-object_id-scheme_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-object_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-object_node_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_node_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-rac_id-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.
*<-- End of Changes (1802)

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_type-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_organisation_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_sales_org.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_sales_org-lowb_sales_organisation_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    " Start Customer Service Document ID
    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-formatted_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-object_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-object_id-scheme_agency_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_agency_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-object_id-scheme_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-object_node_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_node_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-object_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.
    " End Customer Service Document ID

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_type-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_org_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_cust_srvorg.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_cust_srvorg-lower_boundary_customer_servi1.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-bcf_step_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-bcf_step_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-formatted_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-object_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-object_id-scheme_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_id-scheme_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-object_id-scheme_agency_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_id-scheme_agency_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-object_node_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_node_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-object_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id_upb-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_type-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-upb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-formatted_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-formatted_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-object_id-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-object_id-scheme_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-object_id-scheme_agency_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_id-scheme_agency_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-object_node_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_node_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-object_type_code-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_type-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_oed_ref.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_oed_ref-lowb_oed_ref-object_type_code-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-correction_run_indicator.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-correction_run_indicator.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-log_section_uuid-content.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-root.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-root-log_section_uuid-content.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_id.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_cost_object.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_cost_object-lowb_cost_object_key-cost_object_id.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-key-cost_object_type_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_cost_object.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_cost_object-lowb_cost_object_key-cost_object_type_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-multi_customer_proj_indicator.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-multi_customer_proj_indicator.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-fxasr_type_code.
    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-parameters.
    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-parameters-type_code.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*                                         Dedicated attributes configuration
*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

***************************************************************************************************************************
*   Now fill the dedicated attributes which get filled in HANDLE_CREATE_WITH_REF_ACTIONS method
*   and whose value do not get changed after that
***************************************************************************************************************************
    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-projection_bo_name.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-mdro_type_code.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-is_period_end_close_triggered.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_log_section_uuid-content.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-content.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-language_code.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-ap_or_ar.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_dedic_attr_default_exit( io_containing_obj_ref = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.


******************************************************************************************************************************************************
*   Now fill the dedicated attributes which are not filled in HANDLE_CREATE_WITH_REF_ACTIONS
*   and whose value DO get changed (either automatically or by user)
******************************************************************************************************************************************************
    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-enable_diplay_log.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_enable_display_log_exit( io_containing_obj_ref    = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_assignment_type_exit( io_containing_obj_ref    = me
                                                                       iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name
                                                                       iv_is_editable           = abap_true  ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

    CLEAR ls_attribute_map.
    ls_attribute_map-eco_attr_name     = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code.
    ls_attribute_map-is_dedicated      = abap_true.
    ls_attribute_map-dedicated_exit    = NEW lcl_sales_obj_sel_code_exit( io_containing_obj_ref    = me
                                                                          iv_dedicated_attrib_name = ls_attribute_map-eco_attr_name
                                                                          iv_is_editable           = abap_true  ).
    CLEAR ls_attribute_map-core_bo_node_name.
    CLEAR ls_attribute_map-core_bo_attr_name.
    INSERT ls_attribute_map INTO TABLE mt_attribute_map.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->POPULATE_DEDICATED_ATTRIB
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD populate_dedicated_attrib.
    DATA lr_attribute_map TYPE REF TO ty_attribute_map.

    CLEAR mt_dedicated_attributes.
*    IF sy-uname <> 'LA'.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-projection_bo_name INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-mdro_type_code INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-is_period_end_close_triggered INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_log_section_uuid-content INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-content INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_description-language_code INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-can_mdro_log_section_uuid-content INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-enable_diplay_log INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-ap_or_ar INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-assignment_type INTO TABLE mt_dedicated_attributes.
*      INSERT if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_obj_sel_code INTO TABLE mt_dedicated_attributes.
*    ELSE.
    LOOP AT mt_attribute_map REFERENCE INTO lr_attribute_map
        USING KEY core_bo_node_key WHERE core_bo_node_name = space AND is_dedicated = abap_true.
      INSERT lr_attribute_map->eco_attr_name INTO TABLE mt_dedicated_attributes.
    ENDLOOP.
*    ENDIF.

  ENDMETHOD.  "POPULATE_DEDICATED_ATTRIB


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->POPULATE_ECO_ROOT_ATTR_NAMES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CO_ATTR_STRUCT              TYPE        ANY(optional)
* | [<-->] CT_ECO_NODE_ATTRIBUTES         TYPE        SESF_STRING_TAB(optional)
* | [!CX!] CX_A1FIA_AAR_CREATE_QAF_ECO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD populate_eco_root_attr_names.

    DATA lr_attribute_map TYPE REF TO ty_attribute_map.
    DATA lv_is_within_recursion TYPE sesf_boolean.

    FIELD-SYMBOLS <lv_co_attr_field_struct> TYPE any.
    FIELD-SYMBOLS <lv_field_value>          TYPE any.
    FIELD-SYMBOLS <ls_co_attr_struct>       TYPE any.

    IF mt_eco_root_attributes IS NOT INITIAL.
      ct_eco_node_attributes = mt_eco_root_attributes.
      RETURN.
    ENDIF.

    IF mt_run_specific_node IS INITIAL.
      RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco
        EXPORTING
          textid = cx_a1fia_aar_create_qaf_eco=>gc_buffer_not_filled.
    ENDIF.

    IF is_co_attr_struct IS NOT SUPPLIED.
      lv_is_within_recursion = abap_false.
      ASSIGN if_a1fia_aar_create_qaf_eco=>co_attr-root TO <ls_co_attr_struct>.
    ELSE.
      lv_is_within_recursion = abap_true.
      ASSIGN is_co_attr_struct TO <ls_co_attr_struct>.
    ENDIF.

    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE <ls_co_attr_struct> TO <lv_co_attr_field_struct>.
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      ASSIGN COMPONENT 1 OF STRUCTURE <lv_co_attr_field_struct> TO <lv_field_value>.
      IF sy-subrc = 0. "Is <lv_co_attr_field_struct> a deep structure?
*     If <lv_co_attr_field_struct> is again a deep structure - recursive call
        populate_eco_root_attr_names(
          EXPORTING
            is_co_attr_struct = <lv_co_attr_field_struct>
          CHANGING
            ct_eco_node_attributes = ct_eco_node_attributes ).
      ELSE.
        "<lv_co_attr_field_struct> is not a deep structure . Can be added to the list

        "If it is present in the attributes map & the node is valid for the current projection then add it to the list
        READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
          WITH TABLE KEY eco_attr_name = <lv_co_attr_field_struct>.
        IF sy-subrc = 0.
          READ TABLE mt_run_specific_node TRANSPORTING NO FIELDS
            WITH TABLE KEY table_line = lr_attribute_map->core_bo_node_name.
          IF sy-subrc = 0.
            APPEND <lv_co_attr_field_struct> TO ct_eco_node_attributes.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDDO.

    IF lv_is_within_recursion = abap_false.
*      IF sy-uname <> 'LA'.
*     Finally append the "dedicated" fields of root.
*        APPEND LINES OF get_root_dedicated_attr_names( ) TO ct_eco_node_attributes.
*      ENDIF.
      mt_eco_root_attributes = ct_eco_node_attributes.
    ENDIF.
  ENDMETHOD.                    "populate_eco_root_attr_names


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->POPULATE_RUN_SPECIFIC_NODES
* +-------------------------------------------------------------------------------------------------+
* | [!CX!] CX_A1FIA_AAR_CREATE_QAF_ECO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD populate_run_specific_nodes.
    DATA lv_node_proxy_name    TYPE string.
    DATA lo_bo_desc            TYPE REF TO if_esf_bo_desc.
    DATA lo_bo_node_desc       TYPE REF TO if_esf_bo_node_desc.
    DATA lx_esf_metadata_error TYPE REF TO cx_esf_metadata_error.

*   Give out the run specific node names which are used in the screens

    IF ms_readonly_eco_root-projection_bo_name IS INITIAL.
      RAISE EXCEPTION TYPE cx_a1fia_aar_create_qaf_eco
        EXPORTING
          textid = cx_a1fia_aar_create_qaf_eco=>gc_buffer_not_filled.
    ENDIF.

    CLEAR mt_run_specific_node.

    APPEND if_fia_acc_adjustment_run=>co_bo_node-description TO mt_run_specific_node.
    APPEND if_fia_acc_adjustment_run=>co_bo_node-execution TO mt_run_specific_node.
    APPEND if_fia_acc_adjustment_run=>co_bo_node-parameters TO mt_run_specific_node.
    APPEND if_fia_acc_adjustment_run=>co_bo_node-root TO mt_run_specific_node.

*   Now collect the SEL_BY... node names.
    TRY.
        lo_bo_desc = cl_esf_descriptor_factory=>get_bo_descriptor( in_bo_proxy_name = ms_readonly_eco_root-projection_bo_name  ).
        LOOP AT lo_bo_desc->get_bo_node_descriptors( ) INTO lo_bo_node_desc.
          lv_node_proxy_name = lo_bo_node_desc->get_proxy_name( ).
          IF lv_node_proxy_name NP 'SEL_BY_*'.
            CONTINUE. "We want to collect only SEL_BY_... node names
          ENDIF.

          IF lo_bo_node_desc->get_property_value( property_name = if_esf_desc=>co_property_enabled ) = abap_true
            OR lo_bo_node_desc->is_property_value_final( property_name = if_esf_desc=>co_property_enabled ) = abap_false.
            APPEND lv_node_proxy_name TO mt_run_specific_node.
          ENDIF.
        ENDLOOP.

      CATCH cx_esf_metadata_error INTO lx_esf_metadata_error.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_metadata_error.
    ENDTRY.

*For Reference
*FIA_ARPLA_DISC_RUN
*FIA_ARPLA_RGRP_RUN
*FIA_ARP_LEDGER_ACCT_REM
*FIA_BAL_CARFWD_RUN
*FIA_CASHLA_FCR_RUN
*FIA_FIXED_ASSET_DEPR
*FIA_GRIR_CLEARING_RUN
*FIA_INVEN_PRICE_CHNG_RUN
*FIA_ODCLA_OVERHEAD_RUN
*FIA_OHCLA_OVERHEAD_RUN
*FIA_OHC_ASSES_RUN
*FIA_PRDLA_OVERHEAD_RUN
*FIA_SLSLA_ACCRUALS_RUN
*FIA_SLSLA_OVERHEAD_RUN
*FIA_WIP_CLEARING_RUN
*FIA_COB_SETTLEMENT_RUN
  ENDMETHOD.                    "populate_run_specific_nodes


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->PREPARE_CORE_VAL_HELP_RETRIEVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ECO_ATTR_NAME               TYPE        STRING
* | [--->] IV_ECO_NODE_NAME               TYPE        STRING
* | [--->] IV_ECO_NODE_ID                 TYPE        SESF_BO_NODE_ID
* | [<---] EV_CORE_BO_NODE_NAME           TYPE        STRING
* | [<---] EV_CORE_BO_NODE_ID             TYPE        SESF_BO_NODE_ID
* | [<---] EV_CORE_BO_NODE_ID_IS_HANDLE   TYPE        SESF_BOOLEAN
* | [<---] EV_CORE_BO_ATTR_NAME           TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD prepare_core_val_help_retrieve.

    DATA ls_attribute_map TYPE ty_attribute_map.
    DATA lt_single_node_id_handle TYPE sesf_bo_node_id_tab.
    DATA lv_core_bo_table_type TYPE string.
    DATA lr_table TYPE REF TO data.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    FIELD-SYMBOLS <lt_dummy_data> TYPE INDEX TABLE.

    CLEAR ev_core_bo_attr_name.
    CLEAR ev_core_bo_node_id.
    CLEAR ev_core_bo_node_id_is_handle.
    CLEAR ev_core_bo_node_name.

    CHECK mv_eco_root_node_id IS NOT INITIAL AND iv_eco_node_id = mv_eco_root_node_id.
    CHECK iv_eco_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.

    READ TABLE mt_attribute_map INTO ls_attribute_map
      WITH TABLE KEY eco_attr_name = iv_eco_attr_name.

    CHECK sy-subrc = 0 AND ls_attribute_map-is_dedicated = abap_false.
    CHECK ls_attribute_map-core_bo_node_name <> if_fia_acc_adjustment_run=>co_bo_node-root. "see the assumption in the below LCP call

    ev_core_bo_node_id = ls_attribute_map-core_bo_node_id.
    ev_core_bo_attr_name = ls_attribute_map-core_bo_attr_name.
    ev_core_bo_node_name = ls_attribute_map-core_bo_node_name.

    IF ev_core_bo_node_id IS INITIAL.
      ev_core_bo_node_id_is_handle = abap_true.
      ev_core_bo_node_id = get_uuid( ).
      CLEAR lt_single_node_id_handle.
      APPEND ev_core_bo_node_id TO lt_single_node_id_handle.

      CONCATENATE 'IF_FIA_ACC_ADJUSTMENT_RUN=>TT_' ev_core_bo_node_name INTO lv_core_bo_table_type.
      CREATE DATA lr_table TYPE (lv_core_bo_table_type).
      ASSIGN lr_table->* TO <lt_dummy_data>.

      "we are not really interested in defaults but have to make the handle known to the BO.
      "This is the only way to call dynamic value help for an empty secondary node
      TRY.
          mo_lcp_bo->retrieve_default_node_values(
            EXPORTING
              in_bo_node_name               = ls_attribute_map-core_bo_node_name
              in_node_id_handles            = lt_single_node_id_handle
              in_association_name           = ls_attribute_map-core_bo_node_name "Assumption that the core bo node is directly under Root
              in_source_bo_node_name        = if_fia_acc_adjustment_run=>co_bo_node-root "Assumption that the core bo node is directly under Root
              in_source_node_id             = mv_eco_root_node_id "Assumption that the core bo node is directly under Root
              in_source_node_id_is_handle   = abap_false
            IMPORTING
              out_data                      = <lt_dummy_data> "NOT used
          ).
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->QUERY_SOB_BY_COMP_SOB
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_SELECTION_PARAM             TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [--->] IT_REQUESTED_ATTR              TYPE        SESF_STRING_TAB(optional)
* | [<---] ET_DATA_COMP_ACTIVATION_STAT   TYPE        IF_FIA_SET_OF_BOOKS=>TT_COMPANY_ASSIGNMENT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD query_sob_by_comp_sob.
    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    IF mo_sob_lcp IS NOT BOUND.
      TRY.
          mo_sob_lcp = mo_adaptation_handler->get_lcp( if_fia_set_of_books=>co_bo_name ).
        CATCH cx_bsa_runtime INTO lx_bsa_runtime.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_bsa_runtime.
      ENDTRY.
    ENDIF.

    TRY.
        mo_sob_lcp->query(
        EXPORTING
          in_bo_node_name          = if_fia_set_of_books=>co_bo_node-company_assignment
          in_query_name            = if_fia_set_of_books=>co_query-company_assignment-by_sob_and_company
          in_selection_parameters  = it_selection_param
          in_requested_attributes  = it_requested_attr
          in_fill_data             = abap_true
        IMPORTING
          out_data                 = et_data_comp_activation_stat
      ).

*   We are intereted only in the active SOB-Company assignments
        IF ( ms_readonly_eco_root-projection_bo_name = 'FIA_FIXED_ASSET_DEPR' ). "Consider partially active SOBs too for this exceptional case
          DELETE et_data_comp_activation_stat WHERE status-activation_status_code = cl_apc_activation_status_code=>co_inactive.
        ELSE.
          DELETE et_data_comp_activation_stat WHERE status-activation_status_code <> cl_apc_activation_status_code=>co_active.
        ENDIF.

      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->RAISE_STOP_MESSAGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD raise_stop_message.
* in the UI "trigger save after execution" is set for the compound actions
* save will not be triggered by GCP if and error message is raised during EXECUTE_ACTION
* however these messages have to be passed via IN_MESSAGE_HANDLER and not only
* by ECO message manager.
* So a message is raised here. This message is later suppressed in message mapping. That
* means this message should not reach the end user

    DATA lt_message TYPE cm_esi_root=>tt_esi_root.
    DATA lx_message_handler TYPE REF TO cx_esf_message_handler.

    cl_a1fia_aar_util=>create_message(
      EXPORTING
        iv_message_class  = 'A1FIA_ACCOUNTING'
        iv_message_number = '103'
        iv_severity       = cm_esi_root=>co_severity_error
        iv_lifetime       = cm_esi_root=>co_lifetime_transition
      CHANGING
        ct_message        = lt_message
    ).

    TRY.
        CALL METHOD io_message_handler->add_messages
          EXPORTING
            in_messages = lt_message.
      CATCH cx_esf_message_handler INTO lx_message_handler.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_message_handler.
    ENDTRY.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->RESTRICT_PROJECTID_VALUE_SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_SELECTION_PARAMETERS        TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [<-()] OUT_VALUE_SET_NODE_IDS         TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD restrict_projectid_value_set.

* this method restricts the project id ovs based on type of projects (overhead projects or direct projects)
* for this we need to check the business configuration BPVT codes being set for the projects
* hence we query project type BCO to get all the project type codes corresponding to direct or overhead BPVT codes.
    DATA:
            lt_sel_params TYPE sesf_selection_parameters_tab,
            lt_selection_params TYPE sesf_selection_parameters_tab,
            ls_sel_params TYPE sesf_selection_parameter,
            lt_target_node_ids TYPE sesf_bo_node_id_tab,
            mo_pro_bco_lcp TYPE REF TO if_esf_lcp,
            mo_pro_lcp TYPE REF TO if_esf_lcp.

    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.
    DATA lt_pro_data TYPE if_pro_protype=>tt_root.
    DATA ls_pro_data TYPE if_pro_protype=>ty_root.


* first query the Pro_project BO with the in_selection_parameters (coming from the UI)
    lt_selection_params = in_selection_parameters.


*exclude projects which are still "in planning" status
    ls_sel_params-attribute_name = if_pro_project_bo_template_sp=>co_query_p_attr-root-qu_by_creatn_idty-project_lfcyc_stat_c.
    ls_sel_params-option = 'NE'.
    ls_sel_params-sign = 'I'.
    ls_sel_params-low = '1'.  "in planning status = 1
    APPEND ls_sel_params TO lt_selection_params.

* get lcp for pro_project (core BO for re-use OVS)
    TRY.
        mo_pro_lcp = mo_adaptation_handler->get_lcp( 'PRO_PROJECT' ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_bsa_runtime.
    ENDTRY.
    TRY.
        CALL METHOD mo_pro_lcp->query
          EXPORTING
            in_bo_node_name         = if_pro_project_bo_template_sp=>co_bo_node-root
            in_query_name           = if_pro_project_bo_template_sp=>co_query-root-qu_by_creatn_idty
            in_selection_parameters = lt_selection_params
            in_fill_data            = abap_false
          IMPORTING
            out_node_ids            = lt_target_node_ids.
      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

    IF lt_target_node_ids IS NOT INITIAL.
      CLEAR lt_selection_params.
      " get lcp for project type BCO
      TRY.
          mo_pro_bco_lcp = mo_adaptation_handler->get_lcp( if_pro_protype=>co_bo_name ).
        CATCH cx_bsa_runtime INTO lx_bsa_runtime.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_bsa_runtime.
      ENDTRY.

*Checking Public Sector scoping
      DATA(lv_ps_scope) = cl_fia_bus_feature_scope_check=>is_business_feature_in_scope(
          iv_business_feature_name = 'TOB_PS_PUBLICSECTOR'
      ).

      CLEAR ls_sel_params.
* query on project type BCO based on BPVT type code (overhead projects or direct projects)
      IF ms_readonly_eco_root-projection_bo_name = 'FIA_ODCLA_OVERHEAD_RUN'.
        ls_sel_params-attribute_name = if_pro_protype=>co_query_p_attr-root-query_by_elements-bpv_type_code.
        ls_sel_params-option = 'EQ'.
        ls_sel_params-sign = 'I'.
        ls_sel_params-low = gc_bpvt_code_dir_projects. "BPVT code for direct projects is 91
        APPEND ls_sel_params TO lt_sel_params.

        IF lv_ps_scope = abap_true.                   "for PS grant funded project is also direct cost project and should be included in the OVS navigation
          ls_sel_params-attribute_name = if_pro_protype=>co_query_p_attr-root-query_by_elements-bpv_type_code.
          ls_sel_params-option = 'EQ'.
          ls_sel_params-sign = 'I'.
          ls_sel_params-low = gc_bpvt_code_grf_projects. "BPVT code for grant funded projects is 546
          APPEND ls_sel_params TO lt_sel_params.
        ENDIF.

      ELSEIF   ms_readonly_eco_root-projection_bo_name = 'FIA_OHCLA_OVERHEAD_RUN'. " BPVT code = 90
        ls_sel_params-attribute_name = if_pro_protype=>co_query_p_attr-root-query_by_elements-bpv_type_code.
        ls_sel_params-option = 'EQ'.
        ls_sel_params-sign = 'I'.
        ls_sel_params-low = gc_bpvt_code_ovh_projects. "90
        APPEND ls_sel_params TO lt_sel_params.
      ENDIF.

      TRY.
          CALL METHOD mo_pro_bco_lcp->query
            EXPORTING
              in_bo_node_name         = if_pro_protype=>co_bo_node-root
              in_query_name           = if_pro_protype=>co_query-root-query_by_elements
              in_selection_parameters = lt_sel_params
              in_fill_data            = abap_true
            IMPORTING
              out_data                = lt_pro_data.
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      CLEAR lt_selection_params.

* append the type codes to selection parameters
      IF lt_pro_data IS NOT INITIAL.
        TRY.
            LOOP AT lt_pro_data INTO ls_pro_data.
              ls_sel_params-attribute_name = if_pro_project_bo_template_sp=>co_query_p_attr-root-qu_by_creatn_idty-type_code-content   .
              ls_sel_params-option = 'EQ'.
              ls_sel_params-sign = 'I'.
              ls_sel_params-low = ls_pro_data-code-content  .
              APPEND ls_sel_params TO lt_selection_params.
            ENDLOOP.
          CATCH cx_esf_core_service INTO lx_esf_core_service.
            RAISE EXCEPTION TYPE cx_fatal_exception
              EXPORTING
                previous = lx_esf_core_service.
        ENDTRY.
      ENDIF.
*now again call the pro_project query with filtered node ids
      TRY.
          mo_pro_lcp = mo_adaptation_handler->get_lcp( 'PRO_PROJECT' ).
        CATCH cx_bsa_runtime INTO lx_bsa_runtime.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_bsa_runtime.
      ENDTRY.

      TRY.
          CALL METHOD mo_pro_lcp->query
            EXPORTING
              in_bo_node_name         = if_pro_project_bo_template_sp=>co_bo_node-root
              in_query_name           = if_pro_project_bo_template_sp=>co_query-root-qu_by_creatn_idty
              in_selection_parameters = lt_selection_params
              in_fill_data            = abap_false
              in_filter_node_ids      = lt_target_node_ids
            IMPORTING
              out_node_ids            = out_value_set_node_ids.
        CATCH cx_esf_core_service INTO lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->RETRIVE_SOB_ROOT_ID_BY_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] ET_DATA_SOB_ROOT               TYPE        IF_FIA_SET_OF_BOOKS=>TT_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD retrive_sob_root_id_by_node_id.
    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.
    DATA lt_attr_sob_id_content TYPE sesf_string_tab.

    IF mo_sob_lcp IS NOT BOUND.
      TRY.
          mo_sob_lcp = mo_adaptation_handler->get_lcp( if_fia_set_of_books=>co_bo_name ).
        CATCH cx_bsa_runtime INTO lx_bsa_runtime.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_bsa_runtime.
      ENDTRY.
    ENDIF.

    APPEND if_fia_set_of_books=>co_attr-root-id-content TO lt_attr_sob_id_content.

    TRY.
        mo_sob_lcp->retrieve(
          EXPORTING
            in_bo_node_name         = if_fia_set_of_books=>co_bo_node-root
            in_node_ids             = in_node_ids
            in_requested_attributes = lt_attr_sob_id_content
          IMPORTING
            out_data                = et_data_sob_root
        ).
      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->ROOT_NODE_ID_EXISTS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ROOT_NODE_ID                TYPE        SESF_BO_NODE_ID
* | [<-()] RV_ROOT_NODE_ID_EXISTS         TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD root_node_id_exists.
    DATA lt_node_id TYPE sesf_bo_node_id_tab.
    DATA lt_dummy_data TYPE if_fia_acc_adjustment_run=>tt_root.
    DATA lt_failed_node_id TYPE sesf_bo_node_id_tab.
    DATA lx_esf_core_service TYPE REF TO cx_esf_core_service.

    APPEND iv_root_node_id TO lt_node_id.

    TRY.
        mo_lcp_bo->retrieve(
          EXPORTING
            in_bo_node_name         = if_fia_acc_adjustment_run=>co_bo_node-root
            in_node_ids             = lt_node_id
          IMPORTING
            out_data                = lt_dummy_data
            out_failed_node_ids     = lt_failed_node_id
        ).
      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

    IF lt_failed_node_id IS NOT INITIAL.
      rv_root_node_id_exists = abap_false.
    ELSE.
      rv_root_node_id_exists = abap_true.
    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->SET_ATTR_PROPERTIES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_ECO_ATTR_NAME               TYPE        SESF_STRING_TAB
* | [--->] IO_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IV_PROPERTY_NAME               TYPE        STRING
* | [--->] IV_PROPERTY_VALUE              TYPE        SESF_BOOLEAN
* | [--->] IV_ECO_NODE_ID                 TYPE        SESF_BO_NODE_ID
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_attr_properties.
    DATA lv_eco_attr_name TYPE string.
    DATA lx_esf_property_handler TYPE REF TO cx_esf_property_handler.

    LOOP AT it_eco_attr_name INTO lv_eco_attr_name .
      TRY.
          io_property_handler->set_attribute_property(
            EXPORTING
              in_attribute_name = lv_eco_attr_name
              in_property_name  = iv_property_name
              in_value          = iv_property_value
              in_bo_node_id     = iv_eco_node_id
          ).
        CATCH cx_esf_property_handler INTO lx_esf_property_handler.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_property_handler.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->SET_NODE_N_ASSOC_READ_ONLY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IT_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IV_NODE_NAME                   TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD set_node_n_assoc_read_only.
  DATA: ls_properties TYPE if_esf_types=>ty_properties,
        lx_esf_property_handler TYPE REF TO cx_esf_property_handler.

  FIELD-SYMBOLS: <lv_node_id>               LIKE LINE OF it_node_ids,
                 <ls_node_element_property> LIKE LINE OF ls_properties-node_element_properties,
                 <ls_assoc_property>        LIKE LINE OF ls_properties-association_properties.
  TRY.

      DATA(lo_node_desc)       = mo_eco_descriptor->get_bo_node_descriptor( bo_node_proxy_name = iv_node_name  ).
      DATA(lt_node_assoc_desc) = lo_node_desc->get_association_descriptors( ).

      LOOP AT it_node_ids ASSIGNING <lv_node_id> .
*       Disable Update
        APPEND INITIAL LINE TO ls_properties-node_element_properties ASSIGNING <ls_node_element_property>.
        <ls_node_element_property>-node_id = <lv_node_id>.
        <ls_node_element_property>-property_name = if_esf_property_handler=>esf_update_enabled.
        <ls_node_element_property>-property_value = abap_false.

*       Disable Delete
        APPEND INITIAL LINE TO ls_properties-node_element_properties ASSIGNING <ls_node_element_property>.
        <ls_node_element_property>-node_id = <lv_node_id>.
        <ls_node_element_property>-property_name = if_esf_property_handler=>esf_delete_enabled.
        <ls_node_element_property>-property_value = abap_false.

*       Disable Create for sub-nodes
        LOOP AT lt_node_assoc_desc INTO DATA(lo_node_assoc_desc).
          IF lo_node_assoc_desc->is_property_value_final( property_name = if_esf_property_handler=>esf_create_enabled ) = abap_false.
            APPEND INITIAL LINE TO ls_properties-association_properties ASSIGNING <ls_assoc_property>.
            <ls_assoc_property>-association_name = lo_node_assoc_desc->get_proxy_name( ).
            <ls_assoc_property>-node_id          = <lv_node_id>.
            <ls_assoc_property>-property_name    = if_esf_property_handler=>esf_create_enabled.
            <ls_assoc_property>-property_value   = abap_false.
          ENDIF.
        ENDLOOP.

      ENDLOOP.
    CATCH cx_esf_metadata_error INTO DATA(lx_esf_metadata_error).
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_metadata_error.
  ENDTRY.

  TRY.
      io_property_handler->set_properties( ls_properties ).
    CATCH cx_esf_property_handler INTO lx_esf_property_handler.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_property_handler.
  ENDTRY.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->SET_ROOT_DEDICATED_ATTRIBUTES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* | [<-->] CS_ECO_ROOT                    TYPE        IF_A1FIA_AAR_CREATE_QAF_ECO=>TY_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_root_dedicated_attributes.
*    IF sy-uname <> 'LA'.
*      handle_root_dedicated_fields(
*        EXPORTING
*          it_requested_attributes        = it_requested_attributes
*          iv_mode_fill_dedicted_attr_val = abap_true
*        CHANGING
*          cs_eco_root                    = cs_eco_root
*      ).
*    ELSE.
    DATA lt_requested_attributes TYPE sesf_string_tab.
    DATA lv_dedic_attr_name      TYPE string.
    DATA lr_attribute_map        TYPE REF TO ty_attribute_map.
    DATA lt_mapped_eco_attr      TYPE sesf_string_tab.

    lt_requested_attributes = it_requested_attributes.
    IF lt_requested_attributes IS INITIAL.
      lt_requested_attributes = mt_dedicated_attributes.
    ENDIF.

    LOOP AT lt_requested_attributes INTO lv_dedic_attr_name.
      CLEAR lr_attribute_map.
      READ TABLE mt_attribute_map REFERENCE INTO lr_attribute_map
        WITH TABLE KEY eco_attr_name = lv_dedic_attr_name.
      IF sy-subrc = 0 AND lr_attribute_map->is_dedicated = abap_true.
        lr_attribute_map->dedicated_exit->fill_dedicated_attribute_val(
          CHANGING
            cs_retrieved_eco_root = cs_eco_root
        ).
      ENDIF.
    ENDLOOP.
*    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_AAR_CREATE_QAF_ECO->TRANSLATE_MESSAGE_LOCATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_MESSAGE_LOCATION            TYPE        CM_ESI_ROOT=>TY_MESSAGE_LOCATION
* | [<-()] RS_NEW_MESSAGE_LOCATION        TYPE        CM_ESI_ROOT=>TY_MESSAGE_LOCATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD translate_message_location.

    DATA ls_attribute_map TYPE ty_attribute_map.
    DATA lv_core_attr TYPE string.

    CLEAR rs_new_message_location.

    IF is_message_location-bo_name = if_a1fia_aar_create_qaf_eco=>co_bo_name.
      rs_new_message_location = is_message_location.
      RETURN.
    ENDIF.

    READ TABLE mt_attribute_map
      INTO ls_attribute_map TRANSPORTING eco_attr_name
      WITH KEY core_bo_node_key COMPONENTS core_bo_node_name = is_message_location-bo_node_name
               core_bo_node_id = is_message_location-bo_node_id.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    LOOP AT is_message_location-attributes INTO lv_core_attr.

      READ TABLE mt_attribute_map
        INTO ls_attribute_map TRANSPORTING eco_attr_name
        WITH KEY core_bo_node_key COMPONENTS core_bo_node_name = is_message_location-bo_node_name
                 core_bo_node_id = is_message_location-bo_node_id
                 core_bo_attr_name = lv_core_attr.
      IF sy-subrc = 0.
        APPEND ls_attribute_map-eco_attr_name TO rs_new_message_location-attributes.
      ENDIF.

    ENDLOOP.

    IF rs_new_message_location-attributes IS NOT INITIAL.
      rs_new_message_location-bo_name = if_a1fia_aar_create_qaf_eco=>co_bo_name.
      rs_new_message_location-bo_node_name = if_a1fia_aar_create_qaf_eco=>co_bo_node-root.
      rs_new_message_location-bo_node_id = mv_eco_root_node_id.
    ELSE.
      CLEAR rs_new_message_location.
    ENDIF.

  ENDMETHOD.
ENDCLASS.