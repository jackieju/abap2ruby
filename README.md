# abap2ruby
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

abaplib.rb:   Implemenation of ABAP keyword in ruby. like "write". You can definitly write your own lib to execute your translated abap program.

abap/:  abap code for testing, from https://github.com/Apress/sap-abap 

Trouble shooting
===
1. In case you encounter problem of mulit "else" in generated cparser.rb, it's because you use wrong syntax for LL(1) generator.
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


How to contribute
===
As you know, abap has very complicated syntax, because actually it put all functionality/Constant into syntax. For example, in c++, the syntax only defines the way to declare and call a function, but in abap, every function has different syntax, so "printf(xxx....)" is written in syntax...

Abap will include constant those happen in other language as user defined constant as keyword.
e.g.
in of logical expresion of abap, the syntax include.
    | {operand IS [NOT] INITIAL} 
    | {ref     IS [NOT] BOUND} 
    | {oref    IS [NOT] INSTANCE OF class|intf} 
    | {<fs>    IS [NOT] ASSIGNED} 
    | {para    IS [NOT] SUPPLIED} 
    | {para    IS [NOT] REQUESTED}
But in other language "INITAL" "BOUND" ... will be user defined constant, and the syntax will be like
    identifier IS [NOT] Expression
    ...

All in all, Abap is more like the SQL, so there is a struggling that whether it makes sense to translate ABAP to other language.
Because it's the same reason that every try to replace SQL with other language or functions will fail. Because in SQL's scenario, SQL is the best language to express what you want.
Imaging you use java or c++ or python to write a module replacing SQL's select statement, you will find it's more complex than just using SQL.
(That's why I like ruby rails, because they aware of this very early and did not use over-OR-mapping framework like a lot of other language, but provide the way just run SQL statement directly and return ruby Objects. (of course ruby rails also provide basic OR map functionality.))

Another reason for this struggling translate ABAP or SQL language is: 
If you translate it into other langauge, you will find that it became a lot of functions with very complicated parameters, for example, if you replace SQL select statement with a function "select(from, table, orderby, desc, groupby, in , limit, ...)", in the implementation of this function, you will need to check all this parameters again to find the real combined case, there will be so much logical branch, it's just like you parse the SQL statment again, even more complicated, which dose not make sense.

So shall we translate ABAP or just run it directly in a function like "run_abap(...)".

I think ABAP's problem is it over-use the syntax, or say mix the functionality with syntax. So the basic priciple is, only translate non-function syntax like expression, if statement, loop statment... and do not translate the "function" like select statement, search statement .... In another word, for these syntax and functionality like SQL select statement, we can keep it and just run it in function "run_apap('SEARCH OBJ FOR ...')". And for other syntax which is most case, for example variable define, if statement, loop statement... we could translate them into morden langauge, which will be clearer and neater.

So it will need very big efforts to convert ABAP ambigous grammar(https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm) to EBNF. It will be a very big EBNF.

The first step is convert the syntax for the keyword you want to implement from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm definition to EBNF(https://tomassetti.me/ebnf/), which is defined in cocoR/abap.atg.

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

In cp.rb, you can override the function in cocoR/o/cparser.rb to generate code. You can see the example of generating code for "write" Keyword, which is written in function "WriteStatement" in cp.rb

And then you can write you ABAP code for testing in xxx.abap, and run

<pre>
ruby translate.rb xxx.abap
</pre>

to test the parser.

In case you add new keyword to abap.atg, the scanner(scanner.rb) will need to be changed:
1. Set value of @@STATE0, copy the value from cocoR/output/cs.cpp
<pre>
int cScanner::STATE0[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,31,111,26,32,0,96,84,24,39,40,42,94,100,95,36,41,34,2,2,2,2,2,2,2,2,2,30,81,
                  87,80,89,0,0,1,1,1,113,1,1,1,1,1,1,1,1,114,1,1,1,1,1,1,1,1,1,1,1,1,
                  1,37,0,38,86,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                  1,1,1,0,82,0,112,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
</pre>                  
to scanner.rb
<pre>

   @@STATE0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,31,111,26,32,0,94,82,24,38,41,39,92,100,93,36,37,34,2,2,2,2,2,2,2,2,2,30,79,
                  85,78,87,0,0,1,1,1,113,1,1,1,1,1,1,1,1,114,1,1,1,1,1,1,1,1,1,1,1,1,
                  1,97,0,98,84,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                  1,1,1,0,80,0,112,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]                   
</pre>                  

2. copy content of method 'CheckLiteral', from cocoR/o/cscanner.rb

3. copy part of body of method 'Get', from cocoR/o/cscanner.rb to scanner.rb
    1) Copy the while loop after state=@sTATE0[@ch]
    2) Change .Len .Pos to .len .pos 
    
