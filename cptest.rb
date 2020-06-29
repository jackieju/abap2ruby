require_relative 'macro.rb'
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

   *************************
   * Output System Fields  **
   **************************

   wRITE /5 'SY-ABCDE' .
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
s1=<<HERE
*&---------------------------------------------------------------------*
*& Report  YCL_CH04_03_ELEM_DATA_OBJECTS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT  YCL_CH04_03_ELEM_DATA_OBJECTS.

*******************************************************************
* declare elementary DATA objects, assign values with declaration *
* output data objects                                             *
*******************************************************************
***********************************************************************
* key word DATA used to declare data (variables)                     **
*                                                                    **
* : & , used for chaining i.e. avoid repetition of key word DATA.    **
*                                                                    **
* variable TYPE is specified with the key word TYPE followed by      **
* C/D/F/I/N/P/T/X/STRING/XSTRING. if TYPE not specified, assumes     **
* default TYPE as C.                                                 **
*                                                                    **
* length to be specified  for TYPES C,N,P,X in parenthesis. length   **
* is in bytes for P & X. if length not specified for TYPES C,N,P,X   **
* it assumes the default length.(see table 4.1) lengths of TYPES     **
* D,F,I,T is fixed. TYPES STRING, XSTRING length varies at run time  **
*                                                                    **
* the VALUE clause is to assign a starting value. it is optional.    **
*                                                                    **
* decimals for TYPE F,P are specified with key word DECIMALS         **
* followed by the number of decimals                                 **
*                                                                    **
* if single quote required as part of literal string,single quote    **
* should be entered twice like 'ABC''' is for string ABC'            **
***********************************************************************

DATA: CNAME(25)      TYPE C
      VALUE 'MPHASIS - an H.P. Company', " length in parenthesis
                                         " VALUE is optional

      TODAY          TYPE D
      VALUE '20130101', " numeric literals not containing any sign
                        " & decimal can be enclosed in single quotes
                        " numeric literals containing sign or decimal
                        " should be enclosed in single quotes


      FNUM           TYPE F VALUE '12345.6789',
      COUNT          TYPE I VALUE 987654321,
      ECODE(7)       TYPE N VALUE 2191778,
      BASIC_SAL(4)   TYPE P DECIMALS 2 VALUE 20000,
      NOW            TYPE T VALUE '094500', "give value in quotes
      HEXA(8)        TYPE X VALUE '0123456789ABCDEF',
      STRNG          TYPE STRING VALUE 'MORGAN''S GATE', "single quote
                                                         "as part of string

      XSTRNG         TYPE XSTRING." XSTRING does not take VALUE addition
***********************************************************************
WRITE:/5 'TYPE C      :', CNAME,
      /5 'TYPE D      :', TODAY,
      /5 'TYPE F      :', FNUM,
      /5 'TYPE I      :', COUNT,
      /5 'TYPE N      :', ECODE,
      /5 'TYPE P      :', BASIC_SAL,
      /5 'TYPE T      :', NOW,
      /5 'TYPE X      :', HEXA,
      /5 'TYPE STRING :', STRNG.
HERE
s2=<<HERE
REPORT TEST.
   DATA a-c type i .
   a->b = 1.
   .
   
   DATA:
     lr_accpe_qaf                TYPE REF TO if_a1fia_acproerr_qaf_eco=>ty_root,
     lv_user_account_id          TYPE apc_c_user_account_id,
     lv_determine_navigation     TYPE syboolean.

 * Initialization
   rt_accpe_qaf = it_accpe_qaf.
   ls_out_data-parent_node_id      = ls_applog_ovv_item-parent_node_id.
*   data:
a = 1.
HERE
s3=<<HERE
REPORT TEST.
ad->dq = 1.
*f(a->*).
HERE
s4=<<HERE
REPORT TEST.
a = b = c.
HERE
s5=<<HERE
REPORT TEST.
a =     in_source_bo_node_name        = if_fia_acc_adjustment_run=>co_bo_node-root "Assumption that the core bo node is directly under Root

