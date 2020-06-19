class CL_A1FIA_ACCDOC_OWL_CO_SP definition
  public
  inheriting from CL_A1FIA_OWL_CO_GL
  create public .

public section.

  interfaces IF_A1FIA_ACCDOC_OWL_CO .
  interfaces IF_ESF_PROVIDER_VALUE_SET .

  methods IF_ESF_PROVIDER_INIT~INIT
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~QUERY
    redefinition .
  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE
    redefinition .
protected section.

  methods ENRICH_REQUESTED_ATTRIBUTES
    redefinition .
  methods ENRICH_RETRIEVED_DATA
    redefinition .
private section.

  type-pools ABAP .
  class-data SV_BASIC_SEARCH_USED type ABAP_BOOL .
  class-data ST_REL_SOURCE_DOC_ID_RANGE type A1FIAT_FORMATTED_ID_RANGE .
  class-data ST_REL_SOURCE_DOC_TYPE_RANGE type A1FIAT_OBJECT_TYPE_CODE_RANGE .
  data MO_LCP_ACCDOC type ref to IF_ESF_LCP .
  data MV_FILTER_PARAMETERS type IF_FIA_ACCOUNTING_DOCUMENT=>TY_ASSOC_P-ROOT-ITEM .
  data MT_FILTERED_ATTRIBUTES type SESF_STRING_TAB .
  class-data SV_QUERY_NUMBER_OF_NODE_IDS type INT4 .

  class-methods GET_CHOFACCT_FROM_SOB
    importing
      !IV_SETOFBKS type AP_SET_OF_BOOKS_ID
      !IO_LCP_FACADE type ref to IF_ESF_LCP_FACADE
    exporting
      !EV_CHOFACCT type FIA_CHOFACCT .
ENDCLASS.



CLASS CL_A1FIA_ACCDOC_OWL_CO_SP IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_ACCDOC_OWL_CO_SP->ENRICH_REQUESTED_ATTRIBUTES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [<-->] CT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD enrich_requested_attributes.

* call super method:
  CALL METHOD super->enrich_requested_attributes
    EXPORTING
      in_bo_node_name         = in_bo_node_name
    CHANGING
      ct_requested_attributes = ct_requested_attributes.

* make sure that all fields are filled by FSI which are required to      "FP2.5
* calculate the RelatedSourceDocumentID and -Type:                       "FP2.5
  CALL METHOD cl_a1fia_rel_src_doc_util=>adjust_requestd_qrnview_attrib  "FP2.5
    EXPORTING
      in_bo_node_name              = in_bo_node_name
      iv_basic_search_used         = sv_basic_search_used         "FP3.5, Hotfix 29146
      it_rel_source_doc_id_range   = st_rel_source_doc_id_range   "FP3.5, Hotfix 29146
      it_rel_source_doc_type_range = st_rel_source_doc_type_range "FP3.5, Hotfix 29146
    CHANGING
      ct_requested_attributes      = ct_requested_attributes.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_ACCDOC_OWL_CO_SP->ENRICH_RETRIEVED_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CO_NODE_NAME                TYPE        STRING
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<-->] IN_RETRIEVED_DATA              TYPE        INDEX TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD enrich_retrieved_data.
* -----------------------------------------------------------------------
* purpose of this method:
* Fill some additional transient fields that are not persisted in FSI:
* 1. CreatedBy
*    This is a concatenation of Name and ID
* 2. RelatedSourceDocumentID and RelatedSourceDocumentType "FP2.5
*    These are transient fields                            "FP2.5
* -----------------------------------------------------------------------

  CALL METHOD super->enrich_retrieved_data
    EXPORTING
      in_co_node_name   = in_co_node_name
    CHANGING
      in_retrieved_data = in_retrieved_data.

