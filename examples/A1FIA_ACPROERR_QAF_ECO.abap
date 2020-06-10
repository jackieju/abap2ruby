class CL_A1FIA_ACPROERR_QAF_ECO definition
  public
  inheriting from CL_A1FIA_COMMON_ECO
  create public .

public section.

  interfaces IF_A1FIA_ACPROERR_QAF_ECO .
  interfaces IF_BSA_CB_PATH .

  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~QUERY
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
    redefinition .
protected section.
private section.

  data MT_OPEN_TASKS type SESF_ASSOCIATION_LINK_TAB .
  data MO_LCP_TASK type ref to IF_ESF_LCP .
  data MO_APPLOG_SP_LCP type ref to IF_ESF_LCP .
  data MO_LCP_FACADE type ref to IF_ESF_LCP_FACADE .

  methods DETERMINE_RCAUSE_UI_INDICATOR
    importing
      !IV_ACCPE_NODE_ID type SESF_BO_NODE_ID
    returning
      value(RV_RCAUSE_UI_IND) type SYBOOLEAN .
  interface IF_A1FIA_ACPROERR_QAF_ECO load .
  methods ENRICH_RETRIEVED_DATA
    importing
      !IT_ACCPE_QAF type IF_A1FIA_ACPROERR_QAF_ECO=>TT_ROOT
    returning
      value(RT_ACCPE_QAF) type IF_A1FIA_ACPROERR_QAF_ECO=>TT_ROOT .
ENDCLASS.



CLASS CL_A1FIA_ACPROERR_QAF_ECO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_ACPROERR_QAF_ECO->DETERMINE_RCAUSE_UI_INDICATOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ACCPE_NODE_ID               TYPE        SESF_BO_NODE_ID
* | [<-()] RV_RCAUSE_UI_IND               TYPE        SYBOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD determine_rcause_ui_indicator.

  DATA:
    lv_accpe_uuid_proxy           TYPE apc_v_uuid,
    lo_message                    TYPE REF TO cx_root,
    ls_t100key                    TYPE scx_t100key,
    lv_msgv1                      TYPE sychar255,
    lv_msgv2                      TYPE sychar255,
    lv_msgv3                      TYPE sychar255,
    lv_msgv4                      TYPE sychar255,
    lv_classname                  TYPE sychar30,
    lv_methodname                 TYPE sychar30,
    lx_exception                  TYPE REF TO cx_root,
    lv_admin_parameter_exists     TYPE syboolean.

* Coding Switch: Root Error Cause Navigation must be activated
  rv_rcause_ui_ind = abap_false.
  CALL METHOD ('CL_FIA_I2DERROR_BTM_UTIL')=>('ADM_CHECK_PARM')
    EXPORTING
      iv_adm_parm = 'APE_RCAUSE_NAVIGATION'
    RECEIVING
      rv_result   = lv_admin_parameter_exists.
  CHECK lv_admin_parameter_exists = abap_true.

* Get the Error Message according to the Accounting Processing Error BO
  lv_classname = 'CL_FIA_ACCPE_UTILITIES'.
  lv_methodname = 'GET_MESSAGE_OF_ACCPE_4UI_NAVIG'.
  lv_accpe_uuid_proxy-content = iv_accpe_node_id.
  TRY.
      CALL METHOD (lv_classname)=>(lv_methodname)
        EXPORTING
          iv_accpe_uuid = lv_accpe_uuid_proxy
        IMPORTING
          eo_message    = lo_message
          es_t100key    = ls_t100key
          ev_msgv1      = lv_msgv1
          ev_msgv2      = lv_msgv2
          ev_msgv3      = lv_msgv3
          ev_msgv4      = lv_msgv4.
    CATCH cx_sy_dyn_call_illegal_class
          cx_sy_dyn_call_illegal_method
          cx_sy_dyn_call_param_missing
          cx_sy_dyn_call_param_not_found
      INTO lx_exception.
      rv_rcause_ui_ind = abap_false.
      RETURN.
  ENDTRY.

