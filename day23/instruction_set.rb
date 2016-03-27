require 'pry'

class InstructionSet
  def initialize(instruction_string)
    @instructions = []
    instruction_string.each_line do |instruction|
     @instructions << Instruction.build(instruction.strip)
    end
  end

  def [](index)
    @instructions[index]
  end
end