* 1. Fill the fields RelatedSourceDocumentID and RelatedSourceDocumentType based on
*    a) the content of the structure RelatedDocumentIdentification and
*    b) the OEO and OED Reference and
*    c) the selection criteria the user has entered for the RelatedDocumentID:
* 2. Filling CreatedBy is also done in this method:                             "FP2.5
  CALL METHOD cl_a1fia_rel_src_doc_util=>detrmne_rel_srcdoc_id_and_type
    EXPORTING
      it_related_src_doc_id_range   = st_rel_source_doc_id_range
      it_related_src_doc_type_range = st_rel_source_doc_type_range
      iv_basic_search_used          = sv_basic_search_used
      iv_fill_created_by            = abap_true             "FP2.5
    CHANGING
      ct_data                       = in_retrieved_data.

* The below is set an Indicator flag in the QRN View Node for each Acc Document instance
* This Indicator indicates whether the Acc Document has any Line Item or not.
* Based on the Indicator, in the UI we show a message (as like in the Acc Doc OIF)
* --- This might be a performance issue as we have to do RETRIVE_BY_ASSOCIATION for each of Acc Doc
*******************************************************************************************
* Due to violation over guidelines [ ENRICH_RETRIEVED_DATA should not have any LCP calls ]
* am commenting the below code .Since during group-by  this causes serious performance issue
* CSN :531619 2009 raised by Karl-Peter Nos .
* The same functionality can be handled in Visual Composer itself.
* -- SAM THAMBU, J (I055546) - Dt : 04 May 2009
*********************************************************************************************
*  loop at in_retrieved_data assigning <ls_retrieved_data>.
*    clear in_node_ids.
*    append <ls_retrieved_data>-uuid-content to in_node_ids.
*    TRY.
*        mo_lcp_accdoc->retrieve_by_association(
*             EXPORTING
*               in_bo_node_name            = if_fia_accounting_document=>co_bo_node-root                               "Core BO
*               in_association_name        = if_fia_accounting_document=>co_assoc-root-item                            "Core BO
*               in_node_ids                = in_node_ids
*               in_fill_data               = abap_false
*               in_filter_parameters       = mv_filter_parameters
*               in_filtered_attributes     = mt_filtered_attributes
*               in_edit_mode               = in_edit_mode
*               in_requested_image         = in_requested_image
*             IMPORTING
*               out_links                  = lt_out_links
*               out_messages               = lt_out_messages
*               out_failed_source_node_ids = out_failed_source_node_ids
*               out_sync_notifications     = out_sync_notifications
*           ).
*        if lt_out_links is initial .
*          <ls_retrieved_data>-empty_item_ind = abap_true.
*        else.
*          <ls_retrieved_data>-empty_item_ind = abap_false.
*        endif.
*       clear lt_out_links.
*      CATCH cx_esf_core_service INTO lx_esf_core_service.
*        RAISE EXCEPTION TYPE cx_fatal_exception
*          EXPORTING
*            previous = lx_esf_core_service.
*    ENDTRY.
*  endloop.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method CL_A1FIA_ACCDOC_OWL_CO_SP=>GET_CHOFACCT_FROM_SOB
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SETOFBKS                    TYPE        AP_SET_OF_BOOKS_ID
* | [--->] IO_LCP_FACADE                  TYPE REF TO IF_ESF_LCP_FACADE
* | [<---] EV_CHOFACCT                    TYPE        FIA_CHOFACCT
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD get_chofacct_from_sob.

  DATA:
  lo_sob_lcp             TYPE  REF TO if_esf_lcp,
  ls_sel_param           TYPE  sesf_selection_parameter,
  lt_sel_param           TYPE  TABLE OF sesf_selection_parameter,
  lt_setofbks_root_data  TYPE  if_fia_set_of_books=>tt_root,
  ls_setofbks_root_data  LIKE  LINE OF lt_setofbks_root_data,
  lx_esf_core_service    TYPE  REF TO  cx_esf_core_service.

