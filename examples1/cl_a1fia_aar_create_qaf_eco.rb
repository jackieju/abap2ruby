class Cl_a1fia_aar_create_qaf_eco < cl_a1fia_common_eco

   def modify_core_bo_from_eco_root(io_message_handler:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lt_core_modification = if_esf_provider_access.tt_modifications.new

      lr_attribute_map = ty_attribute_map.new

      #"For MODIFY statement ls_attribute_map = ty_attribute_map.new

      lv_eco_attr_name = string.new

      lv_core_bo_node_type = string.new

      lt_node_id = sesf_bo_node_id_tab.new

      lv_core_bo_table_type = string.new

      lv_core_attr_struc_name = string.new

      lr_table = data.new

      lx_uuid_error = cx_uuid_error.new

      lv_clear_cob_tc = syboolean.new

      lv_clear_proj_id = syboolean.new

      lv_clear_cost_id = syboolean.new

      lt_message = cm_esi_root.tt_esi_root.new

      ls_change_notification = if_esf_types.ty_change_notifications.new


      lx_esf_core_service = cx_esf_core_service.new

      loop(at:it_changed_attributes,
      into:lv_eco_attr_name)
      {
         read_table(id:mt_attribute_map)

         if sy.subrc != 0
            raise cx_fatal_exception.new


            #*        ENDIF.



         end


         if lr_attribute_map.is_dedicated == abap_true
            next



         end


         read_table(id:lt_core_modification)

         if sy.subrc != 0
            append(to:lt_core_modification)

            ls_core_modification.bo_node_name = lr_attribute_map.core_bo_node_name


            concatenate(ar:['IF_FIA_ACC_ADJUSTMENT_RUN=>TY_',lr_attribute_map.core_bo_node_name],
            into:lv_core_bo_node_type)

            ls_core_modification.data = ( lv_core_bo_node_type ).new


            if lr_attribute_map.core_bo_node_id .isINITIAL()
               ls_core_modification.change_mode = if_esf_provider_access.co_change_mode_create


               if lr_attribute_map.core_bo_node_name != if_fia_acc_adjustment_run.co_bo_node.root
                  ls_core_modification.node_id = get_uuid (_i:, _e:, _c:) )

                  #"Handle
                  ls_core_modification.source_node_id = is_eco_root.node_id

                  #"ECO root node ID is same as core BO ROOT node id (could be handle too!)
                  ls_core_modification.source_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.root

                  #"Assumption that the core bo node is directly under Root
                  ls_core_modification.association_name = lr_attribute_map.core_bo_node_name

                  #"Assumption that the core bo node is directly under Root #"Root is the source node ID for all the sel by nodes and parameter and description
                  if mv_eco_root_node_id .isNotINITIAL()
                     ls_core_modification.source_node_id_is_handle = abap_false

                     #"Assumption that the core bo node is directly under Root

                  else mv_eco_root_node_id .isNotINITIAL()

                     #"Assumption that the core bo node is directly under Root

                  end



               else lr_attribute_map.core_bo_node_name != if_fia_acc_adjustment_run.co_bo_node.root



               end


               assign(to:ls_core_bo_data)

               begin
                  clear(id:lt_node_id)
                  append(from:ls_core_modification.node_id,
                  to:lt_node_id)
                  concatenate(ar:['IF_FIA_ACC_ADJUSTMENT_RUN=>TT_',ls_core_modification.bo_node_name],
                  into:lv_core_bo_table_type)
                  lr_table = ( lv_core_bo_table_type ).new

                  assign(to:lt_core_bo_defaulted_data)
                  mo_lcp_bo.retrieve_default_node_values (_i:{
                     "in_bo_node_name" => ls_core_modification.bo_node_name,
                     "in_node_id_handles" => lt_node_id,
                     "in_association_name" => ls_core_modification.association_name,
                     "in_source_bo_node_name" => ls_core_modification.source_bo_node_name,
                     "in_source_node_id" => ls_core_modification.source_node_id,
                     "in_source_node_id_is_handle" => ls_core_modification.source_node_id_is_handle,
                  }
                  , _e:{
                     "out_data" => lt_core_bo_defaulted_data,
                  }
                  , _c:) )
                  read_table(id:<lt_core_bo_defaulted_data>,
                  index:1)
                  if sy.subrc == 0
                     concatenate(ar:['IF_FIA_ACC_ADJUSTMENT_RUN=>CO_ATTR-',ls_core_modification.bo_node_name],
                     into:lv_core_attr_struc_name)

                     assign(to:ls_core_bo_attr_struct)

                     assert(o:sy.subrc == 0)

                     extract_editable_non_init_attr (_i:{
                        "is_co_attr_struct" => ls_core_bo_attr_struct,
                        "is_node_data" => ls_core_bo_defaulted_data,
                        "iv_bo_node_name" => ls_core_modification.bo_node_name,
                     }
                     , _e:, _c:{
                        "ct_changed_attributes" => ls_core_modification.changed_attributes,
                     }
                     ) )

                     #"Fill up the defaulted attributes in the modifications structure
                     move_corresponding(o:ls_core_bo_defaulted_data,
                     to:ls_core_bo_data)



                  end

                  free(lt_core_bo_defaulted_data)
                  unassign(lt_core_bo_defaulted_data)
               rescue cx_esf_core_service , => lx_esf_core_service
                  raise cx_fatal_exception.new

               end
               #"Set the NODE_ID correctly in the data part of modifications structure
               assign(to:lv_node_id)

               lv_node_id = ls_core_modification.node_id

               #" Fill the node_id handle, which was created above

            else lr_attribute_map.core_bo_node_id .isINITIAL()



            end




         end

         #"If this is create of the core BO Root itself and the ID is set as changed don't add to changed attr
         if lr_attribute_map.core_bo_attr_name != if_fia_acc_adjustment_run.co_attr.root.id.content
            append(from:lr_attribute_map.core_bo_attr_name,
            to:<ls_core_modification>.changed_attributes)

            assign(to:ls_core_bo_data)

            assign(to:lv_core_bo_attr_val)

            assign(to:lv_eco_attr_name_val)

            lv_core_bo_attr_val = lv_eco_attr_name_val




         end

         #*     GR/IR Specific Check: Raise warning if recalculate all items is selected

         if lv_eco_attr_name == if_a1fia_aar_create_qaf_eco.co_attr.root.correction_run_indicator AND is_eco_root.correction_run_indicator == abap_true
            if ms_readonly_eco_root.purchase_doc_id .isINITIAL()
               cl_a1fia_aar_util.create_message(_i:{
                  "iv_message_class" => 'A1FIA_AAR_CREATE_QAF',
                  "iv_message_number" => '030',
                  "iv_severity" => cm_esi_root.co_severity_warning,
                  "iv_lifetime" => cm_esi_root.co_lifetime_transition,
               }
               , _e:{
                  "eo_message" => DATA (lo_msg_grir,) ),
               }
               )



               begin
                  io_message_handler.add_message (in_message:lo_msg_grir)
                  )
               rescue cx_esf_message_handler , => DATA ( lx_esf_message_handler )
                  raise cx_fatal_exception.new

               end



            end

            #"Purchase doc ID is INITIAL?


         end


      }
      begin
         mo_lcp_bo.modify (_i:{
            "in_modifications" => lt_core_modification,
         }
         , _e:{
            "out_change_notifications" => ls_change_notification,
            "out_messages" => lt_message,
         }
         , _c:) )
      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end
      clear(id:ls_eco_change_notify)
      io_change_handler.get_change_notifications (_i:{
         "in_bo_name" => if_a1fia_aar_create_qaf_eco.co_bo_name,
         "in_bo_node_name" => if_a1fia_aar_create_qaf_eco.co_bo_node.root,
      }
      , _e:{
         "out_change_notifications" => ls_eco_change_notify,
      }
      , _c:) )
      if ls_eco_change_notify .isINITIAL()
         handle_notifications (_i:{
            "is_change_notification" => ls_change_notification,
            "io_change_handler" => io_change_handler,
         }
         , _e:, _c:) )




      end

      #"Notifications handled in ON_BO_CHANGED add_mapped_messages_int (it_message:lt_message,
      io_message_handler:io_message_handler)
      )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_access.check(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_core_bo_node_name = string.new

      lo_message = cm_esi_root.new

      lr_attribute_map = ty_attribute_map.new

      lt_node_id = sesf_bo_node_id_tab.new

      lt_core_message = cm_esi_root.tt_esi_root.new

      lt_core_message_aggregated = cm_esi_root.tt_esi_root.new

      lx_esf_core_service = cx_esf_core_service.new

      lx_esf_message_handler = cx_esf_message_handler.new

      lx_a1fia_aar_create_qaf_eco = cx_a1fia_aar_create_qaf_eco.new

      if mv_eco_root_node_id .isINITIAL()
         return



      end

      begin
         DATA ( lo_node_desc ) = mo_eco_descriptor.get_bo_node_descriptor (bo_node_proxy_name:in_bo_node_name)
         )
         DATA ( lv_is_node_upd_enabled ) = lo_node_desc.get_property_value (property_name:if_esf_desc.co_property_update_enabled)
         )
         DATA ( lv_is_upd_enabled_final ) = lo_node_desc.is_property_value_final (property_name:if_esf_desc.co_property_update_enabled)
         )
      rescue cx_esf_metadata_error , => DATA ( lx_esf_metadata_error )
         raise cx_fatal_exception.new

      end
      if ( lv_is_node_upd_enabled == abap_false AND lv_is_upd_enabled_final == abap_true )
         return



      end

      if in_bo_node_name != if_a1fia_aar_create_qaf_eco.co_bo_node.root
         super.if_esf_provider_access.check (_i:{
            "in_bo_node_name" => in_bo_node_name,
            "in_node_ids" => in_node_ids,
            "in_check_scope" => in_check_scope,
            "in_message_handler" => in_message_handler,
         }
         , _e:, _c:) )


         return



      end

      begin
         if mt_attribute_map .isINITIAL()
            init_buffers (_i:, _e:, _c:) )




         end

         loop(at:mt_run_specific_node,
         into:lv_core_bo_node_name)
         {
            read_table(id:mt_attribute_map)

            if sy.subrc != 0
               raise cx_a1fia_aar_create_qaf_eco.new





            end


            if lr_attribute_map.core_bo_node_id .isINITIAL()
               next



            end


            clear(id:lt_node_id)

            clear(id:lt_core_message)

            append(from:lr_attribute_map.core_bo_node_id,
            to:lt_node_id)

            begin
               mo_lcp_bo.check (_i:{
                  "in_bo_node_name" => lv_core_bo_node_name,
                  "in_node_ids" => lt_node_id,
                  "in_check_scope" => in_check_scope,
               }
               , _e:{
                  "out_messages" => lt_core_message,
               }
               , _c:) )
               #"#EC CI_LCP_LOOP  "No single BO node is being checked-on more than once rescue cx_esf_core_service , => lx_esf_core_service
               raise cx_fatal_exception.new

            end

            append(from:lines,
            to:lt_core_message_aggregated)

         }
      rescue cx_a1fia_aar_create_qaf_eco , => lx_a1fia_aar_create_qaf_eco
         cl_a1fia_aar_util.create_message (_i:{
            "iv_message_class" => 'A1FIA_AAR_CREATE_QAF_ECO',
            "iv_message_number" => '018',
            "iv_severity" => cm_esi_root.co_severity_error,
            "iv_lifetime" => cm_esi_root.co_lifetime_transition,
         }
         , _e:{
            "eo_message" => lo_message,
         }
         , _c:) )
         begin
            in_message_handler.add_message (lo_message,) )
         rescue cx_esf_message_handler , => lx_esf_message_handler
            raise cx_fatal_exception.new

         end
      end
      add_mapped_messages_int (it_message:lt_core_message_aggregated,
      io_message_handler:in_message_handler)
      )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_access.modify(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lr_modification = if_esf_provider_access.ty_modifications.new

      lx_a1fia_aar_create_qaf_eco = cx_a1fia_aar_create_qaf_eco.new

      lo_message = cm_esi_root.new

      lx_esf_message_handler = cx_esf_message_handler.new

      lt_changed_attributes = sesf_string_tab.new

      lt_sub_node_modify = if_esf_provider_access.tt_modifications.new

      lt_modification = if_esf_provider_access.tt_modifications.new


      lt_modification = in_modifications
      loop(at:lt_modification)
      {
         append(from:lr_modification.*,
         to:lt_sub_node_modify)

         abap("DELETE lt_modification")


      }
      read_table(id:lt_modification,
      index:1)
      if sy.subrc == 0 AND lr_modification.bo_node_name == if_fia_acc_adjustment_run.co_bo_node.root
         assert(o:lr_modification.change_mode == if_esf_provider_access.co_change_mode_update)

         begin
            if mt_attribute_map .isINITIAL()
               init_buffers (_i:, _e:, _c:) )




            end

            if mv_eco_root_node_id .isINITIAL()
               raise cx_a1fia_aar_create_qaf_eco.new





            end

            assign(to:ls_eco_root)
            assert(o:sy.subrc == 0)
            ls_eco_root.node_id = mv_eco_root_node_id
            abap("DELETE lr_modification.changed_attributes WHERE table_line CP '*SCHEME*ID'")
            check_and_fill_sob_comp (ir_root_modification:lr_modification,
            io_message_handler:in_message_handler)
            )
            handle_dedicated_attr_modific (_i:, _e:, _c:{
               "cs_root" => ls_eco_root,
               "ct_changed_attr" => lr_modification.changed_attributes,
            }
            ) )
            #"Create or update the core BO nodes modify_core_bo_from_eco_root (_i:{
            "it_changed_attributes" => lr_modification.changed_attributes,
            "is_eco_root" => ls_eco_root,
            "io_change_handler" => in_change_handler,
            "io_message_handler" => in_message_handler,
         }
         , _e:, _c:) )
      rescue cx_a1fia_aar_create_qaf_eco , => lx_a1fia_aar_create_qaf_eco
         cl_a1fia_aar_util.create_message (_i:{
            "iv_message_class" => 'A1FIA_AAR_CREATE_QAF_ECO',
            "iv_message_number" => '018',
            "iv_severity" => cm_esi_root.co_severity_error,
            "iv_lifetime" => cm_esi_root.co_lifetime_transition,
         }
         , _e:{
            "eo_message" => lo_message,
         }
         , _c:) )
         begin
            in_message_handler.add_message (lo_message,) )
         rescue cx_esf_message_handler , => lx_esf_message_handler
            raise cx_fatal_exception.new

         end
      end



   end

   if lt_sub_node_modify .isNotINITIAL()
      super.if_esf_provider_access.modify (_i:{
         "in_change_handler" => in_change_handler,
         "in_message_handler" => in_message_handler,
      }
      , _e:, _c:{
         "in_modifications" => lt_sub_node_modify,
      }
      ) )




   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_esf_provider_access.retrieve(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_requested_core_attr = sesf_string_tab.new

   lt_eco_attr_for_cur_core_node = sesf_string_tab.new

   lv_core_bo_node_id = sesf_bo_node_id.new

   lv_eco_attr = string.new

   lt_node_id = sesf_string_tab.new

   lv_core_bo_node_name = string.new

   lv_core_bo_table_type = string.new

   lr_table = data.new

   lx_esf_core_service = cx_esf_core_service.new

   lx_a1fia_aar_create_qaf_eco = cx_a1fia_aar_create_qaf_eco.new

   lo_message = cm_esi_root.new

   lv_get_all_attributes = sesf_boolean.new

   lr_attribute_map = ty_attribute_map.new

   lt_requested_attributes = sesf_string_tab.new

   lt_eco_req_attr = sesf_string_tab.new

   lv_request_has_valid_node_id = sesf_boolean.new

   if mv_has_sync_notifications == abap_true
      clear(id:lt_node_id)

      append(from:mv_eco_root_node_id,
      to:lt_node_id)

      lv_core_bo_table_type = 'IF_FIA_ACC_ADJUSTMENT_RUN=>TT_ROOT'


      lr_table = ( lv_core_bo_table_type ).new


      assign(to:lt_core_bo_data)

      begin
         mo_lcp_bo.retrieve (_i:{
            "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
            "in_node_ids" => lt_node_id,
            "in_requested_image" => if_esf_types.co_image_current_data,
         }
         , _e:{
            "out_data" => lt_core_bo_data,
         }
         , _c:) )
      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end

      clear(id:mv_has_sync_notifications)



   end

   case in_bo_node_name
   when if_a1fia_aar_create_qaf_eco.co_bo_node.root
      begin
         if mt_attribute_map .isINITIAL()
            init_buffers (_i:, _e:, _c:) )




         end

         out_failed_node_ids = in_node_ids
         lv_request_has_valid_node_id = abap_false
         if mv_eco_root_node_id .isINITIAL()
            read_table(id:in_node_ids,
            into:mv_eco_root_node_id,
            index:1)

            if root_node_id_exists (mv_eco_root_node_id,) ) == abap_false
               clear(id:mv_eco_root_node_id)



            end




         end

         if mv_eco_root_node_id .isNotINITIAL()
            abap("DELETE out_failed_node_ids WHERE table_line = mv_eco_root_node_id")


            if sy.subrc == 0
               lv_request_has_valid_node_id = abap_true




            end




         end

         if lv_request_has_valid_node_id == abap_true
            append(to:out_data)

            if in_requested_attributes .isNotINITIAL()
               lt_eco_req_attr = in_requested_attributes


               append(from:if_a1fia_aar_create_qaf_eco.co_attr.root.acl_company_uuid.content,
               to:lt_eco_req_attr)

               get_root_maped_attr_for_dedica (_i:{
                  "it_requested_attributes" => lt_eco_req_attr,
               }
               , _e:{
                  "et_mapped_req_attributes" => lt_requested_attributes,
               }
               , _c:) )




            end

            #*             For every node of the core BO trigger an LCP only if it is already created and the attribute is requested now

            loop(at:mt_run_specific_node,
            into:lv_core_bo_node_name)
            {
               clear(id:lt_requested_core_attr)

               clear(id:lt_eco_attr_for_cur_core_node)

               clear(id:lv_core_bo_node_id)

               loop(at:mt_attribute_map)
               {
                  if lt_requested_attributes .isNotINITIAL()
                     read_table(id:lt_requested_attributes)

                     if sy.subrc != 0
                        next



                     end




                  end


                  append(from:lr_attribute_map.core_bo_attr_name,
                  to:lt_requested_core_attr)

                  append(from:lr_attribute_map.eco_attr_name,
                  to:lt_eco_attr_for_cur_core_node)

                  lv_core_bo_node_id = lr_attribute_map.core_bo_node_id


               }

               if lt_requested_core_attr .isINITIAL()
                  next



               end


               concatenate(ar:['if_fia_acc_adjustment_run=>tt_',lv_core_bo_node_name],
               into:lv_core_bo_table_type)

               lr_table = ( lv_core_bo_table_type ).new


               assign(to:lt_core_bo_data)

               clear(id:lt_node_id)

               append(from:lv_core_bo_node_id,
               to:lt_node_id)

               begin
                  mo_lcp_bo.retrieve (_i:{
                     "in_bo_node_name" => lv_core_bo_node_name,
                     "in_node_ids" => lt_node_id,
                     "in_edit_mode" => in_edit_mode,
                     "in_requested_attributes" => lt_requested_core_attr,
                  }
                  , _e:{
                     "out_data" => lt_core_bo_data,
                  }
                  , _c:) )
                  #"#EC CI_LCP_LOOP  "No single BO node is being retrieved on more than once rescue cx_esf_core_service , => lx_esf_core_service
                  raise cx_fatal_exception.new

               end

               read_table(id:<lt_core_bo_data>,
               index:1)

               if sy.subrc != 0
                  raise cx_fatal_exception.new





               end


               loop(at:lt_eco_attr_for_cur_core_node,
               into:lv_eco_attr)
               {
                  read_table(id:mt_attribute_map)

                  unassign(lv_eco_attr_val)

                  unassign(lv_core_attr_val)

                  assign(to:lv_eco_attr_val)

                  assign(to:lv_core_attr_val)

                  lv_eco_attr_val = lv_core_attr_val


               }

               free(lt_core_bo_data)

               unassign(lt_core_bo_data)

            }

            ls_eco_root_data.node_id = mv_eco_root_node_id


            set_root_dedicated_attributes (_i:{
               "it_requested_attributes" => lt_eco_req_attr,
            }
            , _e:, _c:{
               "cs_eco_root" => ls_eco_root_data,
            }
            ) )

            #"Buffer root structure for use in associations
            if lines (lt_requested_attributes,) ) > 0
               loop(at:lt_requested_attributes,
               into:lv_eco_attr)
               {
                  assign(to:lv_eco_attr_val)

                  assign(to:lv_eco_attr_val_buffer)

                  lv_eco_attr_val_buffer = lv_eco_attr_val


               }


            else lines (lt_requested_attributes,) ) > 0



            end



         else lv_request_has_valid_node_id == abap_true
            clear(id:out_data)


         end

         #"IF out_failed_node_ids IS INITIAL. rescue cx_a1fia_aar_create_qaf_eco , => lx_a1fia_aar_create_qaf_eco
         clear(id:out_data)
         append(from:lines,
         to:out_failed_node_ids)
         cl_a1fia_aar_util.create_message (_i:{
            "iv_message_class" => 'A1FIA_AAR_CREATE_QAF_ECO',
            "iv_message_number" => '018',
            "iv_severity" => cm_esi_root.co_severity_error,
            "iv_lifetime" => cm_esi_root.co_lifetime_transition,
         }
         , _e:{
            "eo_message" => lo_message,
         }
         , _c:) )
         mo_message_manager.add_message (lo_message,) )
      end
   else
      super.if_esf_provider_access.retrieve(_i:{
         "in_bo_node_name" => in_bo_node_name,
         "in_node_ids" => in_node_ids,
         "in_requested_image" => in_requested_image,
         "in_edit_mode" => in_edit_mode,
         "in_requested_attributes" => in_requested_attributes,
         "in_message_handler" => in_message_handler,
         "in_buffer_sync_handler" => in_buffer_sync_handler,
      }
      , _e:{
         "out_data" => out_data,
         "out_failed_node_ids" => out_failed_node_ids,
      }
      )

      begin
         DATA ( lv_parent_node_name ) = mo_eco_descriptor.get_bo_node_descriptor.get_proxy_name (_i:, _e:, _c:) )
      rescue cx_esf_metadata_error , => DATA ( lx_esf_metadata )
         raise cx_fatal_exception.new

      end
      if lv_parent_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root
         loop(at:out_data)
         {
            assign(to:lv_parent_node_id)

            lv_parent_node_id = mv_eco_root_node_id


         }



      end

   end





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_esf_provider_access.retrieve_by_association(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_favpro_task = if_fia_fav_project.tt_task.new

   ls_favpro_task = if_fia_fav_project.ty_task.new

   lv_bo_name = string.new

   lv_bo_root_node_name = string.new

   lv_eco_attr = string.new

   lv_eco_node_name = string.new

   lv_source_key_name = string.new

   lv_target_node_id = sesf_bo_node_id.new

   lv_failed = sesf_boolean.new

   ls_link = sesf_association_link.new

   ls_sel_params = sesf_selection_parameter.new

   lt_sel_by_bupa_node_id = sesf_bo_node_id_tab.new

   lv_is_key_based_assoc = syboolean.new

   #"Do we need convert keys call? lo_lcp = if_esf_lcp.new

   lx_esf_core_service = cx_esf_core_service.new

   lx_bsa_runtime = cx_bsa_runtime.new

   lt_target_node_id = sesf_bo_node_id_tab.new

   lt_failed = sesf_boolean_tab.new

   lt_sel_params = sesf_selection_parameters_tab.new

   lr_source_key_table = data.new

   lr_source_key = data.new

   clear(id:out_links)
   clear(id:out_data)
   clear(id:out_failed_source_node_ids)
   if in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root
      lv_eco_node_name = in_association_name

      #" For composition associations node name is same as association name.
      lv_is_key_based_assoc = abap_true

      #"Overridden for places where the association does not require convert keys call.
      case in_association_name
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.to_open_task
         mo_task_region_helper.retrieve_by_association(_i:{
            "in_source_node_ids" => in_node_ids,
         }
         , _e:)

      when if_a1fia_aar_create_qaf_eco.co_assoc.root.bupa
         lv_bo_name = 'BUSINESS_PARTNER'
         lv_bo_root_node_name = if_sp_bupa_template.co_bo_node.root
         lv_source_key_name = if_sp_bupa_template.co_key.root.internal_id
         lr_source_key = if_sp_bupa_template.ty_key.root.internal_id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.business_partner_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.company
         lv_bo_name = '/MOM/COMPANY'
         lv_bo_root_node_name = ::mom::if_organisational_centre.co_bo_node.root
         lv_source_key_name = ::mom::if_organisational_centre.co_key.root.id
         lr_source_key = ::mom::if_organisational_centre.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.company_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.cost_centre
         lv_bo_name = '/MOM/COST_CENTRE'
         lv_bo_root_node_name = ::mom::if_organisational_centre.co_bo_node.root
         lv_source_key_name = ::mom::if_organisational_centre.co_key.root.id
         lr_source_key = ::mom::if_organisational_centre.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.cost_centre_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.cust_ser_org
         lv_bo_name = '/MOM/FUNCTIONAL_UNIT'
         lv_bo_root_node_name = ::mom::if_organisational_centre.co_bo_node.root
         lv_source_key_name = ::mom::if_organisational_centre.co_key.root.id
         lr_source_key = ::mom::if_organisational_centre.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.cust_ser_org_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.fixed_asset
         lv_bo_name = if_fia_fixed_asset.co_bo_name
         lv_bo_root_node_name = if_fia_fixed_asset.co_bo_node.root
         lv_source_key_name = if_fia_fixed_asset.co_key.root.key
         lr_source_key = if_fia_fixed_asset.ty_key.root.key.new

         assign(to:ls_source_key)
         ms_readonly_eco_root.fixed_asset_key.company_uuid.content = ms_readonly_eco_root.acl_company_uuid.content
         ls_source_key = ms_readonly_eco_root.fixed_asset_key
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.house_bank
         lv_bo_name = 'HOUSE_BANK'
         lv_bo_root_node_name = if_sp_bupa_template.co_bo_node.root
         lv_source_key_name = if_sp_bupa_template.co_key.root.internal_id
         lr_source_key = if_sp_bupa_template.ty_key.root.internal_id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.house_bank_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.ovh_asses_rule
         lv_bo_name = 'FIA_OHC_ASSES_RULE'
         lv_bo_root_node_name = if_fia_asses_distr_rule.co_bo_node.root
         lv_source_key_name = if_fia_asses_distr_rule.co_key.root.id
         lr_source_key = if_fia_asses_distr_rule.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.ovh_assess_rule_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.permanent_establishment
         lv_bo_name = '/MOM/PERM_ESTABLISHMENT'
         lv_bo_root_node_name = ::mom::if_organisational_centre.co_bo_node.root
         lv_source_key_name = ::mom::if_organisational_centre.co_key.root.id
         lr_source_key = ::mom::if_organisational_centre.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.permanent_establishment_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.project
         lv_bo_name = if_pro_project.co_bo_name
         lv_bo_root_node_name = if_pro_project.co_bo_node.root
         lv_source_key_name = if_pro_project.co_key.root.project_id
         lr_source_key = if_pro_project.ty_key.root.project_id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.project_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.sales_organisation
         lv_bo_name = '/MOM/FUNCTIONAL_UNIT'
         lv_bo_root_node_name = ::mom::if_organisational_centre.co_bo_node.root
         lv_source_key_name = ::mom::if_organisational_centre.co_key.root.id
         lr_source_key = ::mom::if_organisational_centre.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.sales_organisation_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.fav_cost_object
         if ms_readonly_eco_root.key.cost_object_id .isNotINITIAL()
            lv_bo_name = if_fia_fav_cost_object.co_bo_name


            lv_bo_root_node_name = if_fia_fav_cost_object.co_bo_node.root


            lv_source_key_name = if_fia_fav_cost_object.co_key.root.key


            lr_source_key = if_fia_fav_cost_object.ty_key.root.key.new


            assign(to:ls_source_key)

            ls_source_key = ms_readonly_eco_root.key




         end

      when if_a1fia_aar_create_qaf_eco.co_assoc.root.set_of_books
         lv_bo_name = if_fia_set_of_books.co_bo_name
         lv_bo_root_node_name = if_fia_set_of_books.co_bo_node.root
         lv_source_key_name = if_fia_set_of_books.co_key.root.id
         lr_source_key = if_fia_set_of_books.ty_key.root.id.new

         assign(to:ls_source_key)
         ls_source_key = ms_readonly_eco_root.set_of_books_id
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.production_lot
         if ms_readonly_eco_root.production_lot_formatted_id.formatted_id .isNotINITIAL()
            begin
               lo_lcp = mo_adaptation_handler.get_lcp (if_fia_fav_production_doc.co_bo_name,) )
            rescue cx_bsa_runtime , => lx_bsa_runtime
               raise cx_fatal_exception.new

            end

            ls_sel_params.attribute_name = if_fia_fav_production_doc.co_query_p_attr.root.query_by_operational_doc.operational_document_reference.formatted_id


            ls_sel_params.option = 'EQ'


            ls_sel_params.sign = 'I'


            ls_sel_params.low = ms_readonly_eco_root.production_lot_formatted_id.formatted_id


            append(from:ls_sel_params,
            to:lt_sel_params)

            begin
               lo_lcp.query(_i:{
                  "in_bo_node_name" => if_fia_fav_production_doc.co_bo_node.root,
                  "in_query_name" => if_fia_fav_production_doc.co_query.root.query_by_operational_doc,
                  "in_selection_parameters" => lt_sel_params,
                  "in_fill_data" => abap_false,
               }
               , _e:{
                  "out_node_ids" => lt_target_node_id,
               }
               )


            rescue cx_esf_core_service , => lx_esf_core_service
               raise cx_fatal_exception.new

            end

            read_table(id:lt_target_node_id,
            into:lv_target_node_id,
            index:1)

            if sy.subrc == 0
               ls_link.source_node_id = mv_eco_root_node_id


               ls_link.target_node_id = lv_target_node_id


               append(from:ls_link,
               to:out_links)



            end




         end

      when if_a1fia_aar_create_qaf_eco.co_assoc.root.sal_ser_doc
         if ms_readonly_eco_root.cust_ser_document_id.formatted_id .isNotINITIAL()
            begin
               lo_lcp = mo_adaptation_handler.get_lcp (if_fia_fav_sls_srv_doc.co_bo_name,) )
            rescue cx_bsa_runtime , => lx_bsa_runtime
               raise cx_fatal_exception.new

            end

            ls_sel_params.option = 'EQ'


            ls_sel_params.sign = 'I'


            if ms_readonly_eco_root.cust_ser_document_id.uuid .isNotINITIAL()
               ls_sel_params.attribute_name = if_fia_fav_sls_srv_doc.co_query_p_attr.root.query_by_operational_doc.operational_document_reference.uuid.content


               ls_sel_params.low = ms_readonly_eco_root.cust_ser_document_id.uuid.content



            else ms_readonly_eco_root.cust_ser_document_id.uuid .isNotINITIAL()



            end


            append(from:ls_sel_params,
            to:lt_sel_params)

            begin
               lo_lcp.query(_i:{
                  "in_bo_node_name" => if_fia_fav_sls_srv_doc.co_bo_node.root,
                  "in_query_name" => if_fia_fav_sls_srv_doc.co_query.root.query_by_operational_doc,
                  "in_selection_parameters" => lt_sel_params,
                  "in_fill_data" => abap_false,
               }
               , _e:{
                  "out_node_ids" => lt_target_node_id,
               }
               )


            rescue cx_esf_core_service , => lx_esf_core_service
               raise cx_fatal_exception.new

            end

            loop(at:lt_target_node_id,
            into:lv_target_node_id)
            {
               ls_link.source_node_id = mv_eco_root_node_id


               ls_link.target_node_id = lv_target_node_id


               append(from:ls_link,
               to:out_links)

            }



         end

      when if_a1fia_aar_create_qaf_eco.co_assoc.root.purchase_doc or if_a1fia_aar_create_qaf_eco.co_assoc.root.purchase_doc_upb
         if ms_readonly_eco_root.purchase_doc_id.formatted_id .isNotINITIAL() OR ms_readonly_eco_root.purchase_doc_id_upb.formatted_id .isNotINITIAL()
            begin
               lo_lcp = mo_adaptation_handler.get_lcp (if_fia_fav_purchasing_doc.co_bo_name,) )
            rescue cx_bsa_runtime , => lx_bsa_runtime
               raise cx_fatal_exception.new

            end

            ls_sel_params.option = 'EQ'


            ls_sel_params.sign = 'I'


            if ms_readonly_eco_root.purchase_doc_id.uuid .isNotINITIAL()
               ls_sel_params.attribute_name = if_fia_fav_purchasing_doc.co_query_p_attr.root.query_by_operational_doc.operational_document_reference.uuid.content


               ls_sel_params.low = ms_readonly_eco_root.purchase_doc_id.uuid.content



            else ms_readonly_eco_root.purchase_doc_id.uuid .isNotINITIAL()



            end


            append(from:ls_sel_params,
            to:lt_sel_params)

            if ms_readonly_eco_root.purchase_doc_id_upb.uuid .isNotINITIAL()
               ls_sel_params.attribute_name = if_fia_fav_purchasing_doc.co_query_p_attr.root.query_by_operational_doc.operational_document_reference.uuid.content


               ls_sel_params.high = ms_readonly_eco_root.purchase_doc_id_upb.uuid.content



            else ms_readonly_eco_root.purchase_doc_id_upb.uuid .isNotINITIAL()



            end


            append(from:ls_sel_params,
            to:lt_sel_params)

            begin
               lo_lcp.query(_i:{
                  "in_bo_node_name" => if_fia_fav_purchasing_doc.co_bo_node.root,
                  "in_query_name" => if_fia_fav_purchasing_doc.co_query.root.query_by_operational_doc,
                  "in_selection_parameters" => lt_sel_params,
                  "in_fill_data" => abap_false,
               }
               , _e:{
                  "out_node_ids" => lt_target_node_id,
               }
               )


            rescue cx_esf_core_service , => lx_esf_core_service
               raise cx_fatal_exception.new

            end

            loop(at:lt_target_node_id,
            into:lv_target_node_id)
            {
               ls_link.source_node_id = mv_eco_root_node_id


               ls_link.target_node_id = lv_target_node_id


               append(from:ls_link,
               to:out_links)

            }



         end

      when if_a1fia_aar_create_qaf_eco.co_assoc.root.project_task
         if ms_readonly_eco_root.project_task_id .isNotINITIAL()
            begin
               lo_lcp = mo_adaptation_handler.get_lcp (if_fia_fav_project.co_bo_name,) )
            rescue cx_bsa_runtime , => lx_bsa_runtime
               raise cx_fatal_exception.new

            end

            ls_sel_params.attribute_name = if_fia_fav_project.co_query_p_attr.task.query_by_task.task_reference.formatted_id


            ls_sel_params.option = 'EQ'


            ls_sel_params.sign = 'I'


            ls_sel_params.low = ms_readonly_eco_root.project_task_id


            append(from:ls_sel_params,
            to:lt_sel_params)

            begin
               lo_lcp.query(_i:{
                  "in_bo_node_name" => if_fia_fav_project.co_bo_node.task,
                  "in_query_name" => if_fia_fav_project.co_query.task.query_by_task,
                  "in_selection_parameters" => lt_sel_params,
                  "in_fill_data" => abap_true,
               }
               , _e:{
                  "out_data" => lt_favpro_task,
               }
               )

            rescue cx_esf_core_service , => lx_esf_core_service
               raise cx_fatal_exception.new

            end
            #*          READ TABLE lt_target_node_id INTO lv_target_node_id INDEX 1.

            read_table(id:lt_favpro_task,
            into:ls_favpro_task,
            index:1)

            if sy.subrc == 0
               lv_target_node_id = ls_favpro_task.task_reference.uuid.content


               append(from:lv_target_node_id,
               to:lt_target_node_id)

               ls_link.source_node_id = mv_eco_root_node_id


               ls_link.target_node_id = lv_target_node_id


               append(from:ls_link,
               to:out_links)



            end




         end

         #********FCRE Execlution Logic*******************************************************
      when if_a1fia_aar_create_qaf_eco.co_assoc.root.fcre_root
         lv_is_key_based_assoc = abap_false
         if mv_eco_root_node_id .isNotINITIAL()
            append(to:out_links)

            ls_link.source_node_id = ls_link.target_node_id == mv_eco_root_node_id


            if in_fill_data == abap_true
               append(to:out_data)

               assert(o:sy.subrc == 0)

               assign(to:FIELD-SYMBOL ( lv_uuid_content ))

               assign(to:FIELD-SYMBOL ( lv_parent_node_id ))

               assign(to:FIELD-SYMBOL ( lv_node_id ))

               lv_node_id = lv_parent_node_id == lv_uuid_content == mv_eco_root_node_id


               unassign(lv_node_id)

               unassign(lv_parent_node_id)

               unassign(lv_uuid_content)

               unassign(ls_eco_node_fcre_root)



            end



         else mv_eco_root_node_id .isNotINITIAL()
            clear(id:out_failed_source_node_ids)


         end

      else
         raise cx_fatal_exception.new

         #"Unknown association end
         #*   Call the convert keys method to get the target node id

         if lv_is_key_based_assoc == abap_true AND out_links .isINITIAL()
            if mv_eco_root_node_id .isNotINITIAL() AND lv_eco_node_name .isNotINITIAL() AND lv_bo_name .isNotINITIAL() AND lv_bo_root_node_name .isNotINITIAL() AND lv_source_key_name .isNotINITIAL() AND ls_source_key .isNotINITIAL()
               begin
                  lo_lcp = mo_adaptation_handler.get_lcp (lv_bo_name,) )
               rescue cx_bsa_runtime , => lx_bsa_runtime
                  raise cx_fatal_exception.new

               end



               assign(to:lt_source_key)

               assert(o:sy.subrc == 0)

               append(from:ls_source_key,
               to:<lt_source_key>)

               begin
                  lo_lcp.convert_keys (_i:{
                     "in_bo_node_name" => lv_bo_root_node_name,
                     "in_source_key_name" => lv_source_key_name,
                     "in_target_key_name" => if_esf_types.co_node_id_proxy_name,
                     "in_source_keys" => lt_source_key,
                  }
                  , _e:{
                     "out_target_keys" => lt_target_node_id,
                     "out_failed" => lt_failed,
                  }
                  , _c:) )
               rescue cx_esf_core_service , => lx_esf_core_service
                  raise cx_fatal_exception.new

               end

               lv_failed = abap_true


               read_table(id:lt_failed,
               into:lv_failed,
               index:1)

               if lv_failed == abap_false
                  read_table(id:lt_target_node_id,
                  into:lv_target_node_id,
                  index:1)

                  clear(id:ls_link)

                  ls_link.source_node_id = mv_eco_root_node_id


                  ls_link.target_node_id = lv_target_node_id


                  append(from:ls_link,
                  to:out_links)



               end



            else mv_eco_root_node_id .isNotINITIAL() AND lv_eco_node_name .isNotINITIAL() AND lv_bo_name .isNotINITIAL() AND lv_bo_root_node_name .isNotINITIAL() AND lv_source_key_name .isNotINITIAL() AND ls_source_key .isNotINITIAL()
               clear(id:out_links)


            end




         end


         if lv_is_key_based_assoc == abap_true AND in_fill_data == abap_true AND out_links .isNotINITIAL() AND out_data .isINITIAL()
            if_esf_provider_access.retrieve (_i:{
               "in_bo_node_name" => lv_eco_node_name,
               "in_node_ids" => lt_target_node_id,
               "in_edit_mode" => if_esf_types.co_read_only,
               "in_requested_attributes" => in_requested_attributes,
               "in_message_handler" => in_message_handler,
               "in_buffer_sync_handler" => in_buffer_sync_handler,
            }
            , _e:{
               "out_data" => out_data,
            }
            , _c:) )


            if out_data .isINITIAL()
               clear(id:out_links)



            end




         end



      else in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root



      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_access.retrieve_default_node_values(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      if in_bo_node_name != if_a1fia_aar_create_qaf_eco.co_bo_node.root
         super.if_esf_provider_access.retrieve_default_node_values (_i:{
            "in_bo_node_name" => in_bo_node_name,
            "in_node_id_handles" => in_node_id_handles,
            "in_association_name" => in_association_name,
            "in_association_filter_struct" => in_association_filter_struct,
            "in_association_filter_attribs" => in_association_filter_attribs,
            "in_source_bo_node_name" => in_source_bo_node_name,
            "in_source_node_id" => in_source_node_id,
            "in_source_node_id_is_handle" => in_source_node_id_is_handle,
            "in_property_handler" => in_property_handler,
         }
         , _e:{
            "out_data" => out_data,
         }
         , _c:) )




      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_access.retrieve_properties(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lt_requested_attributes = sesf_string_tab.new

      lt_already_retrieved_nodes = sesf_string_tab.new

      lt_core_bo_attr_name = sesf_string_tab.new

      ls_property_scope = if_esf_types.ty_property_scope.new

      ls_property = if_esf_types.ty_properties.new


      ls_node_elem_property = if_esf_types.ty_node_element_property.new

      lr_attr_map = ty_attribute_map.new

      lt_attr_pair_for_node = tt_attribute_pair.new

      lt_node_id = sesf_bo_node_id_tab.new

      lv_eco_attr_name = string.new

      ls_attr_pair = ty_attribute_pair.new

      lv_attr_readonly_set = sesf_boolean.new

      lv_prop_value = sesf_boolean.new

      lt_eco_attr_name = sesf_string_tab.new

      lt_requested_actions = sesf_string_tab.new

      lv_action_enabled = sesf_boolean.new

      lv_action_name = string.new

      lv_is_read_only_attr = syboolean.new

      lx_esf_property_handler = cx_esf_property_handler.new

      lx_esf_core_service = cx_esf_core_service.new

      if mv_eco_root_node_id .isNotINITIAL()
         case in_bo_node_name
         when if_a1fia_aar_create_qaf_eco.co_bo_node.root
            #"Set action properties if abap_true == abap_true
            append(from:if_a1fia_aar_create_qaf_eco.co_action.root.compound_schedule,
            to:lt_requested_actions)

            append(from:if_a1fia_aar_create_qaf_eco.co_action.root.execute,
            to:lt_requested_actions)


         elsif in_property_scope.requested_actions .isNotINITIAL()



         end

         clear(id:lv_action_enabled)
         if ms_readonly_eco_root.processing_status.processing_status_code .isINITIAL() AND is_floorplan_editable (_i:, _e:, _c:) ) == abap_true
            lv_action_enabled = abap_true



         else ms_readonly_eco_root.processing_status.processing_status_code .isINITIAL() AND is_floorplan_editable (_i:, _e:, _c:) ) == abap_true



         end

         loop(at:lt_requested_actions,
         into:lv_action_name)
         {
            begin
               in_property_handler.set_action_enabled (_i:{
                  "in_action_name" => lv_action_name,
                  "in_value" => lv_action_enabled,
                  "in_bo_node_id" => mv_eco_root_node_id,
               }
               , _e:, _c:) )
            rescue cx_esf_property_handler , => lx_esf_property_handler
               raise cx_fatal_exception.new

            end

         }
         if is_floorplan_editable (_i:, _e:, _c:) ) == abap_false
            begin
               in_property_handler.set_node_elem_update_enabled (_i:{
                  "in_bo_node_id" => mv_eco_root_node_id,
                  "in_value" => abap_false,
               }
               , _e:, _c:) )
            rescue cx_esf_property_handler , => lx_esf_property_handler
               raise cx_fatal_exception.new

            end


         else is_floorplan_editable (_i:, _e:, _c:) ) == abap_false
            if ms_readonly_eco_root.mdro_type_code == if_ap_object_type_code_c.gc_arpl_acc_for_cur_rem_run
               begin
                  in_property_handler.set_association_enabled (_i:{
                     "in_association_name" => if_a1fia_aar_create_qaf_eco.co_assoc.root.fcre_root,
                     "in_value" => abap_true,
                     "in_bo_node_id" => mv_eco_root_node_id,
                  }
                  , _e:, _c:) )
               rescue cx_esf_property_handler , => lx_esf_property_handler
                  raise cx_fatal_exception.new

               end



            end



         end

         #"IF ms_eco_root-life_cycle_status <> mc_life_cycle_status-in_preparation.  else
         super.if_esf_provider_access.retrieve_properties (_i:{
            "in_bo_node_name" => in_bo_node_name,
            "in_node_ids" => in_node_ids,
            "in_property_handler" => in_property_handler,
            "in_property_scope" => in_property_scope,
         }
         , _e:, _c:) )
         if is_floorplan_editable (_i:, _e:, _c:) ) == abap_false
            set_node_n_assoc_read_only (_i:{
               "iv_node_name" => in_bo_node_name,
               "io_property_handler" => in_property_handler,
               "it_node_ids" => in_node_ids,
            }
            , _e:, _c:) )




         end

      end
      #"CASE in_bo_node_name.


   end

   #"IF mv_eco_root_node_id IS NOT INITIAL.




   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_esf_provider_access.retrieve_root_node_id(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lv_node_id = sesf_bo_node_id.new

   ls_link = sesf_association_link.new

   if mv_eco_root_node_id .isNotINITIAL()
      loop(at:in_node_ids,
      into:lv_node_id)
      {
         clear(id:ls_link)

         ls_link.source_node_id = lv_node_id


         ls_link.target_node_id = mv_eco_root_node_id


         append(from:ls_link,
         to:out_links)

      }



   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_esf_provider_action.execute_action(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_change_notification = if_esf_types.ty_change_notifications.new

   #"#EC NEEDED lv_has_errors = sesf_boolean.new

   lt_message = if_esf_lcp.ty_message_list.new

   ls_eco_root = if_a1fia_aar_create_qaf_eco.ty_root.new

   lt_eco_root = if_a1fia_aar_create_qaf_eco.tt_root.new

   lt_changed_attributes = sesf_string_tab.new

   lt_requested_attributes = sesf_string_tab.new

   lt_failed_node_ids = sesf_bo_node_id_tab.new

   lx_bsa_runtime = cx_bsa_runtime.new

   ls_create_action_param = if_a1fia_aar_create_qaf_eco.ty_action_p.root.create.new

   #"lv_ap_or_ar_code TYPE if_a1fia_aar_create_qaf_eco=>ty_action_p-root-create-ap_or_ar, lt_eco_root_node_id = sesf_bo_node_id_tab.new


   lx_a1fia_aar_create_qaf_eco = cx_a1fia_aar_create_qaf_eco.new

   lo_message = cm_esi_root.new

   lx_esf_message_handler = cx_esf_message_handler.new

   lx_uuid_error = cx_uuid_error.new

   lv_tab_count = i.new

   ls_create_notification = if_esf_types.ty_create_notification.new

   ls_mdro_root_node_id = sesf_bo_node_id.new

   lx_message_handler = cx_esf_message_handler.new

   lx_esf_core_service = cx_esf_core_service.new

   if in_action_name == if_a1fia_aar_create_qaf_eco.co_action.root.create
      begin
         if mv_eco_root_node_id .isNotINITIAL()
            raise cx_a1fia_aar_create_qaf_eco.new


            #"This is unexpected, could be malicious?


         end

         ls_create_action_param = in_action_parameters
         ms_readonly_eco_root.mdro_type_code = ls_create_action_param.mdro_type_code
         ms_readonly_eco_root.ap_or_ar = ls_create_action_param.ap_or_ar
         ms_readonly_eco_root.projection_bo_name = get_bo_name_from_mdro_type (ls_create_action_param.mdro_type_code,) )
         assert(o:ms_readonly_eco_root.projection_bo_name .isNotINITIAL())
         begin
            mo_lcp_bo = mo_adaptation_handler.get_lcp (ms_readonly_eco_root.projection_bo_name,) )
         rescue cx_bsa_runtime , => lx_bsa_runtime
            raise cx_fatal_exception.new

         end
         init_buffers (_i:, _e:, _c:) )
         read_table(id:in_referencing_node_elements,
         into:ls_referencing_node_elements,
         index:1)
         if ls_referencing_node_elements.bo_name .isINITIAL() OR ls_referencing_node_elements.bo_node_name .isINITIAL() OR ls_referencing_node_elements.bo_node_id .isINITIAL()
            append(from:if_a1fia_aar_create_qaf_eco.co_attr.root.id.content,
            to:lt_changed_attributes)

            ls_eco_root.node_id = get_uuid (_i:, _e:, _c:) )

            #"If it is Regrouping Run or the Remeasurement Run then populate the party role category code as well
            if ms_readonly_eco_root.projection_bo_name == 'FIA_ARPLA_RGRP_RUN' OR ms_readonly_eco_root.projection_bo_name == 'FIA_ARP_LEDGER_ACCT_REM'
               ms_readonly_eco_root.ap_or_ar = ls_create_action_param.ap_or_ar


               case ms_readonly_eco_root.ap_or_ar
               when if_a1fia_aar_create_qaf_eco_c.co_ap_or_ar_code.ap
                  ls_eco_root.party_role_category_code = if_ap_party_role_cat_code_c.gc_creditor
               when if_a1fia_aar_create_qaf_eco_c.co_ap_or_ar_code.ar
                  ls_eco_root.party_role_category_code = if_ap_party_role_cat_code_c.gc_debtor
               else
                  raise cx_fatal_exception.new

                  #"Should be either AP or AR end

                  append(from:if_a1fia_aar_create_qaf_eco.co_attr.root.party_role_category_code,
                  to:lt_changed_attributes)



               end

               #"Create or update the core BO nodes
               modify_core_bo_from_eco_root (_i:{
                  "it_changed_attributes" => lt_changed_attributes,
                  "is_eco_root" => ls_eco_root,
                  "io_change_handler" => in_change_handler,
                  "io_message_handler" => in_message_handler,
               }
               , _e:, _c:) )



            else ls_referencing_node_elements.bo_name .isINITIAL() OR ls_referencing_node_elements.bo_node_name .isINITIAL() OR ls_referencing_node_elements.bo_node_id .isINITIAL()



            end

            if mv_eco_root_node_id .isINITIAL()
               raise cx_a1fia_aar_create_qaf_eco.new





            end

         rescue cx_a1fia_aar_create_qaf_eco , => lx_a1fia_aar_create_qaf_eco
            cl_a1fia_aar_util.create_message (_i:{
               "iv_message_class" => 'A1FIA_AAR_CREATE_QAF_ECO',
               "iv_message_number" => '018',
               "iv_severity" => cm_esi_root.co_severity_error,
               "iv_lifetime" => cm_esi_root.co_lifetime_transition,
            }
            , _e:{
               "eo_message" => lo_message,
            }
            , _c:) )
            begin
               in_message_handler.add_message (lo_message,) )
            rescue cx_esf_message_handler , => lx_esf_message_handler
               raise cx_fatal_exception.new

            end
         end


      elsif in_action_name == if_a1fia_aar_create_qaf_eco.co_action.root.execute OR in_action_name == if_a1fia_aar_create_qaf_eco.co_action.root.compound_schedule
         if in_action_name == if_a1fia_aar_create_qaf_eco.co_action.root.execute AND lv_has_errors == abap_false
            if mo_mdro_schedule_immediately .isNotBOUND()
               mo_mdro_schedule_immediately = cl_ap_mdro_sched_immed_wait.get_instance (iv_mdro_proxy_name:mo_lcp_bo.bo_name,
               it_mdro_root_node_id:in_node_ids)
               )




            end


            mo_mdro_schedule_immediately.schedule_immediately (_i:{
               "io_facade" => me.mo_provider_context.get_lcp_facade (_i:, _e:, _c:) ),
            }
            , _e:{
               "et_messages" => lt_message #"Don't add this to message handler as we are not interested in TechO's messages,
               "et_mdro_root_to_bgjobsch_map" => DATA (lt_mdro_root_to_bgjobsch_map,) ),
            }
            , _c:) )


            read_table(id:lt_mdro_root_to_bgjobsch_map,
            into:DATA ( ls_mdro_root_to_bgjobsch_map ))

            if sy.subrc == 0
               mv_bgjob_scheduled_node_id = ls_mdro_root_to_bgjobsch_map.bgjob_schedule_node_id



            else sy.subrc == 0
               clear(id:mv_bgjob_scheduled_node_id)


            end


            if check_for_errors (lt_message,) ) == abap_true
               me.raise_stop_message (_i:{
                  "io_message_handler" => in_message_handler,
               }
               , _e:, _c:) )




            end




         end



      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_action.retrieve_default_action_param(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################








      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_init.init(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      super.if_esf_provider_init.init(_i:{
         "in_provider_context" => in_provider_context,
         "in_bo_name" => in_bo_name,
      }
      , _e:)

      #"Get LCP facade mo_lcp_facade = in_provider_context.get_lcp_facade (_i:, _e:, _c:) )
      begin
         mo_eco_descriptor = mo_lcp_facade.get_bo_descriptor (in_bo_proxy_name:if_a1fia_aar_create_qaf_eco.co_bo_name)
         )
      rescue cx_esf_core_service , => DATA ( lx_esf_core_service )
         raise cx_fatal_exception.new

      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_interact_ctrl.do_post_processing(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      super.if_esf_provider_interact_ctrl.do_post_processing(_i:{
         "in_overruling_code" => in_overruling_code,
      }
      , _e:)

      cl_a1fia_aar_util.chk_for_fy_vrnt_msg_n_add_info (_i:, _e:, _c:{
         "ct_message" => inout_messages,
      }
      ) )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_subscription.on_bo_changed(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      super.if_esf_provider_subscription.on_bo_changed(_i:{
         "in_publisher_bo_name" => in_publisher_bo_name,
         "in_bo_changes" => in_bo_changes,
         "in_change_handler" => in_change_handler,
      }
      , _e:)

      if in_publisher_bo_name == ms_readonly_eco_root.projection_bo_name
         handle_notifications (_i:{
            "is_change_notification" => in_bo_changes,
            "io_change_handler" => in_change_handler,
         }
         , _e:, _c:) )




      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_transact_ctrl.on_after_cleanup_transaction(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      super.if_esf_provider_transact_ctrl.on_after_cleanup_transaction(_i:, _e:)

      clear_buffers (_i:, _e:, _c:) )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_transact_ctrl.on_after_save_transaction(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_rejected = sesf_boolean.new

      lt_change_notifications = if_esf_types.ty_change_notifications.new

      #"#EC NEEDED lt_message = if_esf_lcp.ty_message_list.new

      ls_attribute_map = ty_attribute_map.new


      lt_eco_message = cm_esi_root.tt_esi_root.new

      lo_esi_t100 = cm_esi_t100.new

      lx_esf_core_service = cx_esf_core_service.new

      lv_rejected = in_rejected
      if lv_rejected .isINITIAL()
         if mv_call_after_save == if_a1fia_aar_create_qaf_eco.co_action.root.execute
            clear(id:mv_call_after_save)

            if mo_mdro_schedule_immediately .isBOUND()
               mo_mdro_schedule_immediately.wait_for_job (_i:{
                  "io_facade" => me.mo_provider_context.get_lcp_facade (_i:, _e:, _c:) ),
                  "iv_max_wait_time" => 300,
               }
               , _e:{
                  "et_messages" => lt_message,
                  "es_change_notification" => lt_change_notifications,
               }
               , _c:) )




            end


            read_table(id:mt_attribute_map,
            into:ls_attribute_map)

            if ls_attribute_map.core_bo_node_id .isINITIAL()
               handle_notifications (_i:{
                  "is_change_notification" => lt_change_notifications,
                  "io_change_handler" => mo_change_handler,
               }
               , _e:, _c:) )




            end


            add_mapped_messages_int (_i:{
               "it_message" => lt_message,
            }
            , _e:{
               "et_eco_message" => lt_eco_message,
            }
            , _c:) )


            append(from:lines,
            to:inout_messages)



         end




      end

      super.if_esf_provider_transact_ctrl.on_after_save_transaction(_i:{
         "in_rejected" => in_rejected,
      }
      , _e:)






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_transact_ctrl.on_before_save_transaction(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      super.if_esf_provider_transact_ctrl.on_before_save_transaction(_i:, _e:{
         "out_rejected" => out_rejected,
         "out_messages" => out_messages,
      }
      )

      #* Any "mandatory fields missing" - raise msgs below
      me.check_mandatory_attr_filled(_i:, _e:)

      cl_a1fia_aar_util.prevent_inconsistent_save (_i:{
         "iv_core_root_node_id" => mv_eco_root_node_id,
         "io_lcp_core_bo" => mo_lcp_bo,
         "iv_scheduled_bgjob_node_id" => mv_bgjob_scheduled_node_id,
      }
      , _e:, _c:{
         "cv_rejected" => out_rejected,
         "ct_message" => out_messages,
      }
      ) )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_value_set.retrieve_code_values(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_core_bo_node_id = sesf_bo_node_id.new

      lv_context_attr = string.new

      #"Only for dump analysis lv_core_bo_node_name = string.new

      lv_core_bo_attr_name = string.new

      lv_is_node_id_handle = sesf_boolean.new

      lx_esf_core_service = cx_esf_core_service.new

      lv_attribute_name = string.new

      lv_bo_node_name = string.new

      lt_code_values = if_esf_types.tt_code_values.new


      if mv_eco_root_node_id .isNotINITIAL()
         if in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root
            read_table(id:in_context_attributes,
            into:lv_context_attr,
            index:1)

            assert(id:a1fia_aar_create_qaf_eco,
            o:sy.subrc != 0 AND ( in_context_parameters .isNotSUPPLIED() OR in_context_parameters .isINITIAL() ))

            if in_attribute_name == if_a1fia_aar_create_qaf_eco.co_attr.root.assignment_type
               cl_fia_cost_object_type_util.get_cost_object_types_by_usage (_i:{
                  "iv_usage" => if_fia_costobj_type_usage_c.gc_depreciation,
                  "iv_free_co_only" => abap_false,
               }
               , _e:{
                  "et_cost_object_type" => DATA (lt_cost_object_type_list,) ),
               }
               , _c:) )


               loop(at:lt_cost_object_type_list)
               {
                  clear(id:ls_code_value)

                  ls_code_value.content = ls_cost_object_type_list.cost_object_type


                  append(from:ls_code_value,
                  to:out_code_values)

               }


            else in_attribute_name == if_a1fia_aar_create_qaf_eco.co_attr.root.assignment_type
               if lv_core_bo_node_id .isNotINITIAL()
                  begin
                     mo_lcp_bo.retrieve_code_values (_i:{
                        "in_bo_node_name" => lv_core_bo_node_name,
                        "in_node_id" => lv_core_bo_node_id,
                        "in_node_id_is_handle" => lv_is_node_id_handle,
                        "in_attribute_name" => lv_core_bo_attr_name,
                     }
                     , _e:{
                        "out_code_values" => out_code_values,
                     }
                     , _c:) )
                  rescue cx_esf_core_service , => lx_esf_core_service
                     raise cx_fatal_exception.new

                  end



               end



            end



         else in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root



         end

         #"Node Name = ROOT?


      end

      #"ECO Root NODE ID Not INITIAL?




      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_value_set.retrieve_value_set(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_core_bo_node_id = sesf_bo_node_id.new

      lv_context_attr = string.new

      #"Only for dump analysis lv_core_bo_node_name = string.new

      lv_core_bo_attr_name = string.new

      lv_is_node_id_handle = sesf_boolean.new

      lx_esf_core_service = cx_esf_core_service.new

      if mv_eco_root_node_id .isNotINITIAL()
         if in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root
            prepare_core_val_help_retrieve (_i:{
               "iv_eco_node_name" => in_bo_node_name,
               "iv_eco_attr_name" => in_attribute_name,
               "iv_eco_node_id" => in_node_id,
            }
            , _e:{
               "ev_core_bo_node_name" => lv_core_bo_node_name,
               "ev_core_bo_node_id" => lv_core_bo_node_id,
               "ev_core_bo_node_id_is_handle" => lv_is_node_id_handle,
               "ev_core_bo_attr_name" => lv_core_bo_attr_name,
            }
            , _c:) )


            if lv_core_bo_node_id .isNotINITIAL()
               if in_attribute_name == if_a1fia_aar_create_qaf_eco.co_attr.root.project_id.content
                  restrict_projectid_value_set (_i:{
                     "in_selection_parameters" => in_selection_parameters,
                  }
                  , _e:, _c:) )

                  #*        ELSEIF in_attribute_name =  if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-formatted_id OR
                  #*           in_attribute_name =  if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-formatted_id OR
                  #*           in_attribute_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-formatted_id.
                  #*
                  #*          DATA lv_doc_type_attr_name TYPE string.
                  #*          DATA lt_sel_param LIKE in_selection_parameters.
                  #*          DATA ls_sel_param LIKE LINE OF in_selection_parameters.
                  #*          DATA lo_doc_eco TYPE REF TO if_esf_lcp.
                  #*
                  #*          lt_sel_param = in_selection_parameters.
                  #*
                  #*          READ TABLE lt_sel_param ASSIGNING FIELD-SYMBOL(<ls_sel_param>)
                  #*            WITH KEY attribute_name = 'OPERATIONAL_DOCUMENT_REFERENCE-OBJECT_TYPE_CODE-CONTENT'.
                  #*          IF sy-subrc <> 0 OR <ls_sel_param>-low IS INITIAL.
                  #*            CASE in_attribute_name.
                  #*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_id-formatted_id.
                  #*                lv_doc_type_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-cust_ser_document_type-content.
                  #*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_id-formatted_id.
                  #*                lv_doc_type_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-sales_document_type-content.
                  #*              WHEN if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_id-formatted_id.
                  #*                lv_doc_type_attr_name  = if_a1fia_aar_create_qaf_eco=>co_attr-root-purchase_doc_type-content.
                  #*            ENDCASE.
                  #*
                  #*            me->if_esf_provider_value_set~retrieve_code_values(
                  #*              EXPORTING
                  #*                in_bo_node_name       = if_a1fia_aar_create_qaf_eco=>co_bo_node-root
                  #*                in_node_id            = mv_eco_root_node_id
                  #*                in_attribute_name     = lv_doc_type_attr_name
                  #*              IMPORTING
                  #*                out_code_values       = lt_out_code_values
                  #*            ).
                  #*
                  #*            ls_sel_param-attribute_name = 'OPERATIONAL_DOCUMENT_REFERENCE-OBJECT_TYPE_CODE-CONTENT'.
                  #*            ls_sel_param-sign = if_esf_types=>co_select_option_including.
                  #*            ls_sel_param-option = if_esf_types=>co_select_option_equal.
                  #*            LOOP AT lt_out_code_values ASSIGNING FIELD-SYMBOL(<ls_code_val>).
                  #*              ls_sel_param-low = <ls_code_val>-content.
                  #*              APPEND ls_sel_param TO lt_sel_param.
                  #*            ENDLOOP.
                  #*          ENDIF.
                  #*
                  #*          TRY.
                  #*              lo_doc_eco = mo_lcp_facade->get_lcp( if_a1fia_fav_ssd_vhelp_co=>co_bo_name ).
                  #*            CATCH cx_esf_core_service INTO lx_esf_core_service.
                  #*              RAISE EXCEPTION TYPE cx_fatal_exception
                  #*                EXPORTING
                  #*                  previous = lx_esf_core_service.
                  #*          ENDTRY.
                  #*
                  #*          TRY.
                  #*              lo_doc_eco->query(
                  #*                EXPORTING
                  #*                  in_bo_node_name          = if_a1fia_fav_ssd_vhelp_co=>co_bo_node-qrnview_ssd
                  #*                  in_query_name            = if_a1fia_fav_ssd_vhelp_co=>co_query-qrnview_ssd-query_by_elements
                  #*                  in_query_options         = in_query_options
                  #*                  in_selection_parameters  = lt_sel_param
                  #*                  in_authorization_context = in_authorization_context
                  #*                IMPORTING
                  #*                  out_node_ids             = out_value_set_node_ids
                  #*              ).
                  #*            CATCH cx_esf_core_service INTO lx_esf_core_service.
                  #*              RAISE EXCEPTION TYPE cx_fatal_exception
                  #*                EXPORTING
                  #*                  previous = lx_esf_core_service.
                  #*          ENDTRY.


               else in_attribute_name == if_a1fia_aar_create_qaf_eco.co_attr.root.project_id.content
                  begin
                     mo_lcp_bo.retrieve_value_set (_i:{
                        "in_bo_node_name" => lv_core_bo_node_name,
                        "in_node_id" => lv_core_bo_node_id,
                        "in_node_id_is_handle" => lv_is_node_id_handle,
                        "in_attribute_name" => lv_core_bo_attr_name,
                        "in_selection_parameters" => in_selection_parameters,
                        "in_query_options" => in_query_options,
                        "in_authorization_context" => in_authorization_context,
                        "in_fill_data" => abap_false,
                     }
                     , _e:{
                        "out_value_set_node_ids" => out_value_set_node_ids,
                     }
                     , _c:) )
                  rescue cx_esf_core_service , => lx_esf_core_service
                     raise cx_fatal_exception.new

                  end


               end




            end



         else in_bo_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root



         end

         #"Node Name = ROOT?


      end

      #"Root Node ID filled?




      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_sub_context(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      rv_sub_context = ms_readonly_eco_root.mdro_type_code





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_task_region_bo_details(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      ev_has_task_region = abap_false
      #" ToOpenTask is NOT to be handled in the generic service provider. Will be handled in this class itself




      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def add_mapped_messages_int(io_message_handler:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lo_message = cm_esi_root.new

      lt_message_map = if_bsa_cb_message_mapping.tt_message_mapping.new


      lx_esf_message_handler = cx_esf_message_handler.new

      if it_message .isINITIAL()
         return



      end

      loop(at:it_message,
      into:lo_message)
      {
         clear(id:ls_message_map)

         ls_message_map.original_message = lo_message


         append(from:ls_message_map,
         to:lt_message_map)

      }
      adjust_messages_int (_i:, _e:{
         "et_eco_message" => et_eco_message,
      }
      , _c:{
         "ct_message_map" => lt_message_map,
      }
      ) )
      if et_eco_message .isNotREQUESTED()
         if io_message_handler .isSUPPLIED()
            begin
               io_message_handler.add_messages (et_eco_message,) )
            rescue cx_esf_message_handler , => lx_esf_message_handler
               raise cx_fatal_exception.new

            end


         else io_message_handler .isSUPPLIED()



         end




      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def adjust_messages_int(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lo_original_msg = cm_esi_root.new

      lo_source_for_copying = cm_esi_root.new

      ls_new_msg_origin_loc = cm_esi_root.ty_message_location.new

      ls_new_msg_envr_location = cm_esi_root.ty_message_location.new

      lr_location = cm_esi_root.ty_message_location.new

      lt_new_msg_envr_location = cm_esi_root.tt_message_locations.new

      clear(id:et_eco_message)
      if mv_eco_root_node_id .isINITIAL()
         return



      end

      loop(at:ct_message_map)
      {
         lo_original_msg = lo_message_map.original_message


         ls_new_msg_origin_loc = translate_message_location (lo_original_msg.origin_location,) )


         clear(id:lt_new_msg_envr_location)

         loop(at:lo_original_msg.environment_locations)
         {
            ls_new_msg_envr_location = translate_message_location (lr_location.*,) )


            if ls_new_msg_envr_location .isNotINITIAL()
               append(from:ls_new_msg_envr_location,
               to:lt_new_msg_envr_location)



            end


         }

         if ls_new_msg_origin_loc .isINITIAL()
            ls_new_msg_origin_loc.bo_name = if_a1fia_aar_create_qaf_eco.co_bo_name


            ls_new_msg_origin_loc.bo_node_name = if_a1fia_aar_create_qaf_eco.co_bo_node.root


            ls_new_msg_origin_loc.bo_node_id = mv_eco_root_node_id




         end


         if lo_message_map.mapped_message .isNotINITIAL()
            lo_source_for_copying = lo_message_map.mapped_message



         else lo_message_map.mapped_message .isNotINITIAL()

            #"This occurs when called internally (NOT from IF_BSA_CB_MESSAGE_MAPPING~ADJUST_MESSAGES)

         end


         lo_message_map.mapped_message = lo_source_for_copying.copy_with_new_location (new_origin_location:ls_new_msg_origin_loc,
         new_environment_locations:lt_new_msg_envr_location,
         new_message_lifetime:lo_source_for_copying.lifetime)
         )


      }
      if et_eco_message .isREQUESTED()
         clear(id:et_eco_message)

         loop(at:ct_message_map)
         {
            append(from:lo_message_map.mapped_message,
            to:et_eco_message)

         }



      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def check_activate_enabled(in_node_ids:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lo_ex = cx_esf_core_service.new

      ls_property_scope = if_esf_types.ty_property_scope.new

      lt_actions = sesf_string_tab.new

      lt_out_properties = if_esf_types.ty_properties.new

      begin
         append(from:if_fia_acc_adjustment_run.co_action.root.activate,
         to:lt_actions)
         ls_property_scope.requested_actions = lt_actions
         mo_lcp_bo.retrieve_properties(_i:{
            "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
            "in_node_ids" => in_node_ids,
            "in_property_scope" => ls_property_scope,
         }
         , _e:{
            "out_properties" => lt_out_properties,
         }
         )

         read_table(id:in_node_ids,
         index:1)
         read_table(id:lt_out_properties.action_properties)
         if sy.subrc == 0
            if out_properties.property_value .isINITIAL()
               rt_enabled = abap_false



            else out_properties.property_value .isINITIAL()



            end



         else sy.subrc == 0



         end

      rescue cx_esf_core_service , => lo_ex
         raise cx_fatal_exception.new

      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def check_and_fill_sob_comp(io_message_handler:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_sob_changed = sesf_boolean.new

      lv_company_changed = sesf_boolean.new

      lv_partially_active_assgn = sesf_boolean.new

      lt_sob_id = if_fia_set_of_books.tt_key.root.id.new

      lt_company_id = ::mom::if_organisational_centre.tt_key.root.id.new

      assign(to:ls_eco_root)
      check( sy.subrc == 0 )
      read_table(id:ir_root_modification.changed_attributes)
      if sy.subrc == 0
         lv_company_changed = abap_true




      end

      read_table(id:ir_root_modification.changed_attributes)
      if sy.subrc == 0
         lv_sob_changed = abap_true




      end

      if lv_company_changed == abap_true AND lv_sob_changed == abap_true
         return



      end

      if lv_company_changed == abap_true AND ls_eco_root.company_id .isNotINITIAL() OR lv_sob_changed == abap_true AND ls_eco_root.set_of_books_id.content .isNotINITIAL()
         if ms_readonly_eco_root.projection_bo_name == 'FIA_FIXED_ASSET_DEPR'
            lv_partially_active_assgn = abap_true




         end

         #*    IF lines( lt_data_comp_activation_stat ) <> 1.
         #*      RETURN. "Either Zero or More than one SOB assignment found active for the given company. Hence no defaulting is to be done for SOB
         #*    ENDIF.

         if lv_company_changed == abap_true
            cl_a1fia_aar_util.get_sob_for_company_id(_i:{
               "iv_company_id" => ls_eco_root.company_id,
               "iv_partially_active_assgn" => lv_partially_active_assgn,
               "io_adaption_handler" => mo_adaptation_handler,
            }
            , _e:{
               "et_sob_id" => lt_sob_id,
            }
            )



            read_table(id:lt_sob_id)

            if sy.subrc != 0
               if lines (lt_sob_id,) ) == 1
                  read_table(id:lt_sob_id,
                  into:ls_eco_root.set_of_books_id,
                  index:1)


               else lines (lt_sob_id,) ) == 1
                  clear(id:ls_eco_root.set_of_books_id)


               end


               append(from:if_a1fia_aar_create_qaf_eco.co_attr.root.set_of_books_id.content,
               to:ir_root_modification.changed_attributes)



            end



         else lv_company_changed == abap_true
            if sy.subrc != 0
               if lines (lt_company_id,) ) == 1
                  read_table(id:lt_company_id,
                  into:ls_eco_root.company_id,
                  index:1)


               else lines (lt_company_id,) ) == 1
                  clear(id:ls_eco_root.company_id)


               end


               append(from:if_a1fia_aar_create_qaf_eco.co_attr.root.company_id,
               to:ir_root_modification.changed_attributes)



            end



         end




      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def check_for_errors(in_messages:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      rt_has_errors = abap_false
      loop(at:in_messages)
      {
         if msg.severity == cm_root.co_severity_error OR msg.severity == cm_root.co_severity_abend
            rt_has_errors = abap_true


            break


         end


      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def check_mandatory_attr_filled(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      CONSTANTS lc_msg_class TYPE string VALUE 'A1FIA_AAR_CREATE_QAF'
      cv_save_rejected = abap_false
      #* Mandatory fields check on Root node
      if ms_readonly_eco_root.projection_bo_name == 'FIA_FIXED_ASSET_DEPR'


      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def clear_buffers(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      clear(id:ms_action_parameters)
      clear(id:mt_eco_root_attributes)
      clear(id:mv_eco_root_node_id)
      clear(id:mt_attribute_map)
      clear(id:mo_lcp_bo)
      clear(id:mv_call_after_save)
      clear(id:mt_run_specific_node)
      clear(id:mo_task_region_helper)
      clear(id:ms_readonly_eco_root)
      clear(id:mo_mdro_schedule_immediately)





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def derive_affected_associations(is_change_notification:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lt_affected_core_nodes = sesf_string_tab.new

      lv_affected_core_node = string.new

      clear(id:rt_affected_associations)
      lt_affected_core_nodes = get_affected_core_bo_nodes (is_change_notification,) )
      loop(at:lt_affected_core_nodes,
      into:lv_affected_core_node)
      {
         case lv_affected_core_node
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_company
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.comp_fin_proc_ctrl,
            to:rt_affected_associations)
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.company,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_set_of_books
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.set_of_books,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_business_partner
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.bupa,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_cost_centre
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.cost_centre,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_production_lot
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.production_lot,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_cust_srvorg
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.cust_ser_org,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_fixed_asset
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.fixed_asset,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_house_bank
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.house_bank,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_ohc_asses_rule
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.ovh_asses_rule,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_permest
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.permanent_establishment,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_project
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.project,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_sales_org
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.sales_organisation,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.execution
            append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.to_open_task,
            to:rt_affected_associations)
         when if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
            case ms_readonly_eco_root.mdro_type_code
            when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_grir_clearing_run
               append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.purchase_doc,
               to:rt_affected_associations)
            when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_slsla_accruals_run OR if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_slsla_overhead_run
               append(from:if_a1fia_aar_create_qaf_eco.co_assoc.root.sal_ser_doc,
               to:rt_affected_associations)
            end
         end

      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def extract_editable_non_init_attr(iv_bo_node_name:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lx_esf_metadata_error = cx_esf_metadata_error.new

      lo_bo_desc = if_esf_bo_desc.new

      lo_bo_node_desc = if_esf_bo_node_desc.new

      lv_is_read_only = sesf_boolean.new

      assert(o:ms_readonly_eco_root.projection_bo_name .isNotINITIAL() AND iv_bo_node_name .isNotINITIAL())
      DO
      assign(to:lv_co_attr_field_struct)
      if sy.subrc != 0
         break


      end

      assign(to:lv_field_value)
      if sy.subrc == 0
         extract_editable_non_init_attr (_i:{
            "is_co_attr_struct" => lv_co_attr_field_struct,
            "is_node_data" => is_node_data,
            "iv_bo_node_name" => iv_bo_node_name,
         }
         , _e:, _c:{
            "ct_changed_attributes" => ct_changed_attributes,
         }
         ) )



      else sy.subrc == 0
         if ( sy.subrc == 0 ) AND ( lv_field_value .isNotINITIAL() )
            begin
               lo_bo_desc = mo_provider_context.get_business_object_descriptor (ms_readonly_eco_root.projection_bo_name,) )
               lo_bo_node_desc = lo_bo_desc.get_bo_node_descriptor (bo_node_proxy_name:iv_bo_node_name)
               )
               lv_is_read_only = lo_bo_node_desc.get_attribute_property_value (attribute_proxy_name:lv_co_attr_field_struct,
               property_name:if_esf_desc.co_property_read_only)
               )
               #*            This should always be an enabled attribute as the default value is non-initial for this. If it fails here the BO impl is wrong
               #*            lv_is_enabled = lo_bo_node_desc->get_attribute_property_value(
               #*                              attribute_proxy_name = <lv_co_attr_field_struct>
               #*                              property_name = if_esf_desc=>co_property_enabled ).
            rescue cx_esf_metadata_error , => lx_esf_metadata_error
               raise cx_fatal_exception.new

            end
            #*       set changed attribute only if "static" READ_ONLY property value is NOT true

            if lv_is_read_only == abap_false
               append(from:lv_co_attr_field_struct,
               to:ct_changed_attributes)



            end




         end



      end

      ENDDO





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_affected_core_bo_nodes(is_change_notification:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      ls_create_notify = if_esf_types.ty_create_notification.new

      ls_suc_create_notify = if_esf_types.ty_suc_create_notification.new

      ls_delete_notify = if_esf_types.ty_delete_notification.new

      ls_update_notify = if_esf_types.ty_update_notification.new

      ls_sync_notify = if_esf_types.ty_sync_notifications.new

      clear(id:rt_affected_core_nodes)
      loop(at:is_change_notification.create_notifications,
      into:ls_create_notify)
      {
         read_table(id:rt_affected_core_nodes,
         from:ls_create_notify.bo_node_name)

         if sy.subrc != 0
            append(from:ls_create_notify.bo_node_name,
            to:rt_affected_core_nodes)



         end


      }
      loop(at:is_change_notification.suc_create_notifications,
      into:ls_suc_create_notify)
      {
         read_table(id:rt_affected_core_nodes,
         from:ls_suc_create_notify.bo_node_name)

         if sy.subrc != 0
            append(from:ls_suc_create_notify.bo_node_name,
            to:rt_affected_core_nodes)



         end


      }
      loop(at:is_change_notification.delete_notifications,
      into:ls_delete_notify)
      {
         read_table(id:rt_affected_core_nodes,
         from:ls_delete_notify.bo_node_name)

         if sy.subrc != 0
            append(from:ls_delete_notify.bo_node_name,
            to:rt_affected_core_nodes)



         end


      }
      loop(at:is_change_notification.update_notifications,
      into:ls_update_notify)
      {
         read_table(id:rt_affected_core_nodes,
         from:ls_update_notify.bo_node_name)

         if sy.subrc != 0
            append(from:ls_update_notify.bo_node_name,
            to:rt_affected_core_nodes)



         end


      }
      loop(at:is_change_notification.sync_notifications,
      into:ls_sync_notify)
      {
         read_table(id:rt_affected_core_nodes,
         from:ls_sync_notify.bo_node_name)

         if sy.subrc != 0
            append(from:ls_sync_notify.bo_node_name,
            to:rt_affected_core_nodes)



         end


      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_bo_name_from_mdro_type(iv_mdro_type_code:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      case iv_mdro_type_code
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_arpla_rgrp_run
         #"11 rv_bo_name = 'FIA_ARPLA_RGRP_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_arp_ledger_acct_rem
         #"10 rv_bo_name = 'FIA_ARP_LEDGER_ACCT_REM'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_bal_carfwd_run
         #"13 rv_bo_name = 'FIA_BAL_CARFWD_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_cashla_fcr_run
         #"19 rv_bo_name = 'FIA_CASHLA_FCR_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_fixed_asset_depr
         #"52 rv_bo_name = 'FIA_FIXED_ASSET_DEPR'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_grir_clearing_run
         #"57 rv_bo_name = 'FIA_GRIR_CLEARING_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_odcla_overhead_run
         #"444 rv_bo_name = 'FIA_ODCLA_OVERHEAD_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_ohcla_overhead_run
         #"78 rv_bo_name = 'FIA_OHCLA_OVERHEAD_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_ohc_asses_run
         #"425 rv_bo_name = 'FIA_OHC_ASSES_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_prdla_overhead_run
         #"95 rv_bo_name = 'FIA_PRDLA_OVERHEAD_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_slsla_accruals_run
         #"112 rv_bo_name = 'FIA_SLSLA_ACCRUALS_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_slsla_overhead_run
         #"113 rv_bo_name = 'FIA_SLSLA_OVERHEAD_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_wip_clearing_run
         #"135 rv_bo_name = 'FIA_WIP_CLEARING_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_settlment_run
         #"1436 rv_bo_name = 'FIA_COB_SETTLEMENT_RUN'
      when if_a1fia_aar_create_qaf_eco_c.mc_mdro_type_code.fia_fixed_asset_setlmnt_run
         #"1807 rv_bo_name = 'FIA_FIXED_ASSET_SETLMNT_RUN'
      else
         raise cx_a1fia_aar_create_qaf_eco.new

      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_eco_core_attr_pair_for_nod(iv_core_bo_node_name:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################





      clear(id:et_eco_core_attr_pair)
      clear(id:et_core_bo_attr_name)
      clear(id:et_eco_attr_name)
      loop(at:mt_attribute_map,
      into:ls_attribute_map)
      {
         clear(id:ls_attribute_pair)

         ls_attribute_pair.core_bo_attr_name = ls_attribute_map.core_bo_attr_name


         ls_attribute_pair.eco_attr_name = ls_attribute_map.eco_attr_name


         abap("INSERT ls_attribute_map.core_bo_attr_name INTO TABLE et_core_bo_attr_name")


         abap("INSERT ls_attribute_map.eco_attr_name INTO TABLE et_eco_attr_name")


         abap("INSERT ls_attribute_pair INTO TABLE et_eco_core_attr_pair")


      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_root_dedicated_attr_names(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      handle_root_dedicated_fields (_i:{
         "iv_mode_get_all_dedicated_attr" => abap_true,
      }
      , _e:{
         "et_eco_attributes" => rt_root_dedicated_attributes,
      }
      , _c:) )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_root_maped_attr_for_dedica(it_requested_attributes:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_dedic_attr_name = string.new

      lr_attribute_map = ty_attribute_map.new

      lt_mapped_eco_attr = sesf_string_tab.new

      et_mapped_req_attributes = it_requested_attributes
      loop(at:it_requested_attributes,
      into:lv_dedic_attr_name)
      {
         clear(id:lr_attribute_map)

         read_table(id:mt_attribute_map)

         if sy.subrc == 0 AND lr_attribute_map.is_dedicated == abap_true
            lr_attribute_map.dedicated_exit.get_related_mapped_eco_attrib (_i:, _e:{
               "et_eco_attributes" => lt_mapped_eco_attr,
            }
            , _c:) )


            if lines (lt_mapped_eco_attr,) ) > 0
               append(from:lines,
               to:et_mapped_req_attributes)



            end




         end


      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def get_uuid(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lr_uuid_generator = if_system_uuid.new

      lx_uuid_error = cx_uuid_error.new

      if ! lr_uuid_generator .isBOUND()
         lr_uuid_generator = cl_uuid_factory.create_system_uuid (_i:, _e:, _c:) )




      end

      begin
         rv_uuid = lr_uuid_generator.create_uuid_c32 (_i:, _e:, _c:) )
      rescue cx_uuid_error , => lx_uuid_error
         raise cx_fatal_exception.new

      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def handle_create_with_ref_actions(io_message_handler:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lt_can_mdro_rt_node_id = sesf_bo_node_id_tab.new

      ls_can_mdro_root = if_fia_acc_adjustment_run.ty_root.new

      lt_can_mdro_root = if_fia_acc_adjustment_run.tt_root.new

      ls_can_mdro_descr = if_fia_acc_adjustment_run.ty_description.new

      lt_can_mdro_descr = if_fia_acc_adjustment_run.tt_description.new

      lv_create_with_ref_action = string.new

      ls_eco_change_notify = if_esf_types.ty_change_notifications.new

      ls_change_notification = if_esf_types.ty_change_notifications.new

      lt_message = cm_esi_root.tt_esi_root.new

      ls_action_parameters_create = if_fia_acc_adjustment_run.ty_action_p.root.create_with_reference.new

      ls_action_parameters_cancel = if_fia_acc_adjustment_run.ty_action_p.root.create_with_ref_for_canc.new


      ls_descr_assoc_param = if_fia_acc_adjustment_run.ty_assoc_p.root.description.new

      lx_esf_core_service = cx_esf_core_service.new

      assert(id:a1fia_aar_create_qaf_eco,
      o:lines (it_referencing_node_elements,) ) == 1)
      read_table(id:it_referencing_node_elements,
      into:ls_referencing_node_elements,
      index:1)
      if iv_for_cancellation == abap_true
         lv_create_with_ref_action = if_fia_acc_adjustment_run.co_action.root.create_with_ref_for_canc

         #"Get the Description of MDRO which is to be cancelled
         append(from:ls_referencing_node_elements.bo_node_id,
         to:lt_can_mdro_rt_node_id)

         begin
            mo_lcp_bo.retrieve (_i:{
               "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
               "in_node_ids" => lt_can_mdro_rt_node_id,
            }
            , _e:{
               "out_data" => lt_can_mdro_root,
            }
            , _c:) )
            read_table(id:lt_can_mdro_root,
            into:ls_can_mdro_root,
            index:1)
            if sy.subrc == 0
               ms_readonly_eco_root.can_mdro_log_section_uuid = ls_can_mdro_root.log_section_uuid


               ls_descr_assoc_param.language_code = sy.langu


               mo_lcp_bo.retrieve_by_association (_i:{
                  "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
                  "in_association_name" => if_fia_acc_adjustment_run.co_assoc.root.description,
                  "in_node_ids" => lt_can_mdro_rt_node_id,
                  "in_filter_parameters" => ls_descr_assoc_param,
                  "in_fill_data" => abap_true,
               }
               , _e:{
                  "out_data" => lt_can_mdro_descr,
               }
               , _c:) )




            end

         rescue cx_esf_core_service , => lx_esf_core_service
            raise cx_fatal_exception.new

         end

         read_table(id:lt_can_mdro_descr,
         into:ls_can_mdro_descr,
         index:1)

         if sy.subrc == 0
            ms_readonly_eco_root.can_mdro_description = ls_can_mdro_descr.description




         end

         #"Assign the action parameters
         assign(to:ls_action_parameters)


      else iv_for_cancellation == abap_true
         assign(to:ls_action_parameters)


      end

      begin
         mo_lcp_bo.execute_action (_i:{
            "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
            "in_action_name" => lv_create_with_ref_action,
            "in_node_ids" => it_node_id,
            "in_referencing_node_elements" => it_referencing_node_elements,
            "in_action_parameters" => ls_action_parameters,
         }
         , _e:{
            "out_change_notifications" => ls_change_notification,
            "out_messages" => lt_message,
         }
         , _c:) )
      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end
      clear(id:ls_eco_change_notify)
      io_change_handler.get_change_notifications (_i:{
         "in_bo_name" => if_a1fia_aar_create_qaf_eco.co_bo_name,
         "in_bo_node_name" => if_a1fia_aar_create_qaf_eco.co_bo_node.root,
      }
      , _e:{
         "out_change_notifications" => ls_eco_change_notify,
      }
      , _c:) )
      if ls_eco_change_notify .isINITIAL()
         handle_notifications (_i:{
            "is_change_notification" => ls_change_notification,
            "io_change_handler" => io_change_handler,
         }
         , _e:, _c:) )




      end

      #"Notifications handled in ON_BO_CHANGED add_mapped_messages_int (it_message:lt_message,
      io_message_handler:io_message_handler)
      )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def handle_dedicated_attr_modific(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_dedicated_attr = string.new

      lr_attribute_map = ty_attribute_map.new

      loop(at:ct_changed_attr,
      into:lv_dedicated_attr)
      {
         read_table(id:mt_attribute_map)

         if sy.subrc == 0 AND lr_attribute_map.is_dedicated == abap_true
            lr_attribute_map.dedicated_exit.modif_mapped_attrib_frm_dedic (_i:, _e:, _c:{
               "cs_modif_eco_root" => cs_root,
               "ct_changed_attr" => ct_changed_attr,
            }
            ) )


            abap("DELETE ct_changed_attr WHERE table_line = lv_dedicated_attr")




         end


      }





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def handle_notifications(io_change_handler:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################










      lv_notify_update = sesf_boolean.new

      lv_notify_create = sesf_boolean.new

      lv_notify_sync = sesf_boolean.new

      lv_sync_scope = if_esf_types.ty_scope.new

      lv_node_name = string.new

      lt_affected_associations = sesf_string_tab.new

      lv_associations_changed = sesf_boolean.new

      lt_node_id = sesf_bo_node_id_tab.new

      lt_bo_root_data_dummy = if_fia_acc_adjustment_run.tt_root.new

      lx_esf_core_service = cx_esf_core_service.new

      lx_esf_change_handler = cx_esf_change_handler.new

      lx_esf_sync_handler = cx_esf_sync_handler.new

      lv_notify_update = abap_false
      lv_notify_create = abap_false
      lv_notify_sync = abap_false
      loop(at:is_change_notification.suc_create_notifications,
      into:ls_suc_create_notify)
      {
         clear(id:ls_attribute_map)

         ls_attribute_map.core_bo_node_id = ls_suc_create_notify.node_id


         abap("MODIFY mt_attribute_map FROM ls_attribute_map USING KEY core_bo_node_key TRANSPORTING core_bo_node_id WHERE core_bo_node_name = ls_suc_create_notify.bo_node_name")


         if ls_suc_create_notify.bo_node_name == if_fia_acc_adjustment_run.co_bo_node.root
            lv_notify_create = abap_true


            mv_eco_root_node_id = ls_suc_create_notify.node_id



         else ls_suc_create_notify.bo_node_name == if_fia_acc_adjustment_run.co_bo_node.root



         end


      }
      loop(at:is_change_notification.create_notifications,
      into:ls_create_notify)
      {
         clear(id:ls_attribute_map)

         ls_attribute_map.core_bo_node_id = ls_create_notify.node_id


         abap("MODIFY mt_attribute_map FROM ls_attribute_map USING KEY core_bo_node_key TRANSPORTING core_bo_node_id WHERE core_bo_node_name = ls_create_notify.bo_node_name")


         if ls_create_notify.bo_node_name == if_fia_acc_adjustment_run.co_bo_node.root
            lv_notify_create = abap_true


            mv_eco_root_node_id = ls_create_notify.node_id



         else ls_create_notify.bo_node_name == if_fia_acc_adjustment_run.co_bo_node.root



         end


      }
      read_table(id:is_change_notification.sync_notifications,
      into:ls_sync_notify)
      if sy.subrc == 0
         clear(id:ls_attribute_map)

         ls_attribute_map.core_bo_node_id = ls_sync_notify.node_id


         abap("MODIFY mt_attribute_map FROM ls_attribute_map USING KEY core_bo_node_key TRANSPORTING core_bo_node_id WHERE core_bo_node_name = ls_sync_notify.bo_node_name")


         lv_notify_sync = abap_true


         lv_sync_scope = if_esf_types.co_scope_local

         #"Only re-read root node.

      else sy.subrc == 0
         loop(at:mt_run_specific_node,
         into:lv_node_name)
         {
            read_table(id:is_change_notification.sync_notifications)

            if sy.subrc == 0
               lv_notify_sync = abap_true


               lv_sync_scope = if_esf_types.co_scope_substructure

               #"don't know which node has been changed, read all sub nodes as well. Shouldn't occur usually.
               break


            end


         }


      end

      #"Check the delete notification and update the buffer loop(at:is_change_notification.delete_notifications,
      into:ls_delete_notify)
      {
         read_table(id:mt_attribute_map,
         into:ls_attribute_map)

         if sy.subrc == 0
            clear(id:ls_attribute_map.core_bo_node_id)

            abap("MODIFY mt_attribute_map FROM ls_attribute_map #"Update all rows for this core BO node USING KEY core_bo_node_key TRANSPORTING core_bo_node_id WHERE core_bo_node_name = ls_delete_notify.bo_node_name")


            lv_notify_update = abap_true

            #"Do not Exit here as the clearing has to be done for all deleted nodes


         end


      }
      if lv_notify_update == abap_false AND lv_notify_create == abap_false
         loop(at:is_change_notification.update_notifications,
         into:ls_update_notify)
         {
            read_table(id:mt_attribute_map)

            if sy.subrc == 0
               lv_notify_update = abap_true


               break


            end


         }



      end

      #"IF lv_notify_update = abap_false AND lv_notify_create = abap_false. if lv_notify_create == abap_true
      begin
         io_change_handler.notify_create(_i:{
            "in_bo_node_name" => if_a1fia_aar_create_qaf_eco.co_bo_node.root,
            "in_bo_node_id" => mv_eco_root_node_id,
         }
         , _e:)

         #"in_create_key_handle = lv_eco_root_node_id_handle  "No handle currently as the create is always through CreateWithReference actions rescue cx_esf_change_handler , => lx_esf_change_handler
         raise cx_fatal_exception.new

      end


   elsif lv_notify_update == abap_true


   elsif lv_notify_sync == abap_true

      #*      TRY. "As the EXECUTE action happens as a background job BOPF buffer would not have been updated hence force a retrieve of current image to update BOPF buffer
      #*          CLEAR lt_node_id.
      #*          APPEND mv_eco_root_node_id TO lt_node_id.
      #*
      #*          mo_lcp_bo->retrieve(
      #*            EXPORTING
      #*              in_bo_node_name         = if_fia_acc_adjustment_run=>co_bo_node-root
      #*              in_node_ids             = lt_node_id
      #*              in_requested_image      = if_esf_types=>co_image_current_data
      #*            IMPORTING
      #*              out_data                = lt_bo_root_data_dummy
      #*          ).
      #*        CATCH cx_esf_core_service INTO lx_esf_core_service.
      #*          RAISE EXCEPTION TYPE cx_fatal_exception
      #*            EXPORTING
      #*              previous = lx_esf_core_service.
      #*      ENDTRY.


   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def handle_root_dedicated_fields(iv_mode_fill_dedicted_attr_val:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################








   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def init_buffers(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   if ms_readonly_eco_root.projection_bo_name .isINITIAL()
      raise cx_a1fia_aar_create_qaf_eco.new


      #"Please set the projection_bo_name prior to this call.


   end

   mo_provider_context.register_on_bo_changes (ms_readonly_eco_root.projection_bo_name,) )
   mo_provider_context.register_on_bo_changes (if_background_job.co_bo_name,) )
   populate_run_specific_nodes (_i:, _e:, _c:) )
   populate_attribute_map (_i:, _e:, _c:) )
   populate_dedicated_attrib (_i:, _e:, _c:) )
   populate_eco_root_attr_names (_i:, _e:, _c:) )
   if mo_task_region_helper .isNotBOUND()
      mo_task_region_helper = cl_coutl_task_region_helper.create_task_region_helper (in_bo_name:ms_readonly_eco_root.projection_bo_name,
      in_bo_node_name:if_fia_acc_adjustment_run.co_bo_node.root,
      in_lcp_facade:mo_provider_context.get_lcp_facade (_i:, _e:, _c:) ))
      )




   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def populate_attribute_map(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_attribute_map = ty_attribute_map.new

   clear(id:mt_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.acl_company_uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.root
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.root.company_uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.accounting_closing_step_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.accounting_closing_step_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.accounting_period_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_time
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_time.lowb_accounting_period_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.business_partner_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_business_partner
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_business_partner.lowb_business_partner_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.can_mdro_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_aar_for_cancel
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_aar_for_cancel.cancel_mdro_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.can_mdro_uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_aar_for_cancel
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_aar_for_cancel.cancellation_mass_data_run_obj.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-chart_of_accounts_code.
   #*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_glacct.
   #*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_glacct-chart_of_accounts_code.
   #*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.
   #*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-chart_of_accounts_item_code-content.
   #*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_glacct.
   #*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_glacct-lowb_chart_of_accounts_item_c-content.
   #*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.company_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_company
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_company.lowb_company_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cost_centre_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_cost_centre
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_cost_centre.lowb_cost_centre_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.currency_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_currency
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_currency.lowb_currency_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_org_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_cust_srvorg
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_cust_srvorg.lower_boundary_customer_servi1
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.description.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.description
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.description.description.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.description.language_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.description
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.description.description.language_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fiscal_year_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_time
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_time.lowb_fiscal_year_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fixed_asset_class
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_fixed_asset_class
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_fixed_asset_class.lowb_fixed_asset_class_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fixed_asset_key.company_uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_fixed_asset
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_fixed_asset.lower_boundary_fixed_asset_key.company_uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fixed_asset_key.id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_fixed_asset
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_fixed_asset.lower_boundary_fixed_asset_key.id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fixed_asset_key.master_fixed_asset_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_fixed_asset
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_fixed_asset.lower_boundary_fixed_asset_key.master_fixed_asset_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #*    ls_attribute_map-eco_attr_name = if_a1fia_aar_create_qaf_eco=>co_attr-root-house_bank_id.
   #*    ls_attribute_map-core_bo_node_name = if_fia_acc_adjustment_run=>co_bo_node-sel_by_house_bank.
   #*    ls_attribute_map-core_bo_attr_name = if_fia_acc_adjustment_run=>co_attr-sel_by_house_bank-lowb_house_bank_id.
   #*    INSERT ls_attribute_map INTO TABLE mt_attribute_map.
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.root
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.root.id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.life_cycle_status
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.root
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.root.status.life_cycle_status_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.ovh_assess_rule_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_ohc_asses_rule
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_ohc_asses_rule.lowb_ohc_asses_rule_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.party_role_category_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_party_role
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_party_role.lowb_party_role_category_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.permanent_establishment_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_permest
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_permest.lowb_permest_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.processing_status.processing_status_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.execution
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.execution.status.processing_status_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.production_lot_formatted_id.formatted_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_production_lot
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_production_lot.lowb_prod_lot_formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.production_lot_formatted_id.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_production_lot
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_production_lot.lowb_prod_lot_uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.project_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_project
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_project.lowb_project_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.project_task_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_project
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_project.lowb_taskref_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_organisation_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_sales_org
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_sales_org.lowb_sales_organisation_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.set_of_books_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_set_of_books
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_set_of_books.lowb_set_of_books_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.test_run_indicator
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.test_run_indicator
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sob_asset_valuation_view_key.set_of_books_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_valuation_view
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_valuation_view.lower_boundary_sob_asset_vv_k.set_of_books_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sob_asset_valuation_view_key.sob_asset_valuation_view_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_valuation_view
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_valuation_view.lower_boundary_sob_asset_vv_k.sob_asset_valuation_view_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.formatted_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.object_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.object_id.scheme_agency_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_agency_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.object_id.scheme_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.object_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.object_node_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_node_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_id.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #*--> Start of Changes (1802)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.formatted_id

   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.object_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.object_id.scheme_agency_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_agency_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.object_id.scheme_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.object_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.object_node_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_node_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.rac_id.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #*<-- End of Changes (1802)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_document_type.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_organisation_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_sales_org
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_sales_org.lowb_sales_organisation_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #" Start Customer Service Document ID ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.formatted_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.object_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.object_id.scheme_agency_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_agency_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.object_id.scheme_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.object_node_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_node_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.object_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_id.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #" End Customer Service Document ID ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_document_type.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.cust_ser_org_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_cust_srvorg
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_cust_srvorg.lower_boundary_customer_servi1
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.bcf_step_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.bcf_step_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.formatted_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.object_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.object_id.scheme_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_id.scheme_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.object_id.scheme_agency_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_id.scheme_agency_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.object_node_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_node_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.object_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id_upb.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_type.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.upb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.formatted_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.formatted_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.object_id.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.object_id.scheme_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.object_id.scheme_agency_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_id.scheme_agency_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.object_node_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_node_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.object_type_code.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_id.uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.purchase_doc_type.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_oed_ref
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_oed_ref.lowb_oed_ref.object_type_code.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.correction_run_indicator
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.correction_run_indicator
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.log_section_uuid.content
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.root
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.root.log_section_uuid.content
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.key.cost_object_id
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_cost_object
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_cost_object.lowb_cost_object_key.cost_object_id
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.key.cost_object_type_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.sel_by_cost_object
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.sel_by_cost_object.lowb_cost_object_key.cost_object_type_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.multi_customer_proj_indicator
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.multi_customer_proj_indicator
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.fxasr_type_code
   ls_attribute_map.core_bo_node_name = if_fia_acc_adjustment_run.co_bo_node.parameters
   ls_attribute_map.core_bo_attr_name = if_fia_acc_adjustment_run.co_attr.parameters.type_code
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   #*                                         Dedicated attributes configuration
   #*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   #***************************************************************************************************************************
   #*   Now fill the dedicated attributes which get filled in HANDLE_CREATE_WITH_REF_ACTIONS method
   #*   and whose value do not get changed after that
   #***************************************************************************************************************************
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.projection_bo_name
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.mdro_type_code
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.is_period_end_close_triggered
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.can_mdro_log_section_uuid.content
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.can_mdro_description.content
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.can_mdro_description.language_code
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.ap_or_ar
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_dedic_attr_default_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   #******************************************************************************************************************************************************
   #*   Now fill the dedicated attributes which are not filled in HANDLE_CREATE_WITH_REF_ACTIONS
   #*   and whose value DO get changed (either automatically or by user)
   #******************************************************************************************************************************************************
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.enable_diplay_log
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_enable_display_log_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.assignment_type
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_assignment_type_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name,
   iv_is_editable:abap_true)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")
   clear(id:ls_attribute_map)
   ls_attribute_map.eco_attr_name = if_a1fia_aar_create_qaf_eco.co_attr.root.sales_obj_sel_code
   ls_attribute_map.is_dedicated = abap_true
   ls_attribute_map.dedicated_exit = NEW lcl_sales_obj_sel_code_exit (io_containing_obj_ref:me,
   iv_dedicated_attrib_name:ls_attribute_map.eco_attr_name,
   iv_is_editable:abap_true)
   )
   clear(id:ls_attribute_map.core_bo_node_name)
   clear(id:ls_attribute_map.core_bo_attr_name)
   abap("INSERT ls_attribute_map INTO TABLE mt_attribute_map")





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def populate_dedicated_attrib(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lr_attribute_map = ty_attribute_map.new

   clear(id:mt_dedicated_attributes)
   loop(at:mt_attribute_map)
   {
      abap("INSERT lr_attribute_map.eco_attr_name INTO TABLE mt_dedicated_attributes")


   }





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def populate_eco_root_attr_names(is_co_attr_struct:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lr_attribute_map = ty_attribute_map.new

   lv_is_within_recursion = sesf_boolean.new

   if mt_eco_root_attributes .isNotINITIAL()
      ct_eco_node_attributes = mt_eco_root_attributes


      return



   end

   if mt_run_specific_node .isINITIAL()
      raise cx_a1fia_aar_create_qaf_eco.new





   end

   if is_co_attr_struct .isNotSUPPLIED()
      lv_is_within_recursion = abap_false


      assign(to:ls_co_attr_struct)


   else is_co_attr_struct .isNotSUPPLIED()
      assign(to:ls_co_attr_struct)


   end

   DO
   assign(to:lv_co_attr_field_struct)
   if sy.subrc != 0
      break


   end

   assign(to:lv_field_value)
   if sy.subrc == 0
      populate_eco_root_attr_names (_i:{
         "is_co_attr_struct" => lv_co_attr_field_struct,
      }
      , _e:, _c:{
         "ct_eco_node_attributes" => ct_eco_node_attributes,
      }
      ) )



   else sy.subrc == 0
      if sy.subrc == 0
         read_table(id:mt_run_specific_node)

         if sy.subrc == 0
            append(from:lv_co_attr_field_struct,
            to:ct_eco_node_attributes)



         end




      end



   end

   ENDDO
   if lv_is_within_recursion == abap_false
      mt_eco_root_attributes = ct_eco_node_attributes




   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def populate_run_specific_nodes(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lv_node_proxy_name = string.new

   lo_bo_desc = if_esf_bo_desc.new

   lo_bo_node_desc = if_esf_bo_node_desc.new

   lx_esf_metadata_error = cx_esf_metadata_error.new

   #*   Give out the run specific node names which are used in the screens
   if ms_readonly_eco_root.projection_bo_name .isINITIAL()
      raise cx_a1fia_aar_create_qaf_eco.new





   end

   clear(id:mt_run_specific_node)
   append(from:if_fia_acc_adjustment_run.co_bo_node.description,
   to:mt_run_specific_node)
   append(from:if_fia_acc_adjustment_run.co_bo_node.execution,
   to:mt_run_specific_node)
   append(from:if_fia_acc_adjustment_run.co_bo_node.parameters,
   to:mt_run_specific_node)
   append(from:if_fia_acc_adjustment_run.co_bo_node.root,
   to:mt_run_specific_node)
   begin
      lo_bo_desc = cl_esf_descriptor_factory.get_bo_descriptor (in_bo_proxy_name:ms_readonly_eco_root.projection_bo_name)
      )
      loop(at:lo_bo_desc.get_bo_node_descriptors (_i:, _e:, _c:) ),
      into:lo_bo_node_desc)
      {
         lv_node_proxy_name = lo_bo_node_desc.get_proxy_name (_i:, _e:, _c:) )


         if lv_node_proxy_name NP 'SEL_BY_*'
            next



         end


         if lo_bo_node_desc.get_property_value (property_name:if_esf_desc.co_property_enabled)
            ) == abap_true OR lo_bo_node_desc.is_property_value_final (property_name:if_esf_desc.co_property_enabled)
            ) == abap_false
            append(from:lv_node_proxy_name,
            to:mt_run_specific_node)



         end


      }
   rescue cx_esf_metadata_error , => lx_esf_metadata_error
      raise cx_fatal_exception.new

   end
   #*For Reference
   #*FIA_ARPLA_DISC_RUN
   #*FIA_ARPLA_RGRP_RUN
   #*FIA_ARP_LEDGER_ACCT_REM
   #*FIA_BAL_CARFWD_RUN
   #*FIA_CASHLA_FCR_RUN
   #*FIA_FIXED_ASSET_DEPR
   #*FIA_GRIR_CLEARING_RUN
   #*FIA_INVEN_PRICE_CHNG_RUN
   #*FIA_ODCLA_OVERHEAD_RUN
   #*FIA_OHCLA_OVERHEAD_RUN
   #*FIA_OHC_ASSES_RUN
   #*FIA_PRDLA_OVERHEAD_RUN
   #*FIA_SLSLA_ACCRUALS_RUN
   #*FIA_SLSLA_OVERHEAD_RUN
   #*FIA_WIP_CLEARING_RUN
   #*FIA_COB_SETTLEMENT_RUN





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def prepare_core_val_help_retrieve(iv_eco_node_id:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_attribute_map = ty_attribute_map.new

   lt_single_node_id_handle = sesf_bo_node_id_tab.new

   lv_core_bo_table_type = string.new

   lr_table = data.new

   lx_esf_core_service = cx_esf_core_service.new

   clear(id:ev_core_bo_attr_name)
   clear(id:ev_core_bo_node_id)
   clear(id:ev_core_bo_node_id_is_handle)
   clear(id:ev_core_bo_node_name)
   check( mv_eco_root_node_id .isNotINITIAL() AND iv_eco_node_id == mv_eco_root_node_id )
   check( iv_eco_node_name == if_a1fia_aar_create_qaf_eco.co_bo_node.root )
   read_table(id:mt_attribute_map,
   into:ls_attribute_map)
   check( sy.subrc == 0 AND ls_attribute_map.is_dedicated == abap_false )
   check( ls_attribute_map.core_bo_node_name != if_fia_acc_adjustment_run.co_bo_node.root )
   #"see the assumption in the below LCP call ev_core_bo_node_id = ls_attribute_map.core_bo_node_id
   ev_core_bo_attr_name = ls_attribute_map.core_bo_attr_name
   ev_core_bo_node_name = ls_attribute_map.core_bo_node_name
   if ev_core_bo_node_id .isINITIAL()
      ev_core_bo_node_id_is_handle = abap_true


      ev_core_bo_node_id = get_uuid (_i:, _e:, _c:) )


      clear(id:lt_single_node_id_handle)

      append(from:ev_core_bo_node_id,
      to:lt_single_node_id_handle)

      concatenate(ar:['IF_FIA_ACC_ADJUSTMENT_RUN=>TT_',ev_core_bo_node_name],
      into:lv_core_bo_table_type)

      lr_table = ( lv_core_bo_table_type ).new


      assign(to:lt_dummy_data)

      begin
         mo_lcp_bo.retrieve_default_node_values (_i:{
            "in_bo_node_name" => ls_attribute_map.core_bo_node_name,
            "in_node_id_handles" => lt_single_node_id_handle,
            "in_association_name" => ls_attribute_map.core_bo_node_name #"Assumption that the core bo node is directly under Root,
            "in_source_bo_node_name" => if_fia_acc_adjustment_run."Assumption that the core bo node is directly under Root,
            "in_source_node_id" => mv_eco_root_node_id #"Assumption that the core bo node is directly under Root,
            "in_source_node_id_is_handle" => abap_false,
         }
         , _e:{
            "out_data" => lt_dummy_data #"NOT used,
         }
         , _c:) )
      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end



   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def query_sob_by_comp_sob(it_requested_attr:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lx_bsa_runtime = cx_bsa_runtime.new

   lx_esf_core_service = cx_esf_core_service.new

   if mo_sob_lcp .isNotBOUND()
      begin
         mo_sob_lcp = mo_adaptation_handler.get_lcp (if_fia_set_of_books.co_bo_name,) )
      rescue cx_bsa_runtime , => lx_bsa_runtime
         raise cx_fatal_exception.new

      end



   end

   begin
      mo_sob_lcp.query (_i:{
         "in_bo_node_name" => if_fia_set_of_books.co_bo_node.company_assignment,
         "in_query_name" => if_fia_set_of_books.co_query.company_assignment.by_sob_and_company,
         "in_selection_parameters" => it_selection_param,
         "in_requested_attributes" => it_requested_attr,
         "in_fill_data" => abap_true,
      }
      , _e:{
         "out_data" => et_data_comp_activation_stat,
      }
      , _c:) )
      #*   We are intereted only in the active SOB-Company assignments
      if ( ms_readonly_eco_root.projection_bo_name == 'FIA_FIXED_ASSET_DEPR' )
         abap("DELETE et_data_comp_activation_stat WHERE status.activation_status_code = cl_apc_activation_status_code => co_inactive")



      else ( ms_readonly_eco_root.projection_bo_name == 'FIA_FIXED_ASSET_DEPR' )



      end

   rescue cx_esf_core_service , => lx_esf_core_service
      raise cx_fatal_exception.new

   end





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def raise_stop_message(io_message_handler:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_message = cm_esi_root.tt_esi_root.new

   lx_message_handler = cx_esf_message_handler.new

   cl_a1fia_aar_util.create_message (_i:{
      "iv_message_class" => 'A1FIA_ACCOUNTING',
      "iv_message_number" => '103',
      "iv_severity" => cm_esi_root.co_severity_error,
      "iv_lifetime" => cm_esi_root.co_lifetime_transition,
   }
   , _e:, _c:{
      "ct_message" => lt_message,
   }
   ) )
   begin
      io_message_handler.add_messages(_i:{
         "in_messages" => lt_message,
      }
      , _e:)

   rescue cx_esf_message_handler , => lx_message_handler
      raise cx_fatal_exception.new

   end





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def restrict_projectid_value_set(in_selection_parameters:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_sel_params = sesf_selection_parameters_tab.new

   lt_selection_params = sesf_selection_parameters_tab.new

   ls_sel_params = sesf_selection_parameter.new

   lt_target_node_ids = sesf_bo_node_id_tab.new

   mo_pro_bco_lcp = if_esf_lcp.new

   mo_pro_lcp = if_esf_lcp.new

   lx_esf_core_service = cx_esf_core_service.new

   lx_bsa_runtime = cx_bsa_runtime.new

   lt_pro_data = if_pro_protype.tt_root.new

   ls_pro_data = if_pro_protype.ty_root.new

   #* first query the Pro_project BO with the in_selection_parameters (coming from the UI)
   lt_selection_params = in_selection_parameters
   #*exclude projects which are still "in planning" status
   ls_sel_params.attribute_name = if_pro_project_bo_template_sp.co_query_p_attr.root.qu_by_creatn_idty.project_lfcyc_stat_c
   ls_sel_params.option = 'NE'
   ls_sel_params.sign = 'I'
   ls_sel_params.low = '1'
   #"in planning status = 1 append(from:ls_sel_params,
   to:lt_selection_params)
   begin
      mo_pro_lcp = mo_adaptation_handler.get_lcp ('PRO_PROJECT',) )
   rescue cx_bsa_runtime , => lx_bsa_runtime
      raise cx_fatal_exception.new

   end
   begin
      mo_pro_lcp.query(_i:{
         "in_bo_node_name" => if_pro_project_bo_template_sp.co_bo_node.root,
         "in_query_name" => if_pro_project_bo_template_sp.co_query.root.qu_by_creatn_idty,
         "in_selection_parameters" => lt_selection_params,
         "in_fill_data" => abap_false,
      }
      , _e:{
         "out_node_ids" => lt_target_node_ids,
      }
      )

   rescue cx_esf_core_service , => lx_esf_core_service
      raise cx_fatal_exception.new

   end
   if lt_target_node_ids .isNotINITIAL()
      clear(id:lt_selection_params)

      begin
         mo_pro_bco_lcp = mo_adaptation_handler.get_lcp (if_pro_protype.co_bo_name,) )
      rescue cx_bsa_runtime , => lx_bsa_runtime
         raise cx_fatal_exception.new

      end
      #*Checking Public Sector scoping

      DATA ( lv_ps_scope ) = cl_fia_bus_feature_scope_check.is_business_feature_in_scope (iv_business_feature_name:'TOB_PS_PUBLICSECTOR')
      )

      clear(id:ls_sel_params)

      if ms_readonly_eco_root.projection_bo_name == 'FIA_ODCLA_OVERHEAD_RUN'
         ls_sel_params.attribute_name = if_pro_protype.co_query_p_attr.root.query_by_elements.bpv_type_code


         ls_sel_params.option = 'EQ'


         ls_sel_params.sign = 'I'


         ls_sel_params.low = gc_bpvt_code_dir_projects

         #"BPVT code for direct projects is 91
         append(from:ls_sel_params,
         to:lt_sel_params)

         if lv_ps_scope == abap_true
            ls_sel_params.attribute_name = if_pro_protype.co_query_p_attr.root.query_by_elements.bpv_type_code


            ls_sel_params.option = 'EQ'


            ls_sel_params.sign = 'I'


            ls_sel_params.low = gc_bpvt_code_grf_projects

            #"BPVT code for grant funded projects is 546
            append(from:ls_sel_params,
            to:lt_sel_params)



         end



      elsif ms_readonly_eco_root.projection_bo_name == 'FIA_OHCLA_OVERHEAD_RUN'
         append(from:ls_sel_params,
         to:lt_sel_params)


      end


      begin
         mo_pro_bco_lcp.query(_i:{
            "in_bo_node_name" => if_pro_protype.co_bo_node.root,
            "in_query_name" => if_pro_protype.co_query.root.query_by_elements,
            "in_selection_parameters" => lt_sel_params,
            "in_fill_data" => abap_true,
         }
         , _e:{
            "out_data" => lt_pro_data,
         }
         )

      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end

      clear(id:lt_selection_params)

      if lt_pro_data .isNotINITIAL()
         begin
            loop(at:lt_pro_data,
            into:ls_pro_data)
            {
               ls_sel_params.attribute_name = if_pro_project_bo_template_sp.co_query_p_attr.root.qu_by_creatn_idty.type_code.content


               ls_sel_params.option = 'EQ'


               ls_sel_params.sign = 'I'


               ls_sel_params.low = ls_pro_data.code.content


               append(from:ls_sel_params,
               to:lt_selection_params)

            }
         rescue cx_esf_core_service , => lx_esf_core_service
            raise cx_fatal_exception.new

         end



      end

      #*now again call the pro_project query with filtered node ids

      begin
         mo_pro_lcp = mo_adaptation_handler.get_lcp ('PRO_PROJECT',) )
      rescue cx_bsa_runtime , => lx_bsa_runtime
         raise cx_fatal_exception.new

      end

      begin
         mo_pro_lcp.query(_i:{
            "in_bo_node_name" => if_pro_project_bo_template_sp.co_bo_node.root,
            "in_query_name" => if_pro_project_bo_template_sp.co_query.root.qu_by_creatn_idty,
            "in_selection_parameters" => lt_selection_params,
            "in_fill_data" => abap_false,
            "in_filter_node_ids" => lt_target_node_ids,
         }
         , _e:{
            "out_node_ids" => out_value_set_node_ids,
         }
         )

      rescue cx_esf_core_service , => lx_esf_core_service
         raise cx_fatal_exception.new

      end



   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def retrive_sob_root_id_by_node_id(in_node_ids:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lx_bsa_runtime = cx_bsa_runtime.new

   lx_esf_core_service = cx_esf_core_service.new

   lt_attr_sob_id_content = sesf_string_tab.new

   if mo_sob_lcp .isNotBOUND()
      begin
         mo_sob_lcp = mo_adaptation_handler.get_lcp (if_fia_set_of_books.co_bo_name,) )
      rescue cx_bsa_runtime , => lx_bsa_runtime
         raise cx_fatal_exception.new

      end



   end

   append(from:if_fia_set_of_books.co_attr.root.id.content,
   to:lt_attr_sob_id_content)
   begin
      mo_sob_lcp.retrieve (_i:{
         "in_bo_node_name" => if_fia_set_of_books.co_bo_node.root,
         "in_node_ids" => in_node_ids,
         "in_requested_attributes" => lt_attr_sob_id_content,
      }
      , _e:{
         "out_data" => et_data_sob_root,
      }
      , _c:) )
   rescue cx_esf_core_service , => lx_esf_core_service
      raise cx_fatal_exception.new

   end





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def root_node_id_exists(iv_root_node_id:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_node_id = sesf_bo_node_id_tab.new

   lt_dummy_data = if_fia_acc_adjustment_run.tt_root.new

   lt_failed_node_id = sesf_bo_node_id_tab.new

   lx_esf_core_service = cx_esf_core_service.new

   append(from:iv_root_node_id,
   to:lt_node_id)
   begin
      mo_lcp_bo.retrieve (_i:{
         "in_bo_node_name" => if_fia_acc_adjustment_run.co_bo_node.root,
         "in_node_ids" => lt_node_id,
      }
      , _e:{
         "out_data" => lt_dummy_data,
         "out_failed_node_ids" => lt_failed_node_id,
      }
      , _c:) )
   rescue cx_esf_core_service , => lx_esf_core_service
      raise cx_fatal_exception.new

   end
   if lt_failed_node_id .isNotINITIAL()
      rv_root_node_id_exists = abap_false



   else lt_failed_node_id .isNotINITIAL()



   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def set_attr_properties(iv_eco_node_id:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lv_eco_attr_name = string.new

   lx_esf_property_handler = cx_esf_property_handler.new

   loop(at:it_eco_attr_name,
   into:lv_eco_attr_name)
   {
      begin
         io_property_handler.set_attribute_property (_i:{
            "in_attribute_name" => lv_eco_attr_name,
            "in_property_name" => iv_property_name,
            "in_value" => iv_property_value,
            "in_bo_node_id" => iv_eco_node_id,
         }
         , _e:, _c:) )
      rescue cx_esf_property_handler , => lx_esf_property_handler
         raise cx_fatal_exception.new

      end

   }





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def set_root_dedicated_attributes(it_requested_attributes:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   lt_requested_attributes = sesf_string_tab.new

   lv_dedic_attr_name = string.new

   lr_attribute_map = ty_attribute_map.new

   lt_mapped_eco_attr = sesf_string_tab.new

   lt_requested_attributes = it_requested_attributes
   if lt_requested_attributes .isINITIAL()
      lt_requested_attributes = mt_dedicated_attributes




   end

   loop(at:lt_requested_attributes,
   into:lv_dedic_attr_name)
   {
      clear(id:lr_attribute_map)

      read_table(id:mt_attribute_map)

      if sy.subrc == 0 AND lr_attribute_map.is_dedicated == abap_true
         lr_attribute_map.dedicated_exit.fill_dedicated_attribute_val (_i:, _e:, _c:{
            "cs_retrieved_eco_root" => cs_eco_root,
         }
         ) )




      end


   }





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def translate_message_location(is_message_location:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_attribute_map = ty_attribute_map.new

   lv_core_attr = string.new

   clear(id:rs_new_message_location)
   if is_message_location.bo_name == if_a1fia_aar_create_qaf_eco.co_bo_name
      rs_new_message_location = is_message_location


      return



   end

   read_table(id:mt_attribute_map,
   into:ls_attribute_map)
   if sy.subrc != 0
      return



   end

   loop(at:is_message_location.attributes,
   into:lv_core_attr)
   {
      read_table(id:mt_attribute_map,
      into:ls_attribute_map)

      if sy.subrc == 0
         append(from:ls_attribute_map.eco_attr_name,
         to:rs_new_message_location.attributes)



      end


   }
   if rs_new_message_location.attributes .isNotINITIAL()
      rs_new_message_location.bo_name = if_a1fia_aar_create_qaf_eco.co_bo_name


      rs_new_message_location.bo_node_name = if_a1fia_aar_create_qaf_eco.co_bo_node.root


      rs_new_message_location.bo_node_id = mv_eco_root_node_id



   else rs_new_message_location.attributes .isNotINITIAL()
      clear(id:rs_new_message_location)


   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def set_node_n_assoc_read_only(iv_node_name:nil,_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_properties = if_esf_types.ty_properties.new

   lx_esf_property_handler = cx_esf_property_handler.new

   begin
      DATA ( lo_node_desc ) = mo_eco_descriptor.get_bo_node_descriptor (bo_node_proxy_name:iv_node_name)
      )
      DATA ( lt_node_assoc_desc ) = lo_node_desc.get_association_descriptors (_i:, _e:, _c:) )
      loop(at:it_node_ids)
      {
         append(to:ls_properties.node_element_properties)

         ls_node_element_property.node_id = lv_node_id


         ls_node_element_property.property_name = if_esf_property_handler.esf_update_enabled


         ls_node_element_property.property_value = abap_false

         #*       Disable Delete

         append(to:ls_properties.node_element_properties)

         ls_node_element_property.node_id = lv_node_id


         ls_node_element_property.property_name = if_esf_property_handler.esf_delete_enabled


         ls_node_element_property.property_value = abap_false

         #*       Disable Create for sub-nodes

         loop(at:lt_node_assoc_desc,
         into:DATA (lo_node_assoc_desc,) ))
         {
            if lo_node_assoc_desc.is_property_value_final (property_name:if_esf_property_handler.esf_create_enabled)
               ) == abap_false
               append(to:ls_properties.association_properties)

               ls_assoc_property.association_name = lo_node_assoc_desc.get_proxy_name (_i:, _e:, _c:) )


               ls_assoc_property.node_id = lv_node_id


               ls_assoc_property.property_name = if_esf_property_handler.esf_create_enabled


               ls_assoc_property.property_value = abap_false




            end


         }

      }
   rescue cx_esf_metadata_error , => DATA ( lx_esf_metadata_error )
      raise cx_fatal_exception.new

   end
   begin
      io_property_handler.set_properties (ls_properties,) )
   rescue cx_esf_property_handler , => lx_esf_property_handler
      raise cx_fatal_exception.new

   end





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def is_floorplan_editable(_i:,_e:)
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   if ms_readonly_eco_root.id.content .isINITIAL()
      rv_is_editable = abap_true



   else ms_readonly_eco_root.id.content .isINITIAL()



   end






   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_bsa_cb_message_mapping.adjust_messages
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   adjust_messages_int (_i:, _e:, _c:{
      "ct_message_map" => inout_messages,
   }
   ) )





   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end