* Determine Application Class for the Root Cause Navigation
* Todo: Must be replaced by a BADI
  CASE ls_t100key-msgid.
    WHEN 'FIA_SLSLA_I2D'.
      lv_classname = 'CL_A1FIA_SLSLA_UI_NAVIG'.
    WHEN 'FIA_MASTER_DATA'.
      lv_classname = 'CL_A1FIA_APE2MAT_UI_NAVIG'.

*   There is no Root Cause Navigation
    WHEN OTHERS.
      rv_rcause_ui_ind = abap_false.
      RETURN.
  ENDCASE.

* Call the Application whether a Root Cause UI exists
  lv_methodname = 'GET_ROOT_CAUSE_UI_INDICATOR'.
  TRY.
      CALL METHOD (lv_classname)=>(lv_methodname)
        EXPORTING
          io_lcp_facade        = mo_lcp_facade
          io_message           = lo_message
          is_t100key           = ls_t100key
          iv_msgv1             = lv_msgv1
          iv_msgv2             = lv_msgv2
          iv_msgv3             = lv_msgv3
          iv_msgv4             = lv_msgv4
        RECEIVING
          rv_root_cause_ui_ind = rv_rcause_ui_ind.

*   Dynamic Call is wrong: No nativation Target
    CATCH cx_sy_dyn_call_illegal_class
          cx_sy_dyn_call_illegal_method
          cx_sy_dyn_call_param_missing
          cx_sy_dyn_call_param_not_found
      INTO lx_exception.
      rv_rcause_ui_ind = abap_false.
      RETURN.
  ENDTRY.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_ACPROERR_QAF_ECO->ENRICH_RETRIEVED_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_ACCPE_QAF                   TYPE        IF_A1FIA_ACPROERR_QAF_ECO=>TT_ROOT
* | [<-()] RT_ACCPE_QAF                   TYPE        IF_A1FIA_ACPROERR_QAF_ECO=>TT_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD enrich_retrieved_data.

  DATA:
    lr_accpe_qaf                TYPE REF TO if_a1fia_acproerr_qaf_eco=>ty_root,
    lv_user_account_id          TYPE apc_c_user_account_id,
    lv_determine_navigation     TYPE syboolean.

* Initialization
  rt_accpe_qaf = it_accpe_qaf.

* Determine Navigation for Root cause only if single select mode
  IF lines( rt_accpe_qaf ) <= 1.
    lv_determine_navigation = abap_true.
  ENDIF.

* Process the enrich per each entry
  LOOP AT rt_accpe_qaf REFERENCE INTO lr_accpe_qaf.

*   Determine Error Cause UI indicator
    IF lv_determine_navigation = abap_true.
      lr_accpe_qaf->error_cause_ui_ind = determine_rcause_ui_indicator( lr_accpe_qaf->node_id ).
    ENDIF.

*   Display User Name (Created By)
    lv_user_account_id = lr_accpe_qaf->creation_user_account_id-content.
    cl_a1fia_concatenate_user_name=>concatenate_user_name(
      EXPORTING
        iv_user_account_name        = lr_accpe_qaf->creation_user_name
        iv_user_account_id          = lv_user_account_id
        iv_technical_user_indicator = lr_accpe_qaf->creation_tech_user_ind
      IMPORTING
        ev_user_display_name        = lr_accpe_qaf->created_by_user_display_name ).

*   Display User Name (Changed By)
    lv_user_account_id = lr_accpe_qaf->last_changed_user_account_id-content.
    cl_a1fia_concatenate_user_name=>concatenate_user_name(
      EXPORTING
        iv_user_account_name        = lr_accpe_qaf->last_changed_user_name
        iv_user_account_id          = lv_user_account_id
        iv_technical_user_indicator = lr_accpe_qaf->last_changed_tech_user_ind
      IMPORTING
        ev_user_display_name        = lr_accpe_qaf->changed_by_user_display_name ).
  ENDLOOP.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_BSA_CB_PATH~RESOLVE
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

  DATA: "lo_lcp_task TYPE REF TO if_esf_lcp,
        lv_no_of_tasks  TYPE i VALUE 0,
        lt_open_tasks TYPE sesf_association_link_tab,
        ls_open_task TYPE sesf_association_link,
        ls_node_id TYPE sesf_bo_node_id,
        ls_task_id  TYPE sesf_bo_node_id,
        out_task_ids TYPE sesf_bo_node_id_tab,
        lt_task_ids TYPE sesf_bo_node_id_tab.
  DATA:
        lt_parameters TYPE if_esf_provider_query=>tt_selection_parameters,
        ls_parameter  LIKE LINE OF lt_parameters,
        lc_bo_name  TYPE string VALUE 'AccountingProcessingError',
        lc_bo_namespace TYPE string VALUE 'http://sap.com/xi/AP/FinancialAccounting/Global'.


  FIELD-SYMBOLS:
        <ls_parameter> LIKE LINE OF lt_parameters,
        <query_parameter> LIKE if_task=>co_query_p_attr-root-query_by_business_object.
  ASSIGN if_task=>co_query_p_attr-root-query_by_business_object TO <query_parameter>.



  CASE in_path_callback_id.
    WHEN 'ROOT_TASK'. "defined in BSA metadata


      READ TABLE in_node_ids INTO ls_node_id INDEX 1.

