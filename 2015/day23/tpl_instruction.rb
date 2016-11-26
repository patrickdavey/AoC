require "./instruction.rb"

class TplInstruction < Instruction
  def call(turing)
    turing.registers[register] = turing.registers[register] * 3
    turing.line += 1
  end
end
