class SAMPLE definition
  public
  inheriting from SAMPLE_BASE
  create public .

public section.

  interfaces IF_SAMPLE .


  class-data MO_SOB_LCP type ref to IF_ESF_LCP .
  constants GC_BPVT_CODE_DIR_PROJECTS type STRING value '91' ##no_text .
  constants GC_BPVT_CODE_OVH_PROJECTS type STRING value '90' ##no_text .
  data MV_BGJOB_SCHEDULED_NODE_ID type SESF_BO_NODE_ID .
  data MO_ECO_DESCRIPTOR type ref to IF_ESF_BO_DESC .
  constants GC_BPVT_CODE_GRF_PROJECTS type STRING value '546' ##no_text .

  interface IF_SAMPLE load .
  methods MODIFY_CORE_BO_FROM_ECO_ROOT
    importing
      !IT_CHANGED_ATTRIBUTES type SESF_STRING_TAB
      !IS_ECO_ROOT type IF_SAMPLE=>TY_ROOT
      !IO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .

  methods IF_ESF_PROVIDER_ACCESS~CHECK
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~MODIFY
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
    redefinition .
protected section.

  methods GET_SUB_CONTEXT
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
  data MS_READONLY_ECO_ROOT type IF_SAMPLE=>TY_ROOT .
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

  class SAMPLE_ROOT definition load .
 
ENDCLASS.



CLASS SAMPLE IMPLEMENTATION.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method SAMPLE->IF_ESF_PROVIDER_INIT~INIT
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
        mo_eco_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = if_sample=>co_bo_name ).
      CATCH cx_esf_core_service INTO DATA(lx_esf_core_service).
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

  ENDMETHOD.                    "if_esf_provider_init~init


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method SAMPLE->IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
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
* | Instance Protected Method SAMPLE->GET_SUB_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_SUB_CONTEXT                 TYPE        IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_sub_context.
    rv_sub_context = ms_readonly_eco_root-mdro_type_code.
  ENDMETHOD.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method SAMPLE->IF_ESF_PROVIDER_ACCESS~CHECK
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

    IF in_bo_node_name <> if_sample=>co_bo_node-root."Only root node has special logic all other nodes are BSA mapped
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
* | Instance Public Method SAMPLE->IF_ESF_PROVIDER_ACCESS~MODIFY
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

    FIELD-SYMBOLS <ls_eco_root> TYPE if_sample=>ty_root.
    FIELD-SYMBOLS <ls_attribute_map> TYPE ty_attribute_map.
    FIELD-SYMBOLS <lv_eco_attr_name> TYPE string.

    lt_modification = in_modifications.
    LOOP AT lt_modification REFERENCE INTO lr_modification WHERE bo_node_name <> if_sample=>co_bo_node-root.
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
* | Instance Public Method SAMPLE->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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
    FIELD-SYMBOLS <ls_eco_root_data> TYPE if_sample=>ty_root.
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
      WHEN if_sample=>co_bo_node-root.
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
                APPEND if_sample=>co_attr-root-acl_company_uuid-content TO lt_eco_req_attr.
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

        IF lv_parent_node_name = if_sample=>co_bo_node-root.
          LOOP AT out_data ASSIGNING <ls_eco_sub_node_data>.
            ASSIGN COMPONENT 'PARENT_NODE_ID' OF STRUCTURE <ls_eco_sub_node_data> TO <lv_parent_node_id>.
            <lv_parent_node_id> = mv_eco_root_node_id.
          ENDLOOP.
        ENDIF.
    ENDCASE.
  ENDMETHOD.                    "if_esf_provider_access~retrieve


ENDCLASS.