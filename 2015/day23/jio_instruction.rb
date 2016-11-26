require "./instruction.rb"

class JioInstruction < Instruction
  def call(turing)
    if turing.registers[register] == 1
      turing.line = turing.line.send(offset, distance)
    else
      turing.line += 1
    end
  end
end
