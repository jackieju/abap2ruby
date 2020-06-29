load "cr_parser.rb"

class CRRParser < CRParser
    def getSymValue(sym)
        @scanner.GetSymString(sym)
    end
    def GetNextSym(step =1)
        _scanner = @scanner.clone()
      #  p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
              #  p "==>scanner clone2 =#{_scanner.inspect}"
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _scanner.nextSym
    end
    def GetNext(step =1)
        _scanner = @scanner.clone()
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _sym
    end
    def GetNextSymFromSym(sym, step =1)
        _scanner = @scanner.clone()
        _scanner.currLine = sym.line
        _scanner.currCol = sym.col
        _scanner.buffPos = sym.pos+sym.len-1
        _scanner.Scan_NextCh
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                p "==>8888:#{_sym}, #{_scanner.nextSym.sym}, #{getSymValue(_scanner.nextSym)}"
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _scanner.nextSym
    end
    def GetNextFromSym(sym, step =1)
        _scanner = @scanner.clone()
        _scanner.currLine = sym.line
        _scanner.currCol = sym.col
        _scanner.buffPos = sym.pos+sym.len-1
        _scanner.Scan_NextCh
        
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _sym
    end
    def curLine()
        @scanner.currLine
    end
    def curCol()
        @scanner.currCol
    end
    

    def curString() # current string means value of nextsym
        # ret = @scanner.GetName()
        ret = @scanner.GetSymValue(@scanner.nextSym)

        if @scanner.nextSym.sym == C_identifierSym

            ret = ret.downcase if IGNORECASE  
        end
        # p "------#{@scanner}"
        return ret
    end
    def prevString() # previous string means value of currsym
        # ret = @scanner.GetName()
        ret = @scanner.GetSymValue(@scanner.currSym)
        if @scanner.currSym.sym == C_identifierSym

            ret = ret.downcase if IGNORECASE  
        end
        # p "------#{@scanner}"
        return ret
    end
    alias :prevName :prevString
    def nextString()
        ret = @scanner.GetNextName()
        p "------#{ret}"
        return ret
    end
    def getSymValue(sym)
        @scanner.GetSymString(sym)
    end
    def curSym()
        @scanner.nextSym
    end
    # def Parse()
    #     @scanner->Reset()
    #     Get()
    #     C()
    # end
    def pclass
        p "=====classdefs====="
          @classdefs.each{|k,v|
                                     p "classdef #{k}=#{v}"
            }
            p "=====classdefs end====="
            
    end
    
    # print stats
    def ps(msg =nil)
        tr = ""
        begin
            raise Exception.new
        rescue Exception=>e
            tr =  e.backtrace[1]
        end
        if msg
            p "==>st:#{msg} (sym:#{@sym}, #{curString()} @#{tr}"
        else
            p "==>st:sym:#{@sym}, #{curString()} @#{tr}"
        end
    end
    
    def status
        "sym:#{@sym}(#{SYMS[@sym]}), val #{curString()}, #{@scanner.buffer[@scanner.buffPos..@scanner.buffPos+10]} "
    end
    
    def dump_buffer_to_file(fname)
        save_to_file(@scanner.buffer, fname)
    end
    def dump_classes_as_ruby
        Kernel.send(:dump_classes_as_ruby, @classdefs)
    end
    def dump_classes
        
        classdefs = @classdefs
        classdefs.each{|k,v|
            p "class #{k}:"
            p "       class name: #{v.class_name}"
            p "       parent: #{v.parent}"
            p "       modules: #{v.modules}"
            p "       methods:"
            v.methods.each{|k,v|
                p "       methods signature:#{k}"
                p "       methods decc:#{v[:decoration] }"
                
                p "       methods name:#{v[:name]}"
                p "       src:#{v[:src]}" 
            }      
        }
    end   
    # find module from scope, if not found then find in parent scope
    def find_module_from(name, scope)
        ret = {
            :v=>nil,
            :prefix=>""
        }
        if scope == nil # find using namespace
            if @using_namespace
                ret[:v]= @using_namespace.modules[name]
                if ret[:v]
                    ret[:prefix]= @using_namespace_str
                end
            end
            return ret
        end
        if !scope.is_a?(ModuleDef) # skip class, functiondef
            return find_module_from(name, scope.parentScope)
        end
        ret[:v] = scope.modules[name]
        if ret[:v]
            return ret
        else
            ret[:v] = scope.classes[name] # call be class
            if ret[:v]
                return ret
            else
                return find_module_from(name, scope.parentScope)
            end
        end
    end
    
    def find_class_from(name, sc)
         if sc
             #p("find_class_from:#{name}, #{sc.inspect}")
            # p sc.classes.inspect
         end
        ret = {
            :v=>nil,
            :prefix=>""
        }
        if !sc
            return ret if !@using_namespace
            ret[:v] = @using_namespace.classes[name]
            if ret[:v]
                ret[:prefix] = @using_namespace_str
            end 
            return ret
        end
        ret[:v] = sc.classes[name]
        return ret if ret[:v]
        return find_class_from(name, sc.parentScope)
    end
    def find_class(name)
        p "find_class:#{name}"
        ret = {
            :v=>nil,
            :prefix=>""
        }
      #  r = _find_class(name)
      #  return r if r
        
        ar = name.split("::")
        if ar.size == 1 # not "::", means only class no modules
             return find_class_from(name, current_ruby_scope)
        else
            na = ar[0]
            # find first module
            if na == "" # the case "::a"
                ret = {
                    :v=>@root_class,
                    :prefix=>""
                }
            else
                ret = find_module_from(na, current_ruby_scope) 
            end
            return ret if ret[:v] == nil
            sc = ret[:v]
            if ar.size >2 # more thant 1 module
                for i in 1..ar.size-2
                    _sc = sc.modules[ar[i]]
                    if _sc == nil
                        _sc = sc.classes[ar[i]]
                    end
                    sc = _sc
                end
            end
             ret[:v] = sc.classes[ar[ar.size-1]] if sc
           
            return ret
        end
        return ret
    end
   
    def find_function_from(name, sc)
        r = sc.methods[name]
        return if r
        return find_function_from(name, sc.parentScope)
    end
    def find_function(name)
        ret = {
            :v=>nil,
            :prefix=>""
        }
        ar = name.split(".")
        if ar.size > 1 # has function owner
            fn = ar[ar.size-1]
            ar_sc = ar[0].split("::")
            if ar_sc.size >1 # has module
                ret = find_module_from(ar_sc[0], current_scope)
                return ret if !ret[:v]
                sc = ret[:v]
                if ar_sc.size > 2 
                    for i in 1..ar_sc.size-2
                        sc = sc.modules[ar_sc[i]]
                    end
                end
                ret[:v] = sc.methods[fn]
                
            else # only class
                ret = find_class(ar_sc[0])
                cls = ret[:v]
                return ret if !cls
                ret[:v] = cls.methods[fn]
            end
        else # only function name
            ret[:v] = find_function_from(name, current_ruby_scope)
        end
        return ret
    end
    
    #def add_class(class_name, parent=nil, modules=nil)
    #    class_name = valid_class_name(class_name)
    #    clsdef = ClassDef.new(class_name)
    #    @classdefs[class_name] = clsdef
    #    return clsdef
    #end
    def GetNextSym(step =1)
        _scanner = @scanner.clone()
      #  p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
              #  p "==>scanner clone2 =#{_scanner.inspect}"
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _scanner.nextSym
    end
    def GetNext(step =1)
        _scanner = @scanner.clone()
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _sym
    end
    def GetNextSymFromSym(sym, step =1)
        _scanner = @scanner.clone()
        _scanner.currLine = sym.line
        _scanner.currCol = sym.col
        _scanner.buffPos = sym.pos+sym.len-1
        _scanner.Scan_NextCh
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                p "==>8888:#{_sym}, #{_scanner.nextSym.sym}, #{getSymValue(_scanner.nextSym)}"
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _scanner.nextSym
    end
    def GetNextFromSym(sym, step =1)
        _scanner = @scanner.clone()
        _scanner.currLine = sym.line
        _scanner.currCol = sym.col
        _scanner.buffPos = sym.pos+sym.len-1
        _scanner.Scan_NextCh
        
        # p "==>scanner clone =#{_scanner.inspect}"
        _sym = nil
        while step > 0
             begin 
                _sym = _scanner.Get()
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
                _scanner.nextSym.SetSym(_sym)
                if (_sym <= C_MAXT) 
                    # _error.errorDist +=1
            
                else 
                    if (_sym == C_PreProcessorSym) # /*86*/
                      # line 65 "cs.atg"
	    
                    else
                        #/* Empty Stmt */ ;
                        _scanner.nextSym = _scanner.currSym
                    end
                end
            
                # if $sc_cur != $sc.currSym.sym
                #     pp("!!!===", 20)
                # end
            
            end while (_sym > C_MAXT || ignoreSym?(_sym))
            step -= 1
        end
        return _sym
    end
    
    def ignoreSym?(sym)
        ignored = [
         #   C_constSym
            ]
        if ignored.include?(sym)
            return true
        else
            return false
        end
    end
    def Get(ignore_crlf=true)        
        # p "sym1=#{@sym}"
         begin 
