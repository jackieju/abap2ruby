load "crr_scan.rb"
load "rubyutility.rb"
load "log.rb"

IGNORECASE=true
# over write Upcase funciton in cocor/o/_global_.rb
def Upcase(c)
    c.upcase
end

#class String
#    def to_byte
#        # self.bytes[0] # not work for ruby 1.8.7
#        self[0].ord # to Decimal
#    end
#end
#COCO_WCHAR_MAX =65535
#MIN_BUFFER_LENGTH =1024
#MAX_BUFFER_LENGTH =(64*MIN_BUFFER_LENGTH)
#HEAP_BLOCK_SIZE =(64*1024)

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
class Scanner <  CRRScanner
    
    attr_accessor :currLine, :currCol, :include_stack
  
   
   
  public
    # def initialize( srcFile,  ignoreCase) 
    #     super(srcFile, ignoreCase)
    # end
    def initialize( str="",  ignoreCase=IGNORECASE) 
        p "+==>init scanner:#{ignoreCase}", 10
        super(str, ignoreCase)
    end

    def dump_some(length=10)
        @buffer[@buffPos..@buffPos+length]
    end
    
    def Comment()
       #p "===>Comment1:#{@ch}"
       level=1
       startLine=@currLine
       oldLineStart=@lineStart
       oldCol=@currCol
      
      
       if @ch=='*'
           _pos = @buffPos-1
           _ch = @buffer[_pos]
           isStart = true # is start of line
           # check if it's start of line
           while (_pos>=0 && _ch.to_byte != EOF_CHAR && _ch.to_byte != LF_CHAR)
               if !isWhitespace?(_ch)
              #     p "===>Comment3:#{_ch}, #{_pos}"
                   isStart = false
                   break
               end
               _pos -=1
               _ch = @buffer[_pos]
           end
         #  p "===>Comment2:#{isStart}, #{@ch}"
           if isStart
               while (@ch && @ch.to_byte != EOF_CHAR && @ch.to_byte != LF_CHAR && @ch.to_byte != 13)
                   NextCh()
                 #  p "===>Comment4:#{@ch} #{@ch.to_byte} #{@ch.to_byte != LF_CHAR}"
                  @nextSym.Len+=1
               end
               @nextSym.Len+=1 if @ch.to_byte != EOF_CHAR
        #      p "===>Comment5:#{@ch} #{@ch.to_byte} "
               return 1
           end
         
      end
     
     if @ch=='"'
         NextCh()
         while (@ch && @ch.to_byte != EOF_CHAR && @ch.to_byte != LF_CHAR && @ch.to_byte != 13)
             p "===>Comment6:#{@ch} #{@ch.to_byte} #{@ch.to_byte != LF_CHAR}"
            @nextSym.Len+=1 if @ch.to_byte != EOF_CHAR
             NextCh()
         end
         return 1
     end
      #if @ch=='"'
      #    p "===>Comment6:#{dump_some}", 10
      #   NextCh()
      #   while (@ch!=nil)
      #      if @ch==10
      #         level-=1
      #         NextCh()
      #         @comEols=@currLine-startLine
      #         if level==0
      #            return 1
      #         end
      #
      #      else
      #         if @ch.to_byte==EOF_CHAR
      #            return 0
      #         else
      #            NextCh()
      #         end
      #
      #      end
      #
      #   end
      #
      #end

       return 0
    end
   
  protected

  # --- here need steps ---#
  # 1. @@STATE0 =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
   #@@STATE0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   #               0,0,31,111,26,32,0,96,84,24,39,40,42,94,100,95,36,41,34,2,2,2,2,2,2,2,2,2,30,81,
   #               87,80,89,0,0,1,1,1,113,1,1,1,1,1,1,1,1,114,1,1,1,1,1,1,1,1,1,1,1,1,
   #               1,37,0,38,86,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
   #               1,1,1,0,82,0,112,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   #               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   #               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   #               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   #               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] 
  # the index of the array is the character's acsii code (ch.to_byte), value of array element is the status code.                 
  # 2. method def CheckLiteral( id)
  # 3. comments (this step not needed now)
    # return 1: comments completed
    # return 0: comments not completed but encounter nil or EOF
    # 
    #  def Comment()
   
