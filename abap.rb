class Object
    def method_missing(name, *args, &block) # :nodoc:
        print "*****************************************\n"
        print "* --->object #{self} miss method #{name}\n"
        print "* Maybe it's not implemented ABAP function\n"
        print "* You can implement '#{name}' according to the ABAP doc https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm\n"
        print "*****************************************\n"
        
    #  (delegate || superclass.delegate).send(name, *args, &block)
    super
    end
end
def clear(b)
end
def DATA(b)
    b
end
def assign(params)
end
def unassign(params)
end
def read_table(id:)
end
def check(params)
end

def assert(params)
end

def loop1(at:,into:)
end

def append(params)
end

def call_method(name, exporting, importing)
 #   exporting.() if exporting
  #  importing.() if importing
    r = Object.send(name.to_sym, nil,{:_i=>exporting, :_e=> importing})

    return r
end


def test1(v1=nil, _i:, _e:)
   
    _i.each{|k,v| eval("#{k} = #{v}")} if _i
    
    # ===== method body ====
    p "v1:#{v1}" 
    # ======================
    
    # after method body
    _exp = {}
    _e.each{|k,v| eval("_exp['#{v}'] = #{k}")} if _e

    return {:exp=>_exp}
end

v2 = nil
#r = call_method("test1", { :v1 => 1},  { "v1" => "v2" })
r = test1(_i:{ :v1 => 1},  _e:{ "v1" => "v2" })
if r[:exp]
    r[:exp].each{|k,v|
        eval("#{k} = #{v}")
    }
end
p "v2:#{v2}"
p r.inspect


def a(*arg, x:, y:)
    p arg[0]
    p x
    p y
end

a(1, x:0, y:1)




=begin
def test1(v1, importing, exporting)
    __r = nil
    # set parameter for imporing
    __imp = importing.(v1) if importing
    p "imp:#{__imp}"
    if __imp
        __imp.each{|k,v|
            #a = binding.local_variable_get(k.to_s)
            #a = instance_variable_get("@#{k}")
            #a = v
            eval("#{k}=v")
        }
    end
    #imporint parameter v1
    
    # method body start
    p "v1:#{v1}" 
    
    
    # after method body
    exporting.() if exporting
    
    return __r
end

importing = proc{|v1|
    exp = {
        :v1=>v1
    }
    __r = {
        :exp=>exp
    }
}
exporting = proc{
    __imp = {
        :v1 => 1
    }
}


def call_method(name, exporting, importing)
 #   exporting.() if exporting
  #  importing.() if importing
    Object.send(name.to_sym, nil, exporting, importing)
end

#def a(p1)
#    p1.()
#    p v1
#end
#a(exporting)

r = call_method("test1", exporting, importing)

p r.inspect
=end