* Find the Chart of Accounts for the entered Set Of Books since the Core Bo Query doesnt accept SOB but it accepts COA
  ls_sel_param-attribute_name = 'ID-CONTENT'.
  ls_sel_param-sign           = 'I'.
  ls_sel_param-option         = 'EQ'.
  ls_sel_param-low            = iv_setofbks.
  APPEND ls_sel_param TO lt_sel_param .

  TRY.

      lo_sob_lcp = io_lcp_facade->get_lcp( if_fia_set_of_books=>co_bo_name ).

      CALL METHOD lo_sob_lcp->query
        EXPORTING
          in_bo_node_name         = if_fia_set_of_books=>co_bo_node-root
          in_query_name           = if_fia_set_of_books=>co_query-root-by_id
          in_selection_parameters = lt_sel_param
*         in_requested_attributes =
          in_fill_data            = 'X'
        IMPORTING
          out_data                = lt_setofbks_root_data.

    CATCH cx_esf_core_service .
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_core_service.
  ENDTRY.


  READ TABLE lt_setofbks_root_data  INDEX 1  INTO  ls_setofbks_root_data.
* Retreive Chart of Accounts Data from the Query
  IF ( ls_setofbks_root_data IS NOT INITIAL ).
    ev_chofacct = ls_setofbks_root_data-chart_of_accounts_code.
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_ACCESS~RETRIEVE
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
  lt_out_data  TYPE  if_a1fia_accdoc_owl_co~tt_qrnview,
  lr_out_data  TYPE  REF TO  if_a1fia_accdoc_owl_co~tt_qrnview.

  FIELD-SYMBOLS:
  <ls_out_data>  TYPE  if_a1fia_accdoc_owl_co~ty_qrnview.

  CALL METHOD super->if_esf_provider_access~retrieve
    EXPORTING
      in_bo_node_name         = in_bo_node_name
      in_node_ids             = in_node_ids
      in_requested_image      = if_esf_types=>co_image_transactional_buffer
      in_edit_mode            = in_edit_mode
      in_requested_attributes = in_requested_attributes
      in_message_handler      = in_message_handler
      in_buffer_sync_handler  = in_buffer_sync_handler
    IMPORTING
      out_data                = out_data
      out_failed_node_ids     = out_failed_node_ids.

  IF ( sv_basic_search_used = abap_true ) AND               "FP3.0
     ( sv_query_number_of_node_ids > lines( out_data ) ).
*   Special logic for sticky notes (from FP3.0 on):
*   If the user searched for Journal Entries using the basic search (Find Form in OWL),
*   FSI does not only search in BO fields that are maintained in TA SFSG_SCOPE or
*   that are added in the FSI selection callback method GET_SEARCH_SCOPE,
*   but it searches also in the sticky notes that are attached to Journal Entries;
*   For example, if the user attached a sticky note with the text "Hello" to a
*   Journal Entry, then this Journal Entry is found if the user searches with the
*   string "Hello"!
*   Note: This search works by using a special TREX index which joins the
*   sticky notes to the BO.
*   Problem:
*   The problem is, that despite the QUERY call returns such sticky note hits,
*   but the RETRIEVE filters them out, that is, it does not return them in
*   OUT_DATA.
*   The reason for this "problem" is, that the FSI selection callback method
*   CL_A1FIA_ACCNOT_GEN_SELMAP=>MAP_INPUT adds some selection criteria in the
*   RETRIEVE. The side effect is, that the records that are found
*   due to sticky notes do not match these selection critieria and hence are not
*   returned in out_data!
*   Adding the selection criteria in CL_A1FIA_ACCNOT_GEN_SELMAP=>MAP_INPU
*   is necessary to achieve that FSI returns the "right" data record
*   for each NodeID: FSI has usually many data records buffered for each single NodeID due
*   to the outer joins in the FSI view of the Journal Entry OWL.
*   Only by filtering out the "right" data, the fields RelatedSourceDocumentID & -Type can
*   be filled correctly. See also internal CSN 0002637295 2010.
*   Solution:
*   Since FSI does this join with the sticky notes "intransparant" for the application,
*   there is no chance to implement a proper solution in AppDev:
*   When looking at a record that is returned by FSI, it cannot be determined whether it
*   was found due to sticky notes or not.

