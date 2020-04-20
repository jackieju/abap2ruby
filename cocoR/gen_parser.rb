require "FileUtils"
require_relative "../rubyutility.rb"

list = [
    "VariableDefineStatement",
    "WriteStatement",
 #   "AssignmentStatement",
   # "BreakStatement",
    "ContinueStatement",
   # "stDO",
   # "ForStatement",
#    "IfStatement",
    "ReturnStatement",
 #   "stWHILE",
  #  "LoopStatement",
   # "CaseStatement",
#    "stCALL",
    #"ClassStatement",
    #"ClassImplStatement",
    #"MethodStatement",
    #"MethodsStatement",
 #   "FunctionDef",
    "MessasgeStatement",
    #"SearchStatement",
    "stAPPEND",
    "stSPLIT",
    "stRAISE",
    "stCONSTANTS",
    "stMOVE",
  #  "stWITH",
    "stTABLES",
    "stAUTHORITY_CHECK",
    "stDELETE",
    "stEVENTS",
    #"stON",
#    "stOPEN",
    "stFETCH",
 #   "stPROVIDE",
    "stREAD",
    "stSORT",
    "stSUBMIT",
   # "stTRY",
    "stADD",
    "stADD_CORRESPONDING",
    "stALIASES",
    "stASSERT",
    "stASSIGN",
    "stBACK",
    "stBREAK_POINT",
    #"stCATCH",
    "stCHECK",
    "stCLASS_DATA",
    "stCLASS_EVENTS",
    "stCLASS_POOL",
    "stCLEAR",
    "stCLOSE",
    "stCOLLECT",
    "stCOMMIT",
    "stCOMPUTE",
    "stCONCATENATE",
    "stCONDENSE",
    "stCONTROLS",
    "stCONVERT",
    "stCREATE",
    "stDEMAND",
    "stDESCRIBE",
    "stDETAIL",
    "stDIVIDE",
    "stDIVIDE_CORRESPONDING",
    "stEDITOR_CALL",
    "stEND_OF_PAGE",
    "stEND_OF_SELECTION",
    "stEXIT",
    "stEXPORT",
    "stEXTRACT",
    "stFIELD_GROUPS",
    "stFIELD_SYMBOLS",
    "stFIELDS",
    "stFIND",
    "stFORMAT",
    "stFREE",
    "stFUNCTION_POOL",
    "stGENERATE",
    "stGET",
    "stHIDE",
    "stIMPORT",
    "stINCLUDE",
    "stINFOTYPES",
    "stINITIALIZATION",
    "stINPUT",
    #"stINSERT",
    "stINTERFACE",
    "stINTERFACE_POOL",
    "stINTERFACES",
    "stLEAVE",
    "stLOAD_OF_PROGRAM",
    "stLOCAL",
    "stLOG_POINT",
    "stMAXIMUM",
    "stMINIMUM",
    "stMODULE",
    "stMULTIPLY",
    "stMULTIPLY_CORRESPONDING",
    "stNEW_LINE",
    "stNEW_PAGE",
    "stNEW_SECTION",
    "stNODES",
    "stOVERLAY",
    "stPACK",
    "stPARAMETERS",
    "stPERFORM",
    "stPOSITION",
    "stPRINT_CONTROL",
    "stPROGRAM",
    "stRANGES",
    "stRECEIVE",
    "stREFRESH",
    "stREJECT",
    "stREPLACE",
    "stRESERVE",
    "stRESUME",
    "stRETRY",
    "stRETURN",
    "stROLLBACK",
    "stSCROLL",
    "stSELECT_OPTIONS",
    "stSELECTION_SCREEN",
    "stSET",
    "stSHIFT",
    "stSKIP",
    "stSTOP",
    "stSUBTRACT",
    "stSUBTRACT_CORRESPONDING",
    "stSUM",
    "stSUMMARY",
    "stSUMMING",
    "stSUPPLY",
    "stSUPPRESS",
    "stSYNTAX_CHECK",
    "stTEST_INJECTION",
    "stTEST_SEAM",
    "stTOP_OF_PAGE",
    "stTRANSFER",
    "stTRANSLATE",
    "stTRUNCATE",
    "stTYPE_POOL",
    "stTYPE_POOLS",
    "stTYPES",
    "stULINE",
    "stUNASSIGN",
    "stUNPACK",
    "stUPDATE",
    "stWAIT",
    "stWINDOW",
    "stSELECT"
]

$rules = {
 "Expression"=> read_file("expression.atg.frag"),
"NameOrRef"=>   'NameOrRef = identifier|"("identifier")" .',
"Exps" => "Exps =  Expression{Expression} .",
"Statements" => "Statements =  Statement { Statement } .",
}