mo_lcp_bo->retrieve_default_node_values(
  EXPORTING
    in_association_name           = ls_attribute_map=>core_bo_node_name "Assumption that the core bo node is directly under Root
    in_source_bo_node_name        = if_fia_acc_adjustment_run=>co_bo_node-root "Assumption that the core bo node is directly under Root
    in_source_node_id             = mv_eco_root_node_id "Assumption that the core bo node is directly under Root

).
HERE
s6=<<HERE
REPORT TEST.
mo_mdro_schedule_immediately->schedule_immediately(
  EXPORTING
    io_facade   = me->mo_provider_context->get_lcp_facade( )
  IMPORTING
    et_messages = lt_message "Don't add this to message handler as we are not interested in TechO's messages
    et_mdro_root_to_bgjobsch_map = DATA(lt_mdro_root_to_bgjobsch_map)
).
HERE

s7=<<HERE
REPORT TEST.

      CALL METHOD mo_rnid_manager->sync_data
        EXPORTING
          iv_node_name = in_bo_node_name
*/        IT_NODE_ID   = OUT_NODE_IDS
          it_data      = out_data.
          
HERE
s7=<<HERE
class ABC definition
  public
  create public .
  data lt_eco_attr_for_cur_core_node type SESF_BO_NODE_ID .
ENDCLASS.

CLASS ABC IMPLEMENTATION.


METHOD if_esf_provider_access~retrieve1.
DATA lt_requested_core_attr TYPE sesf_string_tab.
ENDMETHOD.

METHOD if_esf_provider_access~retrieve.
DATA lt_requested_core_attr TYPE sesf_string_tab.
DATA lt_eco_attr_for_cur_core_node TYPE sesf_string_tab.
a = b
   
ENDMETHOD.  
ENDCLASS.    
HERE
s8=<<HERE
interface IB  .
constants CO_BO_NAME type STRING value 'A1FIA_AAR_CREATE_QAF_ECO' ##no_text .
constants:
  begin of CO_BO_NODE,
    BUPA                           type STRING value 'BUPA',
    COMPANY                        type STRING value 'COMPANY',
    COST_CENTRE                    type STRING value 'COST_CENTRE',
end of CO_BO_NODE .
    
endinterface.
HERE

s9=<<HERE
REPORT TEST.
    CASE lv_affected_core_node.
      WHEN if_fia_acc_adjustment_run=>co_bo_node-sel_by_company.
    ENDCASE          .
HERE
s10=<<HERE
REPORT T.
 mo_adaptation_handler = cl_bsa_factory=>get_adaptation_handler_for_co().
HERE
s11=<<HERE
HERE
$ar = []
#def dump_testcase
    p "==>dump_testcase"
    r = ""
    for i in 0..200
        p i
        begin
            si = eval("s#{i}")
            $ar.push(si)
            p "==>push s#{i}:#{si}"
            
        rescue Exception=>e
            p e
            break
        end
        if si !=nil
            r += "* testcase #{i} \n" + si +"\n"
        end
    end
    save_to_file(r, "cp_testcase.abap")
    #end

#dump_testcase
  p "===>all test cases:#{$ar.size}"
if testall != true
    if testall == false || testall == nil
        s = $ar.last
      
        p "case number:#{$ar.size}"
        print "===>case:\n#{s}"
    else
       # s = eval("s#{testall}") 
       s = $ar[testall]
    end
    
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
p "case content:"
p s

scanner = Scanner.new(s)
error = MyError.new("whaterver", scanner)
parser = Preprocessor.new(scanner, error)
s = parser.Preprocess
p "===>preprocess output:#{s}"

scanner = Scanner.new(s)
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

    print "parsing result:#{ret}\n"
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
 
rescue Exception=>e
    parser.dump_pos
    throw e
end
end # end of test


#=end
test()
#dump_testcase
p "$typedef:#{$typedef.inspect}"

# execute after test

