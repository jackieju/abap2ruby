require_relative 'rubyutility'
require 'fileutils'
require_relative 'hash.rb'

if $LOG_LOADED == nil
    $LOG_LOADED = 1

    # config log
class Log
    @@config = {
        :log=>true,
        :warn=>true,
        :trace=>false
    }

    def self.config(hash=nil)
        if hash
            _p("===>config log2")
            print "===>config log2\n"
            
        end
        if @@config == nil
            @@config = {
                :log=>true,
                :warn=>true,
                :trace=>false
            }
        end
        if  !hash
            return @@config
        end
        @@config[:log] = hash[:log] if hash[:log] != nil
        @@config[:warn] = hash[:warn] if hash[:warn] != nil
        @@config[:trace] = hash[:trace] if hash[:trace] != nil
    end

end

def class_exists?(class_name)   
  eval("defined?(#{class_name}) && #{class_name.class}.is_a?(Class)") == true  
end

def format_msg(msg, cat=nil, stack=0, showTime=true)
    _stack = stack + 1
    
    if cat == nil
        cat = ""
    else
        cat = cat.upcase
    end
    trace = nil
    ret = ""
    
    st = ""
    if showTime
        time = Time.now
        st =  "#{time.strftime("%Y-%m-%d %H:%M:%S")}.#{time.usec.to_s.rjust(6, '0')[0..2]}"
    end
    
    if stack >0
        begin
            raise Exception.new
        rescue Exception=>e
            if e.backtrace.size >=2 && stack >= 0
                _stack  += 1
                _stack = e.backtrace.size-1 if _stack >= e.backtrace.size
                trace = e.backtrace[2.._stack].join("\n-") 
            end
        end    
    end
    
    m = msg
    if msg.is_a?(Exception)
        m = "!!!Exception:#{m.inspect}:\n#{m.backtrace[0..9].join("\n")}"
    end
    m_cat = ""
    m_cat = "\##{cat}" if cat && cat!=""
    
    if trace
        ret = "#{$$}|#{st}#{m_cat}]#{m}\n(#{trace})"
    else
        ret = "#{$$}|#{st}#{m_cat}]#{m}"
    end

    return ret
end
    
def get_logfile_path(cat = "LOG", time = nil)
    time = Time.now if time == nil
    st2 =  "#{time.strftime("%Y%m%d")}"

    froot = g_FILEROOT
    # p "===>file root:#{froot}"
    froot = "." if !froot
    dir = "#{froot}/log"
    # p "--->dir:#{dir}"
    FileUtils.makedirs(dir)   
    fname = "#{dir}/#{cat}_#{st2}.sg"

    return fname
end

def exp_to_s(e, deep=9)
    deep = 29 if e.is_a?(SystemStackError)
    return nil if e.is_a?(Exception) == false
    "!!!Exception:#{e.inspect}:\n#{e.backtrace[0..deep].join("\n+")}\n!!!END"
end

def log_msg(m, cat="LOG", stack=0, showTime = true)
    cat = cat.upcase

    msg=format_msg(m, cat, stack, showTime)
 
    fname = get_logfile_path(cat)
     #p "==>log msg #{fname}: #{msg}"
    append_file(fname, msg)    
end

def log_to_file(m, fname, stack=0, showTime = true)
    _p(m)
    msg=format_msg(m, "", stack, showTime)

    append_file(fname, msg)    
end


def _p(m, stack=0, showTime=true)
    m = format_msg(m, "", stack, showTime)
    # puts m
    begin
    # if class_exists?("Rails.logger")
        Rails.logger.debug(m) 
    # else
        # print "#{m}\n"
    # end
    rescue Exception=>e
         print "#{m}\n"
    end
end

#### log on rails #####
def p(m, stack=0, showTime=true)
    log(m, stack, showTime)
end

def log(m, stack=0, showTime=false)
  #  print("Log.config.log:#{Log.config.log}\n")
    return if Log.config[:log] == false
    m = format_msg(m, "", stack, showTime)
    # puts m
    begin
    # if class_exists?("Rails.logger")
        # Rails.logger.debug(m)
        print "#{m}\n"
    # else
        # print "#{m}\n"
    # end
    rescue Exception=>e
         print "#{m}\n"
    end
end

def warn(m)
    # Rails.logger.warn(m)
    _p(m) if Log.config.warn == true
end

def err(m)
    if m.is_a?(Exception)
        max_stack = 100
        max_stack = m.backtrace.size-1 if m.backtrace.size <= max_stack
        m = "!!!Exception:#{m.inspect}:\n#{m.backtrace[0..max_stack].join("\n")}"
    end
    begin
    # if class_exists?("Rails.logger")
        Rails.logger.error(m) 
    # else
        # print "#{m}\n"
    # end
    rescue Exception=>e
         print "#{m}\n"
    end
end

def trc(m, stack=0)
    if Log.config.trace
        m = format_msg(m, "trc")
        _p(m, stack)
    end
