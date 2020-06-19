class CL_A1S_SERVICE_PROVIDER_ECO definition
  public
  inheriting from CL_BSA_SERVICE_PROVIDER_CO
  create public .

public section.

  interfaces IF_A1S_SERVICE_PROVIDER_ECO
      all methods final .

  aliases GET_BO_NAME
    for IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_NAME .
  aliases GET_BO_ROOT_NODE_NAME
    for IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_ROOT_NODE_NAME .

  methods IF_ESF_PROVIDER_ACCESS~CHECK
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~MODIFY
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
    redefinition .
  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION
    redefinition .
  methods IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~QUERY
    redefinition .
  methods IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
    redefinition .
  methods IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
    redefinition .
protected section.

  aliases MAP_PUT_MESSAGES_INTO_HANDLER
    for IF_A1S_SERVICE_PROVIDER_ECO~MAP_PUT_MESSAGES_INTO_HANDLER .

  data MO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER .
  data MO_MESSAGE_MANAGER type ref to IF_MSGM_MESSAGE_MANAGER .
  data MO_RNID_MANAGER type ref to CL_A1S_RNID_MANAGER_ECO .
  data MV_NOTIFY_ANY_ERROR type SESF_BOOLEAN .

  methods ADD_MESSAGE_ON_AFTER_SAVE_TRX
    importing
      !IV_REJECTED type SESF_BOOLEAN .
  methods GET_MAP_MSGS_CHECK_INCOMING
    returning
      value(RV_CHECK_INCOMMING) type SESF_BOOLEAN .
  methods GET_NODE_ID_FOR_TASK_REGION
    importing
      !IT_NODE_ID type SESF_BO_NODE_ID_TAB
    returning
      value(RT_NODE_ID) type SESF_BO_NODE_ID_TAB .
  interface IF_MSGM_MESSAGE_MANAGER load .
  methods GET_SUB_CONTEXT
    returning
      value(RV_SUB_CONTEXT) type IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT .
  methods GET_TASK_REGION_BO_DETAILS
    importing
      !IV_ECO_NAME type STRING
    exporting
      !EV_HAS_TASK_REGION type SESF_BOOLEAN
      !EV_ECO_ROOT_NODE_NAME type STRING
      !EV_BO_NAME type STRING
      !EV_BO_NODE_NAME type STRING .
  methods SEND_UPDATE_TASK_ASSOCIATION .

  methods PUT_MESSAGES_INTO_HANDLER
    redefinition .
private section.

  constants GC_TASK_ASSOCIATION_NAME type STRING value 'TO_OPEN_TASK' ##no_text .
  data MO_PROVIDER_CONTEXT type ref to IF_ESF_PROVIDER_CONTEXT .
  data MO_TASK_REGION_HELPER type ref to IF_COUTL_TASK_REGION_HELPER .
  data MT_TASK_REGION_NODE_ID type SESF_BO_NODE_ID_TAB .
  data MV_BO_NAME type STRING .
  data MV_BO_ROOT_NODE_NAME type STRING .
  data MV_HAS_TASK_REGION type SESF_BOOLEAN .
  data MV_NOTIFY_TRANS_ERROR type SESF_BOOLEAN .

  class CM_ESI_ROOT definition load .
  type-pools ABAP .
  methods PUT_MESSAGES
    importing
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT
      !IV_IGNORE_WRONG_ORIG_LOCATION type SYBOOLEAN default ABAP_FALSE .
ENDCLASS.



CLASS CL_A1S_SERVICE_PROVIDER_ECO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->ADD_MESSAGE_ON_AFTER_SAVE_TRX
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_REJECTED                    TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD ADD_MESSAGE_ON_AFTER_SAVE_TRX.

  DATA LO_MESSAGE  TYPE REF TO CM_ESI_T100_ADAPTER.
  DATA LS_ORIG_LOC TYPE CM_ESI_ROOT=>TY_MESSAGE_LOCATION.
  DATA LS_MSG      TYPE SYMSG.

  LS_ORIG_LOC-BO_NAME = MV_BO_NAME.

  IF IV_REJECTED = ABAP_TRUE.
    LS_MSG-MSGNO = '001'.
    LS_MSG-MSGTY = 'E'.
  ELSE.
    LS_MSG-MSGNO = '000'.
    LS_MSG-MSGTY = 'S'.
  ENDIF.

  LS_MSG-MSGID = 'MSGM_ON_SAVE_TRANS'.

  LO_MESSAGE = CM_ESI_T100_ADAPTER=>CREATE( SYMPTOM         = SPACE
                                            LIFETIME        = CM_ESI_ROOT=>CO_LIFETIME_TRANSITION
                                            ORIGIN_LOCATION = LS_ORIG_LOC
                                            SYMSG           = LS_MSG ).

  CALL METHOD MO_MESSAGE_MANAGER->ADD_MESSAGE
    EXPORTING
      IO_MESSAGE = LO_MESSAGE.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->GET_MAP_MSGS_CHECK_INCOMING
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_CHECK_INCOMMING             TYPE        SESF_BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD GET_MAP_MSGS_CHECK_INCOMING.
* within one roundtrip first a modify is called that raises some error message.
* within the same roundtrip execute_action is called that invalidates this error message.
* normal message_manager functionality will still display this error message because
* messages created during this roundtrip are not checked for validity.
* by setting this parameter even these messages will be checked and deleted if they
* are no longer valid
* this flag is turned of by default due to performance considerations
* internal message 0120031469 0005126681 2008

  RV_CHECK_INCOMMING = ABAP_FALSE.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->GET_NODE_ID_FOR_TASK_REGION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_NODE_ID                     TYPE        SESF_BO_NODE_ID_TAB
