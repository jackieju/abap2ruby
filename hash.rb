class Hash
  #take keys of hash and transform those to a symbols
  def self.transform_keys_to_symbols(value)
    return value if not value.is_a?(Hash)
    hash = value.inject({}){|memo,(k,v)| memo[k.to_sym] = Hash.transform_keys_to_symbols(v); memo}
    return hash
  end
  def self.transform_keys_to_string(value)
    return value if not value.is_a?(Hash)
    hash = value.inject({}){|memo,(k,v)| memo[k.to_s] = Hash.transform_keys_to_string(v); memo}
    return hash
  end
  def normalize
      Hash.transform_keys_to_string(self)
      Hash.transform_keys_to_symbols(self)
      @normalized = true
  end
  def normalized?
      @normalized == true
  end
  #def []=(n, v)
  #    super
  #    @normalized = false
  #end
  #def merge!(h)
  #    super
  #    @normalized = false
  #end
  #def merge!(other_hash){|key, oldval, newval| block} 
  #end
=begin  
  def method_missing(name, *args, &block) # :nodoc:
     # print "--->hash #{self} miss method #{name}\n"
      #p "--->hash #{self} miss method #{name}", 10
#      (delegate || superclass.delegate).send(name, *args, &block)
      normalize if not normalized?
      name = name.to_s
      if name.end_with?("=")
          n = name[0..name.size-2]
          Hash.define_method( "#{name}".to_sym ) { |val| 
              self[n] = val
              self[n.to_sym] = val
          }
          self[n] = args[0]
          self[n.to_sym] = args[0]
          return args[0]
      else
          Hash.define_method( name.to_sym ) { 
              self[name]
          }
      end
      
      v =  self[name]
      return v if v
      return self[name.to_sym]
  end
  
  def []=(key,val)
      r = nil
      
      #clear if setting str/sym
      r = self.delete key.to_s if (key.is_a? String) 
      r = self.delete key.to_sym if (key.is_a? Symbol) 
                   
     merge!({key.to_s => val})
     merge!({key.to_sym => val})
     return val
  end
=end  
end

a = {:bb=>1}
