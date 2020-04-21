Expression           =  Conditional { AssignmentOperator Expression   }  .

      Conditional          =  LogORExp  .

      LogORExp             =  LogANDExp   { ("||" | "OR" | "EQUIV") LogANDExp }  .

      LogANDExp            =  InclORExp   { ("&&" | "AND") InclORExp }
 
    .

      InclORExp            =  ExclORExp   { "|" ExclORExp }   .

      ExclORExp            =  ANDExp      { "^" ANDExp }    .

      ANDExp               =  EqualExp    { "&" EqualExp }    .

      EqualExp             =    RelationExp { ( "="| "EQ"| "<>" | "NE" | "IS" ["NOT"] ) RelationExp } |
      RelationExp ["NOT"] "BETWEEN" RelationExp "AND" RelationExp  
      .

      RelationExp          =    ShiftExp    { 
                                  ( "<" | "LT"  | ">" | "GT" | "<=" | "LE" | ">=" | "GE" | "CO" | "CN" | "CA" | "NA" | "CS" | "NS" | "CP" | "NP" |"BYTE-CO" | "BYTE-CN" | "BYTE-CA" | "BYTE-NA" | "BYTE-CS" | "BYTE-NS" )  
                                   ShiftExp   }   .

      ShiftExp             =  AddExp      { ( "<<" | ">>" ) AddExp }       .
              
                
                
      AddExp               =  MultExp     { ( "+"  | "-"  ) MultExp }    .

      MultExp              =   CastExp  
     { ( "*"   | "/" | "DIV"  | "%"  | "MOD" | "**" ) CastExp }    .

      CastExp              =   UnaryExp     .



      UnaryExp             =  PostFixExp
                             | ( "++" | "--" ) UnaryExp
                             | UnaryOperator CastExp 	
                            
    					.



      PostFixExp           =  Primary
                             { "[" Expression "]"
                              | FunctionCall
                              | "->" identifier
                              | "=>" identifier
                              | "++"
                              | "--"
                             }    .   
  
      Primary              =  (  string1 | char | number | "(" Expression ")" | PredefinedConstant | identifier )   .

      FunctionCall        =  "("   [ ActualParameters] ")"      .

      ActualParameters    =    Expression   { "," Expression   }      .

      AssignmentOperator   =    "="  | "*=" | "/=" | "%=" | "+=" | "-=" | "&="
                             | "^=" | "|=" | "<<=" | ">>="    .

      UnaryOperator        =  "+" | MinusOperator | "*" | "!" | "&" | "~" | "NOT" |  "INSTANCE" "OF" | "IN"    .

      MinusOperator = space1 "-" | "-" space1 .

      PredefinedConstant = "INITIAL" | "BOUND" | "ASSIGNED" | "SUPPLIED" | "REQUESTED" .
