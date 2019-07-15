load "crr_scan.rb"
load "rubyutility.rb"
load "log.rb"


class String
    def to_byte
        # self.bytes[0] # not work for ruby 1.8.7
        self[0].ord # to Decimal
    end
end
COCO_WCHAR_MAX =65535
MIN_BUFFER_LENGTH =1024
MAX_BUFFER_LENGTH =(64*MIN_BUFFER_LENGTH)
HEAP_BLOCK_SIZE =(64*1024)
# COCO_CPP_NAMESPACE_SEPARATOR =L':'
=begin
# string handling, wide character
wchar_t* coco_string_create(const wchar_t *value)
wchar_t* coco_string_create(const wchar_t *value, int startIndex, int length)
wchar_t* coco_string_create_upper(const wchar_t* data)
wchar_t* coco_string_create_lower(const wchar_t* data)
wchar_t* coco_string_create_lower(const wchar_t* data, int startIndex, int dataLen)
wchar_t* coco_string_create_append(const wchar_t* data1, const wchar_t* data2)
wchar_t* coco_string_create_append(const wchar_t* data, const wchar_t value)
void  coco_string_delete(wchar_t* &data)
int   coco_string_length(const wchar_t* data)
bool  coco_string_endswith(const wchar_t* data, const wchar_t *value)
int   coco_string_indexof(const wchar_t* data, const wchar_t value)
int   coco_string_lastindexof(const wchar_t* data, const wchar_t value)
void  coco_string_merge(wchar_t* &data, const wchar_t* value)
bool  coco_string_equal(const wchar_t* data1, const wchar_t* data2)
int   coco_string_compareto(const wchar_t* data1, const wchar_t* data2)
int   coco_string_hash(const wchar_t* data)

# string handling, ascii character
wchar_t* coco_string_create(const char *value)
char* coco_string_create_char(const wchar_t *value)
void  coco_string_delete(char* &data)
=end


=begin
class Token  

public
	# int kind;     # token kind
	#  int pos;      # token position in the source text (starting at 0)
	#  int col;      # token column (starting at 1)
	#  int line;     # token line (starting at 1)
	#  wchar_t* val; # token value
	#  Token *next;  # ML 2005-03-11 Peek tokens are kept in linked list
	
	def initialize()
	    @kind = 0
    	@pos  = 0
    	@col  = 0
    	@line = 0
    	@val  = nil
    	@next = nil
    end
    # ~Token()
end
=end

=begin
class Buffer 
# This Buffer supports the following cases:
# 1) seekable stream (file)
#    a) whole stream in buffer
#    b) part of stream in buffer
# 2) non seekable stream (network, console)
private
	# unsigned char *buf; # input buffer
	#  int bufCapacity;    # capacity of buf
	#  int bufStart;       # position of first byte in buffer relative to input stream
	#  int bufLen;         # length of buffer
	#  int fileLen;        # length of input stream (may change if the stream is no file)
	#  int bufPos;         # current position in buffer
	#  FILE* stream;       # input stream (seekable)
	#  bool isUserStream;  # was the stream opened by the user?
	
	def ReadNextStreamChunk()
	    
    end
	def CanSeek()    # true if stream can be seeked otherwise false
	end
public
    # static const int EoF = COCO_WCHAR_MAX + 1

	def initialize(s, isUserStream)
    end
	def initialize(buf, len)
    end
	def initialize(b)
    end
    # virtual ~Buffer()
	
	def Close()
    end
	def Read()
    end
	def Peek()
    end
	def GetString( beg,  end1)
	end
	def GetPos()
    end
	def SetPos(value)
    end
end

class UTF8Buffer : public Buffer {
public:
	UTF8Buffer(Buffer *b) : Buffer(b) {}
	virtual int Read()
}
=end
=begin
#-----------------------------------------------------------------------------------
# StartStates  -- maps characters to start states of tokens
#-----------------------------------------------------------------------------------
class StartStates {
private:
	class Elem {
	public:
		int key, val
		Elem *next
		Elem(int key, int val) { this->key = key; this->val = val; next = NULL; }
	}