end

def d(m,stack=0)
    trc(m,stack)
end
def pe(e, deep =9)
    m = exp_to_s(e, deep)
    _p(m)
    return m
end

def p_f(m)
    # p "|==>perf(#{$uid}):(#{Time.now.to_f}) #{m}" if $uid==1909
   # p "|==>perf(#{$uid}):(#{Time.now.to_f}) #{m}" if $uid==25579#  玩玩走走
   d(m)
end

# log memory usage
# has error: current_proc_used_mem not found
def log_mem
    return
    trc = ""
    begin
        raise Exception.new
    rescue Exception=>e
        trc = e.backtrace[1]
    end
    begin
s= "=====>memory usage<========
pid:#{$$}
mem:#{current_proc_used_mem}
obj:#{ObjectSpace.each_object() {}}
#{trc}
==========================="
    _p(s)
    rescue Exception=>e
        p("log mem failed, exception:#{e}")
    end
    return s
end    


# slow log for performance log
class SlowLog
    @@th = 1 #threshhold
    
    # stack level is where the log caller located
    def _in(stack = 2)
        @trc = ""
        begin
            raise Exception.new
        rescue Exception=>e
            @trc = e.backtrace[stack]
        end
        
        @last_log_tf = @t = Time.now.to_f
       
        @buf = ""
        
        @log_num = 0
    end
    def self.in(stack = 2)
        h = SlowLog.new
        
        h._in(stack)
        # h.log
        
        return h
    end
    def _out
        t2 = Time.now.to_f
        # if true
        span = t2 - @t
        if span > @@th 
            # p @buf
            # p @buf = "========= END slow log ========\n"
            # @buf += "Span #{span}\n"
            # @buf += "========= END slow log ========\n"
            m = <<__END1__
            \n========= slow log ========
            pid: #{$$}
            file: #{@trc}
            time: #{@t}
            span:#{span}
#{@buf}
========= END slow log ========          
__END1__
            # p "m=#{m}"
            log_msg(m, "SLOWLOG")
        end
    end
    def self.out(h)
        h._out
    end
    def self.out1(h)
        h._out
    end
    def log(m="", stack=2)
        __last_tf = @last_log_tf
        __tnowf = Time.now.to_f
        @last_log_tf = __tnowf
        delta_tf = __tnowf - __last_tf
        
        trc = ""
        begin
            raise Exception.new
        rescue Exception=>e
            trc = e.backtrace[stack]
            # trc2 = e.backtrace.join("\r\n") 
        end
                
        @buf += "[#{$$}\##{@log_num}@#{__tnowf}+#{delta_tf}] #{m} (#{trc})\n"
        # @buf += trc2
        @log_num += 1
    end
    
    def self.set_timeout(t)
        @@th = t
    end
    
end

# for easy use slow log
def __logf_start__
    $slow_log = SlowLog.in(3)
end

def __logf_end__
    if $slow_log 
        SlowLog.out($slow_log)
        $slow_log = nil
    end
end

def __logf__(m="")
    $slow_log.log(m, 2) if $slow_log
end

def __logf(m="")
    __logf__(m)
end

$Hidden_log_files = []
def hide_p_in_file(file) # after call this the log performance will down
    # begin
    #     raise Exception.new
    # rescue Exception=>e
    #    
    #     if e.backtrace.size >=2
    #         trace = e.backtrace[2..e.backtrace.size-1].join("\n") 
    #         p trace
    #     end
    # end
   $Hidden_log_files.push(file) if file && file.strip !=""
end

def hide_log?
     begin
          raise Exception.new
      rescue Exception=>e
         # puts e.backtrace.inspect
          if e.backtrace.size >=2
              # trace = e.backtrace[2..e.backtrace.size-1].join("\n") 
              trace =  e.backtrace[2] # posistion 2 is where p was called
              # puts "logfromfile:"+trace.split(":")[0]
              # puts "$Hidden_log_files:#{$Hidden_log_files}"
              # puts "result:#{$Hidden_log_files.include?(trace.split(":")[0] )}"
              if $Hidden_log_files.include?(trace.split(":")[0] )
                  return true
              end
          end
      end
      return false
end
  
# def test_slowlog
#     _hh = SlowLog.in
#     _hh.log("sff")
#     sleep(2)
#     _hh.log
#     _hh.log
#     SlowLog.out(_hh)
# end

=begin
# test_slowlog
def stacktoodeep1
    puts "."
    stacktoodeep
end
def stacktoodeep
    puts "'"
    stacktoodeep1
end
begin
   stacktoodeep
rescue Exception=>e
    p "stack size #{e.backtrace.size}"
    p "2:#{e.backtrace[0..e.backtrace.size-1].join("\n")}"
    log_msg(e,"err", 10)
   
end
=end

#print "===>loaded log\n"
#log "===>loaded log\n", 90
end # if $LOG_LOADED == nil