*   As a workaround, the following solution is implemented:
*   0. The QUERY method stores the number of returned NodeIDs in sv_query_number_of_node_ids
*   1. Then the RETRIEVE is called "as usual", that is, adding the mentioned additional selection criteria
*      In this case, the hits from sticky notes are not(!) returned in OUT_DATA.
*      This means: If the number of returned records in OUT_DATA is smaller then the
*      number of returned NodeIDs from the query, then this indicates that
*      some NodeIDs were found due to sticky notes (and "filtered out" by RETRIEVE);
*      In the latter case:
*   2. Call the RETRIEVE again, but making sure that the additional selection criteria are
*      not!) added by CL_A1FIA_ACCNOT_GEN_SELMAP=>MAP_INPUT method;
*      In this case, OUT_DATA contains also the hits found due to the sticky notes.
*   Finally, the additional records from the 2. RETRIEVE are merged into OUT_DATA.
*   This makes sure that for the records from 1. RETRIEVE the fields RelatedSourceDocumentID & -Type
*   are filled correctly, and the hits from sticky notes are returned also.

*   make sure that the selection parameters are not added by CL_A1FIA_ACCNOT_GEN_SELMAP=>MAP_INPUT:
    cl_a1fia_accnot_gen_selmap=>mv_skip_selparams = abap_true.

*   do the 2. RETRIEVE (without additional selection criteria):
    CALL METHOD super->if_esf_provider_access~retrieve
      EXPORTING
        in_bo_node_name         = in_bo_node_name
        in_node_ids             = in_node_ids
        in_requested_image      = if_esf_types=>co_image_transactional_buffer
        in_edit_mode            = in_edit_mode
        in_requested_attributes = in_requested_attributes
        in_message_handler      = in_message_handler
        in_buffer_sync_handler  = in_buffer_sync_handler
      IMPORTING
        out_data                = lt_out_data
        out_failed_node_ids     = out_failed_node_ids.

*   reset the flag for CL_A1FIA_ACCNOT_GEN_SELMAP=>MAP_INPUT:
    cl_a1fia_accnot_gen_selmap=>mv_skip_selparams = abap_false.

    IF ( lines( lt_out_data ) > lines( out_data ) ). "should always be true due to condition in outer IF clause
*     some records were found due to sticky notes:
*     add these records:
*     out_data is not typed; assign it to a typed table symbol to enable READ with key:
      GET REFERENCE OF  out_data  INTO  lr_out_data.

      LOOP AT  lt_out_data   ASSIGNING  <ls_out_data>.
        READ TABLE  lr_out_data->*  TRANSPORTING NO FIELDS
          WITH KEY node_id = <ls_out_data>-node_id.
        IF ( sy-subrc <> 0 ).
*         this record was found due to sticky notes:
          INSERT  <ls_out_data>  INTO TABLE out_data.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDIF. "basic search used

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_INIT~INIT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_PROVIDER_CONTEXT            TYPE REF TO IF_ESF_PROVIDER_CONTEXT
* | [--->] IN_BO_NAME                     TYPE        STRING(optional)
* | [<-->] INOUT_PREFERRED_TRX_PATTERN    TYPE        TY_TRANSACTION_PATTERN (default =IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE)
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_init~init.

  DATA:
  lo_lcp_facade        TYPE REF TO  if_esf_lcp_facade,
  lx_esf_core_service  TYPE REF TO  cx_esf_core_service.


* Check consistence
  IF ( in_provider_context IS  NOT BOUND ).
    RAISE EXCEPTION TYPE cx_fatal_exception.
  ENDIF.

  IF ( in_bo_name  IS  INITIAL ).
    RAISE EXCEPTION TYPE cx_fatal_exception.
  ENDIF.

* Call INIT method of superclass
  super->if_esf_provider_init~init(
    EXPORTING
      in_provider_context         = in_provider_context
      in_bo_name                  = in_bo_name
    CHANGING
      inout_preferred_trx_pattern = inout_preferred_trx_pattern ).



  TRY.