# p "Get0:@sym=#{@sym}, len=#{@scanner.nextSym.len}, nextSym=#{@scanner.nextSym.sym}, string=#{@scanner.GetSymString(@scanner.nextSym)}, pos=#{@scanner.buffPos}, @ch=#{@scanner.ch}"
            @prev_sym = @sym
            @sym = @scanner.Get(ignore_crlf)
  p "Get1:@sym=#{@sym}, len=#{@scanner.nextSym.len}, nextSym=#{@scanner.nextSym.sym}, string=#{@scanner.GetSymString(@scanner.nextSym)}, pos=#{@scanner.buffPos}, @ch=#{@scanner.ch}"
            # p "Get(): sym = #{@sym}, line #{@scanner.nextSym.line} col #{@scanner.nextSym.col} pos #{@scanner.nextSym.pos} sym #{SYMS[@sym]}"
            # p "sym1=#{@sym}"
            # pp("hhhh", 30) if @sym==9
            @scanner.nextSym.SetSym(@sym)
            # p "==>#{@sym}, #{getSymValue(@scanner.nextSym)}"
            if (@sym <= C_MAXT) 
                @error.errorDist +=1
            
            else 
                if (@sym == C_PreProcessorSym) # /*86*/
                    if @in_preprocessing
                        break
                    end
                    @scanner.skip_curline
                    # p "ch #{@scanner.ch}"
                    # p "pos:#{@scanner.buffPos}, #{@scanner.ch}, #{@scanner.buffer[@scanner.buffPos]}, buffer:#{@scanner.buffer}"
