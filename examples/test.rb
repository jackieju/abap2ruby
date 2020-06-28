
require_relative "../abaplib.rb"
require_relative "abap.rb"
include Abap
require_relative "cl_bsa_factory.rb"
require_relative "cl_bsa_service_provider_co.rb"

require_relative "cl_a1s_service_provider_eco.rb"
require_relative "cl_a1fia_common_eco.rb"

require_relative "cl_a1fia_aar_create_qaf_eco.rb"
require_relative "cl_a1fia_acproerr_qaf_eco.rb"

require_relative "if_a1fia_aar_create_qaf_eco.rb"
require_relative "if_esf_types.rb"

require_relative "if_bsa_adaptation_handler.rb"

include Abap
a = Cl_a1fia_aar_create_qaf_eco.new
#a.if_bsa_cb_message_mapping_i_adjust_messages
#a.clear_buffers
#a.init_buffers
in_bo_name = in_provider_context = nil
a.if_esf_provider_init_i_init(_i:{"in_bo_name"=>in_bo_name,"in_provider_context"=>in_provider_context})
in_bo_node_name = "ddd"
in_node_ids = "fff"
in_requested_image = "ff"
in_edit_mode = "fff"
in_requested_attributes = "eee"
out_data=lt_messages=out_failed_node_ids=lt_sync_notifications="ffff"
a.if_esf_provider_access_i_retrieve(_i:{"in_bo_node_name"=>in_bo_node_name,"in_node_ids"=>in_node_ids,"in_requested_image"=>in_requested_image,
    "in_edit_mode"=>in_edit_mode,"in_requested_attributes"=>in_requested_attributes},_e:{"out_data" => out_data,
            "out_messages" => lt_messages,
            "out_failed_node_ids" => out_failed_node_ids,
            "out_sync_notifications" => lt_sync_notifications})