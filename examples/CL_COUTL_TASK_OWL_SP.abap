class CL_COUTL_TASK_OWL_SP definition
  public
  inheriting from CL_MSGM_ABSTRACT_PROVIDER
  create public .

public section.
*"* public components of class CL_COUTL_TASK_OWL_SP
*"* do not include other source files here!!!

  interfaces IF_ESF_PROVIDER_ACCESS .
  interfaces IF_ESF_PROVIDER_QUERY .
  interfaces IF_ESF_PROVIDER_ACTION .
  interfaces IF_ESF_PROVIDER_SUBSCRIPTION .

  types:
    TT_NODE_LIST type SORTED TABLE OF STRING WITH UNIQUE KEY TABLE_LINE .

  interface IF_ESF_PROVIDER_ACCESS load .
  methods DO_MODIFY
    importing
      !IO_CHANGE_HANDLER type ref to IF_ESF_CHANGE_HANDLER
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
      !IS_MODIFICATION type IF_ESF_PROVIDER_ACCESS=>TY_MODIFICATIONS
    raising
      CX_ESF_CHANGE_HANDLER
      CX_ESF_CORE_SERVICE .

  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
protected section.

  data MV_BO_NAME type STRING .
  data MO_FSI_PROVIDER type ref to CL_FSI_SERVICE_PROVIDER .
  data MO_TASK_LCP type ref to IF_ESF_LCP .
  data MO_LCP_FACADE type ref to IF_ESF_LCP_FACADE .
  class-data GV_PARENT_NODE_ID type STRING value 'PARENT_NODE_ID'. "#EC NOTEXT .
  class-data GV_NODE_ID type STRING value 'NODE_ID'. "#EC NOTEXT .
  class-data GV_BO_NODE_ROOT type STRING value 'ROOT'. "#EC NOTEXT .
  class-data GV_QUERY_TASK_VIEW type STRING value 'QUERY_FOR_OPEN_TASKS'. "#EC NOTEXT .
  class-data GV_ASSOC_TO_TASK type STRING value 'TO_TASK'. "#EC NOTEXT .
  class-data GV_ASSOC_TO_REF_BO_NODE type STRING value 'TO_REFERENCE_BONODE'. "#EC NOTEXT .
  class-data GV_ASSOC_TO_CORE_BO_NODE type STRING value 'TO_CORE_BO'. "#EC NOTEXT .
  class-data GV_TASK_FIELD type STRING value 'TASK'. "#EC NOTEXT .
  data MT_TASK_VIEW_NODE_LIST type TT_NODE_LIST .

  methods GET_REF_BO_NODE_NAME
    importing
      !IV_BO_NODE_NAME type STRING
    exporting
      !EV_BO_NAME type STRING
      !EV_BO_NODE_NAME type STRING .
  interface IF_ESF_TYPES load .
  methods GET_REF_BO_DATA
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IS_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
    exporting
      value(ERT_REF_BO_DATA) type ref to DATA
      !ET_LINK type SESF_ASSOCIATION_LINK_TAB .
  methods ADD_MESSAGES
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_ACTION_NAME type STRING
      !IT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER .
  methods GET_CORE_BO_DATA
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_NODE_IDS type SESF_BO_NODE_ID_TAB
      !IS_REQUESTED_IMAGE type IF_ESF_TYPES=>TY_IMAGE
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
    exporting
      !ERT_CORE_BO_DATA type ref to DATA .
  methods GET_ASSOC_BO_NODE_NAME
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_ASSOCIATION_NAME type STRING
    exporting
      !EV_BO_NAME type STRING
      !EV_BO_NODE_NAME type STRING .
  interface IF_ESF_PROVIDER_QUERY load .
  methods MAP_SELECTION_PARAMETERS
    importing
      !IV_BO_NODE_NAME type STRING
      !IV_QUERY_NAME type STRING
      !IT_SELECTION_PARAMETERS type IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS
    exporting
      !ET_SELECTION_PARAMETERS type IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS .
  methods FILL_AUTHORIZATION_CONTEXT
    importing
      !IV_NODE_NAME type STRING
      !IV_QUERY_NAME type STRING
      !IO_MESSAGE_HANDLER type ref to IF_ESF_MESSAGE_HANDLER
    exporting
      !ES_AUTHORIZATION_CONTEXT type IF_ESF_TYPES=>TY_AUTHORIZATION_CONTEXT .
private section.
*"* private components of class CL_COUTL_TASK_OWL_SP
*"* do not include other source files here!!!

  methods GET_CORE_BO_NODE_NAME
    importing
      !IV_BO_NODE_NAME type STRING
    exporting
      !EV_BO_NAME type STRING
      !EV_BO_NODE_NAME type STRING .
ENDCLASS.



CLASS CL_COUTL_TASK_OWL_SP IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->ADD_MESSAGES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_ACTION_NAME                 TYPE        STRING
* | [--->] IT_MESSAGES                    TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ADD_MESSAGES.
** Description of iv_action_name
*  this is the name of the action in case of execute_action in other cases it is as follows:
*  Method   -> Value of the parameter
*  Retrieve -> $RETRIEVE
*  Modify   -> $MODIFY
*  Query    -> $QUERY
*  Check    -> $CHECK
*  Check_and_determine -> $CHECK_AND_DETERMINE

** Original implementation is retained
  mo_message_manager->add_messages( it_messages = it_messages ).

