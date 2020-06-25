*"* components of interface IF_ESF_TYPES
interface IF_ESF_TYPES
  public .


  types TY_IMAGE_COMPARE_TYPE type I .
  types:
    tt_accociation_link_sorted TYPE SORTED TABLE OF sesf_association_link
    WITH NON-UNIQUE KEY source_node_id
    WITH NON-UNIQUE SORTED KEY by_target COMPONENTS target_node_id .
  types TY_SYNC_TYPE type I .
  types TY_OVERRULING_CODE type STRING .
  types TY_AUTHORIZATION_CONTEXT type SESF_AUTHORIZATION_CONTEXT .
  types:
    BEGIN OF ty_context_parameter,
      name TYPE string,
      value TYPE string,
    END OF ty_context_parameter .
  types:
    tt_context_parameters TYPE STANDARD TABLE OF ty_context_parameter WITH DEFAULT KEY .
  types TY_IMAGE type I .
  types:
    BEGIN OF ty_property_scope,
      all_node_props_requested        TYPE sesf_boolean,
      all_action_props_requested      TYPE sesf_boolean,
      requested_actions               TYPE sesf_string_tab,
      all_association_props_requestd  TYPE sesf_boolean,
      requested_associations          TYPE sesf_string_tab,
      all_attribute_props_requested   TYPE sesf_boolean,
      requested_attributes            TYPE sesf_string_tab,
    END OF ty_property_scope .
  types:
    BEGIN OF ty_property_change_scope,
      type_node        TYPE sesf_boolean,
      type_association TYPE sesf_boolean,
      type_attribute   TYPE sesf_boolean,
      type_action      TYPE sesf_boolean,
    END OF ty_property_change_scope .
  types TY_SCOPE type I .
  types:
    BEGIN OF ty_external_references,
      bo_name      TYPE string,
      bo_node_name TYPE string,
      bo_node_ids  TYPE sesf_bo_node_id_tab,
    END OF ty_external_references .
  types TY_CHECK_SCOPE type TY_SCOPE .
  types:
    ty_change_mode TYPE c LENGTH 1 .
  types TY_EDIT_MODE type SESF_EDIT_MODE .
  class CM_ESI_ROOT definition load .
  types TY_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  types:
    BEGIN OF ty_attribute_property,
      node_id          TYPE sesf_bo_node_id,
      attribute_name   TYPE string,
      property_name    TYPE string,
      property_value   TYPE string,
    END OF ty_attribute_property .
  types:
    tt_attribute_properties  TYPE STANDARD TABLE OF
                              ty_attribute_property
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_action_property,
      node_id          TYPE sesf_bo_node_id,
      action_name      TYPE string,
      property_name    TYPE string,
      property_value   TYPE string,
    END OF ty_action_property .
  types:
    tt_action_properties TYPE STANDARD TABLE OF
                              ty_action_property
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_node_element_property,
      node_id          TYPE sesf_bo_node_id,
      property_name    TYPE string,
      property_value   TYPE string,
    END OF ty_node_element_property .
  types:
    tt_node_element_properties TYPE STANDARD TABLE OF
                              ty_node_element_property
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_association_property,
      node_id          TYPE sesf_bo_node_id,
      association_name TYPE string,
      property_name    TYPE string,
      property_value   TYPE string,
    END OF ty_association_property .
  types:
    tt_association_properties TYPE STANDARD TABLE OF
                              ty_association_property
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_properties,
      attribute_properties     TYPE tt_attribute_properties,    " node element properties
      action_properties        TYPE tt_action_properties,       " action properties
      association_properties   TYPE tt_association_properties,  " association properties
      node_element_properties  TYPE tt_node_element_properties, " node properties
    END OF ty_properties .
  types:
    BEGIN OF ty_create_notification,
      bo_name          TYPE string,
      bo_node_name     TYPE string,
      node_id          TYPE sesf_bo_node_id,
    END OF ty_create_notification .
  types:
    tt_create_notifications TYPE STANDARD TABLE OF
                              ty_create_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_suc_create_notification,
      bo_name          TYPE string,
      bo_node_name     TYPE string,
      node_id          TYPE sesf_bo_node_id,
      node_id_handle   TYPE sesf_bo_node_id,
    END OF ty_suc_create_notification .
  types:
    tt_suc_create_notifications TYPE STANDARD TABLE OF
                              ty_suc_create_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_failed_create_notification,
      bo_name          TYPE string,
      bo_node_name     TYPE string,
      node_id_handle   TYPE sesf_bo_node_id,
    END OF ty_failed_create_notification .
  types:
    tt_failed_create_notifications TYPE STANDARD TABLE OF
                              ty_failed_create_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_update_notification,
      bo_name               TYPE string,
      bo_node_name          TYPE string,
      node_id               TYPE sesf_bo_node_id,
      attributes_changed    TYPE sesf_boolean,
      properties_changed    TYPE sesf_boolean,
      associations_changed  TYPE sesf_boolean,
      affected_associations TYPE sesf_string_tab,
      property_scope        TYPE ty_property_change_scope,
    END OF ty_update_notification .
  types:
    tt_update_notifications TYPE STANDARD TABLE OF
                              ty_update_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_delete_notification,
      bo_name          TYPE string,
      bo_node_name     TYPE string,
      node_id       TYPE sesf_bo_node_id,
    END OF ty_delete_notification .
  types:
    tt_delete_notifications TYPE STANDARD TABLE OF
                              ty_delete_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_sync_notifications,
      bo_name      TYPE string,
      bo_node_name TYPE string,
      node_id      TYPE sesf_bo_node_id,
      scope        TYPE ty_scope,
      is_deleted   TYPE sesf_boolean,
      sync_type    TYPE ty_sync_type,
    END OF ty_sync_notifications .
  types:
    tt_sync_notifications TYPE STANDARD TABLE OF ty_sync_notifications WITH DEFAULT KEY .
  types:
    BEGIN OF ty_change_notifications,
      create_notifications        TYPE tt_create_notifications,
      suc_create_notifications    TYPE tt_suc_create_notifications,
      failed_create_notifications TYPE tt_failed_create_notifications,
      update_notifications        TYPE tt_update_notifications,
      delete_notifications        TYPE tt_delete_notifications,
      sync_notifications          TYPE tt_sync_notifications,
    END OF ty_change_notifications .
  types:
    BEGIN OF ty_code_value,
       content   TYPE string,
       list_id   TYPE string,
     END OF ty_code_value .
  types:
    tt_code_values TYPE STANDARD TABLE OF ty_code_value WITH DEFAULT KEY .
  types:
    BEGIN OF ty_adjusted_number,
           bo_name             TYPE string,
           bo_node_name        TYPE string,
           node_id             TYPE sesf_bo_node_id,
           attribute_name      TYPE string,
           old_attribute_value TYPE string,
           new_attribute_value TYPE string,
         END OF ty_adjusted_number .
  types:
    ty_adjusted_numbers TYPE STANDARD TABLE OF
        ty_adjusted_number WITH DEFAULT KEY .
  types TY_INTERACTION_PATTERN type I .
  types:
    BEGIN OF ty_mass_create_notification,
      bo_name          TYPE string,
      bo_node_name     TYPE string,
      node_id          TYPE sesf_bo_node_id,
    END OF ty_mass_create_notification .
  types:
    tt_mass_create_notifications TYPE STANDARD TABLE OF
                              ty_mass_create_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_mass_suc_create_notif,
       bo_name          TYPE string,
       bo_node_name     TYPE string,
      node_id          TYPE sesf_bo_node_id,
       node_id_handle   TYPE sesf_bo_node_id,
    END OF ty_mass_suc_create_notif .
  types:
    tt_mass_suc_create_notifs TYPE STANDARD TABLE OF
                              ty_mass_suc_create_notif
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_mass_failed_create_notif,
        bo_name          TYPE string,
        bo_node_name     TYPE string,
        node_id_handle   TYPE sesf_bo_node_id,
       END OF ty_mass_failed_create_notif .
  types:
    tt_mass_failed_create_notifs TYPE STANDARD TABLE OF
                              ty_mass_failed_create_notif
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_mass_update_notification,
        bo_name               TYPE string,
        bo_node_name          TYPE string,
        node_id               TYPE sesf_bo_node_id,
        attributes_changed    TYPE sesf_boolean,
        properties_changed    TYPE sesf_boolean,
        associations_changed  TYPE sesf_boolean,
        affected_associations TYPE sesf_string_tab,
        property_scope        TYPE ty_property_change_scope,
  END OF ty_mass_update_notification .
  types:
    tt_mass_update_notifications TYPE STANDARD TABLE OF
                              ty_mass_update_notification
                              WITH DEFAULT KEY .
  types:
    BEGIN OF ty_mass_delete_notification,
         bo_name          TYPE string,
         bo_node_name     TYPE string,
         node_id       TYPE sesf_bo_node_id,
       END OF ty_mass_delete_notification .
  types:
    tt_mass_delete_notifications TYPE STANDARD TABLE OF
                              ty_mass_delete_notification
                              WITH DEFAULT KEY .
  types TY_DECOUPLING_REQUEST type I .

  constants:
    BEGIN OF co_context_parameter_names,
         application_name  TYPE ty_context_parameter-name VALUE 'APPLICATION_NAME', "#EC NOTEXT
         floorplan_type    TYPE ty_context_parameter-name VALUE 'FLOORPLAN_TYPE', "#EC NOTEXT
         session_hand_over TYPE ty_context_parameter-name VALUE 'SESSION_HAND_OVER', "#EC NOTEXT
         workcenter_name   TYPE ty_context_parameter-name VALUE 'WORKCENTER_NAME', "#EC NOTEXT
     END  OF co_context_parameter_names .
  constants CO_CHANGE_MODE_CREATE type TY_CHANGE_MODE value 'C' ##no_text .
  constants CO_CHANGE_MODE_DELETE type TY_CHANGE_MODE value 'D' ##no_text .
  constants CO_CHANGE_MODE_UPDATE type TY_CHANGE_MODE value 'U' ##no_text .
  constants CO_CHECK_SCOPE_LOCAL type TY_SCOPE value 0 .
  constants CO_CHECK_SCOPE_SUBSTRUCTURE type TY_SCOPE value 1 .
  constants CO_EDIT type TY_EDIT_MODE value 1 .
  constants CO_EDIT_EXCLUSIVE type TY_EDIT_MODE value 2 .
  constants CO_NODE_ID_PROXY_NAME type STRING value 'NODE_ID' ##no_text .
  constants CO_NODE_ID_ESR_NAME type STRING value 'NodeID' ##no_text .
  constants CO_PARENT_NODE_ID_PROXY_NAME type STRING value 'PARENT_NODE_ID' ##no_text .
  constants CO_PARENT_NODE_ID_ESR_NAME type STRING value 'ParentNodeID' ##no_text .
  constants CO_ROOT_NODE_ID_PROXY_NAME type STRING value 'ROOT_NODE_ID' ##no_text .
  constants CO_ROOT_NODE_ID_ESR_NAME type STRING value 'RootNodeID' ##no_text .
  constants:
    BEGIN OF co_property_change_scope,
      type_node        TYPE sesf_boolean VALUE abap_true,
      type_association TYPE sesf_boolean VALUE abap_true,
      type_attribute   TYPE sesf_boolean VALUE abap_true,
      type_action      TYPE sesf_boolean VALUE abap_true,
    END OF co_property_change_scope .
  constants:
    BEGIN OF co_property_scope_default,
      all_node_props_requested        TYPE sesf_boolean VALUE 'X',
      all_action_props_requested      TYPE sesf_boolean VALUE 'X',
      requested_actions               TYPE sesf_string_tab VALUE IS INITIAL,
      all_association_props_requestd  TYPE sesf_boolean VALUE 'X',
      requested_associations          TYPE sesf_string_tab VALUE IS INITIAL,
      all_attribute_props_requested   TYPE sesf_boolean VALUE 'X',
      requested_attributes            TYPE sesf_string_tab VALUE IS INITIAL,
    END OF co_property_scope_default .
  constants CO_READ_ONLY type TY_EDIT_MODE value 0 .
  constants CO_SCOPE_LOCAL type TY_SCOPE value 0 .
  constants CO_SCOPE_SUBSTRUCTURE type TY_SCOPE value 1 .
  constants CO_IMAGE_BEFORE_MODIFY type TY_IMAGE value 3 .
  constants CO_IMAGE_TRANSACTIONAL_BUFFER type TY_IMAGE value 0 .
  constants CO_IMAGE_BEFORE_CHANGES type TY_IMAGE value 1 .
  constants CO_IMAGE_PERSISTENCY type TY_IMAGE value 2 .
  constants CO_IMAGE_CURRENT_DATA type TY_IMAGE value 2 .
  constants CO_IMAGE_COMP_TBUF_VS_DB type TY_IMAGE_COMPARE_TYPE value 0 .
  constants CO_IMAGE_COMP_TBUF_VS_BEFMOD type TY_IMAGE_COMPARE_TYPE value 1 .
  constants CO_SELECT_OPTION_EQUAL type STRING value 'EQ' ##no_text .
  constants CO_SELECT_OPTION_NOT_EQUAL type STRING value 'NE' ##no_text .
  constants CO_SELECT_OPTION_BETWEEN type STRING value 'BT' ##no_text .
  constants CO_SELECT_OPTION_NOT_BETWEEN type STRING value 'NB' ##no_text .
  constants CO_SELECT_OPTION_NOT_CONT_PTRN type STRING value 'NP' ##no_text .
  constants CO_SELECT_OPTION_CONTAINS_PTRN type STRING value 'CP' ##no_text .
  constants CO_SELECT_OPTION_GREATER_EQUAL type STRING value 'GE' ##no_text .
  constants CO_SELECT_OPTION_GREATER type STRING value 'GT' ##no_text .
  constants CO_SELECT_OPTION_LESS_EQUAL type STRING value 'LE' ##no_text .
  constants CO_SELECT_OPTION_LESS type STRING value 'LT' ##no_text .
  constants CO_SELECT_OPTION_INCLUDING type STRING value 'I' ##no_text .
  constants CO_SELECT_OPTION_EXCLUDING type STRING value 'E' ##no_text .
  constants CO_PHASE_FINALIZE type STRING value 'PHASE_ON_FINALIZE' ##no_text .
  constants CO_PHASE_CHECK_BEFORE_SAVE type STRING value 'PHASE_ON_CHECK_BEFORE_SAVE' ##no_text .
  constants CO_PHASE_BEFORE_SAVE_EVENT type STRING value 'PHASE_ON_BEFORE_SAVE_EVENT' ##no_text .
  constants CO_PHASE_SAVE type STRING value 'PHASE_ON_DO_SAVE' ##no_text .
  constants CO_PHASE_AFTER_SAVE_EVENT type STRING value 'PHASE_ON_AFTER_SAVE_EVENT' ##no_text .
  constants CO_PHASE_AFTER_COMMIT type STRING value 'PHASE_ON_AFTER_COMMIT' ##no_text .
  constants CO_PHASE_AFTER_REJECTED_SAVE type STRING value 'PHASE_ON_AFTER_FAILED_SAVE' ##no_text .
  constants CO_PHASE_NOT_IN_SAVE type STRING value 'NOT_IN_SAVE_CYCLE' ##no_text .
  constants CO_MAXIMUM_ROWS_UNRESTRICTED type INT4 value -1 .
  constants:
    BEGIN OF co_association,
      to_root TYPE string VALUE 'TO_ROOT',
      to_parent TYPE string VALUE 'TO_PARENT',
    END OF co_association .
  constants CO_OC_IN_OVS_PHASE type TY_OVERRULING_CODE value 'IN_OVS_PHASE' ##no_text .
  constants CO_OC_NO_INTERACTION_SINCE_LC type TY_OVERRULING_CODE value 'NO_BACKEND_INTERACTION_SINCE_LAST_CALL' ##no_text .
  constants CO_OC_SKIPPED_FAILED_CREATES type TY_OVERRULING_CODE value 'SAVE_SKIPPED_DUE_TO_FAILED_CREATES' ##no_text .
  constants:
    co_null_time TYPE c LENGTH 6 value '      ' ##no_text .
  constants:
    BEGIN OF co_interaction_pattern, " for use at API level
      save_and_continue TYPE ty_interaction_pattern VALUE 0,
      save_and_exit     TYPE ty_interaction_pattern VALUE 1,
    END OF co_interaction_pattern .
  constants CO_SAVE_AND_CONTINUE_SESSION type I value 0 .
  constants CO_SAVE_AND_EXIT_SESSION type I value 1 .
  constants CO_SAVE_AND_CONTINUE_AT_SAVE type I value 2 .
  constants CO_SAVE_AND_EXIT_AT_SAVE type I value 3 .
  constants CO_BUFFER_CHANGE type TY_SYNC_TYPE value 0 .
  constants CO_PROPERTY_CHANGE type TY_SYNC_TYPE value 1 .
  constants:
    BEGIN OF co_save_decoupling, " preliminary support for early decoupling during save_transaction
      none            TYPE ty_decoupling_request VALUE 0,   " INITIAL: do not use decoupling
      request_phase_1 TYPE ty_decoupling_request VALUE 1,   " do SAVE part 1 (up to Adjust Numbers) and come back
      request_phase_2 TYPE ty_decoupling_request VALUE 2,   " do SAVE part 2 (continue after Adjust Numbers)
    END OF co_save_decoupling .
  constants CO_DO_PREFIX_SEPARATOR type CHAR1 value '.' ##no_text .
  constants CO_DO_PREFIX_ABAP_SEPARATOR type C value '^' ##no_text .
  constants:
    BEGIN OF co_search_execution_mode,
      default     TYPE sesf_search_execution_mode VALUE 0,
      trexviadbsl TYPE sesf_search_execution_mode VALUE 1,
      hybrid      TYPE sesf_search_execution_mode VALUE 2,
    END OF co_search_execution_mode.

endinterface.