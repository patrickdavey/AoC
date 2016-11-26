require "minitest/autorun"
require "./instruction_set.rb"
require "./inc_instruction.rb"
require "pry"

class InstructionSetTest < Minitest::Test
  def test_initial_scenario
    parsed_instructions = InstructionSet.new(instructions)
    assert_equal(parsed_instructions[0].class, IncInstruction)
    assert_equal(parsed_instructions[1].class, JioInstruction)
    assert_equal(parsed_instructions[2].class, TplInstruction)
    assert_equal(parsed_instructions[3].class, IncInstruction)
    assert_equal(parsed_instructions.length, 4)
  end

  def instructions
<<INSTRUCTIONS
inc a
jio a, +2
tpl a
inc a
INSTRUCTIONS
  end
end