* default values for parameters include when equal
      ls_parameter-sign = 'I'.
      ls_parameter-option = 'EQ'.

* Select only Active Tasks
      ls_parameter-attribute_name = <query_parameter>-active_tasks_only_indicator.
      ls_parameter-low = abap_true.
      APPEND ls_parameter TO lt_parameters.

* NODE_ID
      ls_parameter-attribute_name = <query_parameter>-task_bus_obj_node_tech_ref-object_node_technical_id.
      ls_parameter-low = ls_node_id.
      APPEND ls_parameter TO lt_parameters.

* Node Name
      ls_parameter-attribute_name = <query_parameter>-task_bus_obj_node_tech_ref-object_node_name.
      ls_parameter-low = 'ROOT'.
      APPEND ls_parameter TO lt_parameters.

* BO Name
      ls_parameter-attribute_name = <query_parameter>-task_bus_obj_node_tech_ref-object_name.
      ls_parameter-low = lc_bo_name.
      APPEND ls_parameter TO lt_parameters.

* BO Namespace
      ls_parameter-attribute_name = <query_parameter>-task_bus_obj_node_tech_ref-object_namespace_uri-content.
      ls_parameter-low = lc_bo_namespace.
      APPEND ls_parameter TO lt_parameters.

* Include The Tasks with the above object as reference
      ls_parameter-attribute_name = <query_parameter>-business_object_reference_type.
      ls_parameter-low = 1.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DDCBABFBD20CFABD029'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DDCBABFE9051DCD48CE'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DDCBABFF8C1B5A408CE'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DDCBAC017BAEB5C5ACB'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DDCBAC02179FF1A07DC'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DECBAC0075EE2AE4E54'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DECBAC02A34CAE15A84'.
      APPEND ls_parameter TO lt_parameters.

* Include the different task type
*      ls_parameter-attribute_name = <query_parameter>-type_uuid-content.
      ls_parameter-low = '0017A44CDE471DECBAC0328FC7A089FB'.
      APPEND ls_parameter TO lt_parameters.

* Include Dependent Tasks for tasks with the above object as reference too
      ls_parameter-attribute_name = <query_parameter>-business_object_reference_type.
      ls_parameter-low = 3.
      APPEND ls_parameter TO lt_parameters.


      DATA:
        ex TYPE REF TO cx_root.
      TRY.

*          lo_lcp_task = mo_adaptation_handler->get_lcp( in_bo_name = if_task=>co_bo_name ). "Core BO

          CALL METHOD mo_lcp_task->query
            EXPORTING
              in_bo_node_name         = if_task=>co_bo_node-root
              in_query_name           = if_task=>co_query-root-query_by_business_object
              in_selection_parameters = lt_parameters
            IMPORTING
              out_node_ids            = lt_task_ids.


          IF lt_task_ids IS INITIAL."No active task available
*Query for the inactive tasks.
            READ TABLE lt_parameters ASSIGNING <ls_parameter> WITH KEY attribute_name = <query_parameter>-active_tasks_only_indicator.
            <ls_parameter>-low = abap_false.
