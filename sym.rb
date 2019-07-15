





# how to add new sym
# 1. add definition in above. e.g. 
# C_OUTSym =  =                         95 
# 2. add entry in SYMS below
# 3. add code in scanner.rb->CheckLiteral()
# e.g.             
#            when 'O'
#                return C_OUTSym =  if EqualStr("OUT")
# 4. sometimes you need to add condition in cp.rb->C() to enter Definition()


C_EOF_Sym = EOF_Sym = 	0	#  EOF */
C_CRLF_Sym = 0.5

C_identifierSym = 	1	# identifier */
C_numberSym = 	2	# number */
C_hexnumberSym = 	3	# hexnumber */
C_stringD1Sym = 	4	# string1 */
C_charSym = 	5	# char */
C_ColonSym = 	6	# Colon */
C_spaceD1Sym = 	7	# space1 */
C_REPORTSym = 	8	# "REPORT" */
C_PointSym = 	9	# "." */
C_varSym = 	10	# "var" */
C_mixedSym = 	11	# "mixed" */
C_shortSym = 	12	# "short" */
C_intSym = 	13	# "int" */
C_longSym = 	14	# "long" */
C_floatSym = 	15	# "float" */
C_unsignedSym = 	16	# "unsigned" */
C_charSym = 	17	# "char" */
C_doubleSym = 	18	# "double" */
C_voidSym = 	19	# "void" */
C_stringSym = 	20	# "string" */
C_DATASym = 	21	# "DATA" */
C_TYPESym = 	22	# "TYPE" */
C_VALUESym = 	23	# "VALUE" */
C_LIKESym = 	24	# "LIKE" */
C_WRITESym = 	25	# "WRITE" */
C_ATSym = 	26	# "AT" */
C_SlashSym = 	27	# "/" */
C_StarSym = 	28	# "*" */
C_StarStarSym = 	29	# "**" */
C_UNDERSym = 	30	# "UNDER" */
C_NOMinusGAPSym = 	31	# "NO-GAP" */
C_LEFTMinusJUSTIFIEDSym = 	32	# "LEFT-JUSTIFIED" */
C_CENTEREDSym = 	33	# "CENTERED" */
C_RIGHTMinusJUSTIFIEDSym = 	34	# "RIGHT-JUSTIFIED" */
C_EXPONENTSym = 	35	# "EXPONENT" */
C_NOMinusGROUPINGSym = 	36	# "NO-GROUPING" */
C_NOMinusSIGNSym = 	37	# "NO-SIGN" */
C_NOMinusZEROSym = 	38	# "NO-ZERO" */
C_CURRENCYSym = 	39	# "CURRENCY" */
C_DECIMALSSym = 	40	# "DECIMALS" */
C_ROUNDSym = 	41	# "ROUND" */
C_UNITSym = 	42	# "UNIT" */
C_ENVIRONMENTSym = 	43	# "ENVIRONMENT" */
C_TIMESym = 	44	# "TIME" */
C_FORMATSym = 	45	# "FORMAT" */
C_ZONESym = 	46	# "ZONE" */
C_STYLESym = 	47	# "STYLE" */
C_USINGSym = 	48	# "USING" */
C_NOSym = 	49	# "NO" */
C_EDITSym = 	50	# "EDIT" */
C_MASKSym = 	51	# "MASK" */
C_DDSlashMMSlashYYSym = 	52	# "DD/MM/YY" */
C_MMSlashDDSlashYYSym = 	53	# "MM/DD/YY" */
C_DDSlashMMSlashYYYYSym = 	54	# "DD/MM/YYYY" */
C_MMSlashDDSlashYYYYSym = 	55	# "MM/DD/YYYY" */
C_DDMMYYSym = 	56	# "DDMMYY" */
C_MMDDYYSym = 	57	# "MMDDYY" */
C_YYMMDDSym = 	58	# "YYMMDD" */
C_COLORSym = 	59	# "COLOR" */
C_EqualSym = 	60	# "=" */
C_ONSym = 	61	# "ON" */
C_OFFSym = 	62	# "OFF" */
C_INTENSIFIEDSym = 	63	# "INTENSIFIED" */
C_INVERSESym = 	64	# "INVERSE" */
C_HOTSPOTSym = 	65	# "HOTSPOT" */
C_INPUTSym = 	66	# "INPUT" */
C_FRAMESSym = 	67	# "FRAMES" */
C_RESETSym = 	68	# "RESET" */
C_ASSym = 	69	# "AS" */
C_CHECKBOXSym = 	70	# "CHECKBOX" */
C_ICONSym = 	71	# "ICON" */
C_Sym = BOLSym = 	72	# "Sym = BOL" */
C_LINESym = 	73	# "LINE" */
C_QUICKINFOSym = 	74	# "QUICKINFO" */
C_SemicolonSym = 	75	# ";" */
C_breakSym = 	76	# "break" */
C_CONTINUESym = 	77	# "CONTINUE" */
C_doSym = 	78	# "do" */
C_whileSym = 	79	# "while" */
C_LparenSym = 	80	# "(" */
C_RparenSym = 	81	# ")" */
C_forSym = 	82	# "for" */
C_IFSym = 	83	# "IF" */
C_ELSEIFSym = 	84	# "ELSEIF" */
C_ELSESym = 	85	# "ELSE" */
C_ENDIFSym = 	86	# "ENDIF" */
C_returnSym = 	87	# "return" */
C_WHILESym = 	88	# "WHILE" */
C_VARYSym = 	89	# "VARY" */
C_FROMSym = 	90	# "FROM" */
C_NEXTSym = 	91	# "NEXT" */
C_RANGESym = 	92	# "RANGE" */
C_ENDWHILESym = 	93	# "ENDWHILE" */
C_BarBarSym = 	94	# "||" */
C_ORSym = 	95	# "OR" */
C_EQUIVSym = 	96	# "EQUIV" */
C_AndAndSym = 	97	# "&&" */
C_ANDSym = 	98	# "AND" */
C_BarSym = 	99	# "|" */
C_UparrowSym = 	100	# "^" */
C_AndSym = 	101	# "&" */
C_EQSym = 	102	# "EQ" */
C_LessGreaterSym = 	103	# "<>" */
C_NESym = 	104	# "NE" */
C_LessSym = 	105	# "<" */
C_LTSym = 	106	# "LT" */
C_GreaterSym = 	107	# ">" */
C_GTSym = 	108	# "GT" */
C_LessEqualSym = 	109	# "<=" */
C_LESym = 	110	# "LE" */
C_GreaterEqualSym = 	111	# ">=" */
C_GESym = 	112	# "GE" */
C_COSym = 	113	# "CO" */
C_CNSym = 	114	# "CN" */
C_CASym = 	115	# "CA" */
C_NASym = 	116	# "NA" */
C_CSSym = 	117	# "CS" */
C_NSSym = 	118	# "NS" */
C_CPSym = 	119	# "CP" */
C_NPSym = 	120	# "NP" */
C_BYTEMinusCOSym = 	121	# "BYTE-CO" */
C_BYTEMinusCNSym = 	122	# "BYTE-CN" */
C_BYTEMinusCASym = 	123	# "BYTE-CA" */
C_BYTEMinusNASym = 	124	# "BYTE-NA" */
C_BYTEMinusCSSym = 	125	# "BYTE-CS" */
C_BYTEMinusNSSym = 	126	# "BYTE-NS" */
C_LessLessSym = 	127	# "<<" */
C_GreaterGreaterSym = 	128	# ">>" */
C_PlusSym = 	129	# "+" */
C_MinusSym = 	130	# "-" */
C_DIVSym = 	131	# "DIV" */
C_PercentSym = 	132	# "%" */
C_MODSym = 	133	# "MOD" */
C_PlusPlusSym = 	134	# "++" */
C_MinusMinusSym = 	135	# "--" */
C_LbrackSym = 	136	# "[" */
C_RbrackSym = 	137	# "]" */
C_MinusGreaterSym = 	138	# "->" */
C_CommaSym = 	139	# "," */
C_StarEqualSym = 	140	# "*=" */
C_SlashEqualSym = 	141	# "/=" */
C_PercentEqualSym = 	142	# "%=" */
C_PlusEqualSym = 	143	# "+=" */
C_MinusEqualSym = 	144	# "-=" */
C_AndEqualSym = 	145	# "&=" */
C_UparrowEqualSym = 	146	# "^=" */
C_BarEqualSym = 	147	# "|=" */
C_LessLessEqualSym = 	148	# "<<=" */
C_GreaterGreaterEqualSym = 	149	# ">>=" */
C_BangSym = 	150	# "!" */
C_TildeSym = 	151	# "~" */
C_NOTSym = 	152	# "NOT" */
No_Sym = 	153	# not */
C_PreProcessorSym = 	154	# PreProcessor */
MAXT =	No_Sym 	# Max Terminals */
C_MAXT = MAXT





