require "./instruction.rb"

class HlfInstruction < Instruction
  def call(turing)
    turing.registers[register] = (turing.registers[register] / 2).floor
    turing.line += 1
  end
end