*        APPEND ls_parameter TO lt_parameters.

            CALL METHOD mo_lcp_task->query
              EXPORTING
                in_bo_node_name         = if_task=>co_bo_node-root
                in_query_name           = if_task=>co_query-root-query_by_business_object
                in_selection_parameters = lt_parameters
              IMPORTING
                out_node_ids            = lt_task_ids.

          ENDIF.


          IF NOT lt_task_ids IS INITIAL.
* If one Error Bo instance having more than one task instance asigned to it
* of types specified in query I am returning the first task instance
* Ideally one Error bo instance should only have one task instance
* assigned to it of one of the type from the types specified in query.

            READ TABLE lt_task_ids INTO ls_task_id INDEX 1.
            CLEAR lt_task_ids.
            APPEND ls_task_id TO lt_task_ids.

            ls_open_task-target_node_id = ls_task_id.
            ls_open_task-source_node_id = ls_node_id.
            APPEND ls_open_task TO lt_open_tasks.

            IF in_fill_data = abap_true AND
               lt_task_ids IS NOT INITIAL.
              CALL METHOD mo_lcp_task->retrieve
                EXPORTING
                  in_bo_node_name         = if_task=>co_bo_node-root "Core BO
                  in_node_ids             = lt_task_ids
                  in_edit_mode            = in_edit_mode
                  in_requested_image      = in_requested_image
                  in_requested_attributes = in_requested_attributes
                IMPORTING
                  out_data                = out_data
                  out_messages            = out_messages
                  out_sync_notifications  = out_sync_notifications.
            ENDIF.

            MOVE lt_open_tasks TO out_links.

          ELSE.
            RETURN.
          ENDIF.

        CATCH cx_bsa_runtime INTO ex.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = ex.

        CATCH cx_esf_core_service INTO ex.
*        raise exception type cx_fatal_exception exporting previous = ex.
*        Ignore the error as suggested in the note (1141539) from FSI
          CLEAR lt_task_ids.
      ENDTRY.

  ENDCASE.

ENDMETHOD.                    "IF_BSA_CB_PATH~RESOLVE


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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

  DATA: ls_out_data TYPE  if_a1fia_acproerr_qaf_eco=>ty_application_log_item,
        lt_node_ids_source TYPE sesf_bo_node_id_tab,
        lt_out_failed_source_node_ids TYPE  sesf_bo_node_id_tab,
        lt_out_messages TYPE  if_esf_types=>ty_messages,
        lt_acprer_root TYPE if_a1fia_acproerr_qaf_eco=>tt_root,

* result of association from AppLogCO-Root to AppLogCO-Overview:
        lt_out_links_applog_rt_2_ovv       TYPE  sesf_association_link_tab,

* overview item node of the AppLogCO:
        lt_applog_ovv_item   TYPE  /itsam/if_app_log_co=>tt_overview_item,
* item_message_attribute: contains number of variable (1-4) im message and its type as BO node element name:
       ls_applog_ovv_item                 TYPE  /itsam/if_app_log_co=>ty_overview_item,
         "cx_fia_acc_exception,
        lx_esf_core_service TYPE REF TO cx_esf_core_service.


  FIELD-SYMBOLS:
        <ls_out_links_applog_rt_2_ovv>       TYPE  sesf_association_link,
        <ls_acprer_root>                     TYPE if_a1fia_acproerr_qaf_eco=>ty_root.

*-----------------
* Initialization
*-----------------

  CASE in_bo_node_name.
    WHEN if_a1fia_acproerr_qaf_eco=>co_bo_node-root.

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
          out_data                = lt_acprer_root
          out_failed_node_ids     = out_failed_node_ids.

      IF lt_acprer_root IS NOT INITIAL.
        LOOP AT lt_acprer_root ASSIGNING <ls_acprer_root>.

          IF <ls_acprer_root>-status-acc_notif_list_cons_stcode = '3'."Consistent

            <ls_acprer_root>-error_resolution_proc_stcode = '3'."Finish

          ELSEIF <ls_acprer_root>-status-sgl_acc_notif_list_proc_stcode = '2' OR "In process
                 <ls_acprer_root>-status-error_resolution_proc_stcode = '3'. "Finish

            <ls_acprer_root>-error_resolution_proc_stcode = '2'. " In process

          ELSE.
            <ls_acprer_root>-error_resolution_proc_stcode = '1'. "Not Started

          ENDIF.

        ENDLOOP.