def if_bsa_cb_path.resolve
   ###################################
   # setup importing parameter
   _i.each{|k,v| eval("#{k} = #{v}")} if _i
   ###################################



   ls_link = sesf_association_link.new

   lt_fia_fav_sls_srv_data = if_fia_fav_sls_srv_doc.tt_root.new

   lr_fia_fav_sls_srv_data = if_fia_fav_sls_srv_doc.ty_root.new

   lo_lcp = if_esf_lcp.new

   lt_sngle_trgt_node_id = sesf_bo_node_id_tab.new


   #"To store SalesOrder/ServiceOrder..UUID lv_source_node_id = sesf_bo_node_id.new

   lv_target_node_id = sesf_bo_node_id.new


   lv_bo_name = string.new

   lt_message = cm_esi_root.tt_esi_root.new

   lr_table_data = data.new

   lt_eco_message = cm_esi_root.tt_esi_root.new

   clear(id:out_data)
   clear(id:out_links)
   clear(id:out_messages)
   clear(id:out_sync_notifications)
   case in_path_callback_id
   when 'SAL_ORD'
      lv_object_type_code = if_ap_object_type_code_c.gc_sales_order
      lv_bo_name = 'SALES_ORDER'
   when 'SER_ORD'
      lv_object_type_code = if_ap_object_type_code_c.gc_service_order
      lv_bo_name = 'SERVICE_ORDER'
   when 'CUST_RET'
      lv_object_type_code = if_ap_object_type_code_c.gc_customer_return
      lv_bo_name = 'CUSTOMER_RETURN'
   when 'SER_CONF'
      lv_object_type_code = if_ap_object_type_code_c.gc_service_confirmation
      lv_bo_name = 'SERVICE_CONFIRMATION'
   end
   append(from:lines,
   to:lt_fia_fav_sls_srv_data)
   read_table(id:lt_fia_fav_sls_srv_data)
   if sy.subrc == 0
      read_table(id:in_node_ids,
      into:lv_source_node_id,
      index:1)

      read_table(id:lt_fia_fav_sls_srv_data)

      if sy.subrc == 0
         append(from:lr_fia_fav_sls_srv_data.operational_document_reference.uuid,
         to:lt_single_uuid_key)



      end


      if lt_single_uuid_key .isNotINITIAL()
         begin
            if in_fill_data == abap_true AND out_data .isSUPPLIED()
               assign(to:lt_data)


            else in_fill_data == abap_true AND out_data .isSUPPLIED()
               assign(to:lt_data)


            end

            mo_adaptation_handler.get_lcp(_i:{
               "in_bo_name" => lv_bo_name,
            }
            , _e:)

            lo_lcp.convert_keys(_i:{
               "in_bo_node_name" => 'ROOT',
               "in_source_key_name" => 'UUID',
               "in_target_key_name" => if_esf_types.co_node_id_proxy_name,
               "in_source_keys" => lt_single_uuid_key,
            }
            , _e:{
               "out_target_keys" => lt_sngle_trgt_node_id,
            }
            )

            read_table(id:lt_sngle_trgt_node_id,
            into:lv_target_node_id,
            index:1)
            if lv_target_node_id .isNotINITIAL()
               lo_lcp.retrieve(_i:{
                  "in_bo_node_name" => 'ROOT',
                  "in_node_ids" => lt_sngle_trgt_node_id,
               }
               , _e:{
                  "out_data" => lt_data,
                  "out_messages" => lt_message,
               }
               )



               if lt_data .isINITIAL()
                  clear(id:out_links)


               else lt_data .isINITIAL()
                  append(from:ls_link,
                  to:out_links)


               end


               add_mapped_messages_int (_i:{
                  "it_message" => lt_message,
               }
               , _e:{
                  "et_eco_message" => lt_eco_message,
               }
               , _c:) )


               append(from:lines,
               to:out_messages)



            end

         rescue cx_sy_create_data_error ,
            #"Do nothing carry on without out_links filled clear(id:out_data)
            clear(id:out_links)
         end



      end

      #"IF lt_sngle_trgt_node_id IS NOT INITIAL.


   end

   #"IF sy-subrc EQ 0.




   ###################################
   # setup exporting
   _exp = {}
   _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

   return {:exp=>_exp}
   ###################################


end


end