
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

       WRITE /5 'SY-ABCDE' .
   WRITE  SY-ABCDE .
   WRITE  /5 'SY-DATUM' .
   WRITE  SY-DATUM .
   WRITE  /5 'SY-DBSYS' .
   WRITE  SY-DBSYS .
   WRITE  /5 'SY-HOST ' .
   WRITE  SY-HOST .
   WRITE  /5 'SY-LANGU' .
   WRITE  SY-LANGU .
   WRITE  /5 'SY-MANDT' .
   WRITE  SY-MANDT .
   WRITE  /5 'SY-OPSYS' .
   WRITE  SY-OPSYS .
   WRITE  /5 'SY-REPID' .
   WRITE  SY-REPID .
   WRITE  /5 'SY-SAPRL' .
   WRITE  SY-SAPRL .
   WRITE  /5 'SY-SYSID' .
   WRITE  SY-SYSID .
   WRITE  /5 'SY-TCODE' .
   WRITE  SY-TCODE .
   WRITE  /5 'SY-UNAME' .
   WRITE  SY-UNAME .
   WRITE  /5 'SY-UZEIT' .
   WRITE  SY-UZEIT .
   .

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