*       Enrich the retrieved data
        lt_acprer_root = enrich_retrieved_data( lt_acprer_root ).

        MOVE lt_acprer_root TO out_data.

      ENDIF.

    WHEN if_a1fia_acproerr_qaf_eco=>co_bo_node-application_log_item.

*********************************************************************************************
* Step 1: Get root node id of appliction log (from association AccNotif-root -> AppLog-Root)
*********************************************************************************************

*****************  Correction Begin
      REFRESH lt_node_ids_source.
      DATA:
        lt_out_links  TYPE  sesf_association_link_tab,
        lr_link       TYPE REF TO sesf_association_link.
      TRY.
          mo_applog_sp_lcp->retrieve_root_node_id(
             EXPORTING
               in_bo_node_name = /itsam/if_app_log_co=>co_bo_node-overview_item
               in_node_ids     = in_node_ids
             IMPORTING
               out_links       = lt_out_links ).
        CATCH cx_esf_core_service  INTO  lx_esf_core_service.
          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.
      READ TABLE lt_out_links REFERENCE INTO lr_link INDEX 1.
      IF sy-subrc = 0.
        INSERT lr_link->target_node_id INTO TABLE lt_node_ids_source.
      ELSE.
        APPEND LINES OF in_node_ids TO out_failed_node_ids.
        EXIT.
      ENDIF.
*****************  Correction End

      TRY .
*******************************************************************************************************
* Step 2: Get the Overview NodeID of application log CO
*        (from association AppLogCO-Root -> AppLogCO-OverviewItem):
*******************************************************************************************************
*     call association AppLogCO-Root to AppLogCO-Overview:
          CALL METHOD mo_applog_sp_lcp->retrieve_by_association
            EXPORTING
              in_bo_node_name            = /itsam/if_app_log_co=>co_bo_node-root        "Root
              in_association_name        = /itsam/if_app_log_co=>co_assoc-root-overview "Root->Overview
              in_node_ids                = lt_node_ids_source                           "root node of AppLog
              in_fill_data               = abap_false
              in_edit_mode               = in_edit_mode
            IMPORTING
              out_links                  = lt_out_links_applog_rt_2_ovv
              out_failed_source_node_ids = lt_out_failed_source_node_ids
              out_messages               = lt_out_messages.

          CALL METHOD mo_message_manager->add_messages
            EXPORTING
              it_messages = lt_out_messages.

        CATCH cx_esf_core_service  INTO  lx_esf_core_service.

          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      IF NOT ( lt_out_failed_source_node_ids  IS  INITIAL ).
*   an error occurred:
        RAISE EXCEPTION TYPE cx_fatal_exception.
      ENDIF.

      REFRESH lt_node_ids_source.
* probably(?), there can be several AppLogCO-Overview nodes belonging to one ApplogCO-Root:
      LOOP AT  lt_out_links_applog_rt_2_ovv  ASSIGNING  <ls_out_links_applog_rt_2_ovv>.

        APPEND   <ls_out_links_applog_rt_2_ovv>-target_node_id  TO  lt_node_ids_source.

      ENDLOOP.
***********************************************************************************************************************
* Step 3: Get AppLogCO-OverviewItem node ids via assocation from the AppLogCO-Overview node
*         (this node contains the human-readable message text in the field Note):
***********************************************************************************************************************
      TRY .
*     call association AppLogCO-Overview to AppLog-OverviewItem:
          CALL METHOD mo_applog_sp_lcp->retrieve_by_association
            EXPORTING
              in_bo_node_name            = /itsam/if_app_log_co=>co_bo_node-overview               "Overview
              in_association_name        = /itsam/if_app_log_co=>co_assoc-overview-overview_item   "Overview->OverviewItem
              in_node_ids                = lt_node_ids_source                                      "Overview nodes of AppLog
              in_fill_data               = abap_true                                               "read node data!
              in_edit_mode               = in_edit_mode
            IMPORTING
              out_data                   = lt_applog_ovv_item
              out_failed_source_node_ids = lt_out_failed_source_node_ids
              out_messages               = lt_out_messages.

        CATCH cx_esf_core_service  INTO  lx_esf_core_service.

          RAISE EXCEPTION TYPE cx_fatal_exception
            EXPORTING
              previous = lx_esf_core_service.
      ENDTRY.

      LOOP AT  lt_applog_ovv_item  INTO  ls_applog_ovv_item.

        ls_out_data-node_id             = ls_applog_ovv_item-node_id.
        ls_out_data-parent_node_id      = ls_applog_ovv_item-parent_node_id.
