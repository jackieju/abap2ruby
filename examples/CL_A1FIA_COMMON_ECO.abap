class CL_A1FIA_COMMON_ECO definition
  public
  inheriting from CL_A1S_SERVICE_PROVIDER_ECO
  create public .

public section.
*"* public components of class CL_A1FIA_COMMON_ECO
*"* do not include other source files here!!!

  interfaces IF_A1FIA_COMMON_ECO .

  methods IF_ESF_PROVIDER_ACCESS~MODIFY
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
    redefinition .
protected section.
*"* protected components of class CL_A1FIA_COMMON_ECO
*"* do not include other source files here!!!

  data MO_PROVIDER_CONTEXT type ref to IF_ESF_PROVIDER_CONTEXT .

  methods ADD_NODE_FOR_CALLBACK_RRNID
    importing
      !IV_BO_NODE_NAME type STRING .
  methods ADD_NODE_FOR_HEURISTIC_RRNID
    importing
      !IV_BO_NODE_NAME type STRING .
  methods ADD_NODE_FOR_DELEGATION_RRNID
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_CORE_BO_NAME type STRING
      !IV_CORE_BO_NODE_NAME type STRING .
  methods CALLBACK_RRNID
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB
    raising
      CX_ESF_CORE_SERVICE .
  methods DISABLE_RETRIEVE_CHECK .
private section.
*"* private components of class CL_A1FIA_COMMON_ECO
*"* do not include other source files here!!!

  types:
    tt_heuristic_bo_node_name TYPE SORTED TABLE OF string WITH UNIQUE DEFAULT KEY .
  types:
    BEGIN OF ty_lcp_bo_node_name,
           bo_node_name TYPE string,
           core_bo_name TYPE string,
           core_bo_node_name TYPE string,
         END OF ty_lcp_bo_node_name .
  types:
    tt_lcp_bo_node_name TYPE SORTED TABLE OF ty_lcp_bo_node_name WITH UNIQUE KEY bo_node_name .

  data MS_EXECUTE_ACTION_PARAMETER type IF_A1FIA_COMMON_ECO=>TY_EXECUTE_ACTION_PARAMETER .
  data MT_LCP_BO_NODE_NAME type TT_LCP_BO_NODE_NAME .
  data MT_CALLBACK_BO_NODE_NAME type TT_HEURISTIC_BO_NODE_NAME .
  data MT_HEURISTIC_BO_NODE_NAME type TT_HEURISTIC_BO_NODE_NAME .
  data MV_DO_RETRIEVE_CHECK type SESF_BOOLEAN value 'X'. "#EC NOTEXT .

  methods USE_CALLBACK_FOR_RRNID
    importing
      !IV_BO_NODE_NAME type STRING
    returning
      value(RV_RESULT) type BOOLEAN .
  methods USE_DELEGATION_FOR_RRNID
    importing
      !IV_BO_NODE_NAME type STRING
    returning
      value(RV_RESULT) type BOOLEAN .
  methods USE_HEURISTIC_FOR_RRNID
    importing
      !IV_BO_NODE_NAME type STRING
    returning
      value(RV_RESULT) type BOOLEAN .
  methods HEURISTIC_RRNID
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB
    raising
      CX_ESF_CORE_SERVICE .
  methods DELEGATION_RRNID
    importing
      !IN_BO_NODE_NAME type STRING
      !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IN_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE default IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER
    exporting
      !OUT_LINKS type SESF_ASSOCIATION_LINK_TAB
    raising
      CX_ESF_CORE_SERVICE .
ENDCLASS.



CLASS CL_A1FIA_COMMON_ECO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_COMMON_ECO->ADD_NODE_FOR_CALLBACK_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ADD_NODE_FOR_CALLBACK_RRNID.
  insert iv_bo_node_name into TABLE mt_callback_bo_node_name.

  if mo_rnid_manager is BOUND.
    mo_rnid_manager->exclude( iv_node_name = iv_bo_node_name ).
  ENDIF.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_COMMON_ECO->ADD_NODE_FOR_DELEGATION_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_CORE_BO_NAME                TYPE        STRING
