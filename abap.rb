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