*     Get LCP facade
      lo_lcp_facade = in_provider_context->get_lcp_facade( ).


      IF ( lo_lcp_facade  IS  NOT BOUND ).
        RAISE EXCEPTION TYPE cx_fatal_exception.
      ENDIF.

*     Get LCP for AccountingDocument:
      CLEAR mo_lcp_accdoc.

      mo_lcp_accdoc = lo_lcp_facade->get_lcp( if_fia_accounting_document=>co_bo_name ).


      IF ( mo_lcp_accdoc  IS  NOT BOUND ).
        RAISE EXCEPTION TYPE cx_fatal_exception.
      ENDIF.

* Set the Filter for RETRIEVE_BY_ASSOCIATION of the Core BO ROOT to ITEM
      mv_filter_parameters-gl_excluded_ind = ''.
      mv_filter_parameters-clearing_items_exclude_ind = 'X'.
      mv_filter_parameters-zero_amount_items_exclude_ind = 'X'. "FP4.0
      APPEND if_fia_accounting_document=>co_assoc_p_attr-root-item-gl_excluded_ind TO mt_filtered_attributes.
      APPEND if_fia_accounting_document=>co_assoc_p_attr-root-item-clearing_items_exclude_ind TO mt_filtered_attributes.
      APPEND if_fia_accounting_document=>co_assoc_p_attr-root-item-zero_amount_items_exclude_ind TO mt_filtered_attributes. "FP4.0


    CATCH cx_esf_core_service INTO lx_esf_core_service.

*     system error:
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_core_service.

  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_QUERY~QUERY
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

* FP2.5: Sequence changed: st_rel_source_doc_... must be filled before super is called:

* the selection parameters are evaluated also in the method ENRICH_RETRIEVED_DATA,
* so store it here so that they can be evaluated:
  CALL METHOD cl_a1fia_accnot_gen_selmap=>conv_rel_doc_sel_crit_to_range
    EXPORTING
      it_selection_parameters       = in_selection_parameters        " ESI Selection Parameters
    IMPORTING
      et_related_src_doc_id_range   = st_rel_source_doc_id_range    " Range of Related Document IDs (Selection Criteria)
      et_related_src_doc_type_range = st_rel_source_doc_type_range  " Range of Object Type Codes
      ev_basic_search_used          = sv_basic_search_used.

  CALL METHOD super->if_esf_provider_query~query
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
      out_query_info           = out_query_info.

* needed by RETRIEVE method:
* to determine whether some records were found due to sticky notes;
* see comment in RETRIEVE method:
  sv_query_number_of_node_ids = lines( out_node_ids ). "FP3.0

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_ACTION_NAME                 TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<-()] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_value_set~retrieve_action_code_values. "#EC NEEDED

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_VALUE_SET
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
METHOD if_esf_provider_value_set~retrieve_action_value_set. "#EC NEEDED

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_ID                     TYPE        SESF_BO_NODE_ID
* | [--->] IN_NODE_ID_IS_HANDLE           TYPE        SESF_BOOLEAN(optional)
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<---] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_value_set~retrieve_code_values. "#EC NEEDED

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<-()] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_value_set~retrieve_query_code_values. "#EC NEEDED

  FIELD-SYMBOLS:
  <lv_set_of_books_id>  TYPE  any.

  DATA:
  lv_chart_of_accounts     TYPE  fia_chofacct,
  ls_chofact_context_param TYPE  fias_chofacct_item_code_cx_el,
  lx_esf_core_service      TYPE  REF TO  cx_esf_core_service.

* Check for consistence
  IF ( in_bo_node_name IS INITIAL ).
    RAISE EXCEPTION TYPE cx_fatal_exception.
  ENDIF.

  IF ( in_query_name IS INITIAL ).
    RAISE EXCEPTION TYPE cx_fatal_exception.
  ENDIF.

  IF ( in_attribute_name IS INITIAL ).
    RAISE EXCEPTION TYPE cx_fatal_exception.
  ENDIF.