* | [--->] IV_CORE_BO_NODE_NAME           TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD ADD_NODE_FOR_DELEGATION_RRNID.
  DATA ls_lcp_bo_node_name TYPE ty_lcp_bo_node_name.
  ls_lcp_bo_node_name-bo_node_name = iv_bo_node_name.
  ls_lcp_bo_node_name-core_bo_name = iv_core_bo_name.
  ls_lcp_bo_node_name-core_bo_node_name = iv_core_bo_node_name.

  INSERT ls_lcp_bo_node_name INTO TABLE mt_lcp_bo_node_name.

  if mo_rnid_manager is BOUND.
    mo_rnid_manager->exclude( iv_node_name = iv_bo_node_name ).
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_COMMON_ECO->ADD_NODE_FOR_HEURISTIC_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ADD_NODE_FOR_HEURISTIC_RRNID.
  insert iv_bo_node_name into TABLE mt_heuristic_bo_node_name.

  if mo_rnid_manager is BOUND.
    mo_rnid_manager->include( iv_node_name = iv_bo_node_name ).
  ENDIF.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_COMMON_ECO->CALLBACK_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* | [!CX!] CX_ESF_CORE_SERVICE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD CALLBACK_RRNID.
*must be redifined by subclass if used at all
  assert 1 = 0.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_COMMON_ECO->DELEGATION_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* | [!CX!] CX_ESF_CORE_SERVICE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD DELEGATION_RRNID.

  DATA lo_lcp TYPE REF TO if_esf_lcp.

  FIELD-SYMBOLS <ls_lcp_bo_node_name> LIKE LINE OF mt_lcp_bo_node_name.

  READ TABLE mt_lcp_bo_node_name WITH TABLE KEY bo_node_name = in_bo_node_name ASSIGNING <ls_lcp_bo_node_name>.

  ASSERT <ls_lcp_bo_node_name> IS ASSIGNED.

  lo_lcp = mo_adaptation_handler->get_lcp( <ls_lcp_bo_node_name>-core_bo_name ).

  CALL METHOD lo_lcp->retrieve_root_node_id
    EXPORTING
      in_bo_node_name    = <ls_lcp_bo_node_name>-core_bo_node_name
      in_node_ids        = in_node_ids
      in_requested_image = in_requested_image
    IMPORTING
      out_links          = out_links.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_COMMON_ECO->DISABLE_RETRIEVE_CHECK
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD disable_retrieve_check.
* Set the flag to false, to disable Check method call on First Retrieve
  mv_do_retrieve_check  = abap_false.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_COMMON_ECO->HEURISTIC_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* | [!CX!] CX_ESF_CORE_SERVICE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD heuristic_rrnid.

  DATA lv_node_id TYPE sesf_bo_node_id.
  DATA lv_node_id_determined TYPE boolean.
  DATA ls_origin_location TYPE cm_esi_root=>ty_message_location.
  DATA lo_message TYPE REF TO cm_a1fia_common_eco.
  DATA ls_link LIKE LINE OF out_links.
  DATA lv_root_node_name TYPE string.
  DATA lv_bo_name TYPE string.
  DATA lt_out_failed_node_id TYPE sesf_bo_node_id_tab.
  DATA lrt_core_bo_out_data TYPE REF TO data.
  DATA lt_requested_attributes TYPE sesf_string_tab.
  DATA lt_out_links LIKE out_links.

  FIELD-SYMBOLS <lt_core_bo_out_data>  TYPE INDEX TABLE. "#EC NEEDED must be passed to avoid dumps CSN-IM 0120031469 0001477892 2008
  FIELD-SYMBOLS <ls_node_id> LIKE LINE OF in_node_ids.

  lv_root_node_name = if_a1s_service_provider_eco~get_bo_root_node_name( ).
  lv_bo_name = if_a1s_service_provider_eco~get_bo_name( ).

  IF in_bo_node_name = lv_root_node_name.
