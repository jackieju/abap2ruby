# Generated by Abap2Ruby(https://github.com/jackieju/abap2ruby)

module If_esf_provider_init

   # methods INIT
   #     importing
   #       !IN_PROVIDER_CONTEXT type ref to IF_ESF_PROVIDER_CONTEXT
   #       !IN_BO_NAME type STRING optional
   #     changing
   #       !INOUT_PREFERRED_TRX_PATTERN type TY_TRANSACTION_PATTERN default IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE .

   def init(*_a,in_provider_context:nil,in_bo_name:nil,_i:nil,_e:nil,_b:nil)


      raise "Not implemented"

   end

   module_function
   if_esf_provider_init=If_esf_provider_init
   Co_tp_save_and_continue = 0
   def co_tp_save_and_continue;0;  end
   Co_tp_save_and_exit = 1
   def co_tp_save_and_exit;1;  end

end
