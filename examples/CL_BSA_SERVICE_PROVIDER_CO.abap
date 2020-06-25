CLASS cl_bsa_service_provider_co DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
*"* public components of class CL_BSA_SERVICE_PROVIDER_CO
*"* do not include other source files here!!!

    INTERFACES if_esf_provider_access .
    INTERFACES if_esf_provider_action .
    INTERFACES if_esf_provider_init .
    INTERFACES if_esf_provider_query .
    INTERFACES if_esf_provider_subscription .
    INTERFACES if_bsa_callback_handler .
    INTERFACES if_esf_provider_value_set .
    INTERFACES if_esf_provider_interact_ctrl .
    INTERFACES if_esf_provider_transact_ctrl .

    TYPES ty_error_behavior TYPE i .

    CONSTANTS:
      BEGIN OF  co_error_behavior.
    CONSTANTS     dump TYPE ty_error_behavior VALUE 0.
    CONSTANTS     fatal_exception TYPE ty_error_behavior VALUE 1.
    CONSTANTS     dynamic_exception TYPE ty_error_behavior VALUE 2.
    CONSTANTS     message  TYPE ty_error_behavior VALUE 3.
    CONSTANTS END OF co_error_behavior .

    INTERFACE if_esf_types LOAD .
    CLASS-METHODS put_change_notifs_into_handler
      IMPORTING
        !in_change_notifications TYPE if_esf_types=>ty_change_notifications
        !in_change_handler TYPE REF TO if_esf_change_handler .
  PROTECTED SECTION.
*"* protected components of class CL_BSA_SERVICE_PROVIDER_CO
*"* do not include other source files here!!!

    TYPES:
      tt_exceptions TYPE STANDARD TABLE OF REF TO cx_root WITH DEFAULT KEY .

    DATA mt_exceptions TYPE tt_exceptions .
    DATA mo_adaptation_handler TYPE REF TO if_bsa_adaptation_handler .
    DATA mv_error_behavior TYPE ty_error_behavior VALUE co_error_behavior-fatal_exception. "#EC NOTEXT .
    DATA mv_error_behavior_adap_hdlr TYPE ty_error_behavior VALUE co_error_behavior-fatal_exception. "#EC NOTEXT .

    CLASS cm_esi_root DEFINITION LOAD .
    METHODS put_messages_into_handler
      IMPORTING
        !in_message_handler TYPE REF TO if_esf_message_handler
        !in_messages TYPE cm_esi_root=>tt_esi_root .
    METHODS handle_error
      IMPORTING
        !ix_exception TYPE REF TO cx_root .
    INTERFACE if_esf_types LOAD .
    METHODS put_sync_notifs_into_handler
      IMPORTING
        !in_sync_notifications TYPE if_esf_types=>tt_sync_notifications
        !in_sync_handler TYPE REF TO if_esf_buffer_sync_handler .
    METHODS handle_error_adaptation_hdlr
      IMPORTING
        !ix_exception TYPE REF TO cx_root .
  PRIVATE SECTION.
*"* private components of class CL_BSA_SERVICE_PROVIDER_CO
*"* do not include other source files here!!!

    CLASS cm_esi_root DEFINITION LOAD .
    METHODS append_pre_exceptions_to_msgs
      IMPORTING
        !io_exception TYPE REF TO cx_root
      CHANGING
        !ct_messages TYPE cm_esi_root=>tt_esi_root .
ENDCLASS.



CLASS CL_BSA_SERVICE_PROVIDER_CO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_BSA_SERVICE_PROVIDER_CO->APPEND_PRE_EXCEPTIONS_TO_MSGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_EXCEPTION                   TYPE REF TO CX_ROOT
* | [<-->] CT_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD append_pre_exceptions_to_msgs.

    DATA lr_t100_message          TYPE REF TO cm_esi_t100 .
    DATA lr_cast_exception        TYPE REF TO cx_root .