* check if root node exists for this in_requested_image
* if not out_links must be returned empty
* you can not use CHECK_ROOT_NODE_EXISTENCE here => recursion


    lrt_core_bo_out_data = mo_provider_context->get_lcp_facade( )->get_bo_node_table_container(
    in_bo_name =  lv_bo_name
    in_bo_node_name = lv_root_node_name ).
    ASSIGN lrt_core_bo_out_data->* TO <lt_core_bo_out_data>.

    INSERT if_esf_types=>co_node_id_proxy_name INTO TABLE lt_requested_attributes.

    CALL METHOD mo_adaptation_handler->if_esf_lcp~retrieve
      EXPORTING
        in_bo_node_name         = in_bo_node_name
        in_node_ids             = in_node_ids
        in_edit_mode            = if_esf_types=>co_read_only
        in_requested_image      = in_requested_image
        in_requested_attributes = lt_requested_attributes
      IMPORTING
        out_failed_node_ids     = lt_out_failed_node_id
        out_data                = <lt_core_bo_out_data>.

    IF lines( lt_out_failed_node_id ) = 0.
      lt_out_links = if_a1fia_common_eco~source_to_target_mapping( in_node_ids ).
    ENDIF.

  ELSE.

    mo_adaptation_handler->get_first_retrved_root_node_id(
      IMPORTING
        ev_first_ret_data_root_node_id = lv_node_id
        ev_first_root_id_determined = lv_node_id_determined
    ).

    IF lv_node_id_determined = abap_false OR
       ( lv_node_id IS INITIAL AND
         lv_node_id_determined = abap_true ).
      ls_origin_location-bo_name = lv_bo_name.
      CREATE OBJECT lo_message
        EXPORTING
          textid          = cm_a1fia_common_eco=>heuristic_rrnid_error
          severity        = cm_root=>co_severity_error
          lifetime        = cm_esi_root=>co_lifetime_transition
          origin_location = ls_origin_location
          mv_bo_node_name = in_bo_node_name.
      mo_message_manager->add_message( lo_message ).
    ELSE.
* check if root node exists for this in_requested_image
* if not out_links must be returned empty
      IF if_a1fia_common_eco~check_root_node_existence(
          iv_node_id         = lv_node_id
          iv_requested_image = in_requested_image ) = abap_true.
        LOOP AT in_node_ids ASSIGNING <ls_node_id>.
          ls_link-source_node_id = <ls_node_id>.
          ls_link-target_node_id = lv_node_id.
          APPEND ls_link TO lt_out_links.
        ENDLOOP.
      ENDIF.
    ENDIF.

  ENDIF.

  out_links = lt_out_links.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_A1FIA_COMMON_ECO~CHECK_ROOT_NODE_EXISTENCE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_NODE_ID                     TYPE        SESF_BO_NODE_ID
* | [--->] IV_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE
* | [<-()] RV_EXISTS                      TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_a1fia_common_eco~check_root_node_existence.
  DATA lt_node_id TYPE sesf_bo_node_id_tab.
  DATA lt_out_links TYPE sesf_association_link_tab.

  INSERT iv_node_id INTO TABLE lt_node_id.
  CALL METHOD if_esf_provider_access~retrieve_root_node_id
    EXPORTING
      in_bo_node_name    = if_a1s_service_provider_eco~get_bo_root_node_name( )
      in_node_ids        = lt_node_id
      in_requested_image = iv_requested_image
    IMPORTING
      out_links          = lt_out_links.

  IF lines( lt_out_links ) > 0.
    rv_exists = abap_true.
  ELSE.
    rv_exists = abap_false.
  ENDIF.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_A1FIA_COMMON_ECO~GET_LAST_EXECUTED_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RS_EXECUTE_ACTION_PARAMETER    TYPE        TY_EXECUTE_ACTION_PARAMETER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_A1FIA_COMMON_ECO~GET_LAST_EXECUTED_ACTION.
  rs_execute_action_parameter = ms_execute_action_parameter.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_A1FIA_COMMON_ECO~RAISE_STOP_SAVE_MESSAGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_a1fia_common_eco~raise_stop_save_message.
