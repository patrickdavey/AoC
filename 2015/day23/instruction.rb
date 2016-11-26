class Instruction
  PARSE = /^(?<class>(hlf|tpl|inc|jie|jio|jmp)) (?<register>\w)?,?\s?(?<offset>[+|\-])?(?<distance>\d+)?/
  def self.build(instruction)
    parsed = instruction.match(PARSE)
    klass = Object.const_get(parsed[:class].capitalize + "Instruction")
    klass.new(parsed[:register], parsed[:offset], parsed[:distance])
  end

  def initialize(register, offset, distance)
    @register = register
    @offset = offset
    @distance = distance.to_i if distance
  end


  private

  attr_reader :register, :offset, :distance
end

require "./hlf_instruction.rb"
require "./inc_instruction.rb"
require "./tpl_instruction.rb"
require "./jmp_instruction.rb"
require "./jie_instruction.rb"
require "./jio_instruction.rb"