	Elem **tab

public:
	StartStates() { tab = new Elem*[128]; memset(tab, 0, 128 * sizeof(Elem*)); }
	virtual ~StartStates() {
		for (int i = 0; i < 128; ++i) {
			Elem *e = tab[i]
			while (e != NULL) {
				Elem *next = e->next
				delete e
				e = next
			}
		}
		delete [] tab
	}

	void set(int key, int val) {
		Elem *e = new Elem(key, val)
		int k = ((unsigned int) key) % 128
		e->next = tab[k]; tab[k] = e
	}

	int state(int key) {
		Elem *e = tab[((unsigned int) key) % 128]
		while (e != NULL && e->key != key) e = e->next
		return e == NULL ? 0 : e->val
	}
}

#-------------------------------------------------------------------------------------------
# KeywordMap  -- maps strings to integers (identifiers to keyword kinds)
#-------------------------------------------------------------------------------------------
class KeywordMap {
private:
	class Elem {
	public:
		wchar_t *key
		int val
		Elem *next
		Elem(const wchar_t *key, int val) { this->key = coco_string_create(key); this->val = val; next = NULL; }
		virtual ~Elem() { coco_string_delete(key); }
	}

	Elem **tab

public:
	KeywordMap() { tab = new Elem*[128]; memset(tab, 0, 128 * sizeof(Elem*)); }
	virtual ~KeywordMap() {
		for (int i = 0; i < 128; ++i) {
			Elem *e = tab[i]
			while (e != NULL) {
				Elem *next = e->next
				delete e
				e = next
			}
		}
		delete [] tab
	}

	void set(const wchar_t *key, int val) {
		Elem *e = new Elem(key, val)
		int k = coco_string_hash(key) % 128
		e->next = tab[k]; tab[k] = e
	}

	int get(const wchar_t *key, int defaultVal) {
		Elem *e = tab[coco_string_hash(key) % 128]
		while (e != NULL && !coco_string_equal(e->key, key)) e = e->next
		return e == NULL ? defaultVal : e->val
	}
}
=end
=begin
class Scanner {
private
    # void *firstHeap
    # void *heap
    # void *heapTop
    # void **heapEnd
    # 
    # unsigned char EOL
    # int eofSym
    # int noSym
    # int maxT
    # int charSetSize
    # StartStates start
    # KeywordMap keywords

    # Token *t;         # current token
    # wchar_t *tval;    # text of current token
    # int tvalLength;   # length of text of current token
    # int tlen;         # length of current token
    # 
    # Token *tokens;    # list of tokens already peeked (first token is a dummy)
    # Token *pt;        # current peek token
    # 
    # int ch;           # current input character
    # 
    # int pos;          # byte position of current character
    # int line;         # line number of current character
    # int col;          # column number of current character
    # int oldEols;      # EOLs that appeared in a comment

	def CreateHeapBlock()
    end
	def CreateToken()
    end
	def AppendVal(t)
    end
	def SetScannerBehindT()
    end
	def Init()
    end
	DEF nEXTcH()
    end
	def AddCh()
    end
	def Comment0()
    end
	def Comment1()
    end

	def NextToken()
    end

public:
	buffer;   # scanner buffer
	
	def initialize(const unsigned char* buf, int len)
    end
	def initialize(const wchar_t* fileName)
    end
	def Scanner(FILE* s)
    end
    # ~Scanner()
	def Scan()
    end
	def Peek()
    end
	def ResetPeek()
    end

end # end Scanner
=end

# Scan_Ch        Ch




           MAX_IDENTIFIER_LENGTH = 1000
class CScanner <  CRRScanner
    
    attr_accessor :currLine, :currCol, :include_stack
  
   
   
  public
    # def initialize( srcFile,  ignoreCase) 
    #     super(srcFile, ignoreCase)
    # end
    def initialize( str="",  ignoreCase=true) 
        super(str, ignoreCase)
    end


  protected

  # --- here need 5 ---#
  # 1. @@STATE0 =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
   @@STATE0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,213,26,30,0,196,142,24,138,139,38,194,202,195,36,37,32,2,2,2,2,2,2,2,2,2,0,137,
                  145,136,147,0,0,1,220,1,218,1,1,1,1,1,1,1,216,219,215,1,1,1,217,1,1,1,1,1,1,1,
                  1,199,0,200,144,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                  1,1,1,0,140,0,214,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] 
  # the index of the array is the character's acsii code (ch.to_byte), value of array element is the status code.                 
  # 2. method def CheckLiteral( id)
  # 3. comments
    # return 1: comments completed
    # return 0: comments not completed but encounter nil or EOF
    # 
  # 4. def Comment()
   
