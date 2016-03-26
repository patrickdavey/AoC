require "minitest/autorun"
require "./round.rb"
require "./spell.rb"
require "./boss.rb"
require "./wizard.rb"
require "pry"

class RoundTest < Minitest::Test
  def test_basic_round
    wizard = Wizard.new(50, 100)
    boss = Boss.new(51, 9)
    round = Round.new(boss, wizard)
    round.tick!
    assert_equal round.spells.count, 1
  end

  def test_firing_missile
    wizard = Wizard.new(50, 54)
    boss = Boss.new(51, 9)
    round = Round.new(boss, wizard)
    round.tick!
    assert_equal 51 - 4, boss.hit_points
  end

  def test_using_drain
    wizard = Wizard.new(50, 54)
    def wizard.cast_spell(_)
      Spell.drain
    end
    boss = Boss.new(51, 9)
    round = Round.new(boss, wizard)
    round.tick!
    assert_equal 51 - 2, boss.hit_points
    assert_equal 50 + 2, wizard.hit_points
  end
end