*** Sample code for message mapping to ECO.
*
*  field-symbols <fs_message> like line of it_messages.
*  data ls_message_copy like <fs_message>.
*  data ls_origin_location type CM_ESI_ROOT=>ty_message_location.
*  data lt_env_locations   type CM_ESI_ROOT=>TT_MESSAGE_LOCATIONS.
*
*
*  loop at it_messages assigning <fs_message>.
*    if <fs_message>->lifetime eq cm_esi_root=>co_lifetime_transition.
*      ls_origin_location = <fs_message>->origin_location.
*      if ls_origin_location-bo_name = mv_bo_proxy_name and
*         ( ls_origin_location-bo_node_name = mv_node_proxy_name or
*           ls_origin_location-bo_node_name is initial ).
*
*        lt_env_locations = <fs_message>->environment_locations.
*        append ls_origin_location to lt_env_locations.
*
*        ls_origin_location-bo_name = mv_own_bo_proxy_name.
*        ls_origin_location-bo_node_name = iv_bo_node_name.
*        clear ls_origin_location-attributes.
*
***      CAUTION: If a message parameter maps to location attribute, an attribute has
***      to be specified in the new message as well. This attribute should have a
***      UI text associated with it. The message on the screen will have the UI text
***      replaced for the parameter.
*
***       Check and add the attributes are mapped
***       declare and fill a global attribute  gt_mapped_attributes  with mapped attributes.
**        loop at <fs_message>->origin_location-attributes into lv_attribute.
**          read table gt_mapped_attributes with key lv_attribute.
**          check sy-subrc eq 0.
**          append lv_attribute to ls_origin_location-attributes.
**        endloop.
*
*        ls_message_copy = <fs_message>->copy_with_new_location(
*                                  new_origin_location = ls_origin_location
*                                  new_environment_locations = lt_env_locations
*                                  ).
*        try.
*          io_message_handler->add_message( ls_message_copy ).
*          catch cx_esf_message_handler.
*            mo_message_manager->add_message( io_message    = <fs_message> ).
*        endtry.
*      else.
*        mo_message_manager->add_message( io_message    = <fs_message> ).
*      endif.
*    else.
*      mo_message_manager->add_message( io_message    = <fs_message> ).
*    endif.
*  endloop.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->DO_MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IS_MODIFICATION                TYPE        IF_ESF_PROVIDER_ACCESS=>TY_MODIFICATIONS
* | [!CX!] CX_ESF_CHANGE_HANDLER
* | [!CX!] CX_ESF_CORE_SERVICE
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DO_MODIFY.
  data:
        lt_core_modifications type if_esf_provider_access=>tt_modifications,
        ls_core_modification like line of lt_core_modifications,
        ls_change_notifications type IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS,
        lt_messages type if_esf_lcp=>ty_message_list,
        ls_delete_notification type if_esf_types=>ty_delete_notification,
        lv_core_bo_name type string,
        lv_core_bo_node_name type string,
        lo_core_bo_lcp type REF TO if_esf_lcp.

  refresh lt_core_modifications.
*      if is_modification-bo_node_name =    " Node name to be decided
  CALL METHOD get_core_bo_node_name
    EXPORTING
      iv_bo_node_name = is_modification-bo_node_name
    IMPORTING
      ev_bo_name      = lv_core_bo_name
      ev_bo_node_name = lv_core_bo_node_name.

  if lv_core_bo_name is initial or lv_core_bo_node_name is initial.
    RAISE EXCEPTION type cx_fatal_exception.
  endif.

  lo_core_bo_lcp = mo_lcp_facade->get_lcp( in_bo_name = lv_core_bo_name ).
  case is_modification-change_mode.
    when if_esf_types=>co_change_mode_delete.

      clear ls_core_modification.
      ls_core_modification-bo_node_name = lv_core_bo_node_name.
      ls_core_modification-change_mode = if_esf_types=>co_change_mode_delete.
      ls_core_modification-node_id = is_modification-node_id.

      append ls_core_modification to lt_core_modifications.

    when others.

  endcase.

  check lt_core_modifications is not initial.
  CALL METHOD lo_core_bo_lcp->modify
    EXPORTING
      in_modifications         = lt_core_modifications
    IMPORTING
      out_change_notifications = ls_change_notifications
      out_messages             = lt_messages.
*  CALL METHOD mo_message_manager->add_messages
*    EXPORTING
*      it_messages = lt_messages.
  CALL METHOD add_messages
    EXPORTING
      IV_BO_NODE_NAME = is_modification-bo_node_name
      IV_ACTION_NAME = '$MODIFY'
      IO_MESSAGE_HANDLER = IO_MESSAGE_HANDLER
      it_messages = lt_messages.

  loop at ls_change_notifications-delete_notifications into ls_delete_notification
    where bo_name = lv_core_bo_name and bo_node_name = lv_core_bo_node_name. "#EC CI_STDSEQ
      CALL METHOD io_change_handler->notify_delete
        EXPORTING
          in_bo_node_name = is_modification-bo_node_name
          in_bo_node_id   = ls_delete_notification-node_id.
  endloop.


endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->FILL_AUTHORIZATION_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_NODE_NAME                   TYPE        STRING
* | [--->] IV_QUERY_NAME                  TYPE        STRING
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<---] ES_AUTHORIZATION_CONTEXT       TYPE        IF_ESF_TYPES=>TY_AUTHORIZATION_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FILL_AUTHORIZATION_CONTEXT.
* WIth Lean Stack IAM Application Development Guideline
* Section 5 - Call to restrictions API is not to be done
* So calls to this method is illegal.
* See https://wiki.wdf.sap.corp/x/GwiSHQ for task list adoption
* guidelines
  raise exception type cx_fatal_exception.

