# Generated by Abap2Ruby(https://github.com/jackieju/abap2ruby)
require_relative "if_esf_types.rb"

module If_esf_provider_value_set

   # methods RETRIEVE_CODE_VALUES
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_NODE_ID type SESF_BO_NODE_ID
   #       !IN_NODE_ID_IS_HANDLE type SESF_BOOLEAN optional
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_CONTEXT_PARAMETERS type ANY optional
   #       !IN_CONTEXT_ATTRIBUTES type SESF_STRING_TAB optional
   #     exporting
   #       !OUT_CODE_VALUES type IF_ESF_TYPES=>TT_CODE_VALUES .
   #

   def retrieve_code_values(*_a,in_bo_node_name:nil,in_node_id:nil,in_node_id_is_handle:nil,in_attribute_name:nil,in_context_parameters:nil,in_context_attributes:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods RETRIEVE_ACTION_CODE_VALUES
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_ACTION_NAME type STRING
   #       !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_CONTEXT_PARAMETERS type ANY optional
   #       !IN_CONTEXT_ATTRIBUTES type SESF_STRING_TAB optional
   #     returning
   #       value(OUT_CODE_VALUES) type IF_ESF_TYPES=>TT_CODE_VALUES .
   #

   def retrieve_action_code_values(*_a,in_bo_node_name:nil,in_action_name:nil,in_node_ids:nil,in_attribute_name:nil,in_context_parameters:nil,in_context_attributes:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods RETRIEVE_QUERY_CODE_VALUES
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_QUERY_NAME type STRING
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_CONTEXT_PARAMETERS type ANY optional
   #       !IN_CONTEXT_ATTRIBUTES type SESF_STRING_TAB optional
   #     returning
   #       value(OUT_CODE_VALUES) type IF_ESF_TYPES=>TT_CODE_VALUES .
   #

   def retrieve_query_code_values(*_a,in_bo_node_name:nil,in_query_name:nil,in_attribute_name:nil,in_context_parameters:nil,in_context_attributes:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods RETRIEVE_ACTION_VALUE_SET
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_ACTION_NAME type STRING
   #       !IN_NODE_IDS type SESF_BO_NODE_ID_TAB
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_SELECTION_PARAMETERS type SESF_SELECTION_PARAMETERS_TAB
   #       !IN_QUERY_OPTIONS type SESF_QUERY_OPTIONS optional
   #       !IN_AUTHORIZATION_CONTEXT type TY_AUTHORIZATION_CONTEXT optional
   #     returning
   #       value(OUT_VALUE_SET_NODE_IDS) type SESF_BO_NODE_ID_TAB .
   #

   def retrieve_action_value_set(*_a,in_bo_node_name:nil,in_action_name:nil,in_node_ids:nil,in_attribute_name:nil,in_selection_parameters:nil,in_query_options:nil,in_authorization_context:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods RETRIEVE_VALUE_SET
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_NODE_ID type SESF_BO_NODE_ID
   #       !IN_NODE_ID_IS_HANDLE type SESF_BOOLEAN optional
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_SELECTION_PARAMETERS type SESF_SELECTION_PARAMETERS_TAB
   #       !IN_QUERY_OPTIONS type SESF_QUERY_OPTIONS optional
   #       !IN_AUTHORIZATION_CONTEXT type TY_AUTHORIZATION_CONTEXT optional
   #     returning
   #       value(OUT_VALUE_SET_NODE_IDS) type SESF_BO_NODE_ID_TAB .
   #

   def retrieve_value_set(*_a,in_bo_node_name:nil,in_node_id:nil,in_node_id_is_handle:nil,in_attribute_name:nil,in_selection_parameters:nil,in_query_options:nil,in_authorization_context:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods RETRIEVE_QUERY_VALUE_SET
   #     importing
   #       !IN_BO_NODE_NAME type STRING
   #       !IN_QUERY_NAME type STRING
   #       !IN_ATTRIBUTE_NAME type STRING
   #       !IN_SELECTION_PARAMETERS type SESF_SELECTION_PARAMETERS_TAB
   #       !IN_QUERY_OPTIONS type SESF_QUERY_OPTIONS optional
   #       !IN_AUTHORIZATION_CONTEXT type TY_AUTHORIZATION_CONTEXT optional
   #     returning
   #       value(OUT_VALUE_SET_NODE_IDS) type SESF_BO_NODE_ID_TAB .

   def retrieve_query_value_set(*_a,in_bo_node_name:nil,in_query_name:nil,in_attribute_name:nil,in_selection_parameters:nil,in_query_options:nil,in_authorization_context:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end

   module_function
   if_esf_provider_value_set=If_esf_provider_value_set
   include If_esf_types

end