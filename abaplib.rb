require_relative "log.rb"
Log.config.log=true
#def var(variable_name)
#    variable_module = Module.new do
#      attr_accessor variable_name.to_sym
#    end
#
#    include variable_name
#    instance_variable_set("@#{variable_name}", nil)
#end

#class V
#    def create_method( name, &block )
#        self.class.send( :define_method, name, &block )
#    end
#
#    def create_attr( name )
#        create_method( "#{name}=".to_sym ) { |val| 
#            instance_variable_set( "@__" + name, val)
#        }
#
#        create_method( name.to_sym ) { 
#            instance_variable_get( "@__" + name ) 
#        }
#    end
#end
class Binding
  alias :g :local_variable_get
  alias :s :local_variable_get
end

def _super(method, *arg)
    # Parent.instance_method(:method).bind(self).call
   # self.class.superclass.instance_method(method.to_sym).bind(self).call(*arg)
   super_method(method.to_sym).call(*args)
end

def super_method(cls, method)
 #   self.class.superclass.instance_method(method.to_sym).bind(self)#.call(*arg)
    cls.superclass.instance_method(method.to_sym).bind(self)#.call(*arg)
end


def var(hash)
  #  p "self:#{self.class}"
     hash.transform_keys!{ |key| key.to_s.downcase }
    hash.each do |n, v|
      self.class.define_method(n) do
        instance_variable_get("@__#{n}")
      end
      instance_variable_set("@__#{n}", v)
    end
end
def varset(n,v)
    instance_variable_set("@__#{n}", v)
end

def var1(hash)
    hash.each{|k,v|
        self.class.send( :define_method, "#{k}=".to_sym){|val| 
            instance_variable_set( "@__" + k, v)}
            self.class.send( :define_method, "#{k}".to_sym){
                instance_variable_get( "@__" + k ) 
                }
    }
end

# util
#class Object
#    def method_missing(name, *args, &block) # :nodoc:
#        print "*****************************************\n"
#        print "* --->object #{self} miss method #{name}\n"
#        print "* Maybe it's not implemented ABAP function\n"
#        print "* You can implement '#{name}' according to the ABAP doc https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm\n"
#        print "*****************************************\n"
#        p "", 20
#    #  (delegate || superclass.delegate).send(name, *args, &block)
#    super
#    end
#end

##
# method for abap keyword
##
def collect()
end
def clear(b)
    p "calling abap function CLEAR"
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

##
# consts
##
def abap_true
    true
end


def call_method(name, exporting, importing)
 #   exporting.() if exporting
  #  importing.() if importing
    r = Object.send(name.to_sym, nil,{:_i=>exporting, :_e=> importing})

    return r
end

=begin
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

def __in__(_i:nil,_e:nil, _b:nil)
    var(_i) if _i
    var(_e) if _e
    _e.each{|k,v|
        p "v:#{v}"
        p "b:#{_b}"
        v = _b.local_variable_get(v.to_sym)
        p "v:#{v}"
        p "#{k}=v"
        eval("#{k}=v")
        eval("v2=v")
        varset(k, v)
        p "v2:#{v2}"
        p "out:#{k}=#{eval("k")}"
    }
end
def __out__
end



def t(_i:nil,_e:nil, _b:nil)
    #__in__(_i:_i,_e:_e, _b:_b)
    var(_i) if _i
    var(_e) if _e
    _i.each{|k,v|
        eval("#{k}=v")
        varset(k, v)
    }
    _e.each{|k,v|
        #p "v:#{v}"
        #p "b:#{_b}"
        v = _b.local_variable_get(v.to_sym)
        #p "v:#{v}"
        #p "#{k}=v"
        eval("#{k}=v")
        #eval("v2=v")
        varset(k, v)
        #p "v2:#{v2}"
        #p "out:#{k}=#{eval("k")}"
    }
    p "33v2:#{v2}" 
    p "33v1:#{v1}" 
    v2 + 1
    v1 + 1
    v1 + v2 + 1
    v2 = v1 + v2 + 1
    v2 = v2 + v1 + 1
    v1 = v2 + v1 + 1
    v1 = v1 + v2 + 1
   p "v2:#{v2}" 
    _exp = {}
    _e.each{|k,v| 
     #   p "_exp['#{v}'] = #{k}"
     #   eval("#{v} = #{k}")
     _b.local_variable_set(v.to_sym, eval("#{k}")) if v
        } if _e && _b
    return {:exp=>_exp}
end
#
#var({"d1"=>3})
#var({"d2"=>4})
#
#d1 +1
#p "--->#{d1}"

v2 = 999
#t(_i:{"v1"=>1}, _e:{"v2"=>"v2"}, _b:binding)
p "==>1:v2(#{v2.hash})=#{v2}"

def t2(_i:nil,_e:nil, _b:nil)
    #__in__(_i:_i,_e:_e, _b:_b)
    var(_i) if _i;var(_e) if _e
    _i.each{|k,v|eval("#{k}=v");varset(k, v)}
    _e.each{|k,v|v = _b.local_variable_get(v.to_sym);eval("#{k}=v");varset(k, v)}
      
    p "v1:#{v1}"
    case v1
        when 1
            p "---->ffff"
    end
    p "33v2:#{v2}" 
    p "33v1:#{v1}" 
    v2 + 1
    v1 + 1
    v1 + v2 + 1
    v2 = v1 + v2 + 1
    v2 = v2 + v1 + 1
    v1 = v2 + v1 + 1
    v1 = v1 + v2 + 1
    p "v3:#{v3}"
    v3 += "hhh" if v2 >100
    
    
    _e.each{|k,v|_b.local_variable_set(v.to_sym, eval("#{k}"))} if _e && _b
end
v3 = "fsfsf"
t2(_i:{"v1"=>1}, _e:{"v2"=>"v2", "v3"=>"v3"}, _b:binding)
p "==>2:v2(#{v2.hash})=#{v2}"
p v3

def t3
    p "==>3:v2(#{v2.hash})=#{v2}"
end
t3
p "==>4:v2(#{v2.hash})=#{v2}"


=end

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