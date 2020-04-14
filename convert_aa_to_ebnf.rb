require "FileUtils"
# convert ambigous ABAP syntax from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm to EBNF
require_relative "rubyutility.rb"


$map ={
    "identifier"=>"(wa|clnt|entity|dbcur|evt|itab|itab_type|struc|bdc_tab|rtab|stab|variant|ptab|group|dref|idx|lang|dynnr|prog|otab|dset|oref|dobj|dtype|blob|clob|abap_type|type|comp|key_name|didentifier|primary_key|dbtab|view)",
    "number"=>"(width|pos|len|dec|n|line|dynnr)",
    "Expresion"=>"(expr)",
    "string1"=>"(text|title|cntry|mod|col)",
    "Statements"=>"(statement_block)",
    "Typing"=>"(typing)"
    
}
fname = $*[0]
p "file #{fname}"
if !fname
   # fname = "abapref.txt"
   fname = "abap_syntax.txt"
end
s = read_file(fname)
print s
print "\n"
def convert(str)
    # remove comments
    str = str.gsub(/^\#.*?$/m, "")
    print "str->#{str}"
    ar = str.split(/\n\s*\n/)
    list = {}
    ar.each{|s|
        s = s.strip
        next if s == ""
        # get keyword
        keyword = nil
        s.scan(/[A-Z][A-Z0-9_-]+/){|m|
            keyword = m
            break
        }
        print("\n-----------\n")
        print (s+"\n")
        print("\n-----------\n")
        
        p "keyword:#{keyword}"
        if list[keyword] == nil
            list[keyword] = []
        end
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
        if s.index("...")
            raise ("... is not parsed")
        end
        print("==>#{keyword}:#{s}\n")
        s = s.gsub(".", "\".\"")
        
        s = s.gsub(/,\@\~\*\+/, '"\1"')
        print("==>2#{keyword}:#{s}\n")
        
        list[keyword].push(s)
     }
     ret = []
     
     # merge rule of same keyword
     list.each{|k,v|
         if v.size >1
             t=""
             v.each{|l|
                 if !l.strip.start_with?("\"#{k}\"") 
                     raise "error: '#{l}' not start with keyword #{k}"
                 end
                 if !l.strip.end_with?("\".\"")
                     raise "error: '#{l}' not end with keyword \".\""
                     
                 end
                 t += " | " if t != ""
                 l = l.gsub(/\"\.\"$/,"")
                 t += l[k.size+2..l.size-1]
             }
            ret.push("#{k} = \"#{k}\"( #{t} ) \".\"")
        else
            ret.push("#{k} = #{v[0]}")
         end
     
     }
     
    return ret
end

p "==== result ===="
r = convert(s).join("\n\n")

save_to_file(r, "convert_result")