# for error reporting
SYMS=[                                                



"EOF"                         ,
"identifier"               ,
"number"                       ,
"hexnumber"                ,
"string1"                  ,
"char1"                        ,
"library"                  ,
"use"                        ,
";"                      ,
"load"                       ,
"package"                ,
"/"                          ,
"inherit"                ,
"<"                          ,
"class"                      ,
"{"                      ,
"}"                      ,
"static"                 ,
"const"                     ,
"my"                         ,
"extern"               ,
"auto"                        ,
"bool"                      ,
"short"                      ,
"int"                        ,
"long"                       ,
"float"                      ,
"unsigned"               ,
"char"                       ,
"double"                 ,
"void"                       ,
"string"                 ,
"="                          ,
","                          ,
"["                      ,
"]"                      ,
"("                      ,
")"                      ,
"*"                          ,
"case"                       ,
":"                          ,
"default"                ,
"break"                      ,
"continue"               ,
"do"                         ,
"while"                      ,
"for"                        ,
"if"                         ,
"else"                       ,
"return"                 ,
"switch"                 ,
"||"                     ,
"&&"                     ,
"|"                          ,
"^"                      ,
"&"                          ,
"=="                 ,
"!="                     ,
">"                      ,
"<="                     ,
">="                 ,
"<<"                     ,
">>"             ,
"+"                          ,
"-"                          ,
"%"                      ,
"++"                     ,
"--"                 ,
"."                          ,
"->"                 ,
"::"                 ,
"##"                  ,
"new"                        ,
"$"                      ,
"*="                     ,
"/="                 ,
"%="                 ,
"+="                     ,
"-="                 ,
"&="                     ,
"^="                 ,
"|="                     ,
"<<="                ,
">>="        ,
"!"                          ,
"~"                          ,
"enum",
"struct",
"typedef",
"?",
"CRLF",
"delete",
"throw",
"sizeof",
"IN",
"OUT",
"INOUT",
"inline",
"...",
"namespace",
"using",
"template",
"operator",
"override",
"goto",
"union",
"typename",
"not"                          ,
"PreProcessor"         ,
    ]