* AccDoc nodes:
* Initialize exporting parameter
  CLEAR out_code_values[].

  TRY.

*     Field QueryByElements-OEDRef-ObjectTypeCode or OEORef-ObjectTypeCode in two BO nodes:
      IF ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-qrnview-query_by_elements-source_document_type-content ) OR
         ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-qrnview-query_by_elements-cover_source_document_type-content   ).
*       Delegate retrieval of query code values to query on AccountingDocument
        mo_lcp_accdoc->retrieve_query_code_values(
          EXPORTING
            in_bo_node_name       = if_fia_accounting_document=>co_bo_node-root
            in_query_name         = if_fia_accounting_document=>co_query-root-query_by_elements
            in_attribute_name     = if_fia_accounting_document=>co_query_p_attr-root-query_by_elements-original_entry_object_ref-object_type_code-content
            in_context_parameters = in_context_parameters
            in_context_attributes = in_context_attributes
          IMPORTING
            out_code_values       = out_code_values ).
      ENDIF.

*     Field QueryByElements-RelatedDocumentTypeCode:
      IF ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-qrnview-query_by_elements-related_source_document_type ).
*       a) The Code Values for the RelatedDocumentTypeCode shall be restricted to the values like in SourceDocumentType:
*       Delegate retrieval of query code values to query on AccountingDocument
        mo_lcp_accdoc->retrieve_query_code_values(
          EXPORTING
            in_bo_node_name       = if_fia_accounting_document=>co_bo_node-root
            in_query_name         = if_fia_accounting_document=>co_query-root-query_by_elements
            in_attribute_name     = if_fia_accounting_document=>co_query_p_attr-root-query_by_elements-original_entry_object_ref-object_type_code-content
            in_context_parameters = in_context_parameters
            in_context_attributes = in_context_attributes
          IMPORTING
            out_code_values       = out_code_values ).
*       b) and add some additional code values which can act as RelatedDocumentType but are no 'direct' SourceDocument:
*          example: PurchaseOrder, InboundDelivery,...
        CALL METHOD cl_a1fia_rel_src_doc_type_clp=>add_rel_src_doc_obj_types
          EXPORTING
            in_bo_name                   = if_a1fia_accdoc_owl_co=>co_bo_name
          CHANGING
            ct_rel_src_doc_obj_type_code = out_code_values.
      ENDIF.

*     Field QueryByElements-Journal Entry Type
      IF ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-qrnview-query_by_elements-document_type ).
*       Delegate retrieval of query code values to query on AccountingDocument
        mo_lcp_accdoc->retrieve_query_code_values(
          EXPORTING
            in_bo_node_name       = if_fia_accounting_document=>co_bo_node-root
            in_query_name         = if_fia_accounting_document=>co_query-root-query_by_elements
            in_attribute_name     = if_fia_accounting_document=>co_query_p_attr-root-query_by_elements-type_code
            in_context_parameters = in_context_parameters
            in_context_attributes = in_context_attributes
          IMPORTING
            out_code_values       = out_code_values ).
      ENDIF.



      IF ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-owlview-query_by_elements-item_chart_of_accnts_item_code-content ) OR
         ( in_attribute_name = if_a1fia_accdoc_owl_co=>co_query_p_attr-qrnview-query_by_elements-item_chart_of_accnts_item_code-content ).
*       field ChartOfAccountsItem; the problem with this field is, that in the OWL it shows an empty
*       value help if the user did not enter a ChartOfAccounts. This empty value help is a UI effect
*       of the context binding of the ListID to the ChartOfAccounts.
*       Because of this UI effect, the value help was set to dynamic; Here the retrieve is delegated
*       to the AP BO Accounting Document; in this retrieve the values are retrieved, even if the
*       LIST_ID (that is, the ChartOfAccounts) is empty:
        ASSIGN  COMPONENT 'CHART_OF_ACCOUNTS_CODE' OF  STRUCTURE in_context_parameters  TO  <lv_set_of_books_id>.

        IF ( <lv_set_of_books_id>  IS  NOT  INITIAL ).
