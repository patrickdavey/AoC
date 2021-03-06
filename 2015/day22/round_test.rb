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

  def test_initial_scenario
    wizard = Wizard.new(10, 250)
    boss = Boss.new(13, 8)
    round = Round.new(boss, wizard)
    wizard.stub(:possible_spells, ->(_) { [Spell.poison]}) do
      assert_equal 10, wizard.hit_points
      assert_equal 250, wizard.mana
      assert_equal 13, boss.hit_points
      round.tick!
    end
    # we aren't going to separate out a before step (not publicly anyway) so..
    # boss's turn now
    round.tick!
    assert_equal 77, wizard.mana
    assert_equal 10, boss.hit_points
    assert_equal 10 - 8 - 1, wizard.hit_points

    wizard.stub(:possible_spells, ->(_) { [Spell.missile]}) do
      round.tick!
      assert_equal 0, wizard.hit_points
    end
  end

  def test_longer_scenario
    wizard = Wizard.new(10, 250)
    boss = Boss.new(14, 8)
    round = Round.new(boss, wizard)
    wizard.stub(:possible_spells, ->(_) { [Spell.recharge]}) do
      round.tick!
      assert_equal 9, wizard.hit_points
      assert_equal 21, wizard.mana
      assert_equal 14, boss.hit_points
    end

    round.tick!
    assert_equal 21 + 101, wizard.mana
    assert_equal 10 - 8 - 1, wizard.hit_points
    assert_equal 14, boss.hit_points

    wizard.stub(:possible_spells, ->(_) { [Spell.shield]}) do
      round.tick!
      assert_equal 0, wizard.hit_points
    end
  end

end
