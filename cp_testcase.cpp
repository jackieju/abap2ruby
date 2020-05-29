// testcase 0 
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


// testcase 1 
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

// testcase 2 
REPORT TEST.
   DATA a type i .
   a->b = 1.
   .