*  data: cx type ref to cx_root.
*  clear es_authorization_context.
*  if iv_query_name = gv_query_task_view .
*    TRY.
*    CALL METHOD CL_RBAM_RESTRICTIONS_API=>GET_RESTRICTIONS_ESF
*      EXPORTING
*        IF_BO_NAME            = if_task=>co_bo_name
*        IF_BO_NODE_NAME       = if_task=>co_bo_node-root
*        IS_OPERATION          = IF_RBAM_ESF_CONSTANTS=>CO_OPERATION_PATTERN_RETRIEVE
*        IF_USER               = SY-UNAME
**        IF_ACCESS_CONTEXT     =
*      IMPORTING
*        EF_GRANT_RULE_FOUND   = es_authorization_context-grant_rule_found
*        ET_GRANT_RESTRICTIONS = es_authorization_context-grant_restrictions
*        EF_DENY_RULE_FOUND    = es_authorization_context-deny_rule_found
*        ET_DENY_RESTRICTIONS  = es_authorization_context-deny_restrictions
*        .
*        es_authorization_context-is_filled = abap_true.
*     CATCH CX_RBAM_RESTRICTIONS into cx.
*       raise exception type cx_fatal_exception exporting previous = cx.
*    ENDTRY.
*  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->GET_ASSOC_BO_NODE_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_ASSOCIATION_NAME            TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_ASSOC_BO_NODE_NAME.
    data:
        ex type ref to cx_root,
        lo_this_bo_descriptor type ref to if_esf_bo_desc,
        lo_bo_node_descriptor type ref to if_esf_bo_node_desc,
        lo_association_descriptor type ref to if_esf_association_desc.

  try.
      lo_this_bo_descriptor = mo_lcp_facade->get_bo_descriptor( in_bo_proxy_name = mv_bo_name ).
      lo_bo_node_descriptor = lo_this_bo_descriptor->get_bo_node_descriptor( bo_node_proxy_name = iv_bo_node_name ).
      lo_association_descriptor = lo_bo_node_descriptor->get_association_descriptor( association_proxy_name = iv_association_name ).
    catch cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
    catch cx_esf_metadata_error into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
  endtry.

* Find the assocaited BO name
  if lo_association_descriptor is not initial.
    ev_bo_name = lo_association_descriptor->get_target_bo_proxy_name( ).
    ev_bo_node_name = lo_association_descriptor->get_target_bo_node_proxy_name( ).
  else.
*   raise exception if the association could not be found.
    raise exception type cx_fatal_exception.
  endif.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->GET_CORE_BO_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IS_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<---] ERT_CORE_BO_DATA               TYPE REF TO DATA
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_CORE_BO_DATA.
  data: ex type ref to cx_root.
  data: lo_lcp_bo type ref to if_esf_lcp,
        lrt_core_data type ref to data,
        lv_core_bo_name type string,
*        lv_bo_node_name type string VALUE 'ROOT',
        lv_core_bo_node_name type string,
        lt_messages type if_esf_types=>ty_messages.
  field-symbols : <ft_core_data> type index table.

  try.
*     retrieve Core BO
      call method GET_CORE_BO_NODE_NAME
        EXPORTING
          iv_bo_node_name = iv_bo_node_name
        IMPORTING
          ev_bo_name      = lv_core_bo_name
          ev_bo_node_name = lv_core_bo_node_name.

      lrt_core_data = mo_lcp_facade->get_bo_node_table_container(
        in_bo_name = lv_core_bo_name
        in_bo_node_name = lv_core_bo_node_name
        ).

      assign lrt_core_data->* to <ft_core_data>.

      lo_lcp_bo = mo_lcp_facade->get_lcp( in_bo_name = lv_core_bo_name ).

      call method lo_lcp_bo->retrieve
        EXPORTING
          in_bo_node_name    = lv_core_bo_node_name
          in_node_ids        = iv_node_ids
          in_edit_mode       = if_esf_types=>co_read_only
          in_requested_image = is_requested_image
        IMPORTING
          out_messages       = lt_messages
          out_data           = <ft_core_data>.
*      mo_message_manager->add_messages( lt_messages ).
        CALL METHOD add_messages
          EXPORTING
            IV_BO_NODE_NAME = Iv_BO_NODE_NAME
            IV_ACTION_NAME = '$RETRIEVE'
            IO_MESSAGE_HANDLER = IO_MESSAGE_HANDLER
            it_messages = lt_messages.
    catch cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
  endtry.

  ert_core_bo_data = lrt_core_data.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method CL_COUTL_TASK_OWL_SP->GET_CORE_BO_NODE_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_CORE_BO_NODE_NAME.
* Find the name of the core BO
* here the association name is assumed and the target is looked up from metadata
  call method get_assoc_bo_node_name
    exporting
      iv_bo_node_name     = iv_bo_node_name
      iv_association_name = gv_assoc_to_core_bo_node
    importing
      ev_bo_name          = ev_bo_name
      ev_bo_node_name     = ev_bo_node_name.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->GET_REF_BO_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IS_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE
* | [--->] IO_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<---] ERT_REF_BO_DATA                TYPE REF TO DATA
* | [<---] ET_LINK                        TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_REF_BO_DATA.
  data: ex type ref to cx_root.
  data: lo_lcp_bo type ref to if_esf_lcp,
        lt_node_ids type sesf_bo_node_id_tab,
        lrt_core_data type ref to data,
        lv_ref_bo_name type string,
        lv_ref_bo_node_name type string,
        ls_link type sesf_association_link,
        lt_messages type if_esf_types=>ty_messages.
  field-symbols : <ft_core_data> type index table.

  try.
*     retrieve ref BO
      call method IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
        EXPORTING
          in_bo_name          = mv_bo_name
          in_bo_node_name     = iv_bo_node_name
          in_association_name = gv_assoc_to_ref_bo_node
          in_node_ids         = iv_node_ids
          in_fill_data        = abap_false
          in_edit_mode        = if_esf_types=>co_read_only
          in_message_handler  = io_message_handler
        IMPORTING
          out_links           = et_link.

      loop at et_link into ls_link.
        append ls_link-target_node_id to lt_node_ids.
      endloop.
      sort lt_node_ids.
      delete adjacent duplicates from lt_node_ids.

