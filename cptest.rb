
######### test ################
#=begin
def test(testall=false)
    s0=<<HERE
    *&---------------------------------------------------------------------*
    *& Report  YCL_CH04_02_LIST_SYS_FIELDS
    *&
    *&---------------------------------------------------------------------*
    *&
    *&
    *&---------------------------------------------------------------------*

    REPORT  YCL_CH04_02_LIST_SYS_FIELDS.

    **************************
    * Output System Fields  **
    **************************

    WRITE:/5 'SY-ABCDE', SY-ABCDE, " / start output on new line
          /5 'SY-DATUM', SY-DATUM, " 5 start the output from 5th column
          /5 'SY-DBSYS', SY-DBSYS, " : & , are for chaining i.e. avoiding
                                   " repetition of the key word WRITE
          /5 'SY-HOST ', SY-HOST,  " text literals enclosed in single quote
          /5 'SY-LANGU', SY-LANGU,
          /5 'SY-MANDT', SY-MANDT,
          /5 'SY-OPSYS', SY-OPSYS,
          /5 'SY-REPID', SY-REPID,
          /5 'SY-SAPRL', SY-SAPRL,
          /5 'SY-SYSID', SY-SYSID,
          /5 'SY-TCODE', SY-TCODE,
          /5 'SY-UNAME', SY-UNAME,
          /5 'SY-UZEIT', SY-UZEIT.
HERE

#def dump_testcase
    p "==>dump_testcase"
    r = ""
    for i in 0..200
        p i
        begin
            si = eval("# test case #{i}\ns#{i}")
            p "testcase:#{si}"
        rescue Exception=>e
            p e
            break
        end
        if si !=nil
            r += "// testcase #{i} \n" + si +"\n"
        end
    end
    save_to_file(r, "cp_testcase.cpp")
    #end

if !testall
   
    s = s0
else

    r = ""
    for i in 0..200
        begin
            si = eval("# test case #{i}\ns#{i}")
        rescue
            break
        end
        if si !=nil
            r += si +"\n"
        end
    end
    s = r
    p(" ==== find #{i} testcase")
end

p s

scanner = CScanner.new(s, false)
p "===>scanner =#{scanner}"
p "==>#{scanner.nextSym}"
$sc = scanner
$sc_cur = scanner.currSym.sym
error = MyError.new("whaterver", scanner)
parser = Parser.new(scanner, error)

parser.Get
# puts "FunctionBody return \n#{parser.send("FunctionBody")}"
begin
    ret = parser.C

# parser.Preprocess

# scanner.Reset
# parser.Get

# ret = parser.C

    p "parsing result:#{ret}"
    error.PrintListing

    p "---->list classes"
    def list_classes(cls, tabs=0)

        cls.each{|k,v|
            for i in 0..tabs
                print("\t")
            end
            print "class #{k}@#{v}\n"
            if v
                list_classes(v.modules,tabs+1)
                list_classes(v.classes,tabs+1)
            end
        }
    
    end
    list_classes($g_classdefs)
    parser.dump_classes_as_ruby
    end # end of test
 
rescue Exception=>e
    parser.dump_pos
    throw e
end


#=end
test(false)
#dump_testcase
p "$typedef:#{$typedef.inspect}"

# execute after test

