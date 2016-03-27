require "minitest/autorun"
require "./instruction.rb"
require "./hlf_instruction.rb"
require "./inc_instruction.rb"
require "./tpl_instruction.rb"
require "./jmp_instruction.rb"
require "./jie_instruction.rb"
require "./jio_instruction.rb"
require "./turing.rb"
require "pry"

class InstructionTest < Minitest::Test
  def test_half_register_instruction
    instruction = Instruction.build("hlf a")
    assert_equal instruction.class, HlfInstruction
  end

  def test_triple_register_instruction
    instruction = Instruction.build("tpl a")
    assert_equal instruction.class, TplInstruction
  end

  def test_increment_register_instruction
    instruction = Instruction.build("inc a")
    assert_equal instruction.class, IncInstruction
  end

  def test_jump_instruction
    instruction = Instruction.build("jmp +7")
    assert_equal instruction.class, JmpInstruction
  end

  def test_jump_if_even_instruction
    instruction = Instruction.build("jie a -7")
    assert_equal instruction.class, JieInstruction
  end

  def test_jump_if_odd_instruction
    instruction = Instruction.build("jio a +7")
    assert_equal instruction.class, JioInstruction
  end
end