*     retrieve ref BO
      call method GET_REF_BO_NODE_NAME
        EXPORTING
          iv_bo_node_name = iv_bo_node_name
        IMPORTING
          ev_bo_name      = lv_ref_bo_name
          ev_bo_node_name = lv_ref_bo_node_name.

      lrt_core_data = mo_lcp_facade->get_bo_node_table_container(
        in_bo_name = lv_ref_bo_name
        in_bo_node_name = lv_ref_bo_node_name
        ).

      assign lrt_core_data->* to <ft_core_data>.

      lo_lcp_bo = mo_lcp_facade->get_lcp( in_bo_name = lv_ref_bo_name ).

      call method lo_lcp_bo->retrieve
        EXPORTING
          in_bo_node_name    = lv_ref_bo_node_name
          in_node_ids        = lt_node_ids
          in_edit_mode       = if_esf_types=>co_read_only
          in_requested_image = is_requested_image
        IMPORTING
          out_messages       = lt_messages
          out_data           = <ft_core_data>.
*      mo_message_manager->add_messages( lt_messages ).
      CALL METHOD add_messages
        EXPORTING
          IV_BO_NODE_NAME = GV_BO_NODE_ROOT
          IV_ACTION_NAME = '$RETRIEVE'
          IO_MESSAGE_HANDLER = IO_MESSAGE_HANDLER
          it_messages = lt_messages.
    catch cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
  endtry.

  ert_ref_bo_data = lrt_core_data.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->GET_REF_BO_NODE_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [<---] EV_BO_NAME                     TYPE        STRING
* | [<---] EV_BO_NODE_NAME                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_REF_BO_NODE_NAME.
* Find the name of the reference BO
* here the association name is assumed and the target is looked up from metadata
  call method get_assoc_bo_node_name
    exporting
      iv_bo_node_name     = iv_bo_node_name
      iv_association_name = gv_assoc_to_ref_bo_node
    importing
      ev_bo_name          = ev_bo_name
      ev_bo_node_name     = ev_bo_node_name.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~CHECK. "#EC NEEDED

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~CHECK_AND_DETERMINE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_CHECK_SCOPE                 TYPE        IF_ESF_TYPES=>TY_CHECK_SCOPE
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~CHECK_AND_DETERMINE. "#EC NEEDED


endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~CONVERT_KEYS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_SOURCE_KEY_NAME             TYPE        STRING
* | [--->] IN_TARGET_KEY_NAME             TYPE        STRING
* | [--->] IN_SOURCE_KEYS                 TYPE        INDEX TABLE
* | [<---] OUT_TARGET_KEYS                TYPE        INDEX TABLE
* | [<---] OUT_FAILED                     TYPE        SESF_BOOLEAN_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~CONVERT_KEYS. "#EC NEEDED
* no keys for nodes for OWL.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~CONVERT_KEY_TO_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_KEY_NAME                    TYPE        STRING
* | [--->] IN_KEYS                        TYPE        INDEX TABLE
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_KEY_MAPPING                TYPE        SESF_ACCESS_KEY_MAPPING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~CONVERT_KEY_TO_NODE_ID. "#EC NEEDED
* no keys for nodes for OWL.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~MODIFY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* | [<-->] IN_MODIFICATIONS               TYPE        TT_MODIFICATIONS
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~MODIFY.
  data ex type ref to cx_root.
  field-symbols <fs_modification> like line of in_modifications.

  loop at in_modifications assigning <fs_modification>.
    try.
        call method do_modify
          exporting
            io_change_handler  = in_change_handler
            io_message_handler = in_message_handler
            is_modification    = <fs_modification>.
      catch cx_esf_change_handler cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
    endtry.
  endloop.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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
method IF_ESF_PROVIDER_ACCESS~RETRIEVE.

  data : lt_messages type IF_ESF_TYPES=>TY_MESSAGES.
  data : ex type ref to cx_root.
  data : lt_links type sesf_association_link_tab.
  data : ls_link type sesf_association_link.
  data : lt_task_data type if_task=>tt_root.
  data : lv_node_id like line of in_node_ids.
  data : lrs_out_data type ref to data.
  data : lrt_core_data type ref to data.
  data : lv_count type i.

****For Action Properties
data : lt_action_properties type IF_ESF_TYPES=>TT_ACTION_PROPERTIES,
       ls_action_property type IF_ESF_TYPES=>TY_ACTION_PROPERTY,
       ls_property_scope type IF_ESF_TYPES=>TY_PROPERTY_SCOPE,
       lt_requested_actions TYPE sesf_string_tab,
       ls_requested_action LIKE LINE OF lt_requested_actions,
       ls_out_properties type if_esf_types=>ty_properties.
****End

  field-symbols : <fs_core_data> type any.
  field-symbols : <ft_core_data> type index table.
  field-symbols : <fs_task_data> type if_task=>ty_root.
  field-symbols : <fs_out_data> type any.

  field-symbols : <fv_node_id> type sesf_bo_node_id .
  field-symbols : <fv_parent_node_id> type sesf_bo_node_id .
  field-symbols : <fs_task_field> type coutl_task_owlview_elements .
  field-symbols : <fs_isreplicated> type any.

  create data lrs_out_data like line of out_data.
  assign lrs_out_data->* to <fs_out_data>.

  assign component gv_node_id of structure <fs_out_data> to <fv_node_id>.
  assign component gv_parent_node_id of structure <fs_out_data> to <fv_parent_node_id>.
  assign component gv_task_field of structure <fs_out_data> to <fs_task_field>.

  case in_bo_node_name .
    when gv_bo_node_root .
