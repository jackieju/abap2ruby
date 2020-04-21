Format_options = ["COLOR" 
        ( 
            ( ["="] 
                ( 
                    ( "COL_BACKGROUND" 
                    /*    | ("1" | "COL_HEADING" ) 
                        | ("2" | "COL_NORMAL" ) 
                        | ("3" | "COL_TOTAL" ) 
                        | ("4" | "COL_KEY" ) 
                        | ("5" | "COL_POSITIVE" ) 
                        | ("6" | "COL_NEGATIVE" ) 
                        | ("7" | "COL_GROUP" ) */
                        "COL_HEADING" | "COL_NORMAL" | "COL_TOTAL" | "COL_KEY"  | "COL_POSITIVE" | "COL_NEGATIVE" | "COL_GROUP" |number
                    ) ["ON"] 
                ) 
                | "OFF"
            ) 
            | "=" string1
         )] 
       ["INTENSIFIED" [ ("ON"|"OFF")|("=" identifier) ] ] 
       ["INVERSE"     [("ON"|"OFF")|("=" identifier)]] 
       ["HOTSPOT"     [("ON"|"OFF")|("=" identifier)]] 
       ["INPUT"       [("ON"|"OFF")|("=" identifier)]] 
       ["FRAMES"      [("ON"|"OFF")|("=" identifier)]] 
       ["RESET"]
       .


Typing = (
        "TYPE"    (  ["LINE" "OF"] identifier | "REF" "TO" identifier  |identifier) 
        | "LIKE" [( ["LINE" "OF"] | "REF" "TO" )] identifier 
      
         )
 "." .
 
 
Association = "ASSOCIATION" identifier "TO" identifier "ON" identifier "=" identifier 
                                          { "AND" identifier "=" identifier }
                                          ["USING" "KEY" identifier] .

Types_mesh_stmt =   "TYPES"  identifier ( 
                  "TYPE" ["REF" "TO"] identifier 
                  | 
                  "LIKE" ["REF" "TO"] identifier    ) 
               {Association} 
               "." .

/* Because 'END' can be identifier(so LL(1) cannot parse it), so this rule has to be single rule and modifier it in subclass */
TypeOfStuct =   { "TYPES" identifier["("number")"] (TypeDes|LikeDes) ["BOXED"]  "." }
                {stINCLUDE}
                "TYPES" "END" "OF" identifier.     
                
                
ProvideFields = "FIELDS" ("*"| identifier {identifier}) 
               "FROM" identifier "INTO" identifier "VALID" identifier  
               "BOUNDS" number "AND" number 
               ["WHERE" Expression] .
                
                
                
                
SQLCondition = Expression .



Event_exp_item = "VALUE"(Expression) Typing 
                         ["OPTIONAL"|("DEFAULT" Expression)] .
    
Event_options = "EXPORTING" Event_exp_item {Event_exp_item} .


VARYING = "VARYING" identifier "FROM" identifier "NEXT" identifier ["RANGE" Expression] .



AUTHORITY_CHECK_ITEM = "ID" identifier ("FIELD" Expression|"DUMMY") .


TypeDes = "TYPE"    identifier (["LENGTH" number] ["DECIMALS" number] | { "READER"|"LOCATOR"|"LOB" "HANDLE" } )
                      | ["LINE" "OF"] identifier ["BOXED"]
                      | "REF" "TO" identifier 
                      | 
                          {
                              {["STANDARD"] "TABLE"} 
                              |{"SORTED" "TABLE"} 
                              |{"HASHED" "TABLE"}
                          } 
                          "OF" ["REF" "TO"] identifier 
                          [
                               {"WITH" ["UNIQUE"|"NON-UNIQUE"] 
                                   {
                                        {"KEY" [identifier ["ALIAS" identifier] "COMPONENTS"] {identifier}} 
                                        | {"DEFAULT" "KEY"} 
                                    }
                                } 
                                | {"WITH" "EMPTY" "KEY"}
                          ] 
                          { 
                              [ 
                                  "WITH" {"UNIQUE" "HASHED"}
                                  | { {"UNIQUE"|"NON-UNIQUE"} "SORTED"} "KEY" identifier "COMPONENTS" {identifier}
                              ] 
                               
                           } 
                          ["INITIAL" "SIZE" number] 
                          ["WITH" "HEADER" "LINE"]
                         
                       | "RANGE" "OF" identifier ["INITIAL" "SIZE" number] ["WITH" "HEADER" "LINE"] 
                       | { "WRITER"|"LOCATOR" } "FOR" { "COLUMNS" {identifier} } 
                       |  "ALL" ["OTHER"] ["BLOB"|"CLOB"] "COLUMNS" 
                 .
                 
LikeDes =        "LIKE" 
                  (
                      ["LINE" "OF"] identifier
                     | "REF" "TO" identifier
                     |  
                         {
                              ["STANDARD"] "TABLE" 
                              |"SORTED" "TABLE"
                              |"HASHED" "TABLE"
                         } 
                         "OF" ["REF" "TO"] identifier
                         [
                          
                                  "WITH" ["UNIQUE"|"NON-UNIQUE"] 
                                   {
                                    "KEY" [identifier ["ALIAS" identifier] "COMPONENTS"] {identifier} 
                                   |
                                    "DEFAULT" "KEY"
                                   }
                          
                              | "WITH" "EMPTY" "KEY"
                         ] 
                         {
                              
                              "WITH" {"UNIQUE" "HASHED"}
                              |
                              {
                                  {"UNIQUE"|"NON-UNIQUE"} "SORTED"
                                }
                                "KEY" identifier "COMPONENTS" {identifier}
                            
                         } 
                         ["INITIAL" "SIZE" number] 
                         ["WITH" "HEADER" "LINE"]
                    
                      |  
                     "RANGE" "OF" identifier ["INITIAL" "SIZE" number] ["WITH" "HEADER" "LINE"]
                                         
                   ).
 
 
 GroupBy = "GROUP" "BY" ( 
                         ( Expression {Expression} [ identifier "=" "GROUP" "SIZE"] [ identifier "=" "GROUP" "INDEX"]) 
                         |identifier
                        )
                             [("ASCENDING"|"DESCENDING") ["AS" "TEXT"]] 
                             ["WITHOUT" "MEMBERS"] 
                             [ 
                                 "INTO" identifier 
                               | "ASSIGNING" identifier
                               | "REFERENCE" "INTO" identifier
                             ] .
                             
                             
Withline =  "+" identifier [( identifier {"," identifier} )] "AS" identifier {"," "+" identifier [( identifier {"," identifier} )] "AS" identifier}
                                stSELECT "." .


stINCLUDE = "INCLUDE"(  ( "TYPE" identifier | "STRUCTURE" identifier ) 
        ["AS" identifier ["RENAMING" "WITH" "SUFFIX" string1]] 
        |identifier ["IF" "FOUND"]) ".".         
                                
                                