* | [<-()] RT_NODE_ID                     TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD GET_NODE_ID_FOR_TASK_REGION.

  RT_NODE_ID = IT_NODE_ID.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->GET_SUB_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_SUB_CONTEXT                 TYPE        IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD GET_SUB_CONTEXT.                                     "#EC NEEDED

*/Currently no implementation - to be redefined!
  CLEAR RV_SUB_CONTEXT.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->GET_TASK_REGION_BO_DETAILS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ECO_NAME                    TYPE        STRING
* | [<---] EV_HAS_TASK_REGION             TYPE        SESF_BOOLEAN
* | [<---] EV_ECO_ROOT_NODE_NAME          TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD GET_TASK_REGION_BO_DETAILS.

  DATA LO_ASSOCIATION_DESCRIPTOR      TYPE REF TO IF_ESF_ASSOCIATION_DESC. "#EC NEEDED
  DATA LO_BO_DESCRIPTOR               TYPE REF TO IF_ESF_BO_DESC.
  DATA LO_ROOT_NODE_DESCRIPTOR        TYPE REF TO IF_ESF_BO_NODE_DESC.
  DATA LR_BSA_PRIMARY_NODE            TYPE REF TO DATA.
  DATA LX_ESF_METADATA_ERROR          TYPE REF TO CX_ESF_METADATA_ERROR.

  FIELD-SYMBOLS <LS_BSA_PRIMARY_NODE> TYPE ANY.
  FIELD-SYMBOLS <LV_PRMRY_BO_NAME>    TYPE SCOOLOBJECT.  "BSA_PRIMARY_BO_NAME.
  FIELD-SYMBOLS <LV_PRMRY_NODE_NAME>  TYPE SCOOLDESCRIPT."BSA_PRIMARY_BO_NODE_NAME.

*/Initialize Exporting Parameters
  EV_HAS_TASK_REGION = ABAP_FALSE.
  CLEAR:
    EV_BO_NAME,
    EV_BO_NODE_NAME,
    EV_ECO_ROOT_NODE_NAME.

  TRY.
      LO_BO_DESCRIPTOR        = CL_ESF_DESCRIPTOR_FACTORY=>GET_BO_DESCRIPTOR( IN_BO_PROXY_NAME = IV_ECO_NAME ).
      LO_ROOT_NODE_DESCRIPTOR = LO_BO_DESCRIPTOR->GET_ROOT_BO_NODE_DESCRIPTOR( ).
*/    Return Root Node Name
      EV_ECO_ROOT_NODE_NAME   = LO_ROOT_NODE_DESCRIPTOR->GET_PROXY_NAME( ).

    CATCH CX_ESF_METADATA_ERROR INTO LX_ESF_METADATA_ERROR.
      HANDLE_ERROR( IX_EXCEPTION = LX_ESF_METADATA_ERROR ).
  ENDTRY.

  TRY.
*/    Retrieve Association Descriptor for TO_OPEN_TASK association to check whether association exists
*/    Existence of association indicates usage of TaskRegion
      LO_ASSOCIATION_DESCRIPTOR = LO_ROOT_NODE_DESCRIPTOR->GET_ASSOCIATION_DESCRIPTOR( ASSOCIATION_PROXY_NAME = GC_TASK_ASSOCIATION_NAME ).

      CREATE DATA LR_BSA_PRIMARY_NODE TYPE ('BSA_I_PRMRY_NODE').
      ASSIGN LR_BSA_PRIMARY_NODE->* TO <LS_BSA_PRIMARY_NODE>.

      SELECT SINGLE * FROM ('BSA_I_PRMRY_NODE') INTO <LS_BSA_PRIMARY_NODE>
        WHERE BO_NAME      = IV_ECO_NAME
          AND BO_NODE_NAME = EV_ECO_ROOT_NODE_NAME. "#EC CI_DYNTAB

      IF SY-SUBRC IS INITIAL.
        ASSIGN COMPONENT 'PRMRY_BO_NAME'   OF STRUCTURE <LS_BSA_PRIMARY_NODE> TO <LV_PRMRY_BO_NAME>.
        ASSIGN COMPONENT 'PRMRY_NODE_NAME' OF STRUCTURE <LS_BSA_PRIMARY_NODE> TO <LV_PRMRY_NODE_NAME>.
