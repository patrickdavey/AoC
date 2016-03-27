require "./instruction.rb"

class IncInstruction < Instruction
  def call(turing)
    turing.registers[register] += 1
    turing.line += 1
  end
end
