class CPU
    attr_reader :high, :regs

    def initialize; @regs = Hash.new(0) end
    def inc(value)
      puts "calling inc #{value}"
      value
    end
    def dec(value)
      puts "calling dec -#{value}"
      -value
    end
    def run(text)
      puts "text #{text}"
      eval text
    end

    def method_missing(sym, *args)
      puts "sym: #{sym} args: #{args}"
        (@regs[sym] += args[0].to_i).tap { |v| @high = v if @high.nil? || @high < v }
    end
end

cpu = CPU.new
cpu.run $<.read
puts cpu.regs.values.max
puts cpu.high