public
  # 5. def Get(ignore_crlf=true), 
  #     copy the part after state=@sTATE0[@ch]
  #     change .Len .Pos to .len .pos

   def CheckLiteral(id)
      c=CurrentCh(@nextSym.pos)
      if @ignoreCase
         c=Upcase(c)
      end
      p "checkliteral:#{c}"
      case c

      when 'A'
         if EqualStr("AT")
            return C_ATSym
         end

         if EqualStr("AS")
            return C_ASSym
         end

         if EqualStr("AND")
            return C_ANDSym
         end


      when 'C'
         if EqualStr("CENTERED")
            return C_CENTEREDSym
         end

         if EqualStr("CURRENCY")
            return C_CURRENCYSym
         end

         if EqualStr("COLOR")
            return C_COLORSym
         end

         if EqualStr("CHECKBOX")
            return C_CHECKBOXSym
         end

         if EqualStr("CONTINUE")
            return C_CONTINUESym
         end

         if EqualStr("CO")
            return C_COSym
         end

         if EqualStr("CN")
            return C_CNSym
         end

         if EqualStr("CA")
            return C_CASym
         end

         if EqualStr("CS")
            return C_CSSym
         end

         if EqualStr("CP")
            return C_CPSym
         end


      when 'D'
         if EqualStr("DATA")
            return C_DATASym
         end

         if EqualStr("DECIMALS")
            return C_DECIMALSSym
         end

         if EqualStr("DDMMYY")
            return C_DDMMYYSym
         end

         if EqualStr("DIV")
            return C_DIVSym
         end


      when 'E'
         if EqualStr("EXPONENT")
            return C_EXPONENTSym
         end

         if EqualStr("ENVIRONMENT")
            return C_ENVIRONMENTSym
         end

         if EqualStr("EDIT")
            return C_EDITSym
         end

         if EqualStr("ELSEIF")
            return C_ELSEIFSym
         end

         if EqualStr("ELSE")
            return C_ELSESym
         end

         if EqualStr("ENDIF")
            return C_ENDIFSym
         end

         if EqualStr("ENDWHILE")
            return C_ENDWHILESym
         end

         if EqualStr("EQUIV")
            return C_EQUIVSym
         end

         if EqualStr("EQ")
            return C_EQSym
         end


      when 'F'
         if EqualStr("FORMAT")
            return C_FORMATSym
         end

         if EqualStr("FRAMES")
            return C_FRAMESSym
         end

         if EqualStr("FROM")
            return C_FROMSym
         end


      when 'G'
         if EqualStr("GT")
            return C_GTSym
         end

         if EqualStr("GE")
            return C_GESym
         end


      when 'H'
         if EqualStr("HOTSPOT")
            return C_HOTSPOTSym
         end


      when 'I'
         if EqualStr("INTENSIFIED")
            return C_INTENSIFIEDSym
         end

         if EqualStr("INVERSE")
            return C_INVERSESym
         end

         if EqualStr("INPUT")
            return C_INPUTSym
         end

         if EqualStr("ICON")
            return C_ICONSym
         end

         if EqualStr("IF")
            return C_IFSym
         end


      when 'L'
         if EqualStr("LIKE")
            return C_LIKESym
         end

         if EqualStr("LINE")
            return C_LINESym
         end

         if EqualStr("LT")
            return C_LTSym
         end

         if EqualStr("LE")
            return C_LESym
         end


      when 'M'
         if EqualStr("MASK")
            return C_MASKSym
         end

         if EqualStr("MMDDYY")
            return C_MMDDYYSym
         end

         if EqualStr("MOD")
            return C_MODSym
         end


      when 'N'
         if EqualStr("NO")
            return C_NOSym
         end

         if EqualStr("NEXT")
            return C_NEXTSym
         end

         if EqualStr("NE")
            return C_NESym
         end

         if EqualStr("NA")
            return C_NASym
         end

         if EqualStr("NS")
            return C_NSSym
         end

         if EqualStr("NP")
            return C_NPSym
         end

         if EqualStr("NOT")
            return C_NOTSym
         end


      when 'O'
         if EqualStr("ON")
            return C_ONSym
         end

         if EqualStr("OFF")
            return C_OFFSym
         end

         if EqualStr("OR")
            return C_ORSym
         end


      when 'Q'
         if EqualStr("QUICKINFO")
            return C_QUICKINFOSym
         end


      when 'R'
         if EqualStr("REPORT")
            return C_REPORTSym
         end

         if EqualStr("ROUND")
            return C_ROUNDSym
         end

         if EqualStr("RESET")
            return C_RESETSym
         end

         if EqualStr("RANGE")
            return C_RANGESym
         end


      when 'S'
         if EqualStr("STYLE")
            return C_STYLESym
         end

         if EqualStr("SYMBOL")
            return C_SYMBOLSym
         end


      when 'T'
         if EqualStr("TYPE")
            return C_TYPESym
         end

         if EqualStr("TIME")
            return C_TIMESym
         end


      when 'U'
         if EqualStr("UNDER")
            return C_UNDERSym
         end

         if EqualStr("UNIT")
            return C_UNITSym
         end

         if EqualStr("USING")
            return C_USINGSym
         end


      when 'V'
         if EqualStr("VALUE")
            return C_VALUESym
         end

         if EqualStr("VARY")
            return C_VARYSym
         end


      when 'W'
         if EqualStr("WRITE")
            return C_WRITESym
         end

         if EqualStr("WHILE")
            return C_WHILESym
         end


      when 'Y'
         if EqualStr("YYMMDD")
            return C_YYMMDDSym
         end


      when 'Z'
         if EqualStr("ZONE")
            return C_ZONESym
         end


      when 'b'
         if EqualStr("break")
            return C_breakSym
         end


      when 'c'
         if EqualStr("char")
            return C_charSym
         end


      when 'd'
         if EqualStr("double")
            return C_doubleSym
         end

         if EqualStr("do")
            return C_doSym
         end


      when 'f'
         if EqualStr("float")
            return C_floatSym
         end

         if EqualStr("for")
            return C_forSym
         end


      when 'i'
         if EqualStr("int")
            return C_intSym
         end


      when 'l'
         if EqualStr("long")
            return C_longSym
         end


      when 'm'
         if EqualStr("mixed")
            return C_mixedSym
         end


      when 'r'
         if EqualStr("return")
            return C_returnSym
         end


      when 's'
         if EqualStr("short")
            return C_shortSym
         end

         if EqualStr("string")
            return C_stringSym
         end


      when 'u'
         if EqualStr("unsigned")
            return C_unsignedSym
         end


      when 'v'
         if EqualStr("var")
            return C_varSym
         end

         if EqualStr("void")
            return C_voidSym
         end


      when 'w'
         if EqualStr("while")
            return C_whileSym
         end


      end

      return id
   end
   
   def Comment()
       p "===>Comment1:#{@ch}"
      level=1
      startLine=@currLine
      oldLineStart=@lineStart
      oldCol=@currCol
      
      
      if @ch=='*'
          _pos = @buffPos-1
          _ch = @buffer[_pos]
          isStart = true
          while (_pos>=0 && _ch.to_byte != EOF_CHAR && _ch.to_byte != LF_CHAR)
              if !isWhitespace?(_ch)
                  p "===>Comment3:#{_ch}, #{_pos}"
                  isStart = false
                  break
              end
              _pos -=1
              _ch = @buffer[_pos]
          end
          p "===>Comment2:#{isStart}, #{@ch}"
          if isStart
              while (@ch && @ch.to_byte != EOF_CHAR && @ch.to_byte != LF_CHAR && @ch.to_byte != 13)
                  NextCh()
                  p "===>Comment4:#{@ch} #{@ch.to_byte} #{@ch.to_byte != LF_CHAR}"
                  
              end
              
             p "===>Comment5:#{@ch} #{@ch.to_byte} "
              return 1
          end
         
     end
     
      if @ch=='"'
         NextCh()
         while (1)
            if @ch==10
               (level-=1;level+2)
               NextCh()
               @comEols=@currLine-startLine
               if level==0
                  return 1
               end

            else
               if @ch.to_byte==EOF_CHAR
                  return 0
               else
                  NextCh()
               end

            end

         end

      end

      return 0
   end
   
   def Get(ignore_crlf=true)
       # int state, ctx

       return C_EOF_Sym if @ch == nil
       
        # filter white space and comments
        begin
           return C_EOF_Sym if @ch == nil

           p "===>Get2:#{@ch} #{@ch.to_byte}"
           # filter white space
           while (@ch.to_byte >= 9 && # TAB
                   @ch.to_byte <= 10 || # LF
                  @ch.to_byte == 13 || # CR
                  @ch == ' ') # space
                   # p "get30:#{@ch}, #{@buffPos}"
                   if !ignore_crlf && ( @ch.to_byte == 13|| ch.to_byte == 10)
                       p "crlf:#{@ch.to_byte}, pos #{@buffPos}"
                        Scan_NextCh()
                       return C_CRLF_Sym
                   end
                   Scan_NextCh()
                    p "get31:#{@ch}, #{@buffPos}"
                   return C_EOF_Sym if @ch == nil 
           end
           p "get32:#{@ch}, #{@buffPos}"
           
         end while ((@ch == '*' || @ch == '"') && Comment()==1) 
          

           @currSym = nextSym.clone
 
           nextSym.init(0, @currLine, @currCol - 1, @buffPos, 0)
           nextSym.len  = 0
            ctx = 0

           if (@ch.to_byte == EOF_CHAR || @ch == nil) 
               return C_EOF_Sym
           end
           
           if !ignore_crlf &&  ( @ch.to_byte == 13|| ch.to_byte == 10)
               return C_CRLF_Sym
           end
           
           state = @@STATE0[@ch.to_byte]
           
           # copy from generated ruby from cpp code
           while (1)
               p ("ch:#{@ch}, state=#{state}")
              NextCh()
              (@nextSym.len+=1;@nextSym.len-2)
              case state

              when 1
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'

                 else
                    return CheckLiteral(C_identifierSym)
                 end

                 break
              when 2
                 if @ch=='U'
                    state=5
                 else
                    if @ch=='u'
                       state=6
                    else
                       if @ch=='L'
                          state=7
                       else
                          if @ch=='l'
                             state=8
                          else
                             if @ch=='.'
                                state=4
                             else
                                if @ch>='0'&&@ch<='9'

                                else
                                   return C_numberSym
                                end

                             end

                          end

                       end

                    end

                 end

                 break
              when 4
                 if @ch=='U'
                    state=13
                 else
                    if @ch=='u'
                       state=14
                    else
                       if @ch=='L'
                          state=15
                       else
                          if @ch=='l'
                             state=16
                          else
                             if @ch>='0'&&@ch<='9'

                             else
                                return C_numberSym
                             end

                          end

                       end

                    end

                 end

                 break
              when 5
                 return C_numberSym
              when 6
                 return C_numberSym
              when 7
                 return C_numberSym
              when 8
                 return C_numberSym
              when 13
                 return C_numberSym
              when 14
                 return C_numberSym
              when 15
                 return C_numberSym
              when 16
                 return C_numberSym
              when 18
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'
                    state=19
                 else
                    return No_Sym
                 end

                 break
              when 19
                 if @ch=='U'
                    state=20
                 else
                    if @ch=='u'
                       state=21
                    else
                       if @ch=='L'
                          state=22
                       else
                          if @ch=='l'
                             state=23
                          else
                             if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='a'&&@ch<='f'

                             else
                                return C_hexnumberSym
                             end

                          end

                       end

                    end

                 end

                 break
              when 20
                 return C_hexnumberSym
              when 21
                 return C_hexnumberSym
              when 22
                 return C_hexnumberSym
              when 23
                 return C_hexnumberSym
              when 24
                 if @ch==39
                    state=33
                 else
                    if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='&'||@ch>='('&&@ch<=255

                    else
                       return No_Sym
                    end

                 end

                 break
              when 26
                 if @ch>=' '&&@ch<='&'||@ch>='('&&@ch<='['||@ch>=']'&&@ch<=255
                    state=28
                 else
                    if @ch==92
                       state=34
                    else
                       return No_Sym
                    end

                 end

                 break
              when 28
                 if @ch=='"'
                    state=29
                 else
                    return No_Sym
                 end

                 break
              when 29
                 return C_charSym
              when 30
                 if @ch>='A'&&@ch<='Z'||@ch>='a'&&@ch<='z'
                    state=31
                 else
                    return No_Sym
                 end

                 break
              when 31
                 return C_PreProcessorSym
              when 32
                 if @ch=='U'
                    state=5
                 else
                    if @ch=='u'
                       state=6
                    else
                       if @ch=='L'
                          state=7
                       else
                          if @ch=='l'
                             state=8
                          else
                             if @ch=='.'
                                state=4
                             else
                                if @ch>='0'&&@ch<='9'
                                   state=2
                                else
                                   if @ch=='X'||@ch=='x'
                                      state=18
                                   else
                                      return C_numberSym
                                   end

                                end

                             end

                          end

                       end

                    end

                 end

                 break
              when 33
                 if @ch==39

                 else
                    if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='&'||@ch>='('&&@ch<=255
                       state=24
                    else
                       return C_stringD1Sym
                    end

                 end

                 break
              when 34
                 if @ch>=' '&&@ch<='!'||@ch>='#'&&@ch<='&'||@ch>='('&&@ch<=255
                    state=28
                 else
                    if @ch=='"'
                       state=35
                    else
                       return No_Sym
                    end

                 end

                 break
              when 35
                 if @ch=='"'
                    state=29
                 else
                    return C_charSym
                 end

                 break
              when 36
                 return C_PointSym
              when 37
                 if @ch=='='
                    state=204
                 else
                    return C_SlashSym
                 end

                 break
              when 38
                 if @ch=='*'
                    state=39
                 else
                    if @ch=='='
                       state=203
                    else
                       return C_StarSym
                    end

                 end

                 break
              when 39
                 return C_StarStarSym
              when 44
                 if @ch=='P'
                    state=45
                 else
                    return No_Sym
                 end

                 break
              when 45
                 return C_NOMinusGAPSym
              when 50
                 if @ch=='J'
                    state=51
                 else
                    return No_Sym
                 end

                 break
              when 51
                 if @ch=='U'
                    state=52
                 else
                    return No_Sym
                 end

                 break
              when 52
                 if @ch=='S'
                    state=53
                 else
                    return No_Sym
                 end

                 break
              when 53
                 if @ch=='T'
                    state=54
                 else
                    return No_Sym
                 end

                 break
              when 54
                 if @ch=='I'
                    state=55
                 else
                    return No_Sym
                 end

                 break
              when 55
                 if @ch=='F'
                    state=56
                 else
                    return No_Sym
                 end

                 break
              when 56
                 if @ch=='I'
                    state=57
                 else
                    return No_Sym
                 end

                 break
              when 57
                 if @ch=='E'
                    state=58
                 else
                    return No_Sym
                 end

                 break
              when 58
                 if @ch=='D'
                    state=59
                 else
                    return No_Sym
                 end

                 break
              when 59
                 return C_LEFTMinusJUSTIFIEDSym
              when 65
                 if @ch=='J'
                    state=66
                 else
                    return No_Sym
                 end

                 break
              when 66
                 if @ch=='U'
                    state=67
                 else
                    return No_Sym
                 end

                 break
              when 67
                 if @ch=='S'
                    state=68
                 else
                    return No_Sym
                 end

                 break
              when 68
                 if @ch=='T'
                    state=69
                 else
                    return No_Sym
                 end

                 break
              when 69
                 if @ch=='I'
                    state=70
                 else
                    return No_Sym
                 end

                 break
              when 70
                 if @ch=='F'
                    state=71
                 else
                    return No_Sym
                 end

                 break
              when 71
                 if @ch=='I'
                    state=72
                 else
                    return No_Sym
                 end

                 break
              when 72
                 if @ch=='E'
                    state=73
                 else
                    return No_Sym
                 end

                 break
              when 73
                 if @ch=='D'
                    state=74
                 else
                    return No_Sym
                 end

                 break
              when 74
                 return C_RIGHTMinusJUSTIFIEDSym
              when 79
                 if @ch=='O'
                    state=80
                 else
                    return No_Sym
                 end

                 break
              when 80
                 if @ch=='U'
                    state=81
                 else
                    return No_Sym
                 end

                 break
              when 81
                 if @ch=='P'
                    state=82
                 else
                    return No_Sym
                 end

                 break
              when 82
                 if @ch=='I'
                    state=83
                 else
                    return No_Sym
                 end

                 break
              when 83
                 if @ch=='N'
                    state=84
                 else
                    return No_Sym
                 end

                 break
              when 84
                 if @ch=='G'
                    state=85
                 else
                    return No_Sym
                 end

                 break
              when 85
                 return C_NOMinusGROUPINGSym
              when 89
                 if @ch=='I'
                    state=90
                 else
                    return No_Sym
                 end

                 break
              when 90
                 if @ch=='G'
                    state=91
                 else
                    return No_Sym
                 end

                 break
              when 91
                 if @ch=='N'
                    state=92
                 else
                    return No_Sym
                 end

                 break
              when 92
                 return C_NOMinusSIGNSym
              when 96
                 if @ch=='E'
                    state=97
                 else
                    return No_Sym
                 end

                 break
              when 97
                 if @ch=='R'
                    state=98
                 else
                    return No_Sym
                 end

                 break
              when 98
                 if @ch=='O'
                    state=99
                 else
                    return No_Sym
                 end

                 break
              when 99
                 return C_NOMinusZEROSym
              when 124
                 if @ch=='Y'
                    state=125
                 else
                    return No_Sym
                 end

                 break
              when 125
                 return C_DDSlashMMSlashYYYYSym
              when 134
                 if @ch=='Y'
                    state=135
                 else
                    return No_Sym
                 end

                 break
              when 135
                 return C_MMSlashDDSlashYYYYSym
              when 136
                 return C_EqualSym
              when 137
                 return C_SemicolonSym
              when 138
                 return C_LparenSym
              when 139
                 return C_RparenSym
              when 140
                 if @ch=='|'
                    state=141
                 else
                    if @ch=='='
                       state=210
                    else
                       return C_BarSym
                    end

                 end

                 break
              when 141
                 return C_BarBarSym
              when 142
                 if @ch=='&'
                    state=143
                 else
                    if @ch=='='
                       state=208
                    else
                       return C_AndSym
                    end

                 end

                 break
              when 143
                 return C_AndAndSym
              when 144
                 if @ch=='='
                    state=209
                 else
                    return C_UparrowSym
                 end

                 break
              when 145
                 if @ch=='>'
                    state=146
                 else
                    if @ch=='='
                       state=148
                    else
                       if @ch=='<'
                          state=192
                       else
                          return C_LessSym
                       end

                    end

                 end

                 break
              when 146
                 return C_LessGreaterSym
              when 147
                 if @ch=='='
                    state=149
                 else
                    if @ch=='>'
                       state=193
                    else
                       return C_GreaterSym
                    end

                 end

                 break
              when 148
                 return C_LessEqualSym
              when 149
                 return C_GreaterEqualSym
              when 156
                 return C_BYTEMinusCOSym
              when 163
                 return C_BYTEMinusCNSym
              when 170
                 return C_BYTEMinusCASym
              when 177
                 return C_BYTEMinusNASym
              when 184
                 return C_BYTEMinusCSSym
              when 191
                 return C_BYTEMinusNSSym
              when 192
                 if @ch=='='
                    state=211
                 else
                    return C_LessLessSym
                 end

                 break
              when 193
                 if @ch=='='
                    state=212
                 else
                    return C_GreaterGreaterSym
                 end

                 break
              when 194
                 if @ch=='+'
                    state=197
                 else
                    if @ch=='='
                       state=206
                    else
                       return C_PlusSym
                    end

                 end

                 break
              when 195
                 if @ch=='-'
                    state=198
                 else
                    if @ch=='>'
                       state=201
                    else
                       if @ch=='='
                          state=207
                       else
                          return C_MinusSym
                       end

                    end

                 end

                 break
              when 196
                 if @ch=='='
                    state=205
                 else
                    return C_PercentSym
                 end

                 break
              when 197
                 return C_PlusPlusSym
              when 198
                 return C_MinusMinusSym
              when 199
                 return C_LbrackSym
              when 200
                 return C_RbrackSym
              when 201
                 return C_MinusGreaterSym
              when 202
                 return C_CommaSym
              when 203
                 return C_StarEqualSym
              when 204
                 return C_SlashEqualSym
              when 205
                 return C_PercentEqualSym
              when 206
                 return C_PlusEqualSym
              when 207
                 return C_MinusEqualSym
              when 208
                 return C_AndEqualSym
              when 209
                 return C_UparrowEqualSym
              when 210
                 return C_BarEqualSym
              when 211
                 return C_LessLessEqualSym
              when 212
                 return C_GreaterGreaterEqualSym
              when 213
                 return C_BangSym
              when 214
                 return C_TildeSym
              when 215
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='N'||@ch>='P'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='O'
                       state=221
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 216
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='E'
                       state=222
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 217
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='H'||@ch>='J'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='I'
                       state=223
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 218
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='C'||@ch>='E'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='D'
                       state=224
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 219
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='L'||@ch>='N'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='M'
                       state=225
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 220
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='X'||@ch=='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='Y'
                       state=226
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 221
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='-'
                       state=227
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 222
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='E'||@ch>='G'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='F'
                       state=228
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 223
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='F'||@ch>='H'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='G'
                       state=229
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 224
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='/'
                       state=230
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 225
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='/'
                       state=231
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 226
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='T'
                       state=232
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 227
                 if @ch=='G'
                    state=233
                 else
                    if @ch=='S'
                       state=89
                    else
                       if @ch=='Z'
                          state=96
                       else
                          return No_Sym
                       end

                    end

                 end

                 break
              when 228
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='T'
                       state=234
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 229
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='G'||@ch>='I'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='H'
                       state=235
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 230
                 if @ch=='M'
                    state=236
                 else
                    return No_Sym
                 end

                 break
              when 231
                 if @ch=='D'
                    state=237
                 else
                    return No_Sym
                 end

                 break
              when 232
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='D'||@ch>='F'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='E'
                       state=238
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 233
                 if @ch=='A'
                    state=44
                 else
                    if @ch=='R'
                       state=79
                    else
                       return No_Sym
                    end

                 end

                 break
              when 234
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='-'
                       state=50
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 235
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='S'||@ch>='U'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='T'
                       state=239
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 236
                 if @ch=='M'
                    state=240
                 else
                    return No_Sym
                 end

                 break
              when 237
                 if @ch=='D'
                    state=241
                 else
                    return No_Sym
                 end

                 break
              when 238
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='-'
                       state=242
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 239
                 if @ch>='0'&&@ch<='9'||@ch>='A'&&@ch<='Z'||@ch=='_'||@ch>='a'&&@ch<='z'
                    state=1
                 else
                    if @ch=='-'
                       state=65
                    else
                       return CheckLiteral(C_identifierSym)
                    end

                 end

                 break
              when 240
                 if @ch=='/'
                    state=243
                 else
                    return No_Sym
                 end

                 break
              when 241
                 if @ch=='/'
                    state=244
                 else
                    return No_Sym
                 end

                 break
              when 242
                 if @ch=='C'
                    state=245
                 else
                    if @ch=='N'
                       state=246
                    else
                       return No_Sym
                    end

                 end

                 break
              when 243
                 if @ch=='Y'
                    state=247
                 else
                    return No_Sym
                 end

                 break
              when 244
                 if @ch=='Y'
                    state=248
                 else
                    return No_Sym
                 end

                 break
              when 245
                 if @ch=='O'
                    state=156
                 else
                    if @ch=='N'
                       state=163
                    else
                       if @ch=='A'
                          state=170
                       else
                          if @ch=='S'
                             state=184
                          else
                             return No_Sym
                          end

                       end

                    end

                 end

                 break
              when 246
                 if @ch=='A'
                    state=177
                 else
                    if @ch=='S'
                       state=191
                    else
                       return No_Sym
                    end

                 end

                 break
              when 247
                 if @ch=='Y'
                    state=249
                 else
                    return No_Sym
                 end

                 break
              when 248
                 if @ch=='Y'
                    state=250
                 else
                    return No_Sym
                 end

                 break
              when 249
                 if @ch=='Y'
                    state=124
                 else
                    return C_DDSlashMMSlashYYSym
                 end

                 break
              when 250
                 if @ch=='Y'
                    state=134
                 else
                    return C_MMSlashDDSlashYYSym
                 end

                 break
              else
                 return No_Sym
              end

           end
   end
   



end