*   data:
        ls_out_data-log_item            = ls_applog_ovv_item-log_item.
*   the AppLogCO does currently not fill the OverviewItem-LogItem-SeverityCode;
*   but in the UI of the AccNotif, the LogItem-SeverityCode is displayed;
*   The AppLogCO instead fills the field OverviewItem-MaximumLogItemSeverityCode;
*   In general, the MaximumSeverity is the maximum severity of all messages on subnodes;
*   => For single messages (that is, in our case), these two fields contain the same value;
*   to avoid changes in the UI, fill the LogItem-Severity with the MaximumSeverity
*   (which is -as said- the same value):
        ls_out_data-log_item-severity_code = ls_applog_ovv_item-maximum_log_item_severity_code.

        INSERT ls_out_data INTO TABLE out_data.

      ENDLOOP.


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

  ENDCASE.


ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
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

  CALL METHOD super->if_esf_provider_access~retrieve_by_association
    EXPORTING
      in_bo_name                 = in_bo_name
      in_bo_node_name            = in_bo_node_name
      in_association_name        = in_association_name
      in_node_ids                = in_node_ids
      in_fill_data               = in_fill_data
      in_filter_parameters       = in_filter_parameters
      in_filtered_attributes     = in_filtered_attributes
      in_requested_image         = in_requested_image
      in_edit_mode               = in_edit_mode
      in_requested_attributes    = in_requested_attributes
      in_message_handler         = in_message_handler
      in_buffer_sync_handler     = in_buffer_sync_handler
    IMPORTING
      out_links                  = out_links
      out_data                   = out_data
      out_failed_source_node_ids = out_failed_source_node_ids.

*  CASE in_association_name.
*
*    WHEN if_a1fia_acproerr_qaf_eco=>co_assoc-accnotif_assignment-application_log_item.
*
*      CALL METHOD super->if_esf_provider_access~retrieve_by_association
*        EXPORTING
*          in_bo_name                 = in_bo_name
*          in_bo_node_name            = in_bo_node_name
*          in_association_name        = in_association_name
*          in_node_ids                = in_node_ids
*          in_fill_data               = abap_false
*          in_filter_parameters       = in_filter_parameters
*          in_filtered_attributes     = in_filtered_attributes
*          in_requested_image         = if_esf_types=>co_image_transactional_buffer
*          in_edit_mode               = in_edit_mode
*          in_requested_attributes    = in_requested_attributes
*          in_message_handler         = in_message_handler
*          in_buffer_sync_handler     = in_buffer_sync_handler
*        IMPORTING
*          out_links                  = out_links
*          out_data                   = out_data
*          out_failed_source_node_ids = out_failed_source_node_ids.
*
*    WHEN OTHERS.
*
*      CALL METHOD super->if_esf_provider_access~retrieve_by_association
*        EXPORTING
*          in_bo_name                 = in_bo_name
*          in_bo_node_name            = in_bo_node_name
*          in_association_name        = in_association_name
*          in_node_ids                = in_node_ids
*          in_fill_data               = in_fill_data
*          in_filter_parameters       = in_filter_parameters
*          in_filtered_attributes     = in_filtered_attributes
*          in_requested_image         = if_esf_types=>co_image_transactional_buffer
*          in_edit_mode               = in_edit_mode
*          in_requested_attributes    = in_requested_attributes
*          in_message_handler         = in_message_handler
*          in_buffer_sync_handler     = in_buffer_sync_handler
*        IMPORTING
*          out_links                  = out_links
*          out_data                   = out_data
*          out_failed_source_node_ids = out_failed_source_node_ids.
*
*
*  ENDCASE.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_init~init.
  DATA:
        lo_lcp_facade        TYPE  REF TO  if_esf_lcp_facade,
        lx_esf_core_service  TYPE  REF TO  cx_esf_core_service,
        lo_ex                TYPE REF TO cx_root.

  TRY.

      CALL METHOD super->if_esf_provider_init~init
        EXPORTING
          in_provider_context         = in_provider_context
          in_bo_name                  = in_bo_name
        CHANGING
          inout_preferred_trx_pattern = inout_preferred_trx_pattern.


      mo_lcp_task = mo_adaptation_handler->get_lcp( in_bo_name = if_task=>co_bo_name ).

