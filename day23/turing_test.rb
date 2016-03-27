require "minitest/autorun"
require "./turing.rb"
require "./instruction_set.rb"
require "pry"

class InstructionSetTest < Minitest::Test
  def test_initial_scenario
    parsed_instructions = InstructionSet.new(instructions)
    turing = Turing.new(parsed_instructions)
    turing.run!
    assert_equal turing.register("a"), 2
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
