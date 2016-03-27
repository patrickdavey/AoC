require "./instruction.rb"

class JieInstruction < Instruction
  def call(turing)
    if turing.registers[register].even?
      turing.line = turing.line.send(offset, distance)
    else
      turing.line += 1
    end
  end
end
