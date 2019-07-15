require_relative "rubyutility.rb"

fname = $*[0]
p "file #{fname}"
if !fname
    fname = "abapref.txt"
end
s = read_file(fname)
p s
def convert(s)
    return s.gsub(/([A-Z0-9][A-Z0-9_-]*)/, '"\1"')
end

p "==== result ===="
print convert(s)