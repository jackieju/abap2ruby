#  Abap2ruby
A Translator/compiler to convert SAP ABAP code to ruby code

This project is still under developing. Please check abap file and ruby file translated from abap under directory https://github.com/jackieju/abap2ruby/tree/master/examples  to see current functionalities.

Overview
===
The target of this project has 3 ties:
1. The basic goal is extract logic from ABAP code, so you can view/run it as ruby.
2. You can run the ruby code translated from ABAP with default executor of this projects.
3. You can extend or customize the executor to run the logic in your system.


Preparation
===
Ruby 2.6
The project is developed/tested on macos. But since it's ruby project, should be smooth to run on linux or win.


Run
===
<pre>
ruby translate.rb cp_testcase.abap
</pre>

Generate ABAP Parser
===
If you changed the abap.atg and want to regenerate parser.

<pre> 
cd cocoR
./go
</pre>

     Done

Code
===

cocoR/abap.atg:    The EBNF for ABAP

cocoR/o/cparser.rb The generated ABAP parser

cocoR/cocor17:     Source code of cocoR

cp.rb:      subclass of cparser.rb for overriding, the real place to generate code to implement ABAP keyword functionality like "write"

abap.rb:   Implemenation of ABAP keyword in ruby. like "write". You can definitly write your own lib to execute your translated abap program.

abap/:  abap code for testing, from https://github.com/Apress/sap-abap 


Unsupported keywrods
===
| Keyword | Reason |
| ------- | ------ |
| FORM    | Obsolete |


How to contribute
===
As you know, abap has very complicated syntax, because actually it put all functionality/Constant into syntax. For example, in c++, the syntax only defines the way to declare and call a function, but in abap, every function has different syntax, so "printf(xxx....)" is written in syntax... Or in a short word, ABAP syntax is mixed with semantic. When he introduce the syntax, he also introduce the semantic.

In ABAP syntax, those which are user defined constant in other language, are keywords.
<pre>
e.g.
in of logical expresion of abap, the syntax include.
    | {operand IS [NOT] INITIAL} 
    | {ref     IS [NOT] BOUND} 
    | {oref    IS [NOT] INSTANCE OF class|intf} 
    | {<fs>    IS [NOT] ASSIGNED} 
    | {para    IS [NOT] SUPPLIED} 
    | {para    IS [NOT] REQUESTED}
</pre>
But in other language "INITAL" "BOUND" ... will be user defined constant, and the syntax will be like
    identifier IS [NOT] Expression
    ...

