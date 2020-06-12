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
s1=<<HERE
write '1' ##no_text .
write '1' ##Mo_text .

HERE
if !testall
   
    s = s1

else

    r = ""
    for i in 0..100
        begin
            si = eval("s#{i}")
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
#$g_options = {
#    :include_dirs=>[]
#}
    p "======>#{s}"
    $g_search_dirs=["."]
    fname = "./"
    search_dirs = [File.dirname(__FILE__)]
    search_dirs.insert(0, File.dirname(fname))
    $g_search_dirs.insert(0, File.dirname(fname))

    # TODO seems not used
    $g_options = {
        :include_dirs=>search_dirs
    }
 
    scanner = Scanner.new(s)
    error = MyError.new("whaterver", scanner)
    parser = Preprocessor.new(scanner, error)
    # parser.Get
    p "preprocess content:#{scanner.buffer}"
    content = parser.Preprocess(true)
    p "====== result ======"
    p content
    p "====== content end ======"
    
    p "Preprocessor current line #{scanner.currLine}/#{scanner.currSym.line}"
    
    parser.show_macros
    
    error.PrintListing
end
test()
