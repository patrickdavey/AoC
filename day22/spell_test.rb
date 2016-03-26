require "minitest/autorun"
require "./spell.rb"
require "pry"

class RoundTest < Minitest::Test
  def test_immediate?
    spell = Spell.missile
    assert_equal true, spell.immediate?
  end
end