* in the UI "trigger save after execution" is set for the compound actions
* save will not be triggered by GCP if and error message is raised during EXECUTE_ACTION
* however these messages have to be passed via IN_MESSAGE_HANDLER and not only
* by ECO message manager.
* So a message is raised here. This message is later suppressed in message mapping. That
* means this message should not reach the end user

  DATA lo_ex_message TYPE REF TO cx_esf_message_handler .
  DATA lo_message TYPE REF TO cm_esi_t100_adapter .
  DATA ls_msg TYPE symsg .
  DATA ls_orig_loc TYPE cm_esi_root=>ty_message_location .
  DATA lt_out_messages TYPE cm_esi_root=>tt_esi_root .

  ls_orig_loc-bo_name = if_a1s_service_provider_eco~get_bo_name( ).

  ls_msg-msgno = '103'.
  ls_msg-msgty = 'E'.
  ls_msg-msgid = 'A1FIA_ACCOUNTING'.

  lo_message = cm_esi_t100_adapter=>create(
      symptom               = cl_esi_message_symptom_code=>co_bo_inconsistency
      lifetime              = cm_esi_root=>co_lifetime_transition
      origin_location       = ls_orig_loc
      symsg                 = ls_msg
    ).
  APPEND lo_message TO lt_out_messages.

  TRY.
      CALL METHOD io_message_handler->add_messages
        EXPORTING
          in_messages = lt_out_messages.


    CATCH cx_esf_message_handler INTO lo_ex_message.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lo_ex_message.
  ENDTRY.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method CL_A1FIA_COMMON_ECO=>IF_A1FIA_COMMON_ECO~SOURCE_TO_TARGET_MAPPING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_NODE_ID                     TYPE        SESF_BO_NODE_ID_TAB
* | [<-()] RT_OUT_LINK                    TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_a1fia_common_eco~source_to_target_mapping.
  DATA ls_link LIKE LINE OF rt_out_link.
  LOOP AT it_node_id INTO ls_link-source_node_id.
    ls_link-target_node_id = ls_link-source_node_id.
    APPEND ls_link TO rt_out_link.
  ENDLOOP.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_ACCESS~MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<-->] IN_MODIFICATIONS               TYPE        TT_MODIFICATIONS
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_access~modify.

  IF mv_do_retrieve_check  = abap_true.
* MODIFY is called even before Retrieve, should be a floorplan for create
* In Create floorplan error messages should not be shown on launch
*  -> Set flag to suppress the CHECK method call during First retrieve
    mv_do_retrieve_check  = abap_false.
  ENDIF.

  CALL METHOD super->if_esf_provider_access~modify
    EXPORTING
      in_change_handler  = in_change_handler
      in_message_handler = in_message_handler
    CHANGING
      in_modifications   = in_modifications.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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

  DATA:
    lt_message          TYPE cm_esi_root=>tt_esi_root,
    lx_esf_core_service TYPE REF TO cx_esf_core_service.

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

  IF   mv_do_retrieve_check  = abap_true
   AND IN_REQUESTED_IMAGE EQ if_esf_types=>co_image_transactional_buffer
   AND lines( out_failed_node_ids ) <> lines( in_node_ids ).
* If this is the First Retrieve Call,
* call the CHECK method to get the error messages
* to be displayed on the floorplans for Edit
* DS20111013: Only do this for transaction buffer. Not for requests triggered by RBAM. Internal msg 0120031469 0002740280 2011

    TRY.
        mo_adaptation_handler->check(
          EXPORTING
            in_bo_node_name = in_bo_node_name
            in_node_ids     = in_node_ids
            in_check_scope  = if_esf_types=>co_check_scope_substructure
          IMPORTING
            out_messages    = lt_message
        ).
      CATCH cx_esf_core_service INTO lx_esf_core_service.  "
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.
    ENDTRY.

    IF lt_message IS NOT INITIAL.
      mo_message_manager->add_messages( lt_message ).
    ENDIF.

    mv_do_retrieve_check  = abap_false.

  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_access~retrieve_root_node_id.
  DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
  DATA lx_root        TYPE REF TO cx_root .


  TRY.
      IF mo_rnid_manager->mv_skip_rnid_manager = abap_true.
*----------- START of OLD implementation ----------*
        IF use_heuristic_for_rrnid( in_bo_node_name ) = abap_true.
          heuristic_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSEIF use_delegation_for_rrnid( in_bo_node_name ) = abap_true.
          delegation_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSEIF use_callback_for_rrnid( in_bo_node_name ) = abap_true.
          callback_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSE.
          mo_adaptation_handler->retrieve_root_node_id(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
          ).
        ENDIF.
*-----------END of OLD implementation ----------*

      ELSE.