All in all, Abap is more like the SQL, so there is a struggling that whether it makes sense to translate ABAP to other language.
Because it's the same reason that every try to replace SQL with other language or functions will fail. Because in SQL's scenario, SQL is the best language to express what you want.
Imaging you use java or c++ or python to write a module replacing SQL's select statement, you will find it's more complex than just using SQL.
(That's why I like ruby rails, because they aware of this very early and did not use over-OR-mapping framework like a lot of other language, but provide the way just run SQL statement directly and return ruby Objects. (of course ruby rails also provide basic OR map functionality.))

Another reason for this struggling translate ABAP or SQL language is: 
If you translate it into other langauge, you will find that it became a lot of functions with very complicated parameters, for example, if you replace SQL select statement with a function "select(from, table, orderby, desc, groupby, in , limit, ...)", in the implementation of this function, you will need to check all this parameters again to find the real combined case, there will be so much logical branches, it's just like you parse the SQL statment again, even more complicated, which dose not make sense.

So shall we translate ABAP or just run it directly in a function like "run_abap(...)".

I think ABAP's problem is it over-use the syntax, or say mix the functionality with syntax. So the basic priciple is, only translate non-function syntax like expression, if statement, loop statment... and do not translate the "function" like select statement, search statement .... In another word, for these syntax and functionality like SQL select statement, we can keep it and just run it in function "run_apap('SEARCH OBJ FOR ...')". And for other syntax which is most case, for example, variable define, if statement, loop statement... we could translate them into morden langauge, which will be clearer and neater.

So it will need very big efforts to convert ABAP ambigous grammar(https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm) to EBNF. It will be a very big EBNF.

### Why we are not using AST(abstract syntax tree)

1. Generate AST from code and then generate target code from AST will make it difficult to do troubleshooting. But in cocoR way, we can find the problem quickly.

2.

So now let's do your contribution.

### 1. Write EBNF

The first step is convert the syntax for the keyword you want to implement from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm definition to EBNF(https://tomassetti.me/ebnf/), which is defined in cocoR/abap.atg.

### 2. Generate parser

The second step is to generate parser based on your newly added syntax. Just run 
<pre>
cd cocoR
./go
</pre>
and run testcase to see if the generated code is OK.

<pre>
ruby translate.rb cp_testcase.abap
</pre>

But so far you just generated the parser and you need to generate real ruby code in next step.

### 3. Generate Ruby code in Parser

There 3 ways to generate ruby code.

The 1st ways is acctually you  do nothing.
Because the parser will just output the original source.

Then if you just put one line "(.make.)", it will do nice translate for you.
e.g.
<pre>
stASSERT = "ASSERT" [ ["ID" identifier ["SUBKEY" identifier]] 
         ["FIELDS" identifier ] 
         "CONDITION" ] LogExp  "." (.make.) .
</pre>
It will translate ASSERT statment to ruby code
<pre>
     assert()
</pre>

But it's actually an empty call. So you can add the parameter from parsing

<pre>
stASSERT = "ASSERT" [ ["ID" identifier (.cp[:id]=prevString.)["SUBKEY" identifier(.cp[:subkey]=prevString.)]] 
         ["FIELDS" identifier (.cp[:fields]=lus.)] 
         "CONDITION" ] LogExp (.cp[:o]=lus.) "." (.make.) .
</pre>
then it will translate the real assert statment.
e.g.
<pre>
ASSERT sy-subrc = 0.
</pre>
will output ruby code:
<pre>
  assert(o:sy.subrc == 0)
</pre>

So the main/recommened ways is:

Write your code-generating code (ruby) in atg file, between (. and .)

e.g.
<pre>
                       
    IfStatement = (. ret = stmts = ""  .)
                 "IF" Expression (. exp = lus .)  "."
                       [Statements (. stmts = lus .)] 
                       (.  ret += "if #{exp}\n#{stmts}\n" .)
                      { "ELSEIF" Expression (. exp = lus .) "."
                       [Statements (. stmts = lus .) ]
                       (.  ret += "elsif #{exp}\n#{stmts}\n" .)
                       }
                       [ "ELSE" "."   [Statements(. stmts = lus .)]   (.  ret += "else #{exp}\n#{stmts}\n" .) ]
                       "ENDIF"
                        (. 
                           ret += "\nend" 
                           src(ret)
                        .)
                         "." 
                                .
</pre>
Then run
<pre>
cd cocoR
./go
</pre>
 And in generated cocoR/o/cparser.rb:

<pre>
    def IfStatement()
       _in_()


       ret=stmts=""
     

       Expect(C_IFSym)
       Expression()

       exp=lus;

       Expect(C_PointSym)
       if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DEFAULTSym||@sym==C_DATASym||@sym>=C_CONSTANTSSym&&@sym<=C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
          Statements()

          stmts=lus;

       end


       ret+="if #{exp}\n#{stmts}\n";

       while (@sym==C_ELSEIFSym)
          Get()
          Expression()

          exp=lus;

          Expect(C_PointSym)
          if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DEFAULTSym||@sym==C_DATASym||@sym>=C_CONSTANTSSym&&@sym<=C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
             Statements()

             stmts=lus;

          end


          ret+="elsif #{exp}\n#{stmts}\n";

       end

       if @sym==C_ELSESym
          Get()
          Expect(C_PointSym)
          if @sym>=C_identifierSym&&@sym<=C_numberSym||@sym>=C_stringD1Sym&&@sym<=C_charSym||@sym==C_spaceD1Sym||@sym>=C_PointSym&&@sym<=C_FUNCTIONSym||@sym>=C_APPENDSym&&@sym<=C_INITIALSym||@sym>=C_CONCATENATESym&&@sym<=C_INSym||@sym>=C_SEARCHSym&&@sym<=C_FORSym||@sym==C_REFRESHSym||@sym==C_DESCRIBESym||@sym==C_RAISESym||@sym==C_EXPORTINGSym||@sym>=C_MESSAGESym&&@sym<=C_LparenSym||@sym==C_RAISINGSym||@sym==C_LOOPSym||@sym==C_DEFAULTSym||@sym==C_DATASym||@sym>=C_CONSTANTSSym&&@sym<=C_WRITESym||@sym==C_StarSym||@sym>=C_breakSym&&@sym<=C_DOSym||@sym==C_CASESym||@sym==C_forSym||@sym==C_CALLSym||@sym==C_IMPORTINGSym||@sym>=C_CHANGINGSym&&@sym<=C_EXCEPTIONSSym||@sym>=C_PARAMETERMinusTABLESym&&@sym<=C_IFSym||@sym>=C_returnSym&&@sym<=C_WHILESym||@sym==C_CLASSSym||@sym==C_METHODSym||@sym==C_METHODSSym||@sym>=C_RETURNINGSym&&@sym<=C_SPLITSym||@sym==C_AndSym||@sym==C_NOTSym||@sym>=C_PlusSym&&@sym<=C_MinusSym||@sym>=C_PlusPlusSym&&@sym<=C_MinusMinusSym||@sym>=C_BangSym&&@sym<=C_REQUESTEDSym
             Statements()

             stmts=lus;

          end


          ret+="else #{exp}\n#{stmts}\n";

       end

       Expect(C_ENDIFSym)


       ret+="\nend"
       src(ret);

       Expect(C_PointSym)
       _out_()
    end
</pre>

There are some helper method you will use:

```
  lus:     The last unterminator's return value
  src(x):  Set x as return value of current statemet
  src:     Current value of of current parsing statement
  re(s):    Replace current source node content to s
```
All the help methods are defined in cp.rb.
You can also check all their usage samples in abap.atg


The other but unrecommended way is:

In cp.rb, you can override the function in cocoR/o/cparser.rb to generate code. You can see the example of generating code for "write" Keyword, which is written in function "WriteStatement" in cp.rb



And then you can write you ABAP code for testing in xxx.abap, and run

<pre>
ruby translate.rb xxx.abap
</pre>

to test the parser.

In case you add new keyword to abap.atg, you need to generate parser again:
<pre>
cd cocoR
./go
</pre>

    
Rebuild cocoR
===
In case you want to rebuild cocoR:
<pre>
    cd cocoR/cocor17/sources
    make -f unix.mk new
    cp cocor ../../
</pre>

Tips for EBNF
===
1. If the generated parser include code like 
<pre>
    if 1
    ...
</pre>
It indicate EBNF has problem, usually duplicated.
e.g.
<pre>
 NN =  (AA | BB| CC ).
 AA = "AA" "at" identifier ["RIGHT"].
 BB = "AA" "at" number ["LEFT"] .
 CC = "AA" "at" string1 .
</pre>
will generate code :
<pre>
    def NN()
...
       if @sym==C_AASym
          AA()
       else
          if 1
             BB()
          else
             if 1
                CC()
             else
                GenError(386)
             end

          end

       end
...
    end
</pre>
You should change the syntax to:
<pre>
     NN = "AA" "at" (identifier ["RIGHT"] |  number ["LEFT"] | string1 ) .
</pre>

Another sample:

<pre>
    NN = "AA" "at" (["PPP"] number ["LEFT"] string1 | number ["CENTER"] string1 | CC ).
    CC =  identifier ["RIGHT"] .
</pre>

will generate code:
<pre>
    def NN()
...
       Expect(C_AASym)
       Expect(C_atSym)
       if @sym==C_numberSym||@sym==C_PPPSym
          if @sym==C_PPPSym
             Get()
          end

          Expect(C_numberSym)
          if @sym==C_LEFTSym
             Get()
          end

          Expect(C_stringD1Sym)
       else
          if 1
             Get()
             if @sym==C_CENTERSym
                Get()
             end

             Expect(C_stringD1Sym)
          else
             if @sym==C_identifierSym
                CC()
             else
                GenError(388)
             end

          end

       end
...
    end
</pre>
Becuase parser will be confused if encounter number after AA At, because it's a LL(1) gramma parser, which can only decide by looking forward one token.
So it should be changed to:
<pre>
    NN = "AA" "at" (["PPP"] number ["LEFT"|"CENTER"] string1  | CC ).
</pre>
And check the consistent manually by your code, instead of by gramma.

2. In syntax from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm
<pre>
{}: Actually like () in EBNF, and in most case it can be ignored
...: means repeat
</pre>

EBNF Trouble shooting
===
1. In case you encounter problem of multi "else" in generated cparser.rb, it's because you use wrong syntax for LL(1) generator.
e.g.
"Statement" is defined as:
<pre> 

  Statement            = 
      ...
                           | ClassStatement
                           | ClassImplStatement
</pre> 

in which the ClassStatment and ClassImplStatement are defined as:
<pre> 

ClassStatement = "CLASS" identifier "DEFINITION" ...
ClassImplStatement = "CLASS" identifier "IMPLEMENTATION" "." ...
</pre> 

This will cause a LL(1) parser cannot decide which way to go by looking forward only one token.
So you should change it to :
<pre> 

  Statement            = 
      ...
                           |( ClassStatement
                           | ClassImplStatement)
</pre> 


2. Because abap syntax is defined with very ambigous way or redundant way like:
<pre> 

Typing = (
        "TYPE" identifier  
        | "LIKE" identifier 
        |  "TYPE" ( ["LINE" "OF"] identifier | "REF" "TO" identifier ) 
        |  "LIKE" ( ["LINE" "OF"] identifier | "REF" "TO" identifier) 
         )
 "." .
</pre> 
         
This also will cause multi "else" problem. It should be changed to:
<pre> 

Typing = (
        "TYPE"    ( identifier | ["LINE" "OF"] identifier | "REF" "TO" identifier ) 
        | "LIKE" [( ["LINE" "OF"] | "REF" "TO" )] identifier 
      ...
</pre> 
    
Please be noticed that actually
  <pre> 
  
     "XXXX"    ( identifier | ["LINE" "OF"] identifier | "REF" "TO" identifier )
 </pre> 
 
 and 
 <pre> 
 
     "XXXX" [( ["LINE" "OF"] | "REF" "TO" )] identifier 
</pre> 

are equal, and usually we take the second form.