def read_dep_rules()
    s = read_file("dep_rules.atg.frag")
#    p s
    s.scan(/^\s*((\w+)\s*=.*?\.)\s*\n\s*\n/m){|m|
   #     p m
        $rules[m[1]]=m[0]
    }
end

read_dep_rules
print $rules["GroupBy"]

def add_rules(rule, options)
    print "add_rule(#{options.size}) for #{rule}\n"
    p "ep:#{options["Expression"]}"
    
    dep_rules = ""
    options.each{|k,v|
        p "==>k:#{k}"
        if rule.index(k)
            dep_rules += v
            p "added rules #{k}"
            options.delete(k)
            p "#{options["Expression"]}"
            dep_rules += add_rules(v.gsub(k, ""), options)
            #v.scan(/^\s*(.*?)\s*=.*?\.\s*(\r\n\s*\r\n|$)/m){|m|
            #    if m[0] 
            #}
            
        end
        
    }
    return dep_rules
end




num = 0
fname = $*[0]
p "file #{fname}"
if !fname
   # fname = "abapref.txt"
   fname = "abap.atg"
end
content = read_file(fname)
#p content
list.each{|l|
    p "==>1:#{l}"
    r = nil
  #  reg = Regexp.new("^\\s*#{l}\\s*=.*?\\.\\s*\\r\\n\\s*\\r\\n", "m")
    content.scan(/^\s*#{l}\s*=.*?[\s\"]\.\s*\r\n\s*\r\n/m){|m|
        p "-------------------------------------------------------------------------------------\n"
        print m+"\n"
        p "-------------------------------------------------------------------------------------\n"
        r = m.strip
    }
    rule = nil
    print "==>r:#{r}\n"
    
    #r.scan(/^\s*#{l}\s*=(.*?)\.$/m){|m|
    #    rule = m[0]
    #}
    
    co= nil

    r.scan(/^\s*#{l}\s*=\s*(\(\..*?\.\))*\s*(\".*?\")(.*)/m){|m|
    co = m[1]
     rule = m[2]
    }
    r.scan(/^\s*#{l}\s*=.*?(\(.*?\))(.*)/m){|m|
        co = m[0]
         rule = m[1]
    } if co == nil
    name = l
     print "===>rule:#{rule}\n"
    if name.start_with?("st")
        name = l[2..l.size-1]
    end
    content.sub!(r, "#{l}= #{co} (. parseAbap(\"#{name}\") .).") if r
   # content.sub!(r, "") if r
   parser_name = name
   print "===>rule2:#{rule}\n"
    dep_rules = add_rules(rule, $rules.clone)
   tmpl=<<HERE
COMPILER #{parser_name}

CHARACTERS
  letter   = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" .
  digit    = "0123456789" .
  hexdigit = digit + "ABCDEFabcdef" .
  tab      = CHR(9) .
  eol      = CHR(10) .
  files    = letter + digit + ":\\." .
  chars    = CHR(32) .. CHR(255) - '"' .
  strings  = CHR(32) .. CHR(255) - "'".
  strings1 = CHR(32) .. CHR(255) - '"' .	
  macros   = ANY - eol .
  space = CHR(32).

COMMENTS FROM "/*" TO "*/"
COMMENTS FROM "\\"" TO eol

IGNORE
  tab + eol + CHR(13)

TOKENS
  identifier = ( "_" | letter) { "_" | "-" | letter | digit } .
  number     = digit { digit } [ "U" | "u" | "L" | "l" ] .
  hexnumber  = "0" ( "x" | "X" ) hexdigit { hexdigit } [ "U" | "u" | "L" | "l" ] .
  string1     = "'" { strings } "'" .
  char       = '"' [ "\\\\" ] chars '"' .
   Colon = ":" .
  space1 = space .

PRAGMAS

  PreProcessor = "#" ( letter ) .

PRODUCTIONS

 #{parser_name} = #{rule} 
 
 #{dep_rules}
 
END #{parser_name}.
HERE
FileUtils.makedirs("./keyword_parser/#{name}")

atg_fname = "./keyword_parser/#{name}/#{parser_name}.atg"
save_to_file(tmpl, atg_fname)

r = `./cocor #{atg_fname}`

p "return #{r}, #{$?}"
if $?.to_s.index("exit 0") == nil
    p "#{atg_fname} has error !"
    exit
end
num += 1
#`./create_keyword_parser #{name}`

}

p "create #{num} atg"
#p content

#save_to_file(content, "abap2.atg")