**********************************************************************
    " check if a previous exception exists or not
    IF io_exception IS BOUND.
      TRY .
          lr_t100_message ?= io_exception .

          " append the previous message
          APPEND lr_t100_message TO ct_messages .

          " check if the previoud message has also a previous message
          me->append_pre_exceptions_to_msgs( EXPORTING io_exception = io_exception->previous
                                             CHANGING  ct_messages  = ct_messages ) .

        CATCH cx_sy_conversion_no_number
              cx_sy_conversion_overflow
              cx_sy_move_cast_error
              INTO lr_cast_exception .

          " check if the previoud message has also a previous message
          me->append_pre_exceptions_to_msgs( EXPORTING io_exception = io_exception->previous
                                             CHANGING  ct_messages  = ct_messages ) .

      ENDTRY.


    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_BSA_SERVICE_PROVIDER_CO->HANDLE_ERROR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IX_EXCEPTION                   TYPE REF TO CX_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_error.
    ASSERT ix_exception IS BOUND. " You must not call this method without providing an exception

    RAISE EXCEPTION TYPE cx_bsa_runtime_dynamic
      EXPORTING
        previous = ix_exception.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_BSA_SERVICE_PROVIDER_CO->HANDLE_ERROR_ADAPTATION_HDLR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IX_EXCEPTION                   TYPE REF TO CX_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD handle_error_adaptation_hdlr.

    RAISE EXCEPTION TYPE cx_bsa_runtime_dynamic
      EXPORTING
        previous = ix_exception.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~check.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA lt_messages    TYPE cm_esi_root=>tt_esi_root.

    TRY.
        mo_adaptation_handler->check(
          EXPORTING
            in_bo_node_name    = in_bo_node_name
            in_node_ids        = in_node_ids
            in_check_scope     = in_check_scope
          IMPORTING
            out_messages       = lt_messages
        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).


      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~CHECK_AND_DETERMINE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~check_and_determine.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA lt_messages    TYPE cm_esi_root=>tt_esi_root.
    DATA ls_change_notifs TYPE if_esf_types=>ty_change_notifications   .

    TRY.
        mo_adaptation_handler->check_and_determine(
          EXPORTING
            in_bo_node_name    = in_bo_node_name
            in_node_ids        = in_node_ids
            in_check_scope     = in_check_scope
          IMPORTING
            out_messages             = lt_messages
            out_change_notifications = ls_change_notifs
        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

        me->put_change_notifs_into_handler(
            in_change_notifications = ls_change_notifs
            in_change_handler       = in_change_handler
        ).


      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~CONVERT_KEYS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_SOURCE_KEY_NAME             TYPE        STRING
* | [--->] IN_TARGET_KEY_NAME             TYPE        STRING
* | [--->] IN_SOURCE_KEYS                 TYPE        INDEX TABLE
* | [<---] OUT_TARGET_KEYS                TYPE        INDEX TABLE
* | [<---] OUT_FAILED                     TYPE        SESF_BOOLEAN_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~convert_keys.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

    TRY.
        mo_adaptation_handler->convert_keys(
          EXPORTING
            in_bo_node_name    = in_bo_node_name
            in_source_key_name = in_source_key_name
            in_target_key_name = in_target_key_name
            in_source_keys     = in_source_keys
          IMPORTING
            out_target_keys    = out_target_keys
            out_failed         = out_failed
        ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~CONVERT_KEY_TO_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_KEY_NAME                    TYPE        STRING
* | [--->] IN_KEYS                        TYPE        INDEX TABLE
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_KEY_MAPPING                TYPE        SESF_ACCESS_KEY_MAPPING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~convert_key_to_node_id.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

    TRY.
        mo_adaptation_handler->convert_key_to_node_id(
          EXPORTING
            in_bo_node_name    = in_bo_node_name
            in_key_name        = in_key_name
            in_keys            = in_keys
            in_requested_image = in_requested_image
          IMPORTING
            out_key_mapping    = out_key_mapping
        ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<-->] IN_MODIFICATIONS               TYPE        TT_MODIFICATIONS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~modify.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA lt_messages    TYPE cm_esi_root=>tt_esi_root.
    DATA ls_change_notifs TYPE if_esf_types=>ty_change_notifications   .
    TRY.
        mo_adaptation_handler->modify(
          EXPORTING
            in_modifications         = in_modifications
          IMPORTING
            out_messages             = lt_messages
            out_change_notifications = ls_change_notifs
        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

        me->put_change_notifs_into_handler(
            in_change_notifications = ls_change_notifs
            in_change_handler       = in_change_handler
        ).


      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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

    DATA lx_bsa_runtime   TYPE REF TO cx_bsa_runtime .
    DATA lx_root          TYPE REF TO cx_root .
    DATA lt_messages      TYPE cm_esi_root=>tt_esi_root.
    DATA ls_change_notifs TYPE if_esf_types=>ty_change_notifications   .

    IF in_edit_mode <> if_esf_types=>co_read_only.
      ASSERT in_buffer_sync_handler IS BOUND.
    ENDIF.

    TRY.
        mo_adaptation_handler->retrieve(
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_node_ids             = in_node_ids
            in_requested_image      = in_requested_image
            in_edit_mode            = in_edit_mode
            in_requested_attributes = in_requested_attributes
          IMPORTING
            out_data                = out_data
            out_failed_node_ids     = out_failed_node_ids
            out_messages            = lt_messages
            out_sync_notifications  = ls_change_notifs-sync_notifications
        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

        IF in_buffer_sync_handler IS BOUND.
          me->put_sync_notifs_into_handler(
              in_sync_handler       = in_buffer_sync_handler
              in_sync_notifications = ls_change_notifs-sync_notifications
          ).
        ENDIF.

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
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

    DATA lx_bsa_runtime   TYPE REF TO cx_bsa_runtime .
    DATA lx_root          TYPE REF TO cx_root .
    DATA lt_messages      TYPE        cm_esi_root=>tt_esi_root.
    DATA ls_change_notifs TYPE        if_esf_types=>ty_change_notifications   .

    IF in_edit_mode <> if_esf_types=>co_read_only.
      ASSERT in_buffer_sync_handler IS BOUND.
    ENDIF.

    TRY.
        mo_adaptation_handler->retrieve_by_association(
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
            out_failed_source_node_ids = out_failed_source_node_ids
            out_messages               = lt_messages
            out_sync_notifications     = ls_change_notifs-sync_notifications

        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

        IF in_buffer_sync_handler IS BOUND.
          me->put_sync_notifs_into_handler(
              in_sync_handler       = in_buffer_sync_handler
              in_sync_notifications = ls_change_notifs-sync_notifications
          ).
        ENDIF.

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_DEFAULT_NODE_VALUES
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

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA ls_properties  TYPE if_esf_types=>ty_properties.

    ASSERT in_property_handler IS BOUND.

    TRY.
        mo_adaptation_handler->retrieve_default_node_values(
          EXPORTING
            in_bo_node_name               = in_bo_node_name
            in_node_id_handles            = in_node_id_handles
            in_association_name           = in_association_name
            in_association_filter_struct  = in_association_filter_struct
            in_association_filter_attribs = in_association_filter_attribs
            in_source_bo_node_name        = in_source_bo_node_name
            in_source_node_id             = in_source_node_id
            in_source_node_id_is_handle   = in_source_node_id_is_handle
          IMPORTING
            out_data                      = out_data
            out_properties                = ls_properties
        ).

        in_property_handler->set_properties(
             EXPORTING
               in_properties = ls_properties
         ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IN_PROPERTY_SCOPE              TYPE        IF_ESF_TYPES=>TY_PROPERTY_SCOPE (default =IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_access~retrieve_properties.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA ls_properties  TYPE if_esf_types=>ty_properties.

    TRY.
        mo_adaptation_handler->retrieve_properties(
          EXPORTING
            in_bo_node_name     = in_bo_node_name
            in_node_ids         = in_node_ids
            in_property_scope   = in_property_scope
          IMPORTING
            out_properties      = ls_properties
        ).

        in_property_handler->set_properties(
             EXPORTING
               in_properties    = ls_properties
        ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
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
        mo_adaptation_handler->retrieve_root_node_id(
          EXPORTING
            in_bo_node_name    = in_bo_node_name
            in_node_ids        = in_node_ids
            in_requested_image = in_requested_image
          IMPORTING
            out_links          = out_links
        ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

*    IF sy-uname = 'VIOL' AND sy-sysid = 'BXI'.
*      DATA lv_root_node_id      TYPE sesf_bo_node_id .
*      DATA ls_out_links         LIKE LINE OF out_links .
*      mo_adaptation_handler->get_first_retrved_root_node_id( IMPORTING ev_first_ret_data_root_node_id = lv_root_node_id ) .
*      ls_out_links-source_node_id = lv_root_node_id .
*      ls_out_links-target_node_id = lv_root_node_id .
*      APPEND ls_out_links TO out_links .
*
*    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
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

    DATA lx_bsa_runtime   TYPE REF TO cx_bsa_runtime .
    DATA lx_root          TYPE REF TO cx_root .
    DATA lt_messages      TYPE cm_esi_root=>tt_esi_root.
    DATA ls_change_notifs TYPE if_esf_types=>ty_change_notifications   .

    TRY.
        mo_adaptation_handler->execute_action(
          EXPORTING
            in_bo_node_name              = in_bo_node_name
            in_action_name               = in_action_name
            in_node_ids                  = in_node_ids
            in_action_parameters         = in_action_parameters
            in_referencing_node_elements = in_referencing_node_elements
*            in_change_handler            = in_change_handler
*            in_message_handler           = in_message_handler
          IMPORTING
            out_messages                 = lt_messages
            out_change_notifications     = ls_change_notifs
        ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

        me->put_change_notifs_into_handler(
            in_change_notifications = ls_change_notifs
            in_change_handler       = in_change_handler
        ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_ACTION_PARAMETERS          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_action~retrieve_default_action_param.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root          TYPE REF TO cx_root .

    TRY.
        mo_adaptation_handler->retrieve_default_action_param(
          EXPORTING
            in_bo_node_name       = in_bo_node_name
            in_action_name        = in_action_name
            in_node_ids           = in_node_ids
          IMPORTING
            out_action_parameters = out_action_parameters
        ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_init~init.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .

    TRY.
        mo_adaptation_handler = cl_bsa_factory=>get_adaptation_handler_for_co(
            in_bo_name          = in_bo_name
            in_provider_context = in_provider_context
        ).
      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error( ix_exception = lx_bsa_runtime ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION
* +-------------------------------------------------------------------------------------------------+
* | [--->] SESSION_HAND_OVER              TYPE        SESF_BOOLEAN(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_interact_ctrl~close_session.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_OVERRULING_CODE             TYPE        IF_ESF_TYPES=>TY_OVERRULING_CODE(optional)
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_interact_ctrl~do_post_processing.
* obsolete. New exception handling in handle_error
*    DATA lr_exception             TYPE REF TO cx_root.
*    DATA lr_message               TYPE REF TO cm_esi_root.
*    DATA lr_t100_message          TYPE REF TO cx_bsa_runtime .
*
***********************************************************************
*    LOOP AT mt_exceptions INTO lr_exception.
*
*      " create the first standard exception message
**      CREATE OBJECT lr_t100_message
**        EXPORTING
**          textid   = cx_bsa_runtime=>post_processing_error
**          severity = cm_root=>co_severity_warning
**          lifetime = cm_esi_root=>co_lifetime_transition.
*
**      APPEND lr_t100_message TO inout_messages.
*
*      " append all previous exceptions of the exception object to the messages
*      me->append_pre_exceptions_to_msgs( EXPORTING io_exception   = lr_exception
*                                         CHANGING  ct_messages    = inout_messages ) .
*
*    ENDLOOP.
*
    CLEAR mt_exceptions.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_INTERACT_CTRL~DO_PRE_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_interact_ctrl~do_pre_processing.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_QUERY~QUERY
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

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .
    DATA lt_messages    TYPE cm_esi_root=>tt_esi_root.

    TRY.
        mo_adaptation_handler->if_esf_lcp~query(
            EXPORTING
              in_bo_node_name          = in_bo_node_name
              in_query_name            = in_query_name
              in_selection_parameters  = in_selection_parameters
              in_query_options         = in_query_options
              in_requested_attributes  = in_requested_attributes
              in_authorization_context = in_authorization_context
*            in_message_handler       = in_message_handler
              in_fill_data             = in_fill_data
              in_filter_node_ids       = in_filter_node_ids
            IMPORTING
              out_node_ids             = out_node_ids
              out_data                 = out_data
              out_query_info           = out_query_info
              out_messages             = lt_messages
          ).

        me->put_messages_into_handler(
            in_message_handler = in_message_handler
            in_messages        = lt_messages
        ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [<---] OUT_SELECTION_PARAMETERS       TYPE        SESF_SELECTION_PARAMETERS_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_query~retrieve_default_query_param.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

    TRY.
        mo_adaptation_handler->retrieve_default_query_param(
          EXPORTING
            in_bo_node_name          = in_bo_node_name
            in_query_name            = in_query_name
          IMPORTING
            out_selection_parameters = out_selection_parameters
        ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_SUBSCRIPTION~ON_BO_CHANGED
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PUBLISHER_BO_NAME           TYPE        STRING
* | [--->] IN_BO_CHANGES                  TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_subscription~on_bo_changed.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CHECK_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_check_transaction.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_cleanup_transaction.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_after_save_transaction.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CHECK_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_before_check_transaction.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_before_cleanup_transaction.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_transact_ctrl~on_before_save_transaction.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<-()] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_action_code_values.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

**********************************************************************

    TRY.
        mo_adaptation_handler->retrieve_action_code_values(
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_node_ids             = in_node_ids
            in_action_name          = in_action_name
            in_attribute_name       = in_attribute_name
            in_context_parameters   = in_context_parameters
            in_context_attributes   = in_context_attributes
          IMPORTING
            out_code_values         = out_code_values
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_VALUE_SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [--->] IN_QUERY_OPTIONS               TYPE        SESF_QUERY_OPTIONS(optional)
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        TY_AUTHORIZATION_CONTEXT(optional)
* | [<-()] OUT_VALUE_SET_NODE_IDS         TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_action_value_set.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

**********************************************************************

    TRY.
        mo_adaptation_handler->retrieve_action_value_set(
          EXPORTING
            in_bo_node_name           = in_bo_node_name
            in_action_name            = in_action_name
            in_node_ids               = in_node_ids
            in_attribute_name         = in_attribute_name
            in_selection_parameters   = in_selection_parameters
            in_query_options          = in_query_options
            in_authorization_context  = in_authorization_context
          IMPORTING
            out_value_set_node_ids    = out_value_set_node_ids
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_CODE_VALUES
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

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

**********************************************************************

    TRY.
        mo_adaptation_handler->retrieve_code_values(
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_node_id              = in_node_id
            in_node_id_is_handle    = in_node_id_is_handle
            in_attribute_name       = in_attribute_name
            in_context_parameters   = in_context_parameters
            in_context_attributes   = in_context_attributes
          IMPORTING
            out_code_values         = out_code_values
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<-()] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_query_code_values.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

**********************************************************************

    TRY.
        mo_adaptation_handler->retrieve_query_code_values(
          EXPORTING
            in_bo_node_name         = in_bo_node_name
            in_query_name           = in_query_name
            in_attribute_name       = in_attribute_name
            in_context_parameters   = in_context_parameters
            in_context_attributes   = in_context_attributes
          IMPORTING
            out_code_values         = out_code_values
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_VALUE_SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [--->] IN_QUERY_OPTIONS               TYPE        SESF_QUERY_OPTIONS(optional)
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        TY_AUTHORIZATION_CONTEXT(optional)
* | [<-()] OUT_VALUE_SET_NODE_IDS         TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_esf_provider_value_set~retrieve_query_value_set.

    DATA lx_bsa_runtime TYPE REF TO cx_bsa_runtime .
    DATA lx_root        TYPE REF TO cx_root .

**********************************************************************

    TRY.
        mo_adaptation_handler->retrieve_query_value_set(
          EXPORTING
            in_bo_node_name           = in_bo_node_name
            in_query_name             = in_query_name
            in_attribute_name         = in_attribute_name
            in_selection_parameters   = in_selection_parameters
            in_query_options          = in_query_options
            in_authorization_context  = in_authorization_context
          IMPORTING
            out_value_set_node_ids    = out_value_set_node_ids
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).

      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_BSA_SERVICE_PROVIDER_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_VALUE_SET
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

    DATA lx_bsa_runtime   TYPE REF TO cx_bsa_runtime .
    DATA lx_root          TYPE REF TO cx_root .

**********************************************************************
    TRY.
        mo_adaptation_handler->retrieve_value_set(
          EXPORTING
            in_bo_node_name           = in_bo_node_name
            in_node_id                = in_node_id
            in_node_id_is_handle      = in_node_id_is_handle
            in_selection_parameters   = in_selection_parameters
            in_query_options          = in_query_options
            in_authorization_context  = in_authorization_context
            in_attribute_name         = in_attribute_name
          IMPORTING
            out_value_set_node_ids    = out_value_set_node_ids
            ).

      CATCH cx_bsa_runtime INTO lx_bsa_runtime.
        handle_error_adaptation_hdlr( ix_exception = lx_bsa_runtime ).
      CATCH cx_root INTO lx_root.
        handle_error( ix_exception = lx_root ).

    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method CL_BSA_SERVICE_PROVIDER_CO=>PUT_CHANGE_NOTIFS_INTO_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_NOTIFICATIONS        TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD put_change_notifs_into_handler.

    FIELD-SYMBOLS <fs_create_notif> TYPE if_esf_types=>ty_create_notification.
    FIELD-SYMBOLS <fs_suc_create_notif> TYPE if_esf_types=>ty_suc_create_notification.
    FIELD-SYMBOLS <fs_failed_create_notif> TYPE if_esf_types=>ty_failed_create_notification.
    FIELD-SYMBOLS <fs_update_notif> TYPE if_esf_types=>ty_update_notification.
    FIELD-SYMBOLS <fs_delete_notif> TYPE if_esf_types=>ty_delete_notification.

    DATA lx_esf_change_handler TYPE REF TO cx_esf_change_handler.
    DATA lx_esf_sync_handler TYPE REF TO cx_esf_sync_handler.

    LOOP AT in_change_notifications-create_notifications ASSIGNING <fs_create_notif>.
      TRY.
          CALL METHOD in_change_handler->notify_create
            EXPORTING
              in_bo_node_name = <fs_create_notif>-bo_node_name
              in_bo_node_id   = <fs_create_notif>-node_id.
        CATCH cx_esf_change_handler INTO lx_esf_change_handler. "#EC NO_HANDLER
          "ignore. This can occur if BO calls itself recursively within finalize
      ENDTRY.
    ENDLOOP.

    LOOP AT in_change_notifications-suc_create_notifications ASSIGNING <fs_suc_create_notif>.
      TRY.
          CALL METHOD in_change_handler->notify_create
            EXPORTING
              in_bo_node_name      = <fs_suc_create_notif>-bo_node_name
              in_bo_node_id        = <fs_suc_create_notif>-node_id
              in_create_key_handle = <fs_suc_create_notif>-node_id_handle.
        CATCH cx_esf_change_handler INTO lx_esf_change_handler. "#EC NO_HANDLER
          "ignore. This can occur if BO calls itself recursively within finalize
      ENDTRY.
    ENDLOOP.

    LOOP AT in_change_notifications-failed_create_notifications ASSIGNING <fs_failed_create_notif>.
      TRY.
          CALL METHOD in_change_handler->notify_failed_create
            EXPORTING
              in_bo_node_name      = <fs_failed_create_notif>-bo_node_name
              in_create_key_handle = <fs_failed_create_notif>-node_id_handle.
        CATCH cx_esf_change_handler INTO lx_esf_change_handler. "#EC NO_HANDLER
          "ignore. This can occur if BO calls itself recursively within finalize
      ENDTRY.
    ENDLOOP.

    LOOP AT in_change_notifications-update_notifications ASSIGNING <fs_update_notif>.
      TRY.
          CALL METHOD in_change_handler->notify_update
            EXPORTING
              in_bo_node_name          = <fs_update_notif>-bo_node_name
              in_bo_node_id            = <fs_update_notif>-node_id
              in_attributes_changed    = <fs_update_notif>-attributes_changed
              in_properties_changed    = <fs_update_notif>-properties_changed
              in_associations_changed  = <fs_update_notif>-associations_changed
              in_affected_associations = <fs_update_notif>-affected_associations
              in_property_change_scope = <fs_update_notif>-property_scope.
        CATCH cx_esf_change_handler INTO lx_esf_change_handler. "#EC NO_HANDLER
          "ignore. This can occur if BO calls itself recursively within finalize
      ENDTRY.
    ENDLOOP.

    LOOP AT in_change_notifications-delete_notifications ASSIGNING <fs_delete_notif>.
      TRY.
          CALL METHOD in_change_handler->notify_delete
            EXPORTING
              in_bo_node_name = <fs_delete_notif>-bo_node_name
              in_bo_node_id   = <fs_delete_notif>-node_id.
        CATCH cx_esf_change_handler INTO lx_esf_change_handler. "#EC NO_HANDLER
          "ignore. This can occur if BO calls itself recursively within finalize
      ENDTRY.
    ENDLOOP.

*      CATCH cx_esf_change_handler INTO lx_esf_change_handler.
*        RAISE EXCEPTION TYPE cx_fatal_exception
*          EXPORTING
*            previous = lx_esf_change_handler.
*ENDTRY.

    TRY.
        CALL METHOD in_change_handler->notify_buffer_syncs
          EXPORTING
            in_sync_notifications = in_change_notifications-sync_notifications.
      CATCH cx_esf_sync_handler INTO lx_esf_sync_handler.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_sync_handler.
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_BSA_SERVICE_PROVIDER_CO->PUT_MESSAGES_INTO_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD put_messages_into_handler.

    DATA lx_exception       TYPE REF TO cx_root.
    DATA lo_message         TYPE REF TO  cm_esi_root.
    DATA lo_mapped_message  TYPE REF TO  cm_esi_root.
    DATA lt_message         TYPE cm_esi_root=>tt_esi_root.
    DATA ls_origin_location TYPE cm_esi_root=>ty_message_location.

    TRY.
        LOOP AT in_messages INTO lo_message
             WHERE table_line->origin_location-bo_name <> in_message_handler->bo_name.
          EXIT.
        ENDLOOP.

        IF sy-subrc = 0.
          LOOP AT in_messages INTO lo_message.
            IF lo_message->origin_location-bo_name <> in_message_handler->bo_name.
              ls_origin_location-bo_name = in_message_handler->bo_name.
              "change lifetime to transition - no other chance, because state is not allowed
              "without location
              lo_mapped_message = lo_message->copy_with_new_location(
                  new_origin_location       = ls_origin_location
                  new_message_lifetime      = cm_esi_root=>co_lifetime_transition ).
              APPEND lo_mapped_message TO lt_message.
            ELSE.
              APPEND lo_message TO lt_message.
            ENDIF.
          ENDLOOP.
          in_message_handler->add_messages( in_messages = lt_message ).
        ELSE.
          in_message_handler->add_messages( in_messages = in_messages ).
        ENDIF.

      CATCH cx_esf_message_handler INTO lx_exception.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_exception.
    ENDTRY.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_BSA_SERVICE_PROVIDER_CO->PUT_SYNC_NOTIFS_INTO_HANDLER
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_SYNC_NOTIFICATIONS          TYPE        IF_ESF_TYPES=>TT_SYNC_NOTIFICATIONS
* | [--->] IN_SYNC_HANDLER                TYPE REF TO IF_ESF_BUFFER_SYNC_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD put_sync_notifs_into_handler.

    in_sync_handler->notify_buffer_syncs( in_sync_notifications ).

  ENDMETHOD.
ENDCLASS.