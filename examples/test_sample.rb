
require_relative "../abaplib.rb"
require_relative "abap.rb"
include Abap

include Abap
require_relative "sample.rb"
a = Sample.new

class Facade
    def get_bo_descriptor(in_bo_proxy_name:)
    end
end
class F
    def get_lcp_facade(_b:nil)
        Facade.new
    end
end
class Mh
end
in_provider_context = F.new
in_message_handler = Mh.new
out_data = ""
out_failed_node_ids = ""
a.if_esf_provider_init_i_init(_b:binding, _i:{"in_provider_context"=>in_provider_context, "in_bo_name"=>"testname"})
a.if_esf_provider_access_i_retrieve(_b:binding,_i:{"IN_BO_NODE_NAME"=>"name2", "IN_NODE_IDS"=>"id", "IN_REQUESTED_IMAGE"=>"11", "IN_EDIT_MODE"=>"ff","IN_REQUESTED_ATTRIBUTES"=>"fsf", 
    "IN_MESSAGE_HANDLER"=>in_message_handler, "IN_BUFFER_SYNC_HANDLER"=>nil},_e:{"OUT_DATA"=>"out_data","OUT_FAILED_NODE_IDS"=>"out_failed_node_ids"})
    p out_data
    p out_failed_node_ids
