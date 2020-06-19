class CL_MSGM_ABSTRACT_PROVIDER definition
  public
  create public .

public section.
*"* public components of class CL_MSGM_ABSTRACT_PROVIDER
*"* do not include other source files here!!!

  interfaces IF_ESF_PROVIDER_INIT .
  interfaces IF_ESF_PROVIDER_INTERACT_CTRL .
  interfaces IF_ESF_PROVIDER_TRANSACT_CTRL .
protected section.
*"* protected components of class CL_MSGM_ABSTRACT_PROVIDER
*"* do not include other source files here!!!

  data MO_MESSAGE_MANAGER type ref to IF_MSGM_MESSAGE_MANAGER .

  interface IF_MSGM_MESSAGE_MANAGER load .
  methods GET_SUB_CONTEXT
    returning
      value(EV_SUB_CONTEXT) type IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT .
private section.
*"* private components of class CL_MSGM_ABSTRACT_PROVIDER
*"* do not include other source files here!!!

  data MV_BO_NAME type STRING .
ENDCLASS.



CLASS CL_MSGM_ABSTRACT_PROVIDER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_MSGM_ABSTRACT_PROVIDER->GET_SUB_CONTEXT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] EV_SUB_CONTEXT                 TYPE        IF_MSGM_MESSAGE_MANAGER=>TY_SUB_CONTEXT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_SUB_CONTEXT.



endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_init~init.

  DATA lo_lcp_facade TYPE REF TO if_esf_lcp_facade.
  TRY.
      lo_lcp_facade = in_provider_context->get_lcp_facade( ).
    CATCH cx_esf_core_service.                          "#EC NO_HANDLER
  ENDTRY.

  CALL METHOD cl_msgm_message_manager=>get_instance
    EXPORTING
      iv_context    = in_bo_name
      ir_lcp_facade = lo_lcp_facade
    RECEIVING
      ro_instance   = mo_message_manager.

  mv_bo_name = in_bo_name.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION
* +-------------------------------------------------------------------------------------------------+
* | [--->] SESSION_HAND_OVER              TYPE        SESF_BOOLEAN(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_INTERACT_CTRL~CLOSE_SESSION.
  CALL METHOD CL_MSGM_MESSAGE_MANAGER=>CLOSE_SESSION(
    IV_SESSION_HANDOVER = SESSION_HAND_OVER
   ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_OVERRULING_CODE             TYPE        IF_ESF_TYPES=>TY_OVERRULING_CODE(optional)
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD IF_ESF_PROVIDER_INTERACT_CTRL~DO_POST_PROCESSING.
  data lv_skip_check type sesf_boolean.

  " If Overruling code = 'IN_OVS_PHASE' or 'NO_BACKEND_INTERACTION_SINCE_LAST_CALL', pass indicator for lifetime manager to skip lcp->check() calls & send buffered lifetime messages.
  if in_overruling_code is SUPPLIED.
    case in_overruling_code.
      when IF_ESF_TYPES=>CO_OC_IN_OVS_PHASE or IF_ESF_TYPES=>CO_OC_NO_INTERACTION_SINCE_LC.
        lv_skip_check = abap_true.
      when others.
        lv_skip_check = abap_false.
    endcase.
  else.
    lv_skip_check = abap_false.
  endif.

  CALL METHOD mo_message_manager->map_messages
   EXPORTING
     iv_sub_context      = GET_SUB_CONTEXT( )
     iv_skip_check       = lv_skip_check
   CHANGING
     ct_messages = inout_messages.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_INTERACT_CTRL~DO_PRE_PROCESSING
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_INTERACT_CTRL~DO_PRE_PROCESSING.
"#EC NEEDED
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CHECK_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CHECK_TRANSACTION.
"#EC NEEDED
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_CLEANUP_TRANSACTION.
"#EC NEEDED
  " this is to clear the message buffer on CLEANUP phase.
  " ref csn 0120031469 0003093276 2010
  call method mo_message_manager->clear_state.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_AFTER_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_REJECTED                    TYPE        SESF_BOOLEAN
* | [<-->] INOUT_MESSAGES                 TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_transact_ctrl~on_after_save_transaction.

  DATA: ls_orig_loc    TYPE cm_esi_root=>ty_message_location,
        lo_message     TYPE REF TO cm_esi_t100_adapter,
        ls_msg         TYPE        symsg.

  ls_orig_loc-bo_name = mv_bo_name.

  IF in_rejected = 'X'.
    ls_msg-msgno = '001'.
    ls_msg-msgty = 'E'.
  ELSE.
    ls_msg-msgno = '000'.
    ls_msg-msgty = 'S'.
  ENDIF.

  ls_msg-msgid = 'MSGM_ON_SAVE_TRANS'.

  lo_message = cm_esi_t100_adapter=>create(
      symptom               = ''
      lifetime              = cm_esi_root=>co_lifetime_transition
     origin_location       = ls_orig_loc
      symsg                 = ls_msg
    ).

  CALL METHOD mo_message_manager->add_message
    EXPORTING
      io_message     = lo_message.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CHECK_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CHECK_TRANSACTION.
"#EC NEEDED
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CLEANUP_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_CLEANUP_TRANSACTION.
"#EC NEEDED
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_MSGM_ABSTRACT_PROVIDER->IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION
* +-------------------------------------------------------------------------------------------------+
* | [<---] OUT_REJECTED                   TYPE        SESF_BOOLEAN
* | [<---] OUT_MESSAGES                   TYPE        CM_ESI_ROOT=>TT_ESI_ROOT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_TRANSACT_CTRL~ON_BEFORE_SAVE_TRANSACTION.
"#EC NEEDED
endmethod.
ENDCLASS.