require "FileUtils"
# convert ambigous ABAP syntax from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm to EBNF
require_relative "rubyutility.rb"


$map ={
    "identifier"=>"(group|dref|idx|lang|dynnr|prog|otab|dset|oref|dobj|dtype|blob|clob|abap_type|type|comp|key_name|didentifier|primary_key|dbtab|view)",
    "number"=>"(width|pos|len|dec|n|line)",
    "Expresion"=>"(expr)",
    "string1"=>"(text|title|cntry|mod|col)",
    
}
fname = $*[0]
p "file #{fname}"
if !fname
    fname = "abapref.txt"
end
s = read_file(fname)
print s
print "\n"
def convert(str)
    # remove comments
    str = str.gsub(/^\#.*?$/m, "")
    print "str->#{str}"
    ar = str.split("\n\n")
    ret = []
    ar.each{|s|
        s = s.strip
        # get keyword
        keyword = nil
        s.scan(/\w+/){|m|
            keyword = m
            break
        }
        print (s+"\n")
        p "keyword:#{keyword}"
        
        # convert upcase word (Keyword) to quoated
        s = s.gsub(/\b([A-Z][A-Z0-9_-]+)\b/, '"\1"')
 
        # replace non-keyword
        $map.keys().each{|k|
            reg = Regexp.new("\\b#{$map[k]}\\d?\\b")
            p "regexp=#{reg}"
            s = s.gsub(reg, k)
        }
    
        s.gsub!("{","(")
        s.gsub!("}",")")
    
        # tackle with ...
        s.scan(/([a-z][a-z0-9_-]+\s+)+\.\.\./){|m|
            p m.inspect
        }   
         s.gsub!(/([a-z][a-z0-9_-]+\s+)+\.\.\./, '\1')
         s = s.gsub(".", "\".\"")
         ret.push("#{keyword} = #{s}")
     }
    return ret
end

p "==== result ===="
r = convert(s).join("\n\n")

save_to_file(r, "convert_result")