public
  # 4. def Get(ignore_crlf=true), 
  #     copy the part after state=@sTATE0[@ch]
  #     change .Len .Pos to .len .pos
  # 5. recopy sym from cc.hpp to sym.rb (not needed, done by gen_sym.rb)
=begin
  def CheckLiteral(id)
     c=CurrentCh(@nextSym.Pos)
     if @ignoreCase
        c=Upcase(c)
     end

     case c

     when 'A'
        if EqualStr("AND")
           return C_ANDSym
        end

        if EqualStr("ALIAS")
           return C_ALIASSym
        end

        if EqualStr("ALL")
           return C_ALLSym
        end

        if EqualStr("AT")
           return C_ATSym
        end

        if EqualStr("AS")
           return C_ASSym
        end

        if EqualStr("ABSTRACT")
           return C_ABSTRACTSym
        end

        if EqualStr("ASSIGNED")
           return C_ASSIGNEDSym
        end


     when 'B'
        if EqualStr("BYTE")
           return C_BYTESym
        end

        if EqualStr("BETWEEN")
           return C_BETWEENSym
        end

        if EqualStr("BOXED")
           return C_BOXEDSym
        end

        if EqualStr("BLOB")
           return C_BLOBSym
        end

        if EqualStr("BACKGROUND")
           return C_BACKGROUNDSym
        end

        if EqualStr("BYTE-CO")
           return C_BYTEMinusCOSym
        end

        if EqualStr("BYTE-CN")
           return C_BYTEMinusCNSym
        end

        if EqualStr("BYTE-CA")
           return C_BYTEMinusCASym
        end

        if EqualStr("BYTE-NA")
           return C_BYTEMinusNASym
        end

        if EqualStr("BYTE-CS")
           return C_BYTEMinusCSSym
        end

        if EqualStr("BYTE-NS")
           return C_BYTEMinusNSSym
        end

        if EqualStr("BOUND")
           return C_BOUNDSym
        end


     when 'C'
        if EqualStr("CONTROL")
           return C_CONTROLSym
        end

        if EqualStr("COMPONENTS")
           return C_COMPONENTSSym
        end

        if EqualStr("CHARACTER")
           return C_CHARACTERSym
        end

        if EqualStr("COLUMNS")
           return C_COLUMNSSym
        end

        if EqualStr("CLOB")
           return C_CLOBSym
        end

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

        if EqualStr("CASE")
           return C_CASESym
        end

        if EqualStr("CALL")
           return C_CALLSym
        end

        if EqualStr("CALLING")
           return C_CALLINGSym
        end

        if EqualStr("CHANGING")
           return C_CHANGINGSym
        end

        if EqualStr("CLASS")
           return C_CLASSSym
        end

        if EqualStr("CREATE")
           return C_CREATESym
        end

        if EqualStr("CRITICAL")
           return C_CRITICALSym
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
        if EqualStr("DESCRIBE")
           return C_DESCRIBESym
        end

        if EqualStr("DECIMALS")
           return C_DECIMALSSym
        end

        if EqualStr("DISTANCE")
           return C_DISTANCESym
        end

        if EqualStr("DISPLAY")
           return C_DISPLAYSym
        end

        if EqualStr("DATA")
           return C_DATASym
        end

        if EqualStr("DEFAULT")
           return C_DEFAULTSym
        end

        if EqualStr("DDMMYY")
           return C_DDMMYYSym
        end

        if EqualStr("DO")
           return C_DOSym
        end

        if EqualStr("DESTINATION")
           return C_DESTINATIONSym
        end

        if EqualStr("DEFINITION")
           return C_DEFINITIONSym
        end

        if EqualStr("DANGEROUS")
           return C_DANGEROUSSym
        end

        if EqualStr("DURATION")
           return C_DURATIONSym
        end

        if EqualStr("DIV")
           return C_DIVSym
        end


     when 'E'
        if EqualStr("ENDFUNCTION")
           return C_ENDFUNCTIONSym
        end

        if EqualStr("EDIT")
           return C_EDITSym
        end

        if EqualStr("END-LINES")
           return C_ENDMinusLINESSym
        end

        if EqualStr("ENDLOOP")
           return C_ENDLOOPSym
        end

        if EqualStr("EMPTY")
           return C_EMPTYSym
        end

        if EqualStr("EXPONENT")
           return C_EXPONENTSym
        end

        if EqualStr("ENVIRONMENT")
           return C_ENVIRONMENTSym
        end

        if EqualStr("ENDDO")
           return C_ENDDOSym
        end

        if EqualStr("ENDCASE")
           return C_ENDCASESym
        end

        if EqualStr("END")
           return C_ENDSym
        end

        if EqualStr("EXPORTING")
           return C_EXPORTINGSym
        end

        if EqualStr("EXCEPTIONS")
           return C_EXCEPTIONSSym
        end

        if EqualStr("EXCEPTION-TABLE")
           return C_EXCEPTIONMinusTABLESym
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

        if EqualStr("ENABLED")
           return C_ENABLEDSym
        end

        if EqualStr("ENDCLASS")
           return C_ENDCLASSSym
        end

        if EqualStr("ENDMETHOD")
           return C_ENDMETHODSym
        end

        if EqualStr("EVENT")
           return C_EVENTSym
        end

        if EqualStr("EQUIV")
           return C_EQUIVSym
        end

        if EqualStr("EQ")
           return C_EQSym
        end


     when 'F'
        if EqualStr("FROM")
           return C_FROMSym
        end

        if EqualStr("FUNCTION")
           return C_FUNCTIONSym
        end

        if EqualStr("FIELD")
           return C_FIELDSym
        end

        if EqualStr("FIRST-LINE")
           return C_FIRSTMinusLINESym
        end

        if EqualStr("FOR")
           return C_FORSym
        end

        if EqualStr("FORMAT")
           return C_FORMATSym
        end

        if EqualStr("FRAMES")
           return C_FRAMESSym
        end

        if EqualStr("FINAL")
           return C_FINALSym
        end

        if EqualStr("FRIENDS")
           return C_FRIENDSSym
        end

        if EqualStr("FAIL")
           return C_FAILSym
        end


     when 'G'
        if EqualStr("GLOBAL")
           return C_GLOBALSym
        end

        if EqualStr("GT")
           return C_GTSym
        end

        if EqualStr("GE")
           return C_GESym
        end


     when 'H'
        if EqualStr("HELP-ID")
           return C_HELPMinusIDSym
        end

        if EqualStr("HEAD-LINES")
           return C_HEADMinusLINESSym
        end

        if EqualStr("HANDLE")
           return C_HANDLESym
        end

        if EqualStr("HASHED")
           return C_HASHEDSym
        end

        if EqualStr("HEADER")
           return C_HEADERSym
        end

        if EqualStr("HOTSPOT")
           return C_HOTSPOTSym
        end

        if EqualStr("HARMLESS")
           return C_HARMLESSSym
        end


     when 'I'
        if EqualStr("IN")
           return C_INSym
        end

        if EqualStr("INTO")
           return C_INTOSym
        end

        if EqualStr("INDEX")
           return C_INDEXSym
        end

        if EqualStr("ID")
           return C_IDSym
        end

        if EqualStr("INITIAL")
           return C_INITIALSym
        end

        if EqualStr("IS")
           return C_ISSym
        end

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

        if EqualStr("IMPORTING")
           return C_IMPORTINGSym
        end

        if EqualStr("IF")
           return C_IFSym
        end

        if EqualStr("INHERITING")
           return C_INHERITINGSym
        end

        if EqualStr("IMPLEMENTATION")
           return C_IMPLEMENTATIONSym
        end

        if EqualStr("IGNORE")
           return C_IGNORESym
        end

        if EqualStr("INSTANCE")
           return C_INSTANCESym
        end


     when 'K'
        if EqualStr("KIND")
           return C_KINDSym
        end

        if EqualStr("KEY")
           return C_KEYSym
        end


     when 'L'
        if EqualStr("LENGTH")
           return C_LENGTHSym
        end

        if EqualStr("LIST")
           return C_LISTSym
        end

        if EqualStr("LINES")
           return C_LINESSym
        end

        if EqualStr("LINE")
           return C_LINESym
        end

        if EqualStr("LINE-SIZE")
           return C_LINEMinusSIZESym
        end

        if EqualStr("LINE-COUNT")
           return C_LINEMinusCOUNTSym
        end

        if EqualStr("LIKE")
           return C_LIKESym
        end

        if EqualStr("LOOP")
           return C_LOOPSym
        end

        if EqualStr("LOCATOR")
           return C_LOCATORSym
        end

        if EqualStr("LOB")
           return C_LOBSym
        end

        if EqualStr("LEFT-JUSTIFIED")
           return C_LEFTMinusJUSTIFIEDSym
        end

        if EqualStr("LEVEL")
           return C_LEVELSym
        end

        if EqualStr("LONG")
           return C_LONGSym
        end

        if EqualStr("LT")
           return C_LTSym
        end

        if EqualStr("LE")
           return C_LESym
        end


     when 'M'
        if EqualStr("MODE")
           return C_MODESym
        end

        if EqualStr("MASK")
           return C_MASKSym
        end

        if EqualStr("MESSAGE")
           return C_MESSAGESym
        end

        if EqualStr("MMDDYY")
           return C_MMDDYYSym
        end

        if EqualStr("MEMORY")
           return C_MEMORYSym
        end

        if EqualStr("MEDIUM")
           return C_MEDIUMSym
        end

        if EqualStr("METHOD")
           return C_METHODSym
        end

        if EqualStr("METHODS")
           return C_METHODSSym
        end

        if EqualStr("MOD")
           return C_MODSym
        end


     when 'N'
        if EqualStr("NUMBER")
           return C_NUMBERSym
        end

        if EqualStr("NON-UNIQUE")
           return C_NONMinusUNIQUESym
        end

        if EqualStr("NO-GAP")
           return C_NOMinusGAPSym
        end

        if EqualStr("NO-GROUPING")
           return C_NOMinusGROUPINGSym
        end

        if EqualStr("NO-SIGN")
           return C_NOMinusSIGNSym
        end

        if EqualStr("NO-ZERO")
           return C_NOMinusZEROSym
        end

        if EqualStr("NO")
           return C_NOSym
        end

        if EqualStr("NEXT")
           return C_NEXTSym
        end

        if EqualStr("NEW")
           return C_NEWSym
        end

        if EqualStr("NE")
           return C_NESym
        end

        if EqualStr("NOT")
           return C_NOTSym
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


     when 'O'
        if EqualStr("OUTPUT-LENGTH")
           return C_OUTPUTMinusLENGTHSym
        end

        if EqualStr("OF")
           return C_OFSym
        end

        if EqualStr("OCCURS")
           return C_OCCURSSym
        end

        if EqualStr("OTHER")
           return C_OTHERSym
        end

        if EqualStr("ON")
           return C_ONSym
        end

        if EqualStr("OFF")
           return C_OFFSym
        end

        if EqualStr("OR")
           return C_ORSym
        end

        if EqualStr("OTHERS")
           return C_OTHERSSym
        end

        if EqualStr("OPTIONAL")
           return C_OPTIONALSym
        end


     when 'P'
        if EqualStr("PAGES")
           return C_PAGESSym
        end

        if EqualStr("PAGE")
           return C_PAGESym
        end

        if EqualStr("PERFORMING")
           return C_PERFORMINGSym
        end

        if EqualStr("PARAMETER-TABLE")
           return C_PARAMETERMinusTABLESym
        end

        if EqualStr("PUBLIC")
           return C_PUBLICSym
        end

        if EqualStr("PROTECTED")
           return C_PROTECTEDSym
        end

        if EqualStr("PRIVATE")
           return C_PRIVATESym
        end

        if EqualStr("PREFERRED")
           return C_PREFERREDSym
        end

        if EqualStr("PARAMETER")
           return C_PARAMETERSym
        end


     when 'Q'
        if EqualStr("QUICKINFO")
           return C_QUICKINFOSym
        end


     when 'R'
        if EqualStr("REPORT")
           return C_REPORTSym
        end

        if EqualStr("REFRESH")
           return C_REFRESHSym
        end

        if EqualStr("RAISING")
           return C_RAISINGSym
        end

        if EqualStr("READER")
           return C_READERSym
        end

        if EqualStr("REF")
           return C_REFSym
        end

        if EqualStr("RANGE")
           return C_RANGESym
        end

        if EqualStr("READ-ONLY")
           return C_READMinusONLYSym
        end

        if EqualStr("RIGHT-JUSTIFIED")
           return C_RIGHTMinusJUSTIFIEDSym
        end

        if EqualStr("ROUND")
           return C_ROUNDSym
        end

        if EqualStr("RESET")
           return C_RESETSym
        end

        if EqualStr("RISK")
           return C_RISKSym
        end

        if EqualStr("REFERENCE")
           return C_REFERENCESym
        end

        if EqualStr("RETURNING")
           return C_RETURNINGSym
        end

        if EqualStr("RESUMABLE")
           return C_RESUMABLESym
        end

        if EqualStr("REQUESTED")
           return C_REQUESTEDSym
        end


     when 'S'
        if EqualStr("SCREEN")
           return C_SCREENSym
        end

        if EqualStr("STANDARD")
           return C_STANDARDSym
        end

        if EqualStr("SORTED")
           return C_SORTEDSym
        end

        if EqualStr("SIZE")
           return C_SIZESym
        end

        if EqualStr("STYLE")
           return C_STYLESym
        end

        if EqualStr("SYMBOL")
           return C_SYMBOLSym
        end

        if EqualStr("STARTING")
           return C_STARTINGSym
        end

        if EqualStr("SEPARATE")
           return C_SEPARATESym
        end

        if EqualStr("SHARED")
           return C_SHAREDSym
        end

        if EqualStr("SHORT")
           return C_SHORTSym
        end

        if EqualStr("SECTION")
           return C_SECTIONSym
        end

        if EqualStr("SUPPLIED")
           return C_SUPPLIEDSym
        end


     when 'T'
        if EqualStr("TABLE")
           return C_TABLESym
        end

        if EqualStr("TYPE")
           return C_TYPESym
        end

        if EqualStr("TOP-LINES")
           return C_TOPMinusLINESSym
        end

        if EqualStr("TITLE-LINES")
           return C_TITLEMinusLINESSym
        end

        if EqualStr("TO")
           return C_TOSym
        end

        if EqualStr("TIME")
           return C_TIMESym
        end

        if EqualStr("TIMES")
           return C_TIMESSym
        end

        if EqualStr("TASK")
           return C_TASKSym
        end

        if EqualStr("TABLES")
           return C_TABLESSym
        end

        if EqualStr("TESTING")
           return C_TESTINGSym
        end


     when 'U'
        if EqualStr("UNIQUE")
           return C_UNIQUESym
        end

        if EqualStr("UNDER")
           return C_UNDERSym
        end

        if EqualStr("UNIT")
           return C_UNITSym
        end

        if EqualStr("USING")
           return C_USINGSym
        end

        if EqualStr("UPDATE")
           return C_UPDATESym
        end


     when 'V'
        if EqualStr("VALUE")
           return C_VALUESym
        end

        if EqualStr("VARYING")
           return C_VARYINGSym
        end

        if EqualStr("VARY")
           return C_VARYSym
        end


     when 'W'
        if EqualStr("WITH")
           return C_WITHSym
        end

        if EqualStr("WRITER")
           return C_WRITERSym
        end

        if EqualStr("WRITE")
           return C_WRITESym
        end

        if EqualStr("WHEN")
           return C_WHENSym
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
        if EqualStr("communication_failure")
           return C_communicationUnderscorefaiSym
        end


     when 'e'
        if EqualStr("error_message")
           return C_errorUnderscoremessageSym
        end


     when 'f'
        if EqualStr("for")
           return C_forSym
        end


     when 'r'
        if EqualStr("resource_failure")
           return C_resourceUnderscorefailureSym
        end

        if EqualStr("return")
           return C_returnSym
        end


     when 's'
        if EqualStr("system_failure")
           return C_systemUnderscorefailureSym
        end


     end


     return id
  end
