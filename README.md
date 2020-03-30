# abap2ruby


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


Trouble shooting
===
1. In case you encounter problem of mulit "else" in generated cparser.rb, it's because you use wrong syntax for LL(1) generator.
e.g.
"Statment" is defined as:
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
As you know, abap has very complicated syntax, because actually it put all functionality into syntax. For example, in c++, the syntax only defines the way to declare and call a function, but in abap, every function has different syntax, so "printf(xxx....)" is written in syntax...

So it will need very big efforts to convert ABAP ambigous grammar(https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm) to EBNF. It will be a very big EBNF.

The first step is convert the syntax for the keyword you want to implement from https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/index.htm definition to EBNF(https://tomassetti.me/ebnf/), which is defined in cocoR/abap.atg.

The second step is to generate parser based on your newly added syntax. Just ruby 
<pre>
cd cocoR
./go
</pre>
and run testcase to see if the generated code is OK.


<pre>
ruby translate.rb cp_testcase.abap
</pre>

But so far you just generated the parser and you need to generate real ruby code in nex step.

In cp.rb, you can override the function in cocoR/o/cparser.rb to generate code. You can see the example of generating code for "write" Keyword, which in written in function "WriteStatement" in cp.rb