class CL_A1FIA_ACCENTREDEF_OWL_CO definition
  public
  inheriting from CL_A1FIA_OWL2_CO
  create public .

public section.
*"* public components of class CL_A1FIA_ACCENTREDEF_OWL_CO
*"* do not include other source files here!!!

  interfaces IF_A1FIA_ACCENTREDEF_OWL_CO .
  interfaces IF_ESF_PROVIDER_VALUE_SET .

  data MO_LCP type ref to IF_ESF_LCP .

  methods IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
    redefinition .
  methods IF_ESF_PROVIDER_QUERY~QUERY
    redefinition .
protected section.
*"* protected components of class CL_A1FIA_ACCENTREDEF_OWL_CO
*"* do not include other source files here!!!

  methods ENRICH_REQUESTED_ATTRIBUTES
    redefinition .
  methods ENRICH_RETRIEVED_DATA
    redefinition .
private section.
*"* private components of class CL_A1FIA_ACCENTREDEF_OWL_CO
*"* do not include other source files here!!!
ENDCLASS.



CLASS CL_A1FIA_ACCENTREDEF_OWL_CO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_ACCENTREDEF_OWL_CO->ENRICH_REQUESTED_ATTRIBUTES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [<-->] CT_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD enrich_requested_attributes.

* Created By - this is done in backend since we have sorting issues in FP25 Lists
  READ TABLE ct_requested_attributes TRANSPORTING NO FIELDS WITH KEY
   table_line = if_a1fia_accentredef_owl_co=>co_attr-qrnview-created_by_name.

  IF sy-subrc = 0.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-cr_by_bupa_formatted_name TO ct_requested_attributes.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-cr_by_user_account_id-content TO ct_requested_attributes.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-cr_by_technical_indicator TO ct_requested_attributes.
  ENDIF.
* Changed By - this is done in backend since we have sorting issues in FP25 Lists
  READ TABLE ct_requested_attributes TRANSPORTING NO FIELDS WITH KEY
  table_line = if_a1fia_accentredef_owl_co=>co_attr-qrnview-changed_by_name.

  IF sy-subrc = 0.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-ch_by_bupa_formatted_name TO ct_requested_attributes.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-ch_by_user_account_id-content TO ct_requested_attributes.
    APPEND if_a1fia_accentredef_owl_co=>co_attr-qrnview-system_administrative_data-ch_by_technical_indicator TO ct_requested_attributes.
  ENDIF.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method CL_A1FIA_ACCENTREDEF_OWL_CO->ENRICH_RETRIEVED_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_CO_NODE_NAME                TYPE        STRING
* | [--->] IN_REQUESTED_ATTRIBUTES        TYPE        SESF_STRING_TAB(optional)
* | [<-->] IN_RETRIEVED_DATA              TYPE        INDEX TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD enrich_retrieved_data.

  FIELD-SYMBOLS: <ls_qrnview> TYPE if_a1fia_accentredef_owl_co=>ty_qrnview,
                 <out_data> TYPE INDEX TABLE.

  LOOP AT in_retrieved_data ASSIGNING <ls_qrnview>.
    cl_a1fia_concatenate_user_name=>concatenate_user_name(
      EXPORTING
        iv_user_account_name        = <ls_qrnview>-system_administrative_data-cr_by_bupa_formatted_name
        iv_user_account_id          = <ls_qrnview>-system_administrative_data-cr_by_user_account_id-content
        iv_technical_user_indicator = <ls_qrnview>-system_administrative_data-cr_by_technical_indicator
      IMPORTING
        ev_user_display_name        = <ls_qrnview>-created_by_name
    ).

    cl_a1fia_concatenate_user_name=>concatenate_user_name(
      EXPORTING
        iv_user_account_name        = <ls_qrnview>-system_administrative_data-ch_by_bupa_formatted_name
        iv_user_account_id          = <ls_qrnview>-system_administrative_data-ch_by_user_account_id-content
        iv_technical_user_indicator = <ls_qrnview>-system_administrative_data-ch_by_technical_indicator
      IMPORTING
        ev_user_display_name        = <ls_qrnview>-changed_by_name
    ).

  ENDLOOP.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_NODE_IDS                    TYPE        SESF_BO_NODE_ID_TAB
