require "./instruction.rb"

class JmpInstruction < Instruction
  def call(turing)
    turing.line = turing.line.send(offset, distance)
  end
end