* Nos: Test of the new RNID Buffer:
        IF mo_rnid_manager->is_skipped( iv_node_name = in_bo_node_name ) IS INITIAL.
          super->if_esf_provider_access~retrieve_root_node_id(
*        mo_adaptation_handler->retrieve_root_node_id(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
          ).
        ELSEIF use_heuristic_for_rrnid( in_bo_node_name ) = abap_true.
          heuristic_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSEIF use_delegation_for_rrnid( in_bo_node_name ) = abap_true.
          delegation_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSEIF use_callback_for_rrnid( in_bo_node_name ) = abap_true.
          callback_rrnid(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
            ).
        ELSE.
* Nos: New RRNID Handling --> Call super class instead of adaptation handler.
          super->if_esf_provider_access~retrieve_root_node_id(
*        mo_adaptation_handler->retrieve_root_node_id(
            EXPORTING
              in_bo_node_name    = in_bo_node_name
              in_node_ids        = in_node_ids
              in_requested_image = in_requested_image
            IMPORTING
              out_links          = out_links
          ).
        ENDIF.

      ENDIF.

    CATCH cx_bsa_runtime INTO lx_bsa_runtime.
      handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
    CATCH cx_root INTO lx_root.                          "#EC CATCH_ALL
      handle_error( ix_exception = lx_root ).

  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
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

  IF mv_do_retrieve_check  = abap_true.
* EXECUTE_ACTION is called even before Retrieve,
* should be a floorplan with CREATE_WITH_REFERENCE entry point
* In Create floorplan error messages should not be shown on launch
*  -> Set flag to suppress the CHECK method call during First retrieve
    mv_do_retrieve_check  = abap_false.
  ENDIF.

  FIELD-SYMBOLS <lv_action_parameters> TYPE any.

* store last executed action parameters to allow creation of appropriate save & exit messages

  ms_execute_action_parameter-bo_node_name = in_bo_node_name.
  ms_execute_action_parameter-action_name = in_action_name.
  ms_execute_action_parameter-referencing_node_elements = in_referencing_node_elements.

  IF NOT in_action_parameters IS INITIAL.
    CREATE DATA ms_execute_action_parameter-action_parameters LIKE in_action_parameters.
    ASSIGN ms_execute_action_parameter-action_parameters->* TO <lv_action_parameters>.
    <lv_action_parameters> = in_action_parameters.
  ENDIF.



  CALL METHOD super->if_esf_provider_action~execute_action
    EXPORTING
      in_bo_node_name              = in_bo_node_name
      in_action_name               = in_action_name
      in_node_ids                  = in_node_ids
      in_action_parameters         = in_action_parameters
      in_referencing_node_elements = in_referencing_node_elements
      in_change_handler            = in_change_handler
      in_message_handler           = in_message_handler.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_init~init.

  super->if_esf_provider_init~init(
      EXPORTING
        in_provider_context         = in_provider_context
        in_bo_name                  = in_bo_name
      CHANGING
        inout_preferred_trx_pattern = inout_preferred_trx_pattern ) .

  mo_provider_context = in_provider_context.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_COMMON_ECO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_transact_ctrl~on_after_save_transaction.
  CALL METHOD super->if_esf_provider_transact_ctrl~on_after_save_transaction
    EXPORTING
      in_rejected    = in_rejected
    CHANGING
      inout_messages = inout_messages.

* remove last action for next save cycle
  CLEAR ms_execute_action_parameter.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_COMMON_ECO->USE_CALLBACK_FOR_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<-()] RV_RESULT                      TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
method USE_CALLBACK_FOR_RRNID.
  read table mt_callback_bo_node_name from iv_bo_node_name TRANSPORTING NO FIELDS.
  if sy-subrc = 0.
    rv_result = abap_true.
  else.
    rv_result = abap_false.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_COMMON_ECO->USE_DELEGATION_FOR_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<-()] RV_RESULT                      TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD USE_DELEGATION_FOR_RRNID.
  READ TABLE mt_lcp_bo_node_name WITH TABLE KEY bo_node_name = iv_bo_node_name TRANSPORTING NO FIELDS.
  IF sy-subrc = 0.
    rv_result = abap_true.
  ELSE.
    rv_result = abap_false.
  ENDIF.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1FIA_COMMON_ECO->USE_HEURISTIC_FOR_RRNID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<-()] RV_RESULT                      TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
method USE_HEURISTIC_FOR_RRNID.
  read table mt_heuristic_bo_node_name from iv_bo_node_name TRANSPORTING NO FIELDS.
  if sy-subrc = 0.
    rv_result = abap_true.
  else.
    rv_result = abap_false.
  endif.
endmethod.
ENDCLASS.