#!/usr/bin/env ruby
require "FileUtils"
load "rubyutility.rb"

fname = $*[0]
p "file:#{fname}"

file=File.open(fname,"r")  
t = nil      
content = ""

file.each_line do |line|
    content += line
end

print content
s=""
s2 = ""
content.scan(/define\s+(\w+)\s+(\d+)\s+\/\*(.*?)\*\//m){|m|
p m.inspect
next if m[0] == "EOF_Sym"
s+="#{m[0]} = #{m[1]} ##{m[2]}\n"
word = m[2].strip
if word[0] != '"'
    word = "\"#{word}\""
end
s2+= "#{word},\n"
}

ret =<<HERE

C_EOF_Sym = EOF_Sym = 	0	#  EOF */
C_CRLF_Sym = 0.5

#{s}

MAXT =	No_Sym 	# Max Terminals */
C_MAXT = MAXT


SYMS=[  
    "EOF",
    #{s2}
]
HERE
print ret

save_to_file(ret, "sym.rb")