*         in the UI, the ChartOfAccounts is not available/visible as search field, because there are already too many fields
*         in the Advanced search; So, as there is no ChartOfAccounts entered by the user, the only chance is to derive the
*         ChartOfAccounts from the SetOfBooksID. If the user did not either enter a SetOfBooks, then there is no chance to
*         derive a ChartOfAccounts; in this later case, all GLAccounts from all ChartOfAccounts will appear in the value help;
*         including duplicate entries of course;
*         the trick how to get the SetOfBooks that the user has entered (if he has), is that the field  SetOfBooksID is defined
*         in the MDRS in the query parameter "ChartOfAccountsItem" as value help context! That is, instead of the ChartOfAccounts
*         we use the SetOfBooks as value help context!

*         get the ChartOfAccounts from the SetOfBooks:
          CALL METHOD get_chofacct_from_sob
            EXPORTING
              iv_setofbks   = <lv_set_of_books_id>
              io_lcp_facade = mo_lcp_facade
            IMPORTING
              ev_chofacct   = lv_chart_of_accounts.

*         fill the context:
          ls_chofact_context_param-chart_of_accounts_code = lv_chart_of_accounts.

          mo_lcp_accdoc->retrieve_query_code_values(
            EXPORTING
              in_bo_node_name       = if_fia_accounting_document=>co_bo_node-root
              in_query_name         = if_fia_accounting_document=>co_query-root-query_by_elements
              in_attribute_name     = if_fia_accounting_document=>co_query_p_attr-root-query_by_elements-item_chart_of_accnts_item_code-content
              in_context_parameters = ls_chofact_context_param
              in_context_attributes = in_context_attributes
            IMPORTING
              out_code_values       = out_code_values ).
*       of course if the ChartOfAccounts was empty, then the result list (out_code_values) can contain
*       some ChartOfAccountItems twice or even more often; but it would not(!) be good to delete
*       the duplicates. Reason:
*       a) the duplicates can have a different text (since they belong to a different ChartOfAccounts
*       b) the LIST_ID contains the ChartOfAccounts and by chosing an entry in the UI from the
*          value help popup, the LIST_ID is also put into the query as parameter! Not only the ChartOfAccountsItem!
*          Thas is, despite the LIST_ID is not visible to the user, it influences the query result!
        ELSE.
          mo_lcp_accdoc->retrieve_query_code_values(
            EXPORTING
              in_bo_node_name       = if_fia_accounting_document=>co_bo_node-root
              in_query_name         = if_fia_accounting_document=>co_query-root-query_by_elements
              in_attribute_name     = if_fia_accounting_document=>co_query_p_attr-root-query_by_elements-item_chart_of_accnts_item_code-content
            IMPORTING
              out_code_values       = out_code_values ).
        ENDIF.
      ENDIF.

    CATCH cx_esf_core_service INTO lx_esf_core_service.

*     system error:
      RAISE EXCEPTION TYPE cx_fatal_exception
        EXPORTING
          previous = lx_esf_core_service.
  ENDTRY.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_VALUE_SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_SELECTION_PARAMETERS        TYPE        SESF_SELECTION_PARAMETERS_TAB
* | [--->] IN_QUERY_OPTIONS               TYPE        SESF_QUERY_OPTIONS(optional)
* | [--->] IN_AUTHORIZATION_CONTEXT       TYPE        TY_AUTHORIZATION_CONTEXT(optional)
* | [<-()] OUT_VALUE_SET_NODE_IDS         TYPE        SESF_BO_NODE_ID_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_value_set~retrieve_query_value_set.  "#EC NEEDED

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCDOC_OWL_CO_SP->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_VALUE_SET
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
METHOD if_esf_provider_value_set~retrieve_value_set.        "#EC NEEDED

ENDMETHOD.
ENDCLASS.