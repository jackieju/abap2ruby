load "cr_scan.rb"

load 'cocoR/o/cscanner.rb'
load 'cocoR/o/_global_.rb'

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


def isWhitespace?(ch)
    return ch.to_byte >= 9 && # TAB
                       ch.to_byte <= 10 || # LF
                      ch.to_byte == 13 || # CR
                      ch == ' ' # sp
end

class String
    def ==(s)
        if s.class == Integer
            return self.ord == s
        end
        super
    end
    def <=(s)
        if s.class == Integer
            return self.ord <= s
        end
        super
    end
end

           MAX_IDENTIFIER_LENGTH = 1000
class CRRScanner <  CScanner
    
    attr_accessor :currLine, :currCol, :include_stack
   def Scan_NextCh    
       NextCh()
   end
   # def Scan_ComEols   
   #     @comEols
   # end
   # def Scan_CurrLine 
   #      @currLine
   #  end

   # def Scan_CurrCol  
   #      @currCol
   #      end
        
   # def Scan_LineStart 
   #     @lineStart
   #     end
       
   # def Scan_BuffPos   
   #     @buffPos
   #     end
       
   def Scan_NextLen   
       nextSym.len
   end
   
   
  public
    # def initialize( srcFile,  ignoreCase) 
    #     super(srcFile, ignoreCase)
    # end
    def initialize( str="",  ignoreCase=true) 
        super(str, ignoreCase)
        @include_stack = []
    end

    def current_line
        pos1 = nextSym.pos
        while pos1-1 >= 0 && buffer[pos1-1] != "\n"
            pos1 -=1
        end
        pos2 = nextSym.pos
        while buffer[pos2+1] && buffer[pos2+1] != "\n"
            pos2 +=1
        end
        return buffer[pos1..pos2]
    end
    def set(_str, _ignoreCase, _currSym, _nextSym, _currLine, _currCol, _lineStart, _pos, _ch, _comEols)
        @ch = _ch
        @buffer = _str
        @ignoreCase = _ignoreCase
        @currSym = AbsToken.new
        @currSym.init(_currSym.sym, _currSym.line, _currSym.col, _currSym.pos, _currSym.len)
        @nextSym = AbsToken.new
        @nextSym.init(_nextSym.sym, _nextSym.line, _nextSym.col, _nextSym.pos, _nextSym.len)  
        @currLine = _currLine
        @currCol = _currCol
        @lineStart = _lineStart
        @buffPos = _pos
        @comEols = _comEols
    end
    
    def clone()
        sc = self.class.new
        sc.set(@buffer, @ignoreCase, @currSym, @nextSym, @currLine, @currCol, @lineStart, @buffPos, @ch, @comEols)
        return sc
    end
    
    def GetName()

        # return super(@CurrSym, MAX_IDENTIFIER_LENGTH-1)
        # return super(@currSym)
        return GetSymString(@currSym)
	end
	def GetNextName()
	    return GetSymValue(@nextSym)
    end
  protected
    # @@STATE0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    #              0,0,0,55,24,33,71,64,51,26,45,46,47,62,42,63,67,38,35,2,2,2,2,2,2,2,2,2,48,37,
    #                    30,41,57,83,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    #                    1,43,0,44,53,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    #                    1,1,1,39,49,40,82,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    #                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    #                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    #                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    #                    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    # the index of the array is the character's acsii code (ch.to_byte), value of array element is the status code.                 

    def LeftContext(s)
        raise("not implemented")
=begin
        int Level, StartLine, OldCol
          long OldLineStart

          Level = 1; StartLine = CurrLine
          OldLineStart = LineStart; OldCol = @currCol
          if (@ch == '/') { 
          	Scan_NextCh()
          	if (@ch == '*') { 
          		Scan_NextCh()
          		while (1) {
          			if (@ch== '*') { 
          				Scan_NextCh()
          				if (@ch == '/') { 
          					Level--; Scan_NextCh(); Scan_ComEols = @currLine - StartLine
          					if(Level == 0) return 1
          				}  
          			} else 
          			if (@ch == EOF_CHAR) return 0
          			else Scan_NextCh()
          		} 
          	} else { 
          		if (@ch == LF_CHAR) { @currLine--; @lineStart = OldLineStart; }
          		@buffPos -= 2; @currCol = OldCol - 1; Scan_NextCh()
          	} 
          } 
          if (@ch == '/') { 
          	Scan_NextCh()
          	if (@ch == '/') { 
          		Scan_NextCh()
          		while (1) {
          			if (@ch== 10) { 
          				Level--; Scan_NextCh(); Scan_ComEols = @currLine - StartLine
          				if(Level == 0) return 1
          			} else 
          			if (@ch == EOF_CHAR) return 0
          			else Scan_NextCh()
          		} 
          	} else { 
          		if (@ch == LF_CHAR) { @currLine--; @lineStart = OldLineStart; }
          		@buffPos -= 2; @currCol = OldCol - 1; Scan_NextCh()
          	} 
          } 

          return 0