=end
  
   def skip(ignore_crlf= true, skip_comment = true)
       
       return C_EOF_Sym if @ch == nil
       
        # filter white space and comments
        begin
           return C_EOF_Sym if @ch == nil

          # p "===>Get2:#{@ch} #{@ch.to_byte}"
           # filter white space
           while (@ch.to_byte >= 9 && # TAB
                   @ch.to_byte <= 10 || # LF
                  @ch.to_byte == 13 || # CR
                  @ch == ' ') # space
                   # p "get30:#{@ch}, #{@buffPos}"
                   if !ignore_crlf && ( @ch.to_byte == 13|| ch.to_byte == 10)
                       p "crlf:#{@ch.to_byte}, pos #{@buffPos}"
                        Scan_NextCh()
                        nextSym.len += 1
                       return C_CRLF_Sym
                   end
                   Scan_NextCh()
                   nextSym.len += 1
                    #p "get31:#{@ch}, #{@buffPos}"
                   return C_EOF_Sym if @ch == nil 
           end
          # p "get32:#{@ch}, #{@buffPos}"

         end while (skip_comment && (@ch == '*' || @ch == '"') && Comment()==1) 
          
         if (@ch == nil || @ch.to_byte == EOF_CHAR  ) 
             return C_EOF_Sym
         end
        # p "Get5:#{@ch}, #{@ch.to_byte}"
         if !ignore_crlf &&  ( @ch.to_byte == 13|| ch.to_byte == 10)
             return C_CRLF_Sym
         end
         return nil
          
   end
   
   def Get(ignore_crlf=true)
       @currSym = nextSym.clone
      
       nextSym.init(0, @currLine, @currCol - 1, @buffPos, 0)
       nextSym.len  = 0
       
       # int state, ctx
       r = skip(ignore_crlf, false)
     #  p "skip return #{r}"
        return r if r

        nextSym.init(0, @currLine, @currCol - 1, @buffPos, 0)
        nextSym.len  = 0


           ctx = 0
         #   p "==>>>check comments"
           if Comment()==1
         #      p "==>>>is comments:#{GetSymValue(nextSym)}"
               return 0.6
           end
           
           
         #
         #  
         #  state = @@STATE0[@ch.to_byte]
         #  
         #  # copy from generated ruby from cpp code
         #  while (1)
         #     NextCh()
         #     (@nextSym.Len+=1;@nextSym.Len-2)
         #   #  p "@ch:#{@ch}, state:#{state}"
         #
         #       state = UpdateState(state)
         #
         #  end

            ret =  UpdateState()
          #  p "ret:#{ret}"
            return ret

   end
   



end
