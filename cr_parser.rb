load 'log.rb'
def to_ruby_const(s)
    p "33333:#{s}", 20
    a = s[0].upcase
    return a if s.size ==1
    return "#{a}#{s[1..s.size-1]}"
end

# overwrite this for other language
def method_signature(method_name, arg_number)
    p "===>33334"
    if IGNORECASE
        method_name = method_name.downcase
    end
    return "#{method_name}\#\##{arg_number}"
end
def translate_varname(varname, uncapitalize=true)
    return "" if varname==nil or varname == ""
    if IGNORECASE
        varname  = varname.downcase
    end
    if uncapitalize
        if varname.size ==1 
            varname = varname.downcase
        else
            varname = varname[0].downcase+varname[1..varname.size-1]
        end
    end
    keywords = ["begin", "end", "def", "rescue"]
    if keywords.include?(varname)
        return "_translated_#{varname}"
    end
    return varname
end
def valid_class_name(n)
    
    return n.upcase if n.size ==1
    return n[0].upcase+n[1..n.size-1]
end
class Variable
    attr_accessor :name, :type, :newname
    def initialize(name, type, newname=name)
        @name = name
        @type = type
        @newname = translate_varname(newname)
    end
end
class VarType
    attr_accessor :name, :ref, :is_simpleType, :type # type can be:nil, "FunctionPointer"
    # simple type means can typename is identifier and can be used like A Fn(a); to instantiate using constructor 
    def initialize(name, type=nil, is_simpleType = true)
        @name = name
        @ref = 0
        @is_simpleType = is_simpleType
        @type = type
    end

end
class Scope
    # name is scope name in c/cpp, except "module"
    # name can "class", "struct", "module"(module means namespace)
    attr_accessor :name, :vars, :parentScope, :hasGoto, :labeled_blocks, :pre, :class_name # class_name here is just for easy debuging
    def initialize(name)
        @name = name 
        @vars = {}
        @hasGoto = false # only for functiondefinition
        @labeled_blocks =[]
        @pre=""
    end
    
    def add_var(v)
        p "add_var:#{v.name} to #{@class_name}@#{self}", 20
        @vars[v.name] = v
        return v.newname
    end
    
    def get_var(k)
        return @vars[k]
    end

end

class ModuleDef < Scope
    attr_accessor :class_name, :modules, :classes, :methods, :src, :functions, :includings, :require
  
    def initialize(class_name)
        super("module")
        @class_name = to_ruby_const(class_name)
        @methods = {}
        @modules = {}
        @classes = {}
        # @functions record mapping from c name to ruby name, because c can overide function with same name, we will map them to "#{cmethod_name}_v#{arg_number}"
        # e.g.
        # functions=>{
        #    "fn1"=>{
        #        "fn1_v1"=>"fn1#1", #fn1 with 1 parameter
        #        "fn1_v2"=>"fn1#2"  #fn2 with 2 paratermers          
        #    }
        #}
        @functions = {} 
        @includings = [] 
        @require = []
    end
    def add_require(n)
        @require.push(n) if @require.include?(n) == false
        p "added require #{n} to #{name} #{class_name}"
    end
    def add_src(src)
        @src = "" if !@src
        @src += src
    end
    def default_method_head
        "(*_a,_i:nil,_e:nil,_b:nil)"
    end
    # head: content in () in ruby code, including ()
    # will change it with new value if method already exists
    def add_method(method_name, head, args, src, acc="public", others=nil)
        p "===>add_method1:#{class_name},#{method_name}, #{head}, #{others}", 10
        p "====>add_method2:#{src}"
        arg_number = args.size
        method_sig = method_signature(method_name, arg_number)
        
        # if overriden, modify name
        @functions[method_name] = {} if !@functions[method_name] 
        
        if @functions[method_name].keys.size == 0 # first one, maybe will not be overriden, so we give original name
            @functions[method_name][method_name] = method_sig
        else
            if @functions[method_name][method_name] == method_sig # already exist one with normal name, no need to change too
            else
                #if @functions[method_name].keys.size == 1 # change to new name for the old one
                #    v = @functions[method_name].values[0]
                #    nn = "#{method_name}_v#{@methods[v][:args].size}"
                #    @functions[method_name].delete(method_name)
                #    @functions[method_name][nn] = v
                #end
                first = @functions[method_name][method_name]
                newname = "#{method_name}_v#{arg_number}"
                @functions[method_name][newname] = method_sig
               
                
                # change first one src
                m = @methods[first]
                if m[:poly] == nil
                    ass = ""
                    if m[:args].size > 0
                        for i in 0..m[:args].size-1
                            p "fff#{m[:args][i]}"
                            ass += "\n#{m[:args][i][:name]} = *_args_[#{i}]\n"
                        end
                    end
                    m[:head]="(*_args_)"
                    pre =<<HERE
                    # this method has been overriden with different number of parameters
                    #{ass}
                    if _args_.size != #{m[:args].size}
                       return method("#{method_name}_v\#{_args_.size}").call(*_args_) 
                    end
