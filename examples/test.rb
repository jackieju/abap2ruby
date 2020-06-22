
require_relative "../abap.rb"
require_relative "cl_bsa_service_provider_co.rb"

require_relative "cl_a1s_service_provider_eco.rb"
require_relative "cl_a1fia_common_eco.rb"

require_relative "cl_a1fia_aar_create_qaf_eco.rb"
require_relative "cl_a1fia_acproerr_qaf_eco.rb"

a = Cl_a1fia_aar_create_qaf_eco.new
#a.if_bsa_cb_message_mapping_i_adjust_messages
#a.clear_buffers
#a.init_buffers
in_bo_node_name = "ddd"
a.if_esf_provider_access_i_retrieve(_i:{"in_bo_node_name"=>in_bo_node_name})