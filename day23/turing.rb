class Turing
  def initialize(instructions, register_a = 0, register_b = 0)
    @registers = {}
    @register["a"] = register_a
    @register["b"] = register_b
    @instructions = parse_instructions(instructions)
  end


  private

  def parse_instructions(instructions)
    parsed_instructions = []
    instructions.each_line do |instruction|
      parsed_instructions << Instruction.new(instruction.strip)
    end
  end
end