*/      Return Additional Parameters
        EV_HAS_TASK_REGION = ABAP_TRUE.
        EV_BO_NAME         = <LV_PRMRY_BO_NAME>.
        EV_BO_NODE_NAME    = <LV_PRMRY_NODE_NAME>.
      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    CATCH CX_ESF_METADATA_ERROR.
*/    Return Additional Parameters
      EV_HAS_TASK_REGION    = ABAP_FALSE.
      EV_BO_NAME            = SPACE.
      EV_BO_NODE_NAME       = SPACE.
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~ADD_MAPPED_MESSAGES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_MESSAGE                     TYPE        IF_ESF_TYPES=>TY_MESSAGES
* | [!CX!] CX_BSA_RUNTIME
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_A1S_SERVICE_PROVIDER_ECO~ADD_MAPPED_MESSAGES.

  DATA LT_MESSAGE LIKE IT_MESSAGE.

  MO_ADAPTATION_HANDLER->MAP_MESSAGES( EXPORTING IN_MESSAGES  = IT_MESSAGE
                                       IMPORTING OUT_MESSAGES = LT_MESSAGE ).

  MO_MESSAGE_MANAGER->ADD_MESSAGES( LT_MESSAGE ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~ADD_MAPPED_NOTIFICATIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IO_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [!CX!] CX_BSA_RUNTIME
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_A1S_SERVICE_PROVIDER_ECO~ADD_MAPPED_NOTIFICATIONS.

  DATA LS_MAPPED_NOTIFICATION LIKE IS_CHANGE_NOTIFICATION.

  LS_MAPPED_NOTIFICATION = IF_A1S_SERVICE_PROVIDER_ECO~MAP_CHANGE_NOTIFICATIONS( IS_CHANGE_NOTIFICATION ).

  CL_BSA_SERVICE_PROVIDER_CO=>PUT_CHANGE_NOTIFS_INTO_HANDLER( IN_CHANGE_NOTIFICATIONS = LS_MAPPED_NOTIFICATION
                                                              IN_CHANGE_HANDLER       = IO_CHANGE_HANDLER ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_NAME
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_BO_NAME                     TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_NAME.

  RV_BO_NAME = MV_BO_NAME.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_ROOT_NODE_NAME
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_BO_ROOT_NODE_NAME           TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_A1S_SERVICE_PROVIDER_ECO~GET_BO_ROOT_NODE_NAME.

  RV_BO_ROOT_NODE_NAME = MV_BO_ROOT_NODE_NAME.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~MAP_CHANGE_NOTIFICATIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [<-()] RS_CHANGE_NOTIFICATION         TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [!CX!] CX_BSA_RUNTIME
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_A1S_SERVICE_PROVIDER_ECO~MAP_CHANGE_NOTIFICATIONS.

  MO_ADAPTATION_HANDLER->MAP_CHANGE_NOTIFICATIONS( EXPORTING IN_CHANGE_NOTIFICATIONS  = IS_CHANGE_NOTIFICATION
                                                   IMPORTING OUT_CHANGE_NOTIFICATIONS = RS_CHANGE_NOTIFICATION ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_A1S_SERVICE_PROVIDER_ECO~MAP_PUT_MESSAGES_INTO_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IT_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_a1s_service_provider_eco~map_put_messages_into_handler.

  DATA:
    lt_messages           TYPE cm_esi_root=>tt_esi_root,
    lx_exception          TYPE REF TO cx_static_check.

  TRY.
      mo_adaptation_handler->map_messages(
        EXPORTING
          in_messages  = it_messages
        IMPORTING
          out_messages = lt_messages ).

      put_messages( io_message_handler = io_message_handler
                    it_messages        = lt_messages ).

    CATCH cx_bsa_runtime INTO lx_exception.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_exception.
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACCESS~CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_access~check.

  DATA lt_messages    TYPE if_esf_types=>ty_messages.
  DATA lt_node_ids    TYPE sesf_bo_node_id_tab.
  DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.
  DATA lx_root        TYPE REF TO cx_root.

  lt_node_ids = in_node_ids.
  SORT lt_node_ids STABLE.
  DELETE ADJACENT DUPLICATES FROM lt_node_ids.

  TRY.
      CALL METHOD mo_adaptation_handler->check
        EXPORTING
          in_bo_node_name = in_bo_node_name
          in_node_ids     = lt_node_ids
          in_check_scope  = in_check_scope
        IMPORTING
          out_messages    = lt_messages.

      put_messages( io_message_handler            = in_message_handler
                    it_messages                   = lt_messages
                    iv_ignore_wrong_orig_location = abap_true ). "XRG: ignore wrong (non ECO) origin location as otherwise we would break the lifetime handling mechanism or handler would dump

    CATCH cx_bsa_runtime INTO lx_bsa_runtime.
      handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
    CATCH cx_root INTO lx_root.                           "#EC CATCH_ALL
      handle_error( ix_exception = lx_root ).
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACCESS~MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<-->] IN_MODIFICATIONS               TYPE        TT_MODIFICATIONS
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_ESF_PROVIDER_ACCESS~MODIFY.

  MV_NOTIFY_TRANS_ERROR = ABAP_TRUE.

  CALL METHOD SUPER->IF_ESF_PROVIDER_ACCESS~MODIFY
    EXPORTING
      IN_CHANGE_HANDLER  = IN_CHANGE_HANDLER
      IN_MESSAGE_HANDLER = IN_MESSAGE_HANDLER
    CHANGING
      IN_MODIFICATIONS   = IN_MODIFICATIONS.

  MV_NOTIFY_TRANS_ERROR = ABAP_FALSE.

  CALL METHOD MO_RNID_MANAGER->SYNC_CHANGES
    EXPORTING
      IO_CHANGE_HANDLER = IN_CHANGE_HANDLER.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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

*/Redefinition to be deleted (same applied to ELSE-branch in RBA)
*/Currently not done as IN_BUFFER_SYNC_HANDLER is not correctly handled by all SPs)

  DATA lt_messages             TYPE if_esf_types=>ty_messages.
  DATA lt_sync_notifications   TYPE if_esf_types=>tt_sync_notifications. "#EC NEEDED
  DATA lx_bsa_runtime          TYPE REF TO cx_bsa_runtime.
  DATA lx_root                 TYPE REF TO cx_root.

  TRY.
      CALL METHOD mo_adaptation_handler->retrieve
        EXPORTING
          in_bo_node_name         = in_bo_node_name
          in_node_ids             = in_node_ids
          in_requested_image      = in_requested_image
          in_edit_mode            = in_edit_mode
          in_requested_attributes = in_requested_attributes
        IMPORTING
          out_data                = out_data
          out_messages            = lt_messages
          out_failed_node_ids     = out_failed_node_ids
          out_sync_notifications  = lt_sync_notifications.

*/    Use Message Handler (if provided)
      put_messages( io_message_handler = in_message_handler
                    it_messages        = lt_messages ).

      IF     in_buffer_sync_handler         IS BOUND
         AND lines( lt_sync_notifications ) IS NOT INITIAL.
        CALL METHOD in_buffer_sync_handler->notify_buffer_syncs
          EXPORTING
            in_sync_notifications = lt_sync_notifications.
      ENDIF.

      CALL METHOD mo_rnid_manager->sync_data
        EXPORTING
          iv_node_name = in_bo_node_name
*/        IT_NODE_ID   = OUT_NODE_IDS
          it_data      = out_data.

    CATCH cx_bsa_runtime INTO lx_bsa_runtime.
      handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
    CATCH cx_root INTO lx_root.                           "#EC CATCH_ALL
      handle_error( ix_exception = lx_root ).
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
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

  DATA lt_sync_notifications      TYPE if_esf_types=>tt_sync_notifications. "#EC NEEDED
  DATA lt_messages                TYPE if_esf_types=>ty_messages.
  DATA lt_node_id_for_task_search TYPE sesf_bo_node_id_tab.
  DATA lx_bsa_runtime             TYPE REF TO cx_bsa_runtime.
  DATA lx_root                    TYPE REF TO cx_root.
  DATA lt_existing_node_id        TYPE sesf_bo_node_id_tab.
  DATA lt_failed_node_id          TYPE sesf_bo_node_id_tab.
  DATA lrt_out_data               TYPE REF TO data.
  DATA lt_requested_attributes    TYPE sesf_string_tab.

  FIELD-SYMBOLS <lt_out_data>     TYPE INDEX TABLE. "#EC NEEDED must be passed to avoid dumps
  FIELD-SYMBOLS <ls_node_id>      LIKE LINE OF in_node_ids.

  IF mv_has_task_region  = abap_true                AND
     in_association_name = gc_task_association_name AND
     in_bo_node_name     = mv_bo_root_node_name     AND
     in_bo_name          = mv_bo_name.

* check if root_node exists and create OUT_FAILED_SOURCE_NODE_IDS
* needed for TOOL_UNITTEST_BO FN-011..FN-014 compliance
    TRY.
        lt_existing_node_id = in_node_ids.

        lrt_out_data = mo_provider_context->get_lcp_facade( )->get_bo_node_table_container(
        in_bo_name =  mv_bo_name
        in_bo_node_name = mv_bo_root_node_name ).

        ASSIGN lrt_out_data->* TO <lt_out_data>.
        INSERT if_esf_types=>co_node_id_proxy_name INTO TABLE lt_requested_attributes.

        CALL METHOD mo_adaptation_handler->if_esf_lcp~retrieve
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_node_ids             = in_node_ids
            in_edit_mode            = if_esf_types=>co_read_only
            in_requested_image      = in_requested_image
            in_requested_attributes = lt_requested_attributes
          IMPORTING
            out_failed_node_ids     = lt_failed_node_id
            out_data                = <lt_out_data>.

        out_failed_source_node_ids = lt_failed_node_id.

        LOOP AT lt_failed_node_id ASSIGNING <ls_node_id>.
          DELETE TABLE lt_existing_node_id FROM <ls_node_id>. "#EC CI_STDSEQ
        ENDLOOP.

        IF lines( lt_existing_node_id ) > 0.
          mt_task_region_node_id = lt_existing_node_id.

          lt_node_id_for_task_search = get_node_id_for_task_region( lt_existing_node_id ).

          CALL METHOD mo_task_region_helper->retrieve_by_association
            EXPORTING
              in_source_node_ids = lt_node_id_for_task_search
            CHANGING
              out_links          = out_links.
        ENDIF.

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.                         "#EC CATCH_ALL
        handle_error( ix_exception = lx_root ).
    ENDTRY.

  ELSE.
    TRY.
        CALL METHOD mo_adaptation_handler->retrieve_by_association
          EXPORTING
            in_bo_node_name            = in_bo_node_name
            in_association_name        = in_association_name
            in_node_ids                = in_node_ids
            in_fill_data               = in_fill_data
            in_filter_parameters       = in_filter_parameters
            in_filtered_attributes     = in_filtered_attributes
            in_requested_image         = in_requested_image
            in_edit_mode               = in_edit_mode
            in_requested_attributes    = in_requested_attributes
          IMPORTING
            out_links                  = out_links
            out_data                   = out_data
            out_messages               = lt_messages
            out_failed_source_node_ids = out_failed_source_node_ids
            out_sync_notifications     = lt_sync_notifications.

*/      Use Message Handler (if provided)
        put_messages( io_message_handler = in_message_handler
                      it_messages        = lt_messages ).

        IF     in_buffer_sync_handler         IS BOUND
           AND lines( lt_sync_notifications ) IS NOT INITIAL.
          CALL METHOD in_buffer_sync_handler->notify_buffer_syncs
            EXPORTING
              in_sync_notifications = lt_sync_notifications.
        ENDIF.

        CALL METHOD mo_rnid_manager->sync_assoc
          EXPORTING
            iv_node_name        = in_bo_node_name
            iv_association_name = in_association_name
            it_node_id          = in_node_ids
            it_data             = out_data
            it_link             = out_links
            is_filter_parameter = in_filter_parameters
            it_filter_attribute = in_filtered_attributes
            iv_requested_image  = in_requested_image.

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.                         "#EC CATCH_ALL
        handle_error( ix_exception = lx_root ).
    ENDTRY.
  ENDIF.

  IF in_fill_failed_source_node_ids EQ abap_false.
    CLEAR: out_failed_source_node_ids.
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID.

  DATA:
    LV_SKIPPED TYPE CHAR1.

  LV_SKIPPED = ABAP_FALSE.

  CALL METHOD MO_RNID_MANAGER->RRNID
    EXPORTING
      IV_NODE_NAME       = IN_BO_NODE_NAME
      IT_NODE_ID         = IN_NODE_IDS
      IV_REQUESTED_IMAGE = IN_REQUESTED_IMAGE
    IMPORTING
      ET_LINK            = OUT_LINKS
      EV_SKIPPED         = LV_SKIPPED.

  IF LV_SKIPPED EQ ABAP_TRUE.
    CALL METHOD SUPER->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
      EXPORTING
        IN_BO_NODE_NAME    = IN_BO_NODE_NAME
        IN_NODE_IDS        = IN_NODE_IDS
        IN_REQUESTED_IMAGE = IN_REQUESTED_IMAGE
      IMPORTING
        OUT_LINKS          = OUT_LINKS.
  ENDIF.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T(optional)
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION.

  IF MV_NOTIFY_ANY_ERROR = ABAP_UNDEFINED.
    MV_NOTIFY_ANY_ERROR = ABAP_TRUE.
  ENDIF.

  MV_NOTIFY_TRANS_ERROR = ABAP_TRUE.

  CALL METHOD SUPER->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
    EXPORTING
      IN_BO_NODE_NAME              = IN_BO_NODE_NAME
      IN_ACTION_NAME               = IN_ACTION_NAME
      IN_NODE_IDS                  = IN_NODE_IDS
      IN_ACTION_PARAMETERS         = IN_ACTION_PARAMETERS
      IN_REFERENCING_NODE_ELEMENTS = IN_REFERENCING_NODE_ELEMENTS
      IN_CHANGE_HANDLER            = IN_CHANGE_HANDLER
      IN_MESSAGE_HANDLER           = IN_MESSAGE_HANDLER.

  MV_NOTIFY_ANY_ERROR   = ABAP_UNDEFINED.
  MV_NOTIFY_TRANS_ERROR = ABAP_FALSE.

  CALL METHOD MO_RNID_MANAGER->SYNC_CHANGES
    EXPORTING
      IO_CHANGE_HANDLER = IN_CHANGE_HANDLER.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_init~init.

  DATA lo_lcp_facade        TYPE REF TO if_esf_lcp_facade.
  DATA lv_task_bo_name      TYPE string.
  DATA lv_task_bo_node_name TYPE string.
  DATA lx_esf_core_service  TYPE REF TO cx_esf_core_service.

  CALL METHOD super->if_esf_provider_init~init
    EXPORTING
      in_provider_context         = in_provider_context
      in_bo_name                  = in_bo_name
    CHANGING
      inout_preferred_trx_pattern = inout_preferred_trx_pattern.

  mo_provider_context = in_provider_context.

  TRY.
      lo_lcp_facade = in_provider_context->get_lcp_facade( ).
    CATCH cx_esf_core_service INTO lx_esf_core_service.
      handle_error( ix_exception = lx_esf_core_service ).
  ENDTRY.

  CALL METHOD cl_msgm_message_manager=>get_instance
    EXPORTING
      iv_context    = in_bo_name
      ir_lcp_facade = lo_lcp_facade
    RECEIVING
      ro_instance   = mo_message_manager.

*/Store BO Name & Change Handler
  mv_bo_name        = in_bo_name.
  mo_change_handler = in_provider_context->change_handler.

  CALL METHOD get_task_region_bo_details
    EXPORTING
      iv_eco_name           = in_bo_name
    IMPORTING
      ev_has_task_region    = mv_has_task_region
      ev_eco_root_node_name = mv_bo_root_node_name
      ev_bo_name            = lv_task_bo_name
      ev_bo_node_name       = lv_task_bo_node_name.

  IF mv_has_task_region = abap_true.
    IF lv_task_bo_name       IS INITIAL OR
       lv_task_bo_node_name  IS INITIAL OR
       mv_bo_root_node_name  IS INITIAL.
      RAISE EXCEPTION TYPE cx_fatal_exception.
    ELSE.
      mo_task_region_helper = cl_coutl_task_region_helper=>create_task_region_helper( in_bo_name      = lv_task_bo_name
                                                                                      in_bo_node_name = lv_task_bo_node_name
                                                                                      in_lcp_facade   = lo_lcp_facade ).
    ENDIF.
  ENDIF.

*/Instantiate RNID Manager
  TRY.
      CREATE OBJECT mo_rnid_manager
        EXPORTING
          io_adaptation_handler = mo_adaptation_handler
          io_provider_context   = in_provider_context
          iv_eco_name           = in_bo_name.

    CATCH cx_esf_core_service INTO lx_esf_core_service.
      handle_error( ix_exception = lx_esf_core_service ).
  ENDTRY.

  mv_notify_any_error = abap_undefined.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION
* +-------------------------------------------------------------------------------------------------+
* | [--->] SESSION_HAND_OVER              TYPE        SESF_BOOLEAN(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION.

  CALL METHOD SUPER->IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION
    EXPORTING
      SESSION_HAND_OVER = SESSION_HAND_OVER.

  CALL METHOD CL_MSGM_MESSAGE_MANAGER=>CLOSE_SESSION( IV_SESSION_HANDOVER = SESSION_HAND_OVER ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_OVERRULING_CODE             TYPE        IF_ESF_TYPES=>TY_OVERRULING_CODE(optional)
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_interact_ctrl~do_post_processing.

  DATA lt_out_message LIKE inout_messages.
  DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime.
  DATA lv_skip_check TYPE sesf_boolean.

* map messages necessary to catch messages raised during save
* if we keep it here individual calls to mo_adaptation_handler->map_messages are no longer needed
* call have to be done before super->if_esf_provider_interact_ctrl~do_post_processing
* so that errors propagated by handle_error( lx_bsa_runtime ) are displayed correctly

  TRY.
      mo_adaptation_handler->map_messages( EXPORTING in_messages  = inout_messages
                                           IMPORTING out_messages = lt_out_message ).

      inout_messages = lt_out_message.

    CATCH cx_bsa_runtime INTO lx_bsa_runtime.
      handle_error( lx_bsa_runtime ).
  ENDTRY.

  CALL METHOD super->if_esf_provider_interact_ctrl~do_post_processing
    CHANGING
      inout_messages = inout_messages.

  IF ( in_overruling_code IS SUPPLIED AND
       in_overruling_code EQ if_esf_types=>co_oc_in_ovs_phase ).
    lv_skip_check = abap_true.
  ELSE.
    lv_skip_check = abap_false.
  ENDIF.

  CALL METHOD mo_message_manager->map_messages
    EXPORTING
      iv_sub_context = get_sub_context( )
      iv_skip_check  = lv_skip_check
      iv_check_incoming = get_map_msgs_check_incoming( )
    CHANGING
      ct_messages    = inout_messages.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_QUERY~QUERY
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
METHOD IF_ESF_PROVIDER_QUERY~QUERY.

  CALL METHOD SUPER->IF_ESF_PROVIDER_QUERY~QUERY
    EXPORTING
      IN_BO_NODE_NAME          = IN_BO_NODE_NAME
      IN_QUERY_NAME            = IN_QUERY_NAME
      IN_SELECTION_PARAMETERS  = IN_SELECTION_PARAMETERS
      IN_QUERY_OPTIONS         = IN_QUERY_OPTIONS
      IN_AUTHORIZATION_CONTEXT = IN_AUTHORIZATION_CONTEXT
      IN_MESSAGE_HANDLER       = IN_MESSAGE_HANDLER
      IN_FILL_DATA             = IN_FILL_DATA
      IN_FILTER_NODE_IDS       = IN_FILTER_NODE_IDS
      IN_REQUESTED_ATTRIBUTES  = IN_REQUESTED_ATTRIBUTES
    IMPORTING
      OUT_NODE_IDS             = OUT_NODE_IDS
      OUT_DATA                 = OUT_DATA
      OUT_QUERY_INFO           = OUT_QUERY_INFO.

  CALL METHOD MO_RNID_MANAGER->SYNC_DATA
    EXPORTING
      IV_NODE_NAME = IN_BO_NODE_NAME
      IT_NODE_ID   = OUT_NODE_IDS
      IT_DATA      = OUT_DATA.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1S_SERVICE_PROVIDER_ECO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION.

  CALL METHOD SUPER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
    EXPORTING
      IN_REJECTED    = IN_REJECTED
    CHANGING
      INOUT_MESSAGES = INOUT_MESSAGES.

  ADD_MESSAGE_ON_AFTER_SAVE_TRX( IV_REJECTED = IN_REJECTED ).

  SEND_UPDATE_TASK_ASSOCIATION( ).

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_A1S_SERVICE_PROVIDER_ECO->PUT_MESSAGES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IT_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* | [--->] IV_IGNORE_WRONG_ORIG_LOCATION  TYPE        SYBOOLEAN (default =ABAP_FALSE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD put_messages.

* puts messages to message handler or message manager depending on location and lifetime
* if IV_KEEP_ORIGIN_LOCATION is TRUE - messages with origin location different than ECO will be ignored

  DATA:
    lt_messages           TYPE cm_esi_root=>tt_esi_root,
    lt_messages_handler   TYPE cm_esi_root=>tt_esi_root,
    lt_messages_manager   TYPE cm_esi_root=>tt_esi_root,
    lx_exception          TYPE REF TO cx_static_check,
    lo_message            TYPE REF TO cm_esi_root,
    ls_location           LIKE lo_message->origin_location.

  FIELD-SYMBOLS <lo_message> LIKE LINE OF lt_messages.

  CHECK it_messages IS NOT INITIAL.
  ASSERT io_message_handler IS BOUND.

  TRY.

      lt_messages = it_messages.

*     handle dependent on location and lifetime
      ls_location-bo_name = mv_bo_name.
      ls_location-bo_node_name = mv_bo_root_node_name.
      LOOP AT lt_messages ASSIGNING <lo_message>.
        IF <lo_message>->origin_location-bo_name <> mv_bo_name.
          IF iv_ignore_wrong_orig_location = abap_true.
            DELETE lt_messages.
          ELSE.
            IF <lo_message>->lifetime = cm_esi_root=>co_lifetime_transition.
*             location is different and lifetime is transition (potential Core Service rejection) --> must be put to handler so we have to adapt the location as otherwise the message handler raises an exception
              CLEAR lo_message.
              lo_message = <lo_message>->copy_with_new_location( new_origin_location = ls_location ).
              APPEND lo_message TO lt_messages_handler.
              DELETE lt_messages.
            ELSE. "LIFETIME STATE
*             location is different and lifetime is state --> just add it to message manager which can handle this
              APPEND <lo_message> TO lt_messages_manager.
              DELETE lt_messages.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDLOOP.

*     add messages to handler
      IF lt_messages IS NOT INITIAL.
        io_message_handler->add_messages( lt_messages ).
      ENDIF.
      IF lt_messages_handler IS NOT INITIAL.
        io_message_handler->add_messages( lt_messages_handler ).
      ENDIF.
*     add messages to manager as handler can not handle these
      IF lt_messages_manager IS NOT INITIAL.
        mo_message_manager->add_messages( lt_messages_manager ).
      ENDIF.

    CATCH cx_esf_message_handler INTO lx_exception.
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_exception.
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->PUT_MESSAGES_INTO_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD PUT_MESSAGES_INTO_HANDLER.

  DATA:
    LO_MESSAGE          TYPE REF TO CM_ESI_ROOT,
    LT_MESSAGES_MANAGER TYPE CM_ESI_ROOT=>TT_ESI_ROOT,"Messages for MessageManager
    LT_MESSAGES_HANDLER TYPE CM_ESI_ROOT=>TT_ESI_ROOT."Messages for ESF Message Handler

*/Delegation at present not implemented
*/CALL METHOD SUPER->PUT_MESSAGES_INTO_HANDLER
*/  EXPORTING
*/    IN_MESSAGE_HANDLER = IN_MESSAGE_HANDLER
*/    IN_MESSAGES        = IN_MESSAGES.

* Shall Transition error messages be notified directly?
* Background: The ESI Contract requires that transition E messages
*             have to be notified directly in order to prevent
*             possible succeeding SAVE and/or EXECUTE_ACTION calls

  IF MV_NOTIFY_TRANS_ERROR EQ ABAP_TRUE OR
     MV_NOTIFY_ANY_ERROR EQ ABAP_TRUE.
*   Identify E messages and split the message table accordingly
*   XRG: in case of MODIFY only for transition errors
*        in case of EXECUTE_ACTION for any lifetime ==> (ACP compatibility)
    LOOP AT IN_MESSAGES INTO LO_MESSAGE.
      IF LO_MESSAGE->SEVERITY = CM_ESI_ROOT=>CO_SEVERITY_ERROR AND LO_MESSAGE->ORIGIN_LOCATION-BO_NAME = MV_BO_NAME AND
        ( MV_NOTIFY_TRANS_ERROR = ABAP_TRUE AND LO_MESSAGE->LIFETIME = CM_ESI_ROOT=>CO_LIFETIME_TRANSITION OR MV_NOTIFY_ANY_ERROR = ABAP_TRUE ).
        APPEND LO_MESSAGE TO LT_MESSAGES_HANDLER.
      ELSE.
        APPEND LO_MESSAGE TO LT_MESSAGES_MANAGER.
      ENDIF.
    ENDLOOP.

*   Put transition error messages directly into the ESF Message Handler
    IF LT_MESSAGES_HANDLER IS NOT INITIAL.
      SUPER->PUT_MESSAGES_INTO_HANDLER( IN_MESSAGE_HANDLER = IN_MESSAGE_HANDLER
                                        IN_MESSAGES        = LT_MESSAGES_HANDLER ).
    ENDIF.

*   Put the rest into Message Manager
    IF LT_MESSAGES_MANAGER IS NOT INITIAL.
      MO_MESSAGE_MANAGER->ADD_MESSAGES( LT_MESSAGES_MANAGER ).
    ENDIF.
* Put all messages into Message Manager
  ELSE.
    MO_MESSAGE_MANAGER->ADD_MESSAGES( IN_MESSAGES ).
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1S_SERVICE_PROVIDER_ECO->SEND_UPDATE_TASK_ASSOCIATION
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD SEND_UPDATE_TASK_ASSOCIATION.

  DATA LT_AFFECTED_ASSOCIATION TYPE SESF_STRING_TAB.

  FIELD-SYMBOLS <LV_NODE_ID> LIKE LINE OF MT_TASK_REGION_NODE_ID.

  IF MV_HAS_TASK_REGION = ABAP_TRUE.
    INSERT GC_TASK_ASSOCIATION_NAME INTO TABLE LT_AFFECTED_ASSOCIATION.

    LOOP AT MT_TASK_REGION_NODE_ID ASSIGNING <LV_NODE_ID>.
      CALL METHOD MO_CHANGE_HANDLER->NOTIFY_UPDATE
        EXPORTING
          IN_BO_NODE_NAME          = MV_BO_ROOT_NODE_NAME
          IN_BO_NODE_ID            = <LV_NODE_ID>
          IN_ATTRIBUTES_CHANGED    = ABAP_FALSE
          IN_PROPERTIES_CHANGED    = ABAP_FALSE
          IN_ASSOCIATIONS_CHANGED  = ABAP_TRUE
          IN_AFFECTED_ASSOCIATIONS = LT_AFFECTED_ASSOCIATION.
    ENDLOOP.
  ENDIF.

ENDMETHOD.
ENDCLASS.