*     Dummy implementation
      loop at in_node_ids into lv_node_id .
        <fv_node_id> = lv_node_id.
        append <fs_out_data> to out_data.
      endloop .

    when others.
      if <fs_task_field> is assigned.
        insert in_bo_node_name into table MT_TASK_VIEW_NODE_LIST.
*     This is the case of nodes for task based views
        try.
*         retrieve task root
            call method mo_task_lcp->retrieve
              EXPORTING
                in_bo_node_name     = if_task=>co_bo_node-root
                in_node_ids         = in_node_ids
                in_edit_mode        = if_esf_types=>co_read_only
                in_requested_image  = in_requested_image
              IMPORTING
                out_messages        = lt_messages
                out_failed_node_ids = out_failed_node_ids
                out_data            = lt_task_data.
*            mo_message_manager->add_messages( lt_messages ).
            CALL METHOD add_messages
              EXPORTING
                IV_BO_NODE_NAME = IN_BO_NODE_NAME
                IV_ACTION_NAME = '$RETRIEVE'
                IO_MESSAGE_HANDLER = In_MESSAGE_HANDLER
                it_messages = lt_messages.

            sort lt_task_data by node_id.
          catch cx_esf_core_service into ex.
            raise exception type cx_fatal_exception exporting previous = ex.
        endtry.

****Retrieve action properties
         ls_requested_action = IF_TASK=>CO_ACTION-ROOT-FORWARD.
          APPEND ls_requested_action to lt_requested_actions.

          ls_requested_action = IF_TASK=>CO_ACTION-ROOT-ESCALATE.
          APPEND ls_requested_action to lt_requested_actions.

          ls_property_scope-requested_actions = lt_requested_actions.


          TRY.
              CALL METHOD mo_task_lcp->RETRIEVE_PROPERTIES
                EXPORTING
                  IN_BO_NODE_NAME   = if_task=>co_bo_node-root
                  IN_NODE_IDS       = in_node_ids
                  IN_PROPERTY_SCOPE = ls_property_scope
                IMPORTING
                  OUT_PROPERTIES    = ls_out_properties.
            CATCH CX_ESF_CORE_SERVICE into ex.
              raise exception type cx_fatal_exception exporting previous = ex.
          ENDTRY.

         lt_action_properties = ls_out_properties-action_properties.

         sort lt_action_properties by node_id.

        lv_count = 0.
        do.
          assign component sy-index of structure <fs_out_data> to <fs_isreplicated>.
          if sy-subrc ne 0.
            exit.
          endif.

          if <fs_isreplicated> is assigned.
            lv_count = lv_count + 1.
          endif.
        enddo.

****End of action properties code
*     retrieve ref bo data only in case we have replicated IDs, how to find this?
        if lv_count > 4.
          call method get_ref_bo_data
            EXPORTING
              iv_bo_node_name    = in_bo_node_name
              iv_node_ids        = in_node_ids
              is_requested_image = in_requested_image
              io_message_handler = in_message_handler
            IMPORTING
              et_link            = lt_links
              ert_ref_bo_data    = lrt_core_data.
          assign lrt_core_data->* to <ft_core_data>.

          sort lt_links by source_node_id.
          sort <ft_core_data> by (gv_node_id).
        endif.

        loop at lt_task_data assigning <fs_task_data> .         "#EC CI_STDSEQ
          <fs_task_field>-FORWARD_ENABLED_INDICATOR = 'X'.
          <fs_task_field>-escalation_enabled_indicator = 'X'.

          if <ft_core_data> is assigned.
*           in this case, we need to fill the ID fields of the BO

*           read the link table to get the node_id of the ref BO
            read table lt_links with key source_node_id = <fs_task_data>-node_id
              into ls_link binary search.                                           "#EC CI_STDSEQ

*           read the corresponding ref BO Node data
            if sy-subrc = 0.
              read table <ft_core_data> with key (gv_node_id) = ls_link-target_node_id
                assigning <fs_core_data> binary search.
              if sy-subrc = 0.
*               this needs to me made more efficient
                move-corresponding <fs_core_data> to <fs_out_data>.
              endif.
            endif.
          endif.

          <fv_node_id> = <fs_task_data>-node_id.
          <fv_parent_node_id> = <fv_node_id>.             "#EC CI_STDSEQ

*         update the task related fields
          <fs_task_field>-uuid = <fs_task_data>-uuid.
          case <fs_task_data>-status-life_cycle_status_code.
            when 'W'  OR 'R' OR 'P'.
              <fs_task_field>-life_cycle_status_code = 1.
            when 'S'.
              <fs_task_field>-life_cycle_status_code = 2.
            when 'C' OR 'X'.
              <fs_task_field>-life_cycle_status_code = 3.
            when OTHERS.
              <fs_task_field>-life_cycle_status_code = 0.
          endcase.

          <fs_task_field>-icon_id = 'TaskMessage'.
******Code for getting the Action indicators


          loop at lt_action_properties into ls_action_property where node_id = <fs_task_data>-node_id. "#EC CI_STDSEQ


                if ls_action_property-ACTION_NAME = IF_TASK=>CO_ACTION-ROOT-FORWARD.
                  check  ls_action_property-property_value is initial.
                  <fs_task_field>-FORWARD_ENABLED_INDICATOR = ' '.

                elseif ls_action_property-ACTION_NAME = IF_TASK=>CO_ACTION-ROOT-ESCALATE.
                  check  ls_action_property-property_value is initial.
                  <fs_task_field>-escalation_enabled_indicator = ' '.
                endif.

          endloop.


          append <fs_out_data> to out_data.
        endloop .
      else.
