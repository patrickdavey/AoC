require "minitest/autorun"
require "./round.rb"
require "./spell.rb"
require "./player.rb"
require "pry"

class RoundTest < Minitest::Test
  def test_basic_round
    player = Player.new(50, mana: 100)
    boss = Player.new(51, damage: 9)
    round = Round.new(boss, player)
    round.tick!
    assert_equal round.spells.count, 1
  end
end
