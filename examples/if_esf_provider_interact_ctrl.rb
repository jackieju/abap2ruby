# Generated by Abap2Ruby(https://github.com/jackieju/abap2ruby)
require_relative "if_esf_types.rb"

module If_esf_provider_interact_ctrl

   # methods DO_POST_PROCESSING
   #     importing
   #       !IN_OVERRULING_CODE type IF_ESF_TYPES=>TY_OVERRULING_CODE optional
   #     changing
   #       !INOUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
   #

   def do_post_processing(*_a,in_overruling_code:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods DO_PRE_PROCESSING .
   #

   def do_pre_processing(*_a,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end
   # methods CLOSE_SESSION
   #     importing
   #       !SESSION_HAND_OVER type SESF_BOOLEAN optional .

   def close_session(*_a,session_hand_over:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end

   module_function
   if_esf_provider_interact_ctrl=If_esf_provider_interact_ctrl
   include If_esf_types

end