* | [--->] IN_PROPERTY_HANDLER            TYPE REF TO IF_ESF_PROPERTY_HANDLER
* | [--->] IN_PROPERTY_SCOPE              TYPE        IF_ESF_TYPES=>TY_PROPERTY_SCOPE (default =IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES.
*CALL METHOD SUPER->IF_ESF_PROVIDER_ACCESS~RETRIEVE_PROPERTIES
*  EXPORTING
*    IN_BO_NODE_NAME     =
*    IN_NODE_IDS         =
*    IN_PROPERTY_HANDLER =
**    in_property_scope   = IF_ESF_TYPES=>CO_PROPERTY_SCOPE_DEFAULT
*    .
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_QUERY~QUERY
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

  DATA : ls_selection_parameters        TYPE sesf_selection_parameter,
         lt_selection_parameters                  TYPE TABLE OF sesf_selection_parameter.
*           lt_sel_params_correct_sel_opts TYPE TABLE OF sesf_selection_parameter,
*           lv_delete_mapix                LIKE sy-tabix,
*           lx_ex                          TYPE REF TO cx_root,
*           lv_date                        TYPE d,
*           lv_timestamp                   TYPE timestampl.
*
*    IF in_bo_node_name = if_a1fia_accentredef_owl_co=>co_bo_node-qrnview
*      AND in_query_name = if_a1fia_accentredef_owl_co=>co_query-qrnview-query_by_elements. " check whether correct query is getting called
*
*      LOOP AT in_selection_parameters INTO ls_selection_parameters. " if one of input params is creation date, add it to lt_sel_params
*        IF ls_selection_parameters-attribute_name =
*          if_a1fia_accentredef_owl_co=>co_query_p_attr-qrnview-query_by_elements-system_administrative_data-creation_date_time.
*          lv_delete_mapix = sy-tabix.
*          lv_date = ls_selection_parameters-low.
*          lv_date = lv_date + 2.
*          CONVERT DATE lv_date INTO TIME STAMP lv_timestamp TIME ZONE sy-zonlo.
*          ls_selection_parameters-low = lv_timestamp.
*          APPEND ls_selection_parameters TO lt_sel_params.
*        ENDIF.
*      ENDLOOP.
*
*      IF lt_sel_params IS NOT INITIAL. " lt_sel_params is not empty -> change the sel options for creation date now
*        READ TABLE lt_sel_params INTO ls_selection_parameters INDEX 1.
*        TRY.
*            CALL METHOD /isdt/cl_udtm_search=>conv_selopt_date_to_tzi_dt
*              EXPORTING
*                it_sel_param_date       = lt_sel_params
**               IV_RENDER_AS_ISO        =
**               IV_USE_CLOSED_INTERVALS =
*              RECEIVING
*                rt_sel_param_tzi        = lt_sel_params_correct_sel_opts.
*          CATCH /isdt/cx_invalid_date INTO lx_ex.
*            RAISE EXCEPTION TYPE cx_fatal_exception
*              EXPORTING
*                previous = lx_ex.
*          CATCH /isdt/cx_unsupported_seloption INTO lx_ex.
*            RAISE EXCEPTION TYPE cx_fatal_exception
*              EXPORTING
*                previous = lx_ex.
*        ENDTRY.
*        CLEAR lt_sel_params[].
*        APPEND LINES OF in_selection_parameters TO lt_sel_params. " add all input params to lt_sel_params
*        DELETE lt_sel_params INDEX lv_delete_mapix. " delete the old creation date selection param from lt_sel_params
*        APPEND LINES OF lt_sel_params_correct_sel_opts TO lt_sel_params. " add the new creation date select options
*      ELSE.
*        APPEND LINES OF in_selection_parameters TO lt_sel_params." if lt_sel_param was empty,
*        " just copy in_selection_parameters to lt_sel_params
*      ENDIF.
*    ELSE.
*      APPEND LINES OF in_selection_parameters TO lt_sel_params." if the query was not of our concern,
*      " just copy in_selection_parameters to lt_sel_params
*    ENDIF.

  APPEND LINES OF in_selection_parameters TO lt_selection_parameters.
  "Fp25
  CALL METHOD cl_a1fia_sel_by_date=>convert_date_to_date_range
    EXPORTING
      in_attribute_name       = if_a1fia_accentredef_owl_co~co_attr-qrnview-system_administrative_data-cr_date_time
    CHANGING
      ct_selection_parameters = lt_selection_parameters.
  "Fp25
  CALL METHOD cl_a1fia_sel_by_date=>convert_date_to_date_range
    EXPORTING
      in_attribute_name       = if_a1fia_accentredef_owl_co~co_attr-qrnview-system_administrative_data-ch_date_time
    CHANGING
      ct_selection_parameters = lt_selection_parameters.

  CALL METHOD super->if_esf_provider_query~query " call the super query with lt_sel_params
    EXPORTING
      in_bo_node_name          = in_bo_node_name
      in_query_name            = in_query_name
      in_selection_parameters  = lt_selection_parameters
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

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_CODE_VALUES
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
  "Dummy implementation, dont remove this impl, cause this comes under ATC Check of this class as an error.
  DATA: lv_dummy TYPE string.
  lv_dummy = 'dummy impl'. "#EC NOTEXT
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_ACTION_VALUE_SET
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
  "Dummy implementation, dont remove this impl, cause this comes under ATC Check of this class as an error.
  DATA: lv_dummy TYPE string.
  lv_dummy = 'dummy impl'. "#EC NOTEXT
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_CODE_VALUES
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
  "Dummy implementation, dont remove this impl, cause this comes under ATC Check of this class as an error.
  DATA: lv_dummy TYPE string.
  lv_dummy = 'dummy impl'. "#EC NOTEXT

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_CODE_VALUES
* +-------------------------------------------------------------------------------------------------+
* | [--->] IN_BO_NODE_NAME                TYPE        STRING
* | [--->] IN_QUERY_NAME                  TYPE        STRING
* | [--->] IN_ATTRIBUTE_NAME              TYPE        STRING
* | [--->] IN_CONTEXT_PARAMETERS          TYPE        ANY(optional)
* | [--->] IN_CONTEXT_ATTRIBUTES          TYPE        SESF_STRING_TAB(optional)
* | [<-()] OUT_CODE_VALUES                TYPE        IF_ESF_TYPES=>TT_CODE_VALUES
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD if_esf_provider_value_set~retrieve_query_code_values.
  DATA: lo_lcp_facade                TYPE REF TO if_esf_lcp_facade,
        lx_esf_core_service          TYPE REF TO cx_esf_core_service,
        lo_acc_ent_rec_def           TYPE REF TO if_esf_lcp,
        lt_out_code_values           TYPE if_esf_types=>tt_code_values,
        ls_out_code_values           LIKE LINE OF lt_out_code_values.

* This method is implemented to provide a solution: 01570317 2010

  IF in_attribute_name = if_a1fia_accentredef_owl_co=>co_query_p_attr-qrnview-query_by_elements-status-life_cycle_status_code.
    TRY.

        lo_lcp_facade = cl_esf_lcp_factory=>get_lcp_facade( ).

        lo_acc_ent_rec_def = lo_lcp_facade->get_lcp( if_fia_acc_entry_rec_def=>co_bo_name ).

        lo_acc_ent_rec_def->retrieve_query_code_values(
          EXPORTING
            in_bo_node_name       = if_fia_acc_entry_rec_def=>co_bo_node-root
            in_query_name         = if_fia_acc_entry_rec_def=>co_query-root-query_by_elements
            in_attribute_name     = if_fia_acc_entry_rec_def=>co_query_p_attr-root-query_by_elements-status-life_cycle_status_code
          IMPORTING
            out_code_values       = lt_out_code_values ).


        LOOP AT lt_out_code_values INTO ls_out_code_values.
          IF ls_out_code_values-content NE '1'. "In Preparation
            APPEND ls_out_code_values TO out_code_values.
          ENDIF.
        ENDLOOP.


      CATCH cx_esf_core_service INTO lx_esf_core_service.
        RAISE EXCEPTION TYPE cx_fatal_exception
          EXPORTING
            previous = lx_esf_core_service.

    ENDTRY.
  ENDIF.
ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_QUERY_VALUE_SET
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
  "Dummy implementation, dont remove this impl, cause this comes under ATC Check of this class as an error.
  DATA: lv_dummy TYPE string.
  lv_dummy = 'dummy impl'. "#EC NOTEXT

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_ACCENTREDEF_OWL_CO->IF_ESF_PROVIDER_VALUE_SET~RETRIEVE_VALUE_SET
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
  "Dummy implementation, dont remove this impl, cause this comes under ATC Check of this class as an error.
  DATA: lv_dummy TYPE string.
  lv_dummy = 'dummy impl'. "#EC NOTEXT
ENDMETHOD.
ENDCLASS.