HERE
m[:src] = "" if m[:src] ==nil
                    m[:src] = pre + m[:src]
                    m[:poly] = true
                end
                 method_name = newname
            end
        end
            
        if @methods[method_sig] # change exsiting 
            method_desc = @methods[method_sig]
            method_desc[:name] = method_name
            method_desc[:args] = args
            method_desc[:head] = head if head != nil
            if method_desc[:head] == nil
                method_desc[:head] = default_method_head
            end
            
            if src && src.strip != ""
                method_desc[:src] =src
            end
            if method_desc[:decoration] == nil
                method_desc[:decoration] = ""
            end
            ar = acc.split(" ")
            ar.each{|v|
                if method_desc[:decoration].index(v) == nil
                    method_desc[:decoration] += " #{v}"
                end
            }
            #if others && others[:doc] && method_desc[:doc] == nil
            #    method_desc[:doc] = others[:doc]
            #end
            #if others && others[:import] && method_desc[:import] == nil
            #    method_desc[:import] = others[:import]
            #end           
            if others  
                if method_desc[:others] == nil
                    method_desc[:others] = others 
                else                     
                    method_desc[:others][:doc] = others[:doc] if others[:doc]
                    method_desc[:others][:import] = others[:import] if others[:import]
                    method_desc[:others][:export] = others[:export] if others[:export]
                end
            end
        else
            @methods[method_sig]={
                :name=>method_name,
                :args=>args,
                :src=>src,
                :decoration=>acc,
                :head=>head
            }
            if @methods[method_sig][:head] == nil
                @methods[method_sig][:head] = default_method_head
            end
            
            #if @methods[method_sig][:doc] == nil && others && others[:doc]
            #    @methods[method_sig][:doc] = others[:doc]
            #end
            #if others && others[:import] && @methods[method_sig][:import] == nil
            #    @methods[method_sig][:import] = others[:import]
            #end     

            if others  
                if @methods[method_sig][:others] == nil
                    @methods[method_sig][:others] = others 
                else                     
                    @methods[method_sig][:others][:doc] = others[:doc] if others[:doc]
                    @methods[method_sig][:others][:import] = others[:doc] if others[:import]
                    @methods[method_sig][:others][:export] = others[:doc] if others[:export]
                end
            end
        end
        
        p("method #{method_sig} added to #{self.class_name}@#{self}:#{@methods[method_sig].inspect} \n")
      #  p(@methods.inspect)
      #  if self.class != ModuleDef
      #      p ("parent:#{self.parent}")
      #      if  self.parent
      #          p("parent:#{self.parent.inspect}")
      #      else
      #          p("parent:#{self.parent}")
      #  
      #      end
      #  end
    end
    
    def add_module(module_name)
         p "add_module #{module_name} to #{@name} #{@class_name}"
        if module_name.class == String
            moduleDef = ModuleDef.new(module_name)
            @modules[module_name] = moduleDef
            moduleDef.parentScope = self
        else
            moduleDef = module_name
            @modules[moduleDef.class_name] = moduleDef
            moduleDef.parentScope = self
           
            
        end
        return moduleDef
    end
    
    # class_name can be ClassDef Object
    def add_class(class_name)
        
        if class_name.class == String 
            class_name = valid_class_name(class_name)
            clsdef = @classes[class_name]
            if clsdef == nil
                clsdef = ClassDef.new(class_name)
                @classes[class_name] = clsdef
                clsdef.parentScope = self
                p "===>add_class:#{clsdef.class_name}@#{clsdef} to #{self.class_name}@#{self}", 20
            end
        else
            
            clsdef = class_name
            @classes[clsdef.class_name] = clsdef
            clsdef.parentScope = self
            p "===>add_class:#{clsdef.class_name}@#{clsdef} to #{self.class_name}@#{self}", 20
        end
        

        return clsdef
    end
    
    def add_var(v)
        p "v:#{v.inspect}"
        p "add_const to module:#{v.name} to #{@class_name}@#{self}", 20
      
        v.newname = "#{v.name[0].upcase}#{v.name[1..v.name.size-1]}"
        p "add_const:#{v.name} class var #{v.newname}"
        @vars[v.name] = v
        return v.newname
    end
