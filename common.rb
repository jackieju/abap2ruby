load 'rbeautify.rb'

def write_class(ruby_filename, class_template)
    # s = class_template
    p "write class to file #{ruby_filename}"
    s = RBeautify.beautify_string(class_template)
    p s
    
    begin
        FileUtils.makedirs(File.dirname(ruby_filename))
        
         aFile = File.new(ruby_filename, "w+")
         aFile.puts s[0]
         aFile.close
     rescue Exception=>e
         p e
     end
     # RBeautify.beautify_file(ruby_filename)
     p "done"
end
def pp(m, stack=0)

    m = format_msg(m, "", stack)
    # puts m
    begin
        put m
    rescue Exception=>e
         print "#{m}\n"
    end
end

def debug(s)
    p s
end

def pdebug(s, stack=0)
    depth = 0
    sp = ""
    begin
        raise Exception.new
    rescue Exception=>e
        e.backtrace.each{|b|
            if b =~ /in `C'/
                # p "====got botoom====total #{e.backtrace.size}"
                break
            else
                depth += 1
                sp += "-+"
            end
        }
        
    end
    
    m = "{#{sp}#{depth}}#{s}"
    if stack>0
        m = format_msg(m, "", stack)
    end
    
    debug(m)
    
end

def dump_one_as_ruby(v, module_name=nil)
    pp "dump ruby for #{v.class_name}@#{v}, #{module_name}", 20
   # pp "dump #{v.inspect}", 10
            s_methods =""
            v.methods.each{|k,v|
                p "#{k}, #{v[:decoration]}"
                # p "       methods signature:#{k}"
                # p "       methods name:#{v[:name]}"
                # p "       src:#{v[:src]}" 
                method_name = v[:name]
                # if method_name =~ /SetJournalDocumentNumber/
                #     p "--->src111:#{v[:src]}"
                # end
                if v[:decoration] =~ /static/
                    method_name = "self.#{v[:name]}"
                end
            
            
                if v[:src] #&& v[:src].strip != ""
                    p "src:#{v[:src]}"
                    method_template =<<HERE
                def #{method_name}#{v[:head]}#{v[:src]}
                end
HERE
                else
                    next
                end
                s_methods += method_template

            }
            # p "==>methods:#{methods}"
            class_name = v.class_name
            includings = ""
            v.includings.each{|inc|
                includings += "include #{inc}\n"
            }
            if class_name == "::"
                    class_name ="_global_"
                    class_template = <<HERE
                    #{s_methods}
                    #{v.src}
HERE
            else
                if (module_name && module_name != "")
                    class_name = "#{module_name}::#{class_name}"
                end
                if v.class == ModuleDef
                    class_template =<<HERE
                module #{class_name}
                    #{includings}
                 #{s_methods}
                 #{v.src}
                end
HERE
                else
                    
                    if v.parent
                        class_template =<<HERE
                class #{class_name} < #{v.parent}
                    #{includings}
                #{s_methods}
                 #{v.src}
                end
HERE
                    else
                        class_template =<<HERE
                class #{class_name}
                    #{includings}
                 #{s_methods}
                 #{v.src}
                end
HERE
                    end
                end
            end
            
            wfname = ""
            wfname += "#{$output_dir}/" if $output_dir && $output_dir != ""
            #if module_name && module_name != ""
            #    p "module_name:#{module_name}"
            #    
            #    mds = module_name.split("::")
            #    p "mds:#{mds}"
            #    mpath = mds.join("/")
            #    wfname += "#{mpath}/"
            #end
           # wfname +=  "#{v.class_name.downcase}.rb"
           wfname +=  "#{class_name.gsub("::","/").downcase}.rb"
            #if $output_dir && $output_dir != ""
            #    wfname = "#{$output_dir}/#{class_name.downcase}.rb"
            #else
            #    wfname = "#{class_name.downcase}.rb"
            #end
            write_class(wfname, class_template)
            $output_filelist = [] if !$output_filelist
            $output_filelist.push(wfname)
end
#def dump_module_as_ruby(moduleDef, module_name=nil)
#    v =moduleDef
#    dump_classes_as_ruby(v.classes) if v.classes && v.classes.size > 0
#    dump_one_as_ruby(v, module_name)
#end
def dump_classes_as_ruby(classdefs, module_name=nil)
 #   p "dump222 #{classdefs.inspect}"
        classdefs.each{|k,v|
            p "class #{k}"
            p "       type: #{v.name} #{v.class}"
            p "       class name: #{v.class_name}"
#            p "       parent: #{v.parent}"
            p "       parentScope: #{v.parentScope}@#{v.parentScope}" if v.parentScope
            p "       modules: #{v.modules.keys}"
            p "       classes: #{v.classes.size}"
            p "       methods: #{v.methods.size}"
            p "       src: #{v.src}" if v.src
            m=""
            if v.is_a?(ModuleDef)
                p "--->333"
              # dump_module_as_ruby(v, module_name)
              
              if (module_name && module_name != "" && module_name != "::")
                  m = "#{module_name}::"
              else
                  m =""
              end
              
              m += v.class_name if v.class_name != "::"
              dump_classes_as_ruby(v.classes, m) if v.classes && v.classes.size > 0
              
              dump_classes_as_ruby(v.modules, m) if v.modules && v.modules.size > 0
              
            end
            dump_one_as_ruby(v, module_name)
            
        }
        
        
end
def is_number?(s)
    s =~ /^\d+\w?$/
end