*     get a LCP instance of the BO Application Log:
      mo_applog_sp_lcp = mo_adaptation_handler->get_lcp( /itsam/if_app_log_co=>co_bo_name ).
      mo_lcp_facade = in_provider_context->get_lcp_facade( ).
*
*      TRY.
*          mo_lcp_accproerr = lo_lcp_facade->get_lcp( if_fia_accnotif=>co_bo_name ).
*
*        CATCH cx_esf_core_service  INTO  lx_esf_core_service.
*
*          RAISE EXCEPTION TYPE cx_fatal_exception
*            EXPORTING
*              previous = lx_esf_core_service.
*      ENDTRY.
*      MO_LCP_ACCNOTIF = mo_adaptation_handler->get_lcp( in_bo_name = if_fia_accnotif=>co_bo_name ).
** for accessing the application log:
*      create object mo_applog_access
*        exporting
*          iv_host_bo_name   = if_fia_accnotif=>co_bo_name       "name of the core BO because it hosts the assoc. to the appl log
*          iv_host_node_name = if_fia_accnotif=>co_bo_node-root
*          iv_assoc_name     = if_fia_accnotif=>co_assoc-root-application_log
*          io_host_sp_lcp    = MO_LCP_ACCNOTIF.
*
** delegate the INIT method call to the service provider of the application log node:
*      CALL METHOD mo_applog_access->if_esf_provider_init~init
*        EXPORTING
*          in_provider_context = in_provider_context
*          in_bo_name          = in_bo_name.
*

    CATCH cx_bsa_runtime INTO lo_ex.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lo_ex.
  ENDTRY.

  add_node_for_heuristic_rrnid( if_a1fia_acproerr_qaf_eco=>co_bo_node-accnotif_assignment ).
  add_node_for_heuristic_rrnid( if_a1fia_acproerr_qaf_eco=>co_bo_node-application_log_item ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_ESF_PROVIDER_QUERY~QUERY
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

  IF in_query_name <> if_a1fia_acproerr_qaf_eco=>co_query-accnotif_assignment-query_by_elements.
    super->if_esf_provider_query~query(
      EXPORTING
        in_bo_node_name          = in_bo_node_name
        in_query_name            = in_query_name
        in_selection_parameters  = in_selection_parameters
        in_query_options         = in_query_options
        in_authorization_context = in_authorization_context
        in_message_handler       = in_message_handler
        in_fill_data             = in_fill_data
        in_filter_node_ids       = in_filter_node_ids
        in_requested_attributes  = in_requested_attributes
      IMPORTING
        out_node_ids             = out_node_ids
        out_data                 = out_data
        out_query_info           = out_query_info ).

* Todo: Query is not needed. Must be deleted in MDRS Repository
  ELSE.
    CLEAR out_node_ids.
    CLEAR out_data.
    CLEAR out_query_info.
  ENDIF.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACPROERR_QAF_ECO->IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [<---] OUT_SELECTION_PARAMETERS       TYPE        SESF_SELECTION_PARAMETERS_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_query~retrieve_default_query_param.

  IF in_query_name <> if_a1fia_acproerr_qaf_eco=>co_query-accnotif_assignment-query_by_elements.
    super->if_esf_provider_query~retrieve_default_query_param(
      EXPORTING
        in_bo_node_name          = in_bo_node_name
        in_query_name            = in_query_name
      IMPORTING
        out_selection_parameters = out_selection_parameters ).

* Todo: Query is not needed. Must be deleted in MDRS Repository
  ELSE.
    CLEAR out_selection_parameters.
  ENDIF.
ENDMETHOD.
ENDCLASS.