end
class ClassDef < ModuleDef
    attr_accessor :class_name, :parent, :methods, :src, :parentScope, :functions, :includings
    def initialize(class_name)
        super("class")
        @class_name = class_name
        @methods = {}
        @name="class"
        @includings = []
    end
    # for supporting multi-inheritanc
    # will generate new module containings class content, and current class will just include the module
    def to_module
        module_name = "#{@class_name}_module"
        r = ModuleDef.new(module_name)
        r.methods = @methods
        r.functions = @functions
        r.src = @src
        r.parentScope = parentScope
        r.includings = includings
        
        @methods = {}
        @classes = {}
        @functions = {} 
        @includings = [module_name]
        return r
    end
    
    def add_var(v)
        p "add_var:#{v.name} to #{@class_name}@#{self}", 20
        if @name == "class"
            v.newname = "@#{v.newname}"
            p "add_var:#{v.name} class var #{v.newname}"
        end
        @vars[v.name] = v
        return v.newname
    end
end
class CRParser 
# Abstract Parser
  public
    def initialize(s = nil, e = nil)
        if (!e || !s) 
          p "CRParser::CRParser: No Scanner or No Error Mgr\n"
          exit(1)
        end
        @scanner = s
        @error = e
        @sym = 0
        @sstack = [] # scope stack
        @classdefs = {}
        
    end
    
    def current_scope(name=nil)
        return @sstack.last if name == nil
         i = @sstack.size-1
         while (i>=0)
             if @sstack[i].name == name
                 return @sstack[i]
             end
             i -= 1
         end
         return nil
    end
    
    def list_scopes
        cs = current_scope
        s = ""
        while cs
            s+= "scope:#{cs.name}=>"
            cs = cs.parentScope
        end
        p s
    end
    def in_scope(name)
        cs = current_scope
     #   p "==>in_scope0:#{name}, #{name.class_name}, #{name.inspect} ", 10
         p "==>cs2:#{name.inspect}"
        p "==>cs1:#{cs.inspect}"
        p "==>cs3:#{name.class_name}@#{name.name}" if name.is_a?ModuleDef
        if name.class == String
            name = Scope.new(name)
            @sstack.push(name)
        else
            if name == cs
                throw Exception.new("enter wrong scope")
            end
            @sstack.push(name)
        end
    
      #  p("rootmod3:#{$g_root_moddef.parentScope}")
     #   p "cs2:#{current_scope.inspect}, #{cs}"
        current_scope.parentScope = cs
       #    p("rootmod4:#{$g_root_moddef.parentScope}")
        throw Exception.new("hehehehe") if current_scope != name
        if current_scope == cs
            throw Exception.new("hahahahaha")
        end
        # p "cs3:#{current_scope.inspect}, parent=#{current_scope.parent}", 30
        p "==>in_scope1:#{name}, #{name.class_name}, #{name.name}, #{name.parentScope}, #{name.parentScope.name if name.parentScope}, #{name.parentScope.class_name if name.parentScope} ", 10
        return name
    end
    def out_scope()
        r = @sstack.pop
        p "==>out_scope:#{r}, #{r.name}, #{r.class_name}"
        return r
    end    
    def current_ruby_scope
         i = @sstack.size-1
         while (i>=0)
             n = @sstack[i].name
             if n == "class" || n == "struct" || n == "module"
                 return @sstack[i]
             end
             i -= 1
         end
         return nil
    end
    
    # find var in scope and it's ancestor
    def find_var_in_scope(name, scope)
        ret = scope.get_var(name)
        return ret if ret
        if scope.is_a?(ClassDef) && scope.parent
            parent = scope.parent
            if parent.class == String
                parent = find_class(parent)[:v]
            end
            return nil if !parent
            return find_var_in_scope(name, parent)
        end
        return nil
    end
    
    def find_var(name, scope=nil)
         p "find_var:#{name}", 20
        scope= current_scope  if !scope
        i = 1
        while scope 
             #p "scope:#{scope.inspect}"
            p "scope:#{scope}, #{scope.name}"
            p "class:#{scope.class_name}" if scope.is_a?(ClassDef) || scope.is_a?(ModuleDef)
            
            i+=1
            if i>=20
                dump_pos
                #p "scope:#{scope.inspect}"
                throw Exception.new("===>error<====")
            end
            scope.vars.each{|k,v|
                p "===>var:#{k}"
            }
            ret = find_var_in_scope(name, scope)
            return ret if ret
            scope = scope.parentScope
        end
        return nil
    end
    def canUseBreak?
        i = @sstack.size-1
        while (i>=0)
            if @sstack[i].name == "FunctionBody" 
                return false
            end
            
            if  @sstack[i].name == "ForStatement" || @sstack[i].name == "WhileStatement" || @sstack[i].name == "DoStatement"
                return true
            end
            i -= 1
        end
        return false
        
    end
    
    
    # Constructs abstract parser, and associates it with scanner S and
    # customized error reporter E

    def CRParser
        p("Abstract CRParser::Parse() called\n")
        exit(1)
        
    end

    def Parse()
        
    end
    # Abstract parser

    def SynError(errorNo)
        if (errorNo <= @error.MinUserError) 
            errorNo = @error.MinUserError
        end    
        @error.StoreErr(errorNo, @scanner.nextSym)
             
    end
    # Records syntax error ErrorNo

    def SemError(errorNo)
        if (errorNo <= @error.MinUserError)
             errorNo = @error.MinUserError
         end
        @error.StoreErr(errorNo, @scanner.CurrSym)
    end
    # Records semantic error ErrorNo

    def dump_pos(pos=@scanner.buffPos, lines = 5)
        pos=@scanner.buffPos if pos == nil
        
        p("current file:#{$g_cur_parse_file}")
        p("start dump pos:#{pos},#{@scanner.buffer[pos..pos+100]}", 5)
        lino = get_lineno_by_pos(pos)+1
        
        p "---- dump position ----"
        i = lines
        ls =  prevline(pos, i)
        ls.each{|l|
            p "#{"%05d" % (lino-i)}#{l}"
            i-=1
        }
       
        pos1 = pos
        while (pos1 > 0 && @scanner.buffer[pos1-1] != "\n" )
            pos1 -= 1
        end
        pos2 = pos 
        while (pos2 < @scanner.buffer.size-1 && @scanner.buffer[pos2+1] != "\n" )
            pos2 += 1
        end        
        p "#{"%05d" % (lino)}......#{@scanner.buffer[pos1..pos2].gsub("\t",' ')}......"
        s1 = ""
        for a in 0..pos-pos1-1
            s1 += "~"
        end
        s2 = ""
        for a in 0..pos2-pos-1
            s2 += "~"
        end
        p "     ......#{s1}^#{s2}......"
        
        p "---- end of dump position ----"
        
    end    
	

  protected

    def Get()
        p "get"
    end
    
    def In(symbolSet, i)
        return symbolSet[i / NSETBITS] & (1 << (i % NSETBITS))
        
    end
    
    def isKeyword?(n)
        list = ["DATA", "WRITE",
"DO",
"IF",
"WHILE",
"Loop",
"CASE",
"CALL",
"Method",
"Methods",
"FUNCTION",
"MESSAGE",
"SEARCH",
"APPEND",
"SPLIT",
"RAISE",
"CONSTANTS",
"MOVE",
"WITH",
"TABLES",
"AUTHORITY_CHECK",
"DELETE",
"EVENTS",
"MODIFY",
"ON",
"OPEN",
"FETCH",
"PROVIDE",
"READ",
"SORT",
"SUBMIT",
"TRY",
"RUCTURE",
"TYPE",
"ADD",
"ADD_CORRESPONDING",
"ALIASES",
"ASSERT",
"ASSIGN",
"BACK",
"BREAK_POINT",
"CATCH",
"CHECK",
"CLASS_DATA",
"CLASS_EVENTS",
"CLASS_POOL",
"CLEAR",
"CLOSE",
"COLLECT",
"COMMIT",
"COMPUTE",
"CONCATENATE",
"CONDENSE",
"CONTROLS",
"CONVERT",
"CREATE",
"DEMAND",
"DESCRIBE",
"DETAIL",
"DIVIDE",
"DIVIDE_CORRESPONDING",
"EDITOR_CALL",
"END_OF_PAGE",
"END_OF_SELECTION",
"EXIT",
"EXPORT",
"EXTRACT",
"FIELD_GROUPS",
"FIELD_SYMBOLS",
"FIELDS",
"FIND",
"FORMAT",
"FREE",
"FUNCTION_POOL",
"GENERATE",
"GET",
"HIDE",
"IMPORT",
"INCLUDE",
"INFOTYPES",
"INITIALIZATION",
"INPUT",
"INSERT",
"INTERFACE",
"INTERFACE_POOL",
"INTERFACES",
"LEAVE",
"LOAD_OF_PROGRAM",
"LOCAL",
"LOG_POINT",
"MAXIMUM",
"MINIMUM",
"MODULE",
"MULTIPLY",
"MULTIPLY_CORRESPONDING",
"NEW_LINE",
"NEW_PAGE",
"NEW_SECTION",
"NODES",
"OVERLAY",
"PACK",
"PARAMETERS",
"PERFORM",
"POSITION",
"PRINT_CONTROL",
"PROGRAM",
"RANGES",
"RECEIVE",
"REFRESH",
"REJECT",
"REPLACE",
"RESERVE",
"RESUME",
"RETRY",
"RETURN",
"ROLLBACK",
"SCROLL",
"SELECT_OPTIONS",
"SELECTION_SCREEN",
"SET",
"SHIFT",
"SKIP",
"STOP",
"SUBTRACT",
"SUBTRACT_CORRESPONDING",
"SUM",
"SUMMARY",
"SUMMING",
"SUPPLY",
"SUPPRESS",
"SYNTAX_CHECK",
"TEST_INJECTION",
"TEST_SEAM",
"TOP_OF_PAGE",
"TRANSFER",
"TRANSLATE",
"TRUNCATE",
"TYPE_POOL",
"TYPE_POOLS",
"TYPES",
"ULINE",
"UNASSIGN",
"UNPACK",
"UPDATE",
"WAIT",
"WINDOW"]
return list.include?(SYMS[n])
    end
    
    def is(keyword)
        
    end
    
    def Expect(n)
        p "expect #{n}(#{SYMS[n]}), sym = #{@sym}(#{SYMS[@sym]})('#{@scanner.GetSymValue(@scanner.nextSym)}'), line #{@scanner.nextSym.line} col #{@scanner.nextSym.col} pos #{@scanner.nextSym.pos} sym #{SYMS[@scanner.nextSym.sym]}"
       # if @sym == n || (n == C_identifierSym && isKeyword?(@sym) == false)
        if @sym == n || (n == C_identifierSym && (curString().split("-")[0] =~/^[A-Za-z][A-Za-z0-9]*$/) == 0)
       
            # for debug
            if (n == C_identifierSym && (curString().split("-")[0] =~/^[A-Za-z][A-Za-z0-9]*$/) == 0)
                p "symbol #{n}(#{curString})#{SYMS[@sym]}} is identifier"
            end
            Get()

        else    
            GenError(n)
        end
    end
    def prevline(pos, num=1, padding=0)
        ret = []
        # pos = @scanner.buffPos
        buffer = @scanner.buffer
        
     #   p "p1:#{pos}"
        while pos>0 && buffer[pos] && (buffer[pos].to_byte == 10 || buffer[pos].to_byte == 13)
            pos -= 1
        end
      #  p "p2:#{pos}"
        
        while  pos>0 && buffer[pos] && (buffer[pos].to_byte != 10 && buffer[pos].to_byte != 13)
            pos -= 1
        end
        
     #   p "p3:#{pos}"
        while (num>0)

            
            pos_end = pos
            while  pos>0 && buffer[pos] && (buffer[pos].to_byte == 10 || buffer[pos].to_byte == 13)
                pos -= 1
            end   
           # p "p4:#{pos}"
            
            while  pos>0 && buffer[pos] && (buffer[pos].to_byte != 10 && buffer[pos].to_byte != 13)
                pos -= 1
            end
         #   p "p5:#{pos}"
            
            if pos == 0
                pos_start = 0
            else
                pos_start = pos+1 
            end
            ret.insert(0,buffer[pos_start..pos_end]) if buffer[pos_start..pos_end]
            num -= 1
        end
        
        return ret
    end
    
    def get_lineno_by_pos(pos) # line number start from 0
        buf = @scanner.buffer[0..pos]
        return buf.count("\n")
    end

    
    def GenError(errorNo)
   #     p "generror #{errorNo}, line #{@scanner.nextSym.line} col #{@scanner.nextSym.col} sym #{@scanner.nextSym.sym} val #{@scanner.GetName()}"
   p "generror #{errorNo}, line #{@scanner.nextSym.line} col #{@scanner.nextSym.col} sym #{@scanner.nextSym.sym}(#{SYMS[@scanner.nextSym.sym]}) sval #{curString()}"
        
        
        pos = @scanner.nextSym.pos
        
        dump_pos(pos)
        
        # # p "line:#{@scanner.cur_line()}"
        p("stack:", 1000)
        @error.StoreErr(errorNo, @scanner.nextSym.clone)
        raise "stopped because error #{errorNo}, file #{$g_cur_parse_file}"
    end
    # Scanner
    #    Error
    #    Sym


end