*     this is the case for non Task Views

*       retrieve ref bo data only in case we have replicated IDs, how to find this?
*        if abap_true = abap_true.
          call method get_core_bo_data
            EXPORTING
              iv_bo_node_name    = in_bo_node_name
              iv_node_ids        = in_node_ids
              is_requested_image = in_requested_image
              io_message_handler = in_message_handler
            IMPORTING
              ert_core_bo_data   = lrt_core_data.
          assign lrt_core_data->* to <ft_core_data>.
*        endif.

        loop at <ft_core_data> assigning <fs_core_data> .
*          this needs to me made more efficient
          move-corresponding <fs_core_data> to <fs_out_data>.
          <fv_parent_node_id> = <fv_node_id>.
          append <fs_out_data> to out_data.
        endloop .

      endif.
  endcase .

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION
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
METHOD IF_ESF_PROVIDER_ACCESS~RETRIEVE_BY_ASSOCIATION.

  DATA: ex type ref to cx_root,
        lv_node_id LIKE LINE OF in_node_ids,
        ls_link LIKE LINE OF out_links.

  field-symbols:
    <lv_ref_bo_node_data> type if_task=>ty_business_obj_reference
  .

  DATA:
     lv_link LIKE LINE OF out_links
    ,lv_link2 LIKE LINE OF out_links
    ,lt_ref_bo_node_data TYPE if_task=>tt_business_obj_reference
    ,lt_links LIKE out_links .

* no asssocaiations from root are supported.
* if the call reaches here it is assumed that the node is for a task view
  if in_bo_name <> gv_bo_node_root.
    CASE in_association_name .

      WHEN gv_assoc_to_task.
*     Task has the same node id as the QRN
        LOOP AT in_node_ids INTO lv_node_id.
          ls_link-source_node_id = lv_node_id.
          ls_link-target_node_id = lv_node_id.
          APPEND ls_link TO out_links.
        ENDLOOP.

      WHEN GV_ASSOC_TO_CORE_BO_NODE.
*     No task case. simple Delegation needed
        LOOP AT in_node_ids INTO lv_node_id.
          ls_link-source_node_id = lv_node_id.
          ls_link-target_node_id = lv_node_id.
          APPEND ls_link TO out_links.
        ENDLOOP.

      WHEN gv_assoc_to_ref_bo_node.
