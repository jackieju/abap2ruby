class Cl_a1fia_acproerr_qaf_eco < cl_a1fia_common_eco

   def if_esf_provider_access.retrieve(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      ls_out_data = if_a1fia_acproerr_qaf_eco.ty_application_log_item.new

      lt_node_ids_source = sesf_bo_node_id_tab.new

      lt_out_failed_source_node_ids = sesf_bo_node_id_tab.new

      lt_out_messages = if_esf_types.ty_messages.new

      lt_acprer_root = if_a1fia_acproerr_qaf_eco.tt_root.new

      #* result of association from AppLogCO-Root to AppLogCO-Overview:
      lt_out_links_applog_rt_2_ovv = sesf_association_link_tab.new

      #* overview item node of the AppLogCO:
      lt_applog_ovv_item = ::itsam::if_app_log_co.tt_overview_item.new

      #* item_message_attribute: contains number of variable (1-4) im message and its type as BO node element name:
      ls_applog_ovv_item = ::itsam::if_app_log_co.ty_overview_item.new

      #"cx_fia_acc_exception, lx_esf_core_service = cx_esf_core_service.new

      case in_bo_node_name
      when if_a1fia_acproerr_qaf_eco.co_bo_node.root
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
            "out_data" => lt_acprer_root,
            "out_failed_node_ids" => out_failed_node_ids,
         }
         )

         if lt_acprer_root .isNotINITIAL()
            loop(at:lt_acprer_root)
            {
               if ls_acprer_root.status.acc_notif_list_cons_stcode == '3'
                  ls_acprer_root.error_resolution_proc_stcode = '3'

                  #"Finish

               elsif ls_acprer_root.status.sgl_acc_notif_list_proc_stcode == '2' OR #"In process ls_acprer_root.status.error_resolution_proc_stcode == '3'

                  #" In process
               else ls_acprer_root.status.sgl_acc_notif_list_proc_stcode == '2' OR #"In process ls_acprer_root.status.error_resolution_proc_stcode == '3'

                  #"Not Started

               end


            }

            lt_acprer_root = enrich_retrieved_data (lt_acprer_root,) )


            MOVE lt_acprer_root TO out_data




         end

      when if_a1fia_acproerr_qaf_eco.co_bo_node.application_log_item
         #*********************************************************************************************
         #* Step 1: Get root node id of appliction log (from association AccNotif-root -> AppLog-Root)
         #*********************************************************************************************
         #*****************  Correction Begin
         REFRESH lt_node_ids_source
         lt_out_links = sesf_association_link_tab.new

         lr_link = sesf_association_link.new

         begin
            mo_applog_sp_lcp.retrieve_root_node_id (_i:{
               "in_bo_node_name" => ::itsam::if_app_log_co.co_bo_node.overview_item,
               "in_node_ids" => in_node_ids,
            }
            , _e:{
               "out_links" => lt_out_links,
            }
            , _c:) )
         rescue cx_esf_core_service , => lx_esf_core_service
            raise cx_fatal_exception.new

         end
         read_table(id:lt_out_links,
         index:1)
         if sy.subrc == 0
            abap("INSERT lr_link.target_node_id INTO TABLE lt_node_ids_source")



         else sy.subrc == 0
            break

         end

         #*****************  Correction End
         begin
            #*******************************************************************************************************
            #* Step 2: Get the Overview NodeID of application log CO
            #*        (from association AppLogCO-Root -> AppLogCO-OverviewItem):
            #*******************************************************************************************************
            #*     call association AppLogCO-Root to AppLogCO-Overview:
            mo_applog_sp_lcp.retrieve_by_association(_i:{
               "in_bo_node_name" => ::itsam::if_app_log_co."Root,
               "in_association_name" => ::itsam::if_app_log_co."Root->Overview,
               "in_node_ids" => lt_node_ids_source #"root node of AppLog,
               "in_fill_data" => abap_false,
               "in_edit_mode" => in_edit_mode,
            }
            , _e:{
               "out_links" => lt_out_links_applog_rt_2_ovv,
               "out_failed_source_node_ids" => lt_out_failed_source_node_ids,
               "out_messages" => lt_out_messages,
            }
            )

            mo_message_manager.add_messages(_i:{
               "it_messages" => lt_out_messages,
            }
            , _e:)

         rescue cx_esf_core_service , => lx_esf_core_service
            raise cx_fatal_exception.new

         end
         if ! ( lt_out_failed_source_node_ids .isINITIAL() )
            raise cx_fatal_exception.new





         end

         REFRESH lt_node_ids_source
         #* probably(?), there can be several AppLogCO-Overview nodes belonging to one ApplogCO-Root:
         loop(at:lt_out_links_applog_rt_2_ovv)
         {
            append(from:ls_out_links_applog_rt_2_ovv.target_node_id,
            to:lt_node_ids_source)

         }
         begin
            #*     call association AppLogCO-Overview to AppLog-OverviewItem:
            mo_applog_sp_lcp.retrieve_by_association(_i:{
               "in_bo_node_name" => ::itsam::if_app_log_co."Overview,
               "in_association_name" => ::itsam::if_app_log_co."Overview->OverviewItem,
               "in_node_ids" => lt_node_ids_source #"Overview nodes of AppLog,
               "in_fill_data" => abap_true #"read node data!,
               "in_edit_mode" => in_edit_mode,
            }
            , _e:{
               "out_data" => lt_applog_ovv_item,
               "out_failed_source_node_ids" => lt_out_failed_source_node_ids,
               "out_messages" => lt_out_messages,
            }
            )

         rescue cx_esf_core_service , => lx_esf_core_service
            raise cx_fatal_exception.new

         end
         loop(at:lt_applog_ovv_item,
         into:ls_applog_ovv_item)
         {
            ls_out_data.node_id = ls_applog_ovv_item.node_id


            ls_out_data.parent_node_id = ls_applog_ovv_item.parent_node_id

            #*   data:

            ls_out_data.log_item = ls_applog_ovv_item.log_item

            #*   the AppLogCO does currently not fill the OverviewItem-LogItem-SeverityCode;
            #*   but in the UI of the AccNotif, the LogItem-SeverityCode is displayed;
            #*   The AppLogCO instead fills the field OverviewItem-MaximumLogItemSeverityCode;
            #*   In general, the MaximumSeverity is the maximum severity of all messages on subnodes;
            #*   => For single messages (that is, in our case), these two fields contain the same value;
            #*   to avoid changes in the UI, fill the LogItem-Severity with the MaximumSeverity
            #*   (which is -as said- the same value):

            ls_out_data.log_item.severity_code = ls_applog_ovv_item.maximum_log_item_severity_code


            abap("INSERT ls_out_data INTO TABLE out_data")


         }
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



      super.if_esf_provider_access.retrieve_by_association(_i:{
         "in_bo_name" => in_bo_name,
         "in_bo_node_name" => in_bo_node_name,
         "in_association_name" => in_association_name,
         "in_node_ids" => in_node_ids,
         "in_fill_data" => in_fill_data,
         "in_filter_parameters" => in_filter_parameters,
         "in_filtered_attributes" => in_filtered_attributes,
         "in_requested_image" => in_requested_image,
         "in_edit_mode" => in_edit_mode,
         "in_requested_attributes" => in_requested_attributes,
         "in_message_handler" => in_message_handler,
         "in_buffer_sync_handler" => in_buffer_sync_handler,
      }
      , _e:{
         "out_links" => out_links,
         "out_data" => out_data,
         "out_failed_source_node_ids" => out_failed_source_node_ids,
      }
      )

      #*  CASE in_association_name.
      #*
      #*    WHEN if_a1fia_acproerr_qaf_eco=>co_assoc-accnotif_assignment-application_log_item.
      #*
      #*      CALL METHOD super->if_esf_provider_access~retrieve_by_association
      #*        EXPORTING
      #*          in_bo_name                 = in_bo_name
      #*          in_bo_node_name            = in_bo_node_name
      #*          in_association_name        = in_association_name
      #*          in_node_ids                = in_node_ids
      #*          in_fill_data               = abap_false
      #*          in_filter_parameters       = in_filter_parameters
      #*          in_filtered_attributes     = in_filtered_attributes
      #*          in_requested_image         = if_esf_types=>co_image_transactional_buffer
      #*          in_edit_mode               = in_edit_mode
      #*          in_requested_attributes    = in_requested_attributes
      #*          in_message_handler         = in_message_handler
      #*          in_buffer_sync_handler     = in_buffer_sync_handler
      #*        IMPORTING
      #*          out_links                  = out_links
      #*          out_data                   = out_data
      #*          out_failed_source_node_ids = out_failed_source_node_ids.
      #*
      #*    WHEN OTHERS.
      #*
      #*      CALL METHOD super->if_esf_provider_access~retrieve_by_association
      #*        EXPORTING
      #*          in_bo_name                 = in_bo_name
      #*          in_bo_node_name            = in_bo_node_name
      #*          in_association_name        = in_association_name
      #*          in_node_ids                = in_node_ids
      #*          in_fill_data               = in_fill_data
      #*          in_filter_parameters       = in_filter_parameters
      #*          in_filtered_attributes     = in_filtered_attributes
      #*          in_requested_image         = if_esf_types=>co_image_transactional_buffer
      #*          in_edit_mode               = in_edit_mode
      #*          in_requested_attributes    = in_requested_attributes
      #*          in_message_handler         = in_message_handler
      #*          in_buffer_sync_handler     = in_buffer_sync_handler
      #*        IMPORTING
      #*          out_links                  = out_links
      #*          out_data                   = out_data
      #*          out_failed_source_node_ids = out_failed_source_node_ids.
      #*
      #*
      #*  ENDCASE.





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



      lo_lcp_facade = if_esf_lcp_facade.new

      lx_esf_core_service = cx_esf_core_service.new

      lo_ex = cx_root.new

      begin
         super.if_esf_provider_init.init(_i:{
            "in_provider_context" => in_provider_context,
            "in_bo_name" => in_bo_name,
         }
         , _e:)

         mo_lcp_task = mo_adaptation_handler.get_lcp (in_bo_name:if_task.co_bo_name)
         )
         #*     get a LCP instance of the BO Application Log:
         mo_applog_sp_lcp = mo_adaptation_handler.get_lcp (::itsam::if_app_log_co.co_bo_name,) )
         mo_lcp_facade = in_provider_context.get_lcp_facade (_i:, _e:, _c:) )
         #*
         #*      TRY.
         #*          mo_lcp_accproerr = lo_lcp_facade->get_lcp( if_fia_accnotif=>co_bo_name ).
         #*
         #*        CATCH cx_esf_core_service  INTO  lx_esf_core_service.
         #*
         #*          RAISE EXCEPTION TYPE cx_fatal_exception
         #*            EXPORTING
         #*              previous = lx_esf_core_service.
         #*      ENDTRY.
         #*      MO_LCP_ACCNOTIF = mo_adaptation_handler->get_lcp( in_bo_name = if_fia_accnotif=>co_bo_name ).
         #** for accessing the application log:
         #*      create object mo_applog_access
         #*        exporting
         #*          iv_host_bo_name   = if_fia_accnotif=>co_bo_name       "name of the core BO because it hosts the assoc. to the appl log
         #*          iv_host_node_name = if_fia_accnotif=>co_bo_node-root
         #*          iv_assoc_name     = if_fia_accnotif=>co_assoc-root-application_log
         #*          io_host_sp_lcp    = MO_LCP_ACCNOTIF.
         #*
         #** delegate the INIT method call to the service provider of the application log node:
         #*      CALL METHOD mo_applog_access->if_esf_provider_init~init
         #*        EXPORTING
         #*          in_provider_context = in_provider_context
         #*          in_bo_name          = in_bo_name.
         #*
      rescue cx_bsa_runtime , => lo_ex
         raise cx_fatal_exception.new

      end
      add_node_for_heuristic_rrnid (if_a1fia_acproerr_qaf_eco.co_bo_node.accnotif_assignment,) )
      add_node_for_heuristic_rrnid (if_a1fia_acproerr_qaf_eco.co_bo_node.application_log_item,) )





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_query.query(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      if in_query_name != if_a1fia_acproerr_qaf_eco.co_query.accnotif_assignment.query_by_elements
         super.if_esf_provider_query.query (_i:{
            "in_bo_node_name" => in_bo_node_name,
            "in_query_name" => in_query_name,
            "in_selection_parameters" => in_selection_parameters,
            "in_query_options" => in_query_options,
            "in_authorization_context" => in_authorization_context,
            "in_message_handler" => in_message_handler,
            "in_fill_data" => in_fill_data,
            "in_filter_node_ids" => in_filter_node_ids,
            "in_requested_attributes" => in_requested_attributes,
         }
         , _e:{
            "out_node_ids" => out_node_ids,
            "out_data" => out_data,
            "out_query_info" => out_query_info,
         }
         , _c:) )

         #* Todo: Query is not needed. Must be deleted in MDRS Repository


      else in_query_name != if_a1fia_acproerr_qaf_eco.co_query.accnotif_assignment.query_by_elements
         clear(id:out_query_info)


      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def if_esf_provider_query.retrieve_default_query_param(_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      if in_query_name != if_a1fia_acproerr_qaf_eco.co_query.accnotif_assignment.query_by_elements
         super.if_esf_provider_query.retrieve_default_query_param (_i:{
            "in_bo_node_name" => in_bo_node_name,
            "in_query_name" => in_query_name,
         }
         , _e:{
            "out_selection_parameters" => out_selection_parameters,
         }
         , _c:) )

         #* Todo: Query is not needed. Must be deleted in MDRS Repository


      else in_query_name != if_a1fia_acproerr_qaf_eco.co_query.accnotif_assignment.query_by_elements
         clear(id:out_selection_parameters)


      end






      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def determine_rcause_ui_indicator(iv_accpe_node_id:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lv_accpe_uuid_proxy = apc_v_uuid.new

      lo_message = cx_root.new

      ls_t100key = scx_t100key.new

      lv_msgv1 = sychar255.new

      lv_msgv2 = sychar255.new

      lv_msgv3 = sychar255.new

      lv_msgv4 = sychar255.new

      lv_classname = sychar30.new

      lv_methodname = sychar30.new

      lx_exception = cx_root.new

      lv_admin_parameter_exists = syboolean.new

      #* Coding Switch: Root Error Cause Navigation must be activated
      rv_rcause_ui_ind = abap_false
      CL_FIA_I2DERROR_BTM_UTIL.ADM_CHECK_PARM(_i:{
         "iv_adm_parm" => 'APE_RCAUSE_NAVIGATION',
      }
      , _e:)

      check( lv_admin_parameter_exists == abap_true )
      #* Get the Error Message according to the Accounting Processing Error BO
      lv_classname = 'CL_FIA_ACCPE_UTILITIES'
      lv_methodname = 'GET_MESSAGE_OF_ACCPE_4UI_NAVIG'
      lv_accpe_uuid_proxy.content = iv_accpe_node_id
      begin
         lv_classname.lv_methodname(_i:{
            "iv_accpe_uuid" => lv_accpe_uuid_proxy,
         }
         , _e:{
            "eo_message" => lo_message,
            "es_t100key" => ls_t100key,
            "ev_msgv1" => lv_msgv1,
            "ev_msgv2" => lv_msgv2,
            "ev_msgv3" => lv_msgv3,
            "ev_msgv4" => lv_msgv4,
         }
         )

      rescue cx_sy_dyn_call_illegal_class , cx_sy_dyn_call_illegal_method , cx_sy_dyn_call_param_missing , cx_sy_dyn_call_param_not_found , => lx_exception
         rv_rcause_ui_ind = abap_false
         return
      end
      #* Determine Application Class for the Root Cause Navigation
      #* Todo: Must be replaced by a BADI
      case ls_t100key.msgid
      when 'FIA_SLSLA_I2D'
         lv_classname = 'CL_A1FIA_SLSLA_UI_NAVIG'
      when 'FIA_MASTER_DATA'
         lv_classname = 'CL_A1FIA_APE2MAT_UI_NAVIG'
         #*   There is no Root Cause Navigation
      else
         rv_rcause_ui_ind = abap_false
         return
      end
      #* Call the Application whether a Root Cause UI exists
      lv_methodname = 'GET_ROOT_CAUSE_UI_INDICATOR'
      begin
         lv_classname.lv_methodname(_i:{
            "io_lcp_facade" => mo_lcp_facade,
            "io_message" => lo_message,
            "is_t100key" => ls_t100key,
            "iv_msgv1" => lv_msgv1,
            "iv_msgv2" => lv_msgv2,
            "iv_msgv3" => lv_msgv3,
            "iv_msgv4" => lv_msgv4,
         }
         , _e:)

         #*   Dynamic Call is wrong: No nativation Target
      rescue cx_sy_dyn_call_illegal_class , cx_sy_dyn_call_illegal_method , cx_sy_dyn_call_param_missing , cx_sy_dyn_call_param_not_found , => lx_exception
         rv_rcause_ui_ind = abap_false
         return
      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end
   def enrich_retrieved_data(it_accpe_qaf:nil,_i:,_e:)
      ###################################
      # setup importing parameter
      _i.each{|k,v| eval("#{k} = #{v}")} if _i
      ###################################



      lr_accpe_qaf = if_a1fia_acproerr_qaf_eco.ty_root.new

      lv_user_account_id = apc_c_user_account_id.new

      lv_determine_navigation = syboolean.new

      #* Initialization
      rt_accpe_qaf = it_accpe_qaf
      #* Determine Navigation for Root cause only if single select mode
      if lines (rt_accpe_qaf,) ) <= 1
         lv_determine_navigation = abap_true




      end

      #* Process the enrich per each entry
      loop(at:rt_accpe_qaf)
      {
         if lv_determine_navigation == abap_true
            lr_accpe_qaf.error_cause_ui_ind = determine_rcause_ui_indicator (lr_accpe_qaf.node_id,) )




         end

         #*   Display User Name (Created By)

         lv_user_account_id = lr_accpe_qaf.creation_user_account_id.content


         cl_a1fia_concatenate_user_name.concatenate_user_name (_i:{
            "iv_user_account_name" => lr_accpe_qaf.creation_user_name,
            "iv_user_account_id" => lv_user_account_id,
            "iv_technical_user_indicator" => lr_accpe_qaf.creation_tech_user_ind,
         }
         , _e:{
            "ev_user_display_name" => lr_accpe_qaf.created_by_user_display_name,
         }
         , _c:) )

         #*   Display User Name (Changed By)

         lv_user_account_id = lr_accpe_qaf.last_changed_user_account_id.content


         cl_a1fia_concatenate_user_name.concatenate_user_name (_i:{
            "iv_user_account_name" => lr_accpe_qaf.last_changed_user_name,
            "iv_user_account_id" => lv_user_account_id,
            "iv_technical_user_indicator" => lr_accpe_qaf.last_changed_tech_user_ind,
         }
         , _e:{
            "ev_user_display_name" => lr_accpe_qaf.changed_by_user_display_name,
         }
         , _c:) )


      }





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



      lv_no_of_tasks = i.new

      lt_open_tasks = sesf_association_link_tab.new

      ls_open_task = sesf_association_link.new

      ls_node_id = sesf_bo_node_id.new

      ls_task_id = sesf_bo_node_id.new

      out_task_ids = sesf_bo_node_id_tab.new

      lt_task_ids = sesf_bo_node_id_tab.new

      lt_parameters = if_esf_provider_query.tt_selection_parameters.new


      lc_bo_name = string.new

      lc_bo_namespace = string.new

      assign(to:query_parameter)
      case in_path_callback_id
      when 'ROOT_TASK'
         #"defined in BSA metadata read_table(id:in_node_ids,
         into:ls_node_id,
         index:1)
         ls_parameter.sign = 'I'
         ls_parameter.option = 'EQ'
         #* Select only Active Tasks
         ls_parameter.attribute_name = query_parameter.active_tasks_only_indicator
         ls_parameter.low = abap_true
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.task_bus_obj_node_tech_ref.object_node_technical_id
         ls_parameter.low = ls_node_id
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.task_bus_obj_node_tech_ref.object_node_name
         ls_parameter.low = 'ROOT'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.task_bus_obj_node_tech_ref.object_name
         ls_parameter.low = lc_bo_name
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.task_bus_obj_node_tech_ref.object_namespace_uri.content
         ls_parameter.low = lc_bo_namespace
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.business_object_reference_type
         ls_parameter.low = 1
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.type_uuid.content
         ls_parameter.low = '0017A44CDE471DDCBABFBD20CFABD029'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DDCBABFE9051DCD48CE'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DDCBABFF8C1B5A408CE'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DDCBAC017BAEB5C5ACB'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DDCBAC02179FF1A07DC'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DECBAC0075EE2AE4E54'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DECBAC02A34CAE15A84'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.low = '0017A44CDE471DECBAC0328FC7A089FB'
         append(from:ls_parameter,
         to:lt_parameters)
         ls_parameter.attribute_name = query_parameter.business_object_reference_type
         ls_parameter.low = 3
         append(from:ls_parameter,
         to:lt_parameters)
         ex = cx_root.new

         begin
            #*          lo_lcp_task = mo_adaptation_handler->get_lcp( in_bo_name = if_task=>co_bo_name ). "Core BO
            mo_lcp_task.query(_i:{
               "in_bo_node_name" => if_task.co_bo_node.root,
               "in_query_name" => if_task.co_query.root.query_by_business_object,
               "in_selection_parameters" => lt_parameters,
            }
            , _e:{
               "out_node_ids" => lt_task_ids,
            }
            )

            if lt_task_ids .isINITIAL()
               read_table(id:lt_parameters)

               ls_parameter.low = abap_false

               #*        APPEND ls_parameter TO lt_parameters.

               mo_lcp_task.query(_i:{
                  "in_bo_node_name" => if_task.co_bo_node.root,
                  "in_query_name" => if_task.co_query.root.query_by_business_object,
                  "in_selection_parameters" => lt_parameters,
               }
               , _e:{
                  "out_node_ids" => lt_task_ids,
               }
               )





            end

            if ! lt_task_ids .isINITIAL()
               read_table(id:lt_task_ids,
               into:ls_task_id,
               index:1)

               clear(id:lt_task_ids)

               append(from:ls_task_id,
               to:lt_task_ids)

               ls_open_task.target_node_id = ls_task_id


               ls_open_task.source_node_id = ls_node_id


               append(from:ls_open_task,
               to:lt_open_tasks)

               if in_fill_data == abap_true AND lt_task_ids .isNotINITIAL()
                  mo_lcp_task.retrieve(_i:{
                     "in_bo_node_name" => if_task."Core BO,
                     "in_node_ids" => lt_task_ids,
                     "in_edit_mode" => in_edit_mode,
                     "in_requested_image" => in_requested_image,
                     "in_requested_attributes" => in_requested_attributes,
                  }
                  , _e:{
                     "out_data" => out_data,
                     "out_messages" => out_messages,
                     "out_sync_notifications" => out_sync_notifications,
                  }
                  )





               end


               MOVE lt_open_tasks TO out_links



            else ! lt_task_ids .isINITIAL()
               return


            end

         rescue cx_bsa_runtime , => ex
            raise cx_fatal_exception.new

         rescue cx_esf_core_service , => ex
            #*        raise exception type cx_fatal_exception exporting previous = ex.
            #*        Ignore the error as suggested in the note (1141539) from FSI
            clear(id:lt_task_ids)
         end
      end





      ###################################
      # setup exporting
      _exp = {}
      _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

      return {:exp=>_exp}
      ###################################


   end


end
