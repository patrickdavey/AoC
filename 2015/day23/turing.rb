class Turing
  attr_reader :registers
  attr_accessor :line

  def initialize(instruction_set, register_a = 0, register_b = 0)
    @registers = {}
    @registers["a"] = register_a
    @registers["b"] = register_b
    @instruction_set = instruction_set.freeze
    @line = 0
  end

  def run!
    while(within_bounds?)
      instruction_set[line].call(self)
    end
  end

  def register(reg)
    registers[reg]
  end

  private

  attr_reader :instruction_set

  def within_bounds?
    line < instruction_set.length
  end
end