*     We should try to do this using foreign node id association
*        Here we, use data from task to get the reference bo node
        TRY.
            CALL METHOD mo_task_lcp->retrieve_by_association
              EXPORTING
                in_bo_node_name     = if_task=>co_bo_node-root
                in_association_name = if_task=>co_assoc-root-business_obj_reference
                in_node_ids         = in_node_ids
                in_fill_data        = abap_true
              IMPORTING
                out_links           = lt_links
                out_data            = lt_ref_bo_node_data.
          catch cx_esf_core_service into ex.
            raise exception type cx_fatal_exception exporting previous = ex.
        endtry.
        sort lt_ref_bo_node_data by node_id.
        LOOP AT lt_links INTO lv_link.
          READ TABLE lt_ref_bo_node_data ASSIGNING <lv_ref_bo_node_data>
              with key node_id = lv_link-target_node_id binary search.
          lv_link2-source_node_id = lv_link-source_node_id.
          lv_link2-target_node_id = <lv_ref_bo_node_data>-OBJECT_NODE_TECHNICAL_REFERENC-OBJECT_NODE_TECHNICAL_ID.
          APPEND lv_link2 TO out_links.
        ENDLOOP.
    ENDCASE .
  endif.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE_DEFAULT_NODE_VALUES
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
method IF_ESF_PROVIDER_ACCESS~RETRIEVE_DEFAULT_NODE_VALUES. "#EC NEEDED
* not required as modify and so create is not supported.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IN_PROPERTY_SCOPE              TYPE        IF_ESF_TYPES=>TY_PROPERTY_SCOPE (default =IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES.          "#EC NEEDED
*  data : ex type ref to cx_root.
*
*  TRY.
*      CALL METHOD mo_task_lcp->RETRIEVE_PROPERTIES
*        EXPORTING
*          IN_BO_NODE_NAME   = if_task=>co_bo_node-root
*          IN_NODE_IDS       = in_node_ids
*          IN_PROPERTY_SCOPE = IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT
*        IMPORTING
*          OUT_PROPERTIES    = out_properties.
*    CATCH CX_ESF_CORE_SERVICE into ex.
*      raise exception type cx_fatal_exception exporting previous = ex.
*  ENDTRY.


endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_REQUESTED_IMAGE             TYPE        IF_ESF_TYPES=>TY_IMAGE (default =IF_ESF_TYPES=>CO_IMAGE_TRANSACTIONAL_BUFFER)
* | [<---] OUT_LINKS                      TYPE        SESF_ASSOCIATION_LINK_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~RETRIEVE_ROOT_NODE_ID.  "#EC NEEDED

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ACTION_PARAMETERS           TYPE        ANY
* | [--->] IN_REFERENCING_NODE_ELEMENTS   TYPE        SESF_BO_NODE_REFERENCE_T(optional)
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* | [--->] IN_MESSAGE_HANDLER             TYPE REF TO IF_ESF_MESSAGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACTION~EXECUTE_ACTION. "#EC NEEDED
*  No actions are provided on the nodes
*  the commented lines are for the QRN case
******************************************



*  data: lo_exception type ref to cx_root.
*  data: lo_lcp type ref to if_esf_lcp.
*  data: lv_node type string.
*  data: lv_action_name type string.
*  data: lt_messages type if_esf_lcp=>ty_message_list.
*  data: ls_change_notification type if_esf_lcp=>ty_change_notifications.
*  data: lt_node_ids like in_node_ids.
*
*
** delegate to the appropriate service provider
*  case in_action_name.
*    when if_task=>co_action-root-complete.
*    when if_task=>co_action-root-change_priority.
*      lo_lcp  = mo_task_lcp.
*      lv_node = if_task=>co_bo_node-root.
*      lt_node_ids = in_node_ids[].
*      lv_action_name = in_action_name.
*    when others. " delegate to the reference BO Node
**   not delegated now
*  endcase.
*
*
*  check lo_lcp is bound.
*  check lv_node is not initial.
*  check lv_action_name is not initial.
*  check lt_node_ids is not initial.
*
** retrieve exclusively
**    TODO
*
** delegate the action
*  try.
*      call method lo_lcp->execute_action
*        EXPORTING
*          in_bo_node_name              = lv_node
*          in_action_name               = lv_action_name
*          in_node_ids                  = lt_node_ids
*          in_action_parameters         = in_action_parameters
*          in_referencing_node_elements = in_referencing_node_elements
*        IMPORTING
*          out_change_notifications     = ls_change_notification
*          out_messages                 = lt_messages.
*      call method mo_message_manager->add_messages
*        EXPORTING
*          it_messages = lt_messages.
*    catch cx_esf_core_service into lo_exception.
*      raise exception type cx_fatal_exception exporting previous = lo_exception.
*  endtry.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [<---] OUT_ACTION_PARAMETERS          TYPE        ANY
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACTION~RETRIEVE_DEFAULT_ACTION_PARAM. "#EC NEEDED
* delegate the calls to the appropriate provider
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_INIT~INIT.
  data: ex type ref to cx_root.
  super->if_esf_provider_init~init(
    EXPORTING
      in_provider_context         = in_provider_context
      in_bo_name                  = in_bo_name
    CHANGING
      inout_preferred_trx_pattern = inout_preferred_trx_pattern
  ).

  mo_lcp_facade = IN_PROVIDER_CONTEXT->GET_LCP_FACADE( ).
  try.
      mo_task_lcp = mo_lcp_facade->get_lcp( in_bo_name = IF_TASK=>CO_BO_NAME ).
    catch cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
  endtry.

  mv_bo_name = in_bo_name.

  try.
      call method in_provider_context->register_on_bo_changes( in_publisher_bo_name = IF_TASK=>CO_BO_NAME ).

    catch cx_esf_core_service into ex.
      raise exception type cx_fatal_exception exporting previous = ex.
  endtry.

  create object mo_fsi_provider.
  mo_fsi_provider->if_esf_provider_init~init(
    EXPORTING
      in_provider_context         = in_provider_context
      in_bo_name                  = in_bo_name
    CHANGING
      inout_preferred_trx_pattern = inout_preferred_trx_pattern
  ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_QUERY~QUERY
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
method IF_ESF_PROVIDER_QUERY~QUERY.
  data: ex type ref to cx_root.
  data: lo_lcp_bo type ref to if_esf_lcp,
        lrt_core_data type ref to data,
        lv_core_bo_name type string,
        lv_core_bo_node_name type string,
        lt_messages type if_esf_types=>ty_messages.
  data: lt_selection_parameters like in_selection_parameters.
  data: ls_authorization_context like in_authorization_context.
  field-symbols : <ft_core_data> type index table.

*  FP 2.5
*  With Lean Stack IAM Application Development Guideline
*  Section 5 - Calls To Restriction API is not to be
*  made. ACL Ref assocaition to Task is to be added
*  in modeling.
*  See https://wiki.wdf.sap.corp/x/GwiSHQ
**   Provide a way to modify authorization_context
*  CALL METHOD fill_authorization_context
*    EXPORTING
*      iv_node_name           = in_bo_node_name
*      iv_query_name             = in_query_name
*    IMPORTING
*      es_authorization_context  = ls_authorization_context.
  ls_authorization_context = in_authorization_context.

  case in_query_name.
    when gv_query_task_view.
*   these should be FSI based
      call method mo_fsi_provider->if_esf_provider_query~query
        EXPORTING
          in_bo_node_name         = in_bo_node_name
          in_query_name           = in_query_name
          in_selection_parameters = in_selection_parameters
          in_query_options        = in_query_options
          in_authorization_context = ls_authorization_context
          in_message_handler      = in_message_handler
          in_fill_data            = abap_false
          in_filter_node_ids      = in_filter_node_ids
        IMPORTING
          out_node_ids            = out_node_ids
          out_query_info          = out_query_info
          out_data                = out_data.

      if in_fill_data = abap_true.
        call method me->if_esf_provider_access~retrieve
          EXPORTING
            in_bo_node_name = in_bo_node_name
            in_node_ids     = out_node_ids
            in_message_handler = in_message_handler
            in_edit_mode = if_esf_types=>co_read_only
          IMPORTING
            out_data        = out_data.
      endif.
    when others.
*   these should be delegated to core BO.
      try.
*     retrieve Core BO
          call method get_core_bo_node_name
            EXPORTING
              iv_bo_node_name = in_bo_node_name
            IMPORTING
              ev_bo_name      = lv_core_bo_name
              ev_bo_node_name = lv_core_bo_node_name.

          lrt_core_data = mo_lcp_facade->get_bo_node_table_container(
            in_bo_name = lv_core_bo_name
            in_bo_node_name = lv_core_bo_node_name
            ).

          assign lrt_core_data->* to <ft_core_data>.

          lo_lcp_bo = mo_lcp_facade->get_lcp( in_bo_name = lv_core_bo_name ).

          call method map_selection_parameters
            EXPORTING
              iv_bo_node_name         = in_bo_node_name
              iv_query_name           = in_query_name
              it_selection_parameters = in_selection_parameters
            IMPORTING
              et_selection_parameters = lt_selection_parameters.

          call method lo_lcp_bo->query
            EXPORTING
              in_bo_node_name         = lv_core_bo_node_name
              in_query_name           = in_query_name
              in_filter_node_ids      = in_filter_node_ids
              in_query_options        = in_query_options
              in_authorization_context = in_authorization_context
              in_selection_parameters = lt_selection_parameters
              in_fill_data            = in_fill_data
            IMPORTING
              out_query_info          = out_query_info
              out_node_ids            = out_node_ids
              out_data                = <ft_core_data>
              out_messages            = lt_messages.
*          mo_message_manager->add_messages( lt_messages ).
            CALL METHOD add_messages
              EXPORTING
                IV_BO_NODE_NAME = IN_BO_NODE_NAME
                IV_ACTION_NAME = '$QUERY'
                IO_MESSAGE_HANDLER = In_MESSAGE_HANDLER
                it_messages = lt_messages.

          if in_fill_data = abap_true.
            data: lrs_out_data type ref to data.

            field-symbols: <fs_out_data> type any.
            field-symbols: <fs_core_data> type any.

            create data lrs_out_data like line of out_data.
            assign lrs_out_data->* to <fs_out_data>.

            loop at <ft_core_data> assigning <fs_core_data>.
              move-corresponding <fs_core_data> to <fs_out_data>.
              append <fs_out_data> to out_data.
            endloop.
          endif.
        catch cx_esf_core_service into ex.
          raise exception type cx_fatal_exception exporting previous = ex.
      endtry.
  endcase.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [<---] OUT_SELECTION_PARAMETERS       TYPE        SESF_SELECTION_PARAMETERS_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_QUERY~RETRIEVE_DEFAULT_QUERY_PARAM.
  data: ex type ref to cx_root.
  data: lo_lcp_bo type ref to if_esf_lcp,
        lv_core_bo_name type string,
        lv_core_bo_node_name type string.

  case in_query_name.
    when gv_query_task_view.
*   these should be FSI based
    when others.
*   these should be delegated to core BO.
      try.
*     retrieve Core BO
          call method get_core_bo_node_name
            EXPORTING
              iv_bo_node_name = in_bo_node_name
            IMPORTING
              ev_bo_name      = lv_core_bo_name
              ev_bo_node_name = lv_core_bo_node_name.

          lo_lcp_bo = mo_lcp_facade->get_lcp( in_bo_name = lv_core_bo_name ).

          call method lo_lcp_bo->retrieve_default_query_param
            EXPORTING
              in_bo_node_name         = lv_core_bo_node_name
              in_query_name           = in_query_name
            IMPORTING
              out_selection_parameters = out_selection_parameters.
        catch cx_esf_core_service into ex.
          raise exception type cx_fatal_exception exporting previous = ex.
      endtry.
  endcase.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_COUTL_TASK_OWL_SP->IF_ESF_PROVIDER_SUBSCRIPTION~ON_BO_CHANGED
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PUBLISHER_BO_NAME           TYPE        STRING
* | [--->] IN_BO_CHANGES                  TYPE        IF_ESF_TYPES=>TY_CHANGE_NOTIFICATIONS
* | [--->] IN_CHANGE_HANDLER              TYPE REF TO IF_ESF_CHANGE_HANDLER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_SUBSCRIPTION~ON_BO_CHANGED.
  data:
          ex type ref to cx_root,
          ls_delete_notification type  if_esf_types=>ty_delete_notification,
          ls_update_notification type  if_esf_types=>ty_update_notification,
          lv_task_view_node_name type string.

  loop at in_bo_changes-update_notifications into ls_update_notification
     where bo_name = IF_TASK=>CO_BO_NAME.                                     "#EC CI_STDSEQ
    loop at MT_TASK_VIEW_NODE_LIST into lv_task_view_node_name.
      try.
          call method in_change_handler->notify_update
            EXPORTING
              in_bo_node_name         = lv_task_view_node_name
              in_bo_node_id           = ls_update_notification-node_id
              in_attributes_changed   = abap_true
              in_properties_changed   = abap_false
              in_associations_changed = abap_false.
        catch cx_esf_core_service into ex.
          raise exception type cx_fatal_exception exporting previous = ex.
      endtry.
    endloop.
  endloop.

  loop at in_bo_changes-delete_notifications into ls_delete_notification
    where bo_name = IF_TASK=>CO_BO_NAME.                                          "#EC CI_STDSEQ
    loop at MT_TASK_VIEW_NODE_LIST into lv_task_view_node_name.
      try.
          call method in_change_handler->notify_delete
            EXPORTING
              in_bo_node_name = lv_task_view_node_name
              in_bo_node_id   = ls_delete_notification-node_id.
        catch cx_esf_core_service into ex.
          raise exception type cx_fatal_exception exporting previous = ex.
      endtry.
    endloop.
  endloop.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_COUTL_TASK_OWL_SP->MAP_SELECTION_PARAMETERS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_BO_NODE_NAME                TYPE        STRING
* | [--->] IV_QUERY_NAME                  TYPE        STRING
* | [--->] IT_SELECTION_PARAMETERS        TYPE        IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS
* | [<---] ET_SELECTION_PARAMETERS        TYPE        IF_ESF_PROVIDER_QUERY=>TT_SELECTION_PARAMETERS
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MAP_SELECTION_PARAMETERS.
  et_selection_parameters[] = it_selection_parameters[].
endmethod.
ENDCLASS.