=end       
    end
    

public
    def delete_prevline
        pos = nextSym.pos
      #  p "-=-->delete_prevline:pos #{@buffPos}, cur line #{@currLine}, ch #{@buffer[@buffPos].inspect}, buffer size #{@buffer.size}, buffer=#{@buffer}", 10
        return if pos <=0
        
        
        if pos > @buffer.size-1
            return delete_line(@buffer.size-1)
        end
        # p "ch[#{pos}]:#{@buffer[pos]}, #{@buffer[pos].to_byte}"
        if CurrentCh(pos) == "\n" 
            # break if CurrentCh(pos) == nil
            pos -=1
          # p "ch[#{pos}]:#{@buffer[pos]}, #{@buffer[pos].to_byte}"
            # p cch().to_byte
        end
        if CurrentCh(pos) == "\r" 
            # break if CurrentCh(pos) == nil
            pos -=1
          # p "ch[#{pos}]:#{@buffer[pos]}, #{@buffer[pos].to_byte}"
            # p cch().to_byte
        end
        # p "-=-->pos1:#{pos}"
        while CurrentCh(pos) != nil && CurrentCh(pos) != "\n"
            pos -= 1
            # p "ch[#{pos}]:#{@buffer[pos]}, #{@buffer[pos].to_byte}"
        end
        p "-=-->pos2:#{pos}"
        pos = 0 if pos < 0
       # old_size = @buffer.size
        # p "-=-->pos3:#{pos}, #{@buffer[pos].to_byte}"
        
        delete_line(pos)
        # @buffPos -= old_size - @buffer.size
        
    end
    # insert before pos line
    def insert_line(str, pos=nil)
        __t = Time.now.to_f
        # p "insert line #{str}, pos=#{pos}, @buffPos=#{@buffPos}"
        # pp "insert line #{str}, pos=#{pos}, #{self.inspect}"
        # pp "old buffer before insert:#{@buffer}", 20
        pos = @buffPos if pos == nil
        while @buffer[pos] == "\n"
            pos -= 1
        end
        while @buffer[pos] != nil && @buffer[pos] != "\n"
            pos -= 1
        end
        pos = -1 if pos <-1
        str += "\n"
        # p "insert_line:pos=#{pos}"
        str1 = ""
        if pos >0 
            str1 = @buffer[0..pos]
        end
        str2 = @buffer[pos+1..@buffer.size-1]
        # p "str1:#{str1}"
        @buffer = "#{str1}#{str}#{str2}"
        # p "new buffer after insert:#{@buffer}"
        p "@@@ insert line cost #{Time.now.to_f - __t}"
        
    end
    
    
    def delete_curline
        delete_line()
    end
    
    # delete lines where from line pos1 located1 to line pos2 located
    def delete_lines(pos1, pos2, include_last_line=true)
        __t = Time.now.to_f
        
     #   pp "===>delete_lines, pos=#{pos1},#{pos2}, @buffPo=#{@buffPos}, buffer=#{@buffer}", 20
        
        replace_start = pos1
        replace_end = pos2
       # p "replace_start:#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
       # p "replace_end:#{replace_end}(#{@buffer[replace_end]})  #{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
                
         # to line start
         if @buffer[replace_start] == "\n" || @buffer[replace_start] == "\r" 
             if @buffer[replace_start] == "\r" 
                 replace_start -=1
             elsif @buffer[replace_start] == "\n" 
                 replace_start -=1
                 replace_start -=1 if @buffer[replace_start] == "\r"
             end
         end
        while (@buffer[replace_start] != "\n" && @buffer[replace_start] != "\r" && replace_start >=0)
            replace_start -=1
        end
        if @buffer[replace_start] == "\n" || @buffer[replace_start] == "\r"  
            replace_start +=1 
        end
        
       # p "replace_start1:#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
       # p "replace_end1:#{replace_end}(#{@buffer[replace_end]})  #{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
        
        if include_last_line
            # to line end
            while (@buffer[replace_end] != "\n" && @buffer[replace_end] != "\r")
                replace_end +=1
            end
        else
            #while (@buffer[replace_end] == "\n" || @buffer[replace_end] == "\r")
            #    replace_end -=1
            #end1
           # p "replace_start2:#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
           # p "replace_end2:#{replace_end}(#{@buffer[replace_end]}) #{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
            
            while (@buffer[replace_end] != "\n" && @buffer[replace_end] != "\r" && @buffer[replace_end] !=nil)
                replace_end -=1
            end         
           # p "replace_start3:#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
           # p "replace_end3:#{replace_end} #{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
               
        end
        

        p "replace_start=#{replace_start}, #{buffer[replace_start..replace_start+10]}, replace_end=#{replace_end}, ,#{buffer[replace_end..replace_end+10]}, buffPos=#{@buffPos}"
        
        if replace_end > replace_start       
        
            #calculate line
            line_count_before_pos = 0
            if @buffPos > replace_start && @buffPos < replace_end
                i = replace_start
                i = 0 if i < 0
                while (i < @buffPos)
                    i +=1
                    line_count_before_pos += 1 if buffer[i] == "\n"
                end
            end

            replaced = @buffer[replace_start..replace_end]
            line_count = replaced.count("\n")
        
            p "replace_start=#{replace_start} #{@buffer[replace_start..replace_start+10]}, replace_end=#{replace_end}, #{@buffer[replace_end..replace_end+10]}, buffPos=#{@buffPos}"
            p "line count:#{line_count}"
            str1 = ""
                    
            if replace_start > 0 
                str1 = @buffer[0..replace_start-1]
            end
            old_buffer_size = @buffer.size
            deleted_content = @buffer[replace_start..replace_end]
            @buffer = "#{str1}#{@buffer[replace_end+1..@buffer.size-1]}"
            size_diff = @buffer.size - old_buffer_size
            @nextSym.pos += size_diff if @nextSym.pos > replace_end
            @currSym.pos += size_diff if @currSym.pos > replace_end
           # p "buffer:#{@buffer}"
            # if include_last_line
            #     @buffPos = replace_start
            # else
            #     @buffPos -= (old_buffer_size - @buffer.size )
            # end
            p "==>789L:line #{@currLine}, #{@buffPos}, size change #{old_buffer_size-@buffer.size}"
             if @buffPos >= replace_end
                  @buffPos -= (old_buffer_size - @buffer.size )
                  @currLine -= line_count
                  @lineStart -= (old_buffer_size-@buffer.size)
                 #  p "==>7892L:#{@buffPos}, #{@currLine}"
                  #Reset(@buffPos, @currLine, @lineStart, @currCol)
                 # p "==>7893L:#{@buffPos}"
             elsif @buffPos > replace_start# &&  @buffPos <replace_end
                 # adjust buffPos
                if replace_start < 0
                    @buffPos = -1
                else                    
                    @buffPos = replace_start-1 # -1 because will scann_nextch()
                end
                # adjust currLine, lineStart
                if @buffPos >= replace_end
                    @currLine -= line_count
                    @lineStart += size_diff
                else
                    @currCol = 0
                    @currLine -= line_count_before_pos
                end
              #  Reset(@buffPos, @currLine, @lineStart, @currCol)
                 
              Scan_NextCh()
                 
            end
        end
        
        
        # pp "===>delete_lines2, pos=#{pos1},#{pos2}, @buffPo=#{@buffPos}, buffer=#{@buffer}", 20 
        p "@@@ delete lines#{line_count}/#{size_diff} cost #{Time.now.to_f - __t}", 5
      #  p "buffer(#{@buffer.size}):#{@buffer}"
      #  p "deleted:#{deleted_content}"
      #  p "buffPos:#{buffPos}, #{nextSym.inspect}"
        return [replace_start, replace_end] 
    end
    
    def dump_char(pos=@buffPos)
        if @buffer[pos]  == nil
            return "(nil)"
        elsif @buffer[pos].to_byte == 10 || @buffer[pos].to_byte == 13 || @buffer[pos].to_byte ==0
            return "'\\#{@buffer[pos].to_byte}'@#{pos})"
        else
            return "'#{@buffer[pos]}'(#{@buffer[pos].to_byte}@#{pos})"
        end
    end
    
    # delete content from pos(from) to pos(to)(not include to)
    # e.g.    "abcdef" from:2, to:5, result:"abf"
    def delete_in_line(from, to) 
        __t = Time.now.to_f
        
        p ("delete_in_line:from #{from}(#{buffer[from..from+5]}), #{to}(#{buffer[to..to+5]}), #{@buffPos}"), 10
        replace_start = from 
         replace_end = to
         
         str1 = ""
         if replace_start >= 1
             str1 = @buffer[0..replace_start-1]
         end
         old_size = @buffer.size   
         str = str1+@buffer[replace_end..@buffer.size-1]
          @buffer=str
          if @buffPos > replace_start# &&  @buffPos <replace_end
              if replace_start < 0
                  @buffPos = -1
              else
                  @buffPos = replace_start-1
              end
              Reset(@buffPos, @currLine, @lineStart, @currCol)
          end
          
          @ch = CurrentCh(@buffPos)
          p "pos after deleteinline:#{@buffPos}"
         # p "after delete_in_line:#{@buffer}"
         # p "buffer  after deleteinline:#{@buffer}", 10
         p "@@@ delete in line cost #{Time.now.to_f - __t}"
         
    end
    def delete_line(pos=nil)
        __t = Time.now.to_f
        p "replace_start333:#{nextSym.inspect}, pos=#{pos}, #{GetSymValue(nextSym)}"
        
        pos = nextSym.pos if pos == nil
        if pos >= @buffer.size
            pos -=1
        end
        return if pos >= @buffer.size || pos < 0 || pos == nil
       # p "===>delete_line, #{@buffer[pos..pos+20].inspect}, @buffPos=#{@buffPos}, #{@buffer}", 10
        
     #   pp "===>delete_line, pos=#{pos}, ch=#{@buffer[pos].inspect}, @buffPos=#{@buffPos}, buffer=#{@buffer}", 20
        
        # replace_start is excluded, replace_end is excluded
        replace_start = pos 
        replace_start = 0 if replace_start < 0
        replace_end = pos
      #  p "replace_start333:#{replace_start}, #{replace_end}, #{@buffer[replace_start].to_byte if @buffer[replace_start]},#{@buffer.size}, #{@buffer}"
        
        #if @buffer[replace_start] == nil
        #    replace_start -=1
        #end
        #if @buffer[replace_end] == nil
        #    replace_end -=1
        #end
      #  p "replace_start1:#{dump_char(replace_start)}, #{cch}"
    #  p "replace_start2:#{replace_start}(#{@buffer[replace_start]}) #{dump_char(replace_start-3)}|#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
    #  p "replace_end2:#{replace_end}(#{@buffer[replace_end]}) #{dump_char(replace_start-3)}|#{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
    
        
        # to line start
        if @buffer[replace_start] == "\n" 
            replace_start -=1
        end
        if @buffer[replace_start] == "\r" 
            replace_start -=1
        end

      #  p "replace_start2:#{dump_char(replace_start)}"

        #move replace_start before the first pos which will be replaced
        while (@buffer[replace_start] && @buffer[replace_start] != "\n" && @buffer[replace_start] != "\r" )
            replace_start -=1
        #    p "replace_start3:#{dump_char(replace_start)}"
            
        end
      #  p "replace_start4:#{dump_char(replace_start)}"
        
        # to line end
        # p "==>replace_end=#{replace_end}, #{@buffer[replace_end]}, #{@buffer[replace_end].to_byte}"
        while (@buffer[replace_end] && @buffer[replace_end] != "\n" && @buffer[replace_end] != "\r" )
            replace_end +=1
       #     p "==>replace_end2=#{replace_end}, #{@buffer[replace_end]}"
            
        end

        if @buffer[replace_end] == "\r"
             replace_end +=1
        end     
        if @buffer[replace_end] == "\n"
            replace_end +=1
        end 
            #     
            # while @buffer[replace_end] == "\n" || @buffer[replace_end] == "\r"
            #     replace_end +=1
            # end
        

        # p "c:#{c}"
        # p "str1:#{@buffer[0..replace_start]}"
        # p "str2:#{@buffer[@buffPos..@buffer.size-1]}"
        str1 = ""
        if replace_start >= 0
            str1 = @buffer[0..replace_start]
        end
      #  p "replace_start:#{dump_char(replace_start-2)}|#{dump_char(replace_start-1)}|#{dump_char(replace_start)}|#{dump_char(replace_start+1)}"
       # p "replace_end:#{dump_char(replace_end-2)}|#{dump_char(replace_end-1)}|#{dump_char(replace_end)}|#{dump_char(replace_end+1)}"
        
        # p "delete_line3: replace_start=#{replace_start}, replace_end=#{replace_end}, #{@buffer[replace_start+1..replace_end]}\n=====\n#{@buffer[replace_end+1..replace_end+15]}", 20
        
        # p "str1=#{str1}"
        # p "str2=#{@buffer[replace_end..@buffer.size-1]}"    
        old_size = @buffer.size   
        str = str1+@buffer[replace_end..@buffer.size-1]
     #   p "buffer1:#{@buffer}"
       # p "replace_start:#{replace_start}, #{replace_end}, #{@buffer[replace_start].to_byte}"
         @currLine -= @buffer[replace_start+1..replace_end-1].count("\n")
        @buffer=str
        # p "buffer2:#{@buffer}"
       
        if @buffPos > replace_start# &&  @buffPos <replace_end
            if replace_start < 0
                @buffPos = -1
            else
                @buffPos = replace_start
            end
            if @buffPos >= replace_end
               # @currLine = @currLine-1
                @lineStart -= (old_size-@buffer.size)
            end
            if @buffPos < replace_end
                @currCol = 0
            end
            Reset(@buffPos, @currLine, @lineStart, @currCol)
        end
        @ch = CurrentCh(@buffPos)
        # p "new buffer after delete current line(from #{pos} to #{@buffer.size-1}): #{@buffer[pos..@buffer.size-1]}, ||\n#{@buffer}"
        # p "buffer3(size=#{@buffer.size}, pos #{@buffPos}):#{@buffer[0..552]}"
        # p "buffer4(size=#{@buffer.size}):#{@buffer[0..431]}\n=========\n#{@buffer[432..552]}"
        
        # p "===>delete_line1:pos=#{@buffPos}, ch=#{@ch}, #{@buffer[@buffPos..@buffPos+10]},buffer:#{@buffer}"
       # p "pos:#{@buffPos}, #{@ch}, buffer:#{@buffer}"
       p "@@@ delete line cost #{Time.now.to_f - __t}"
        
    end
    
    def fix_ch
        @ch = CurrentCh(@buffPos)
    end
    
    # # get next next sym
    #  def getNext()
    #      sc = CScanner.new
    #      sc.set(@buffer, @ignoreCase, @currSym, @nextSym, @currLine, @currCol, @lineStart, @buffPos, @ch, @comEols))
    #      return sc.Get()
    #      
    #  end
    # get next sym
    
    # should'nt do this in a cycle like #ifdef #if
    def save_part(fname)
        @saved_line = 0 if !@save_line
        pos = @buffPos
        p "save_part1:#{pos}, #{currLine}, #{@saved_line}"
        while pos>=0 && @buffer[pos] != "\n"
            pos -=1
        end
        for i in 0..5
            if pos >= 0
                pos -= 1 if @buffer[pos] == "\n"
                while pos>=0 && @buffer[pos] != "\n"
                    pos -=1
                end 
            end
        end
        pos = 0 if pos < 0
        # now pos will be \n 
        p "save_part:#{pos}"
        content = @buffer[0..pos]
        #p "content:#{content}"
        append_file(fname, content)
        lineLost = content.count("\n")
        p "save line #{lineLost}"
        
        @saved_line += lineLost
        @buffer = @buffer[pos+1..@buffer.size-1]
        sizeDiff = pos+1
        @buffPos -= sizeDiff
      #  @currLine = @buffer[0..@buffPos].count("\n")+1
        @nextSym.pos -=sizeDiff
        @nextSym.line -= lineLost
        @currSym.pos -= sizeDiff
        @currSym.line -= lineLost
        
        return lineLost
        
    end
    
    def remain_enough_line?(n)
        #p "=>remain_enough_line?"
        pos = @buffPos
        i = 0
        while i <= n && pos < @buffer.size-1
           while @buffer[pos] != "\n" && pos < @buffer.size-1
               pos += 1
           end
           i +=1 if @buffer[pos] == "\n"
           pos +=1 
        end
        return i > n
    end
    
    # return 1: comments completed
    # return 0: comments not completed but encounter nil or EOF
    def Comment()
        1
    end    


end