=begin              
                 # line 65 "cs.atg"
                  _str1 = curString()
                  pp "preprocessor #{}", 20
                  @sym = @scanner.Get()
                  _str2 = curString()
                  directive = "#{_str1}#{_str2}"
                  p "directive=#{directive}"
                  if  directive == "\#include"
                      @sym = @scanner.Get()
                      finclude = curString()
                      if finclude[0]=="\"" || finclude[0] =="\'"
                            finclude = finclude[1..finclude.size-1]
                      end
                      if finclude[finclude.size-1]=="\"" || finclude[finclude.size-1] =="\'"
                            finclude = finclude[0..finclude.size-2]
                      end
                      p "include file #{finclude}"
                      include_file(finclude)
                         
                  end
                  
                  # skip current line
                  @scanner.NextLine
=end                  
                  
                  
                  
                  
                   # p "preprocessor2 #{curString()}"
=begin
                  	char str[256];
                  	str = @scanner.GetName(@scanner.nextSym)
              	
                  	p = strchr(str, ' ')
        
                  	if ( p != NULL )
                  	    *p=0; 
                  	    directive = str + sizeof(char)
                  	    #// proce include 
                  	    if (strcmp(str, "include") == 0){
                  	            // get content
                  	            p += sizeof(char)
                  	            while ( (*p == ' ' || *p == '\t' ) && *p != '\0' ){
                  	                    p += sizeof(char)              
                  	            }
                  	            if ( *p != '\0' )
                  	                    content = p;
                  	    end

                  	end
=end
              	    
                else
                    #/* Empty Stmt */ ;
                    @scanner.nextSym = @scanner.currSym
                end
            end
        end while (@sym > C_MAXT || (self.class.to_s!= "Preprocessor" &&ignoreSym?(@sym) ) )
         p "get()2: #{@sym}, #{curString}"
        # p "Get()2 #{@scanner.nextSym.sym}, line #{@scanner.nextSym.line}, col #{@scanner.nextSym.col}, value #{curString()}"
        # p("Get()3:#{@sym}, #{curString()}, line #{curLine}", 20)
        return @scanner.nextSym.sym
    end
    def delete_curline
        pos = @scanner.buffPos
        
        @scanner.delete_curline
       #  Get() if pos != @scanner.buffPos
       #  p "get:#{@sym}"
    end
    def delete_prevline
        # pos = @scanner.buffPos
        p "==>sym2220:#{@sym}, #{curString()}, #{@scanner.buffPos}"
        
        @scanner.delete_prevline
        if @scanner.buffPos <= 0
            @scanner.Reset
            # Get()
        end
        #Get()
        # Get() if pos != @scanner.buffPos
        p "==>sym2221:#{@sym}, #{curString()}, #{@scanner.buffPos}"
    end
    def delete_lines(p1,p2,inclue = true)
        pos = @scanner.buffPos
        p("---->dddd:#{pos}, #{p1}, #{p2}")
        pos1,pos2 = @scanner.delete_lines(p1, p2, inclue)
        #p "after delete_lines:#{pos1}, #{pos2}, pos #{pos}, buffer:#{@scanner.buffer}", 10
        # Get() if pos != @scanner.buffPos
        p "after delete_lines:#{@scanner.buffer[@scanner.buffPos..@scanner.buffPos+20]}"
        p("---->dddd:#{pos}, #{pos1}, #{pos2}")
        
      #  Get() if pos >pos1 && pos <= pos2
    #    Get() if pos >=pos1 && pos <= pos2
        p "after delete_lines2:#{@scanner.buffer[@scanner.buffPos..@scanner.buffPos+50]}"
        
    end
 


    def skip_curline
        ret = @scanner.skip_curline
#        Get()
        
        return ret
    end    
    def find_method(method, arg_num=nil)
        p "find_method1:#{method}, #{arg_num}"
        ar = method.split(".")
        
        if (ar.size >1)
            c = find_var(ar[0])
            if c && c.type
                
              #  clsdef = find_class(ar[0])[:v]
               clsdef = find_class(c.type)[:v]
            end
        else
            clsdef = @root_class
        end
        clsdef = @root_class if !clsdef
        fname = ar[ar.size-1]
        #p "find_method3:#{clsdef.class_name}, #{clsdef.functions.inspect}"
        
        if (arg_num)
            ret =  clsdef.methods[method_signature(fname, arg_num)]
        else
            ret =  clsdef.functions[fname]
            
        end
       # p "find_method2:#{method_signature(fname, arg_num)}=>#{clsdef.class_name}, #{ret}"
   #     p clsdef.methods.inspect
        return ret
    end
    
    def skipUnusableType()
        utype = [C_typenameSym]
        while (@sym == C_identifierSym && GetNext() != C_ColonColonSym || utype.include?(@sym))
            if utype.include?(@sym)
                Get()
                next
            end
            v = curString()
            if ($unusableType.include?(v))
                Get()
            else
                break
            end
        end
    end
    
end
    
    