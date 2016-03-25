require "minitest/autorun"
require "./player.rb"
require "./spell.rb"
require "pry"

class PlayerTest < Minitest::Test
  def test_basic_spell
    player = Player.new(50, 500)
    spell = Spell.missile
    player << spell
    assert_equal 500 - spell.cost, player.mana
  end

  def test_basic_spell
    player = Player.new(50, 500)
    spell = Spell.recharge
    player << spell
    assert_equal 500 - spell.cost, player.mana
  end
end
