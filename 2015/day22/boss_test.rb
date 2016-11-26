require "minitest/autorun"
require "./boss.rb"
require "./spell.rb"
require "pry"

class BossTest < Minitest::Test
  def test_basic_boss
    boss = Boss.new(0, 0)
    assert_equal true, boss.dead?
  end

  def test_apply_missile
    boss = Boss.new(100, 1)
    boss.apply_spell(Spell.missile)
    assert_equal 100 - 4, boss.hit_points
  end

  def test_apply_drain
    boss = Boss.new(100, 1)
    boss.apply_spell(Spell.drain)
    assert_equal 100 - 2, boss.hit_points
  end

  def test_apply_shield
    boss = Boss.new(100, 1)
    boss.apply_spell(Spell.shield)
    assert_equal 100, boss.hit_points
  end

  def test_apply_poison
    boss = Boss.new(100, 1)
    boss.apply_spell(Spell.poison)
    assert_equal 100 - 3, boss.hit_points
  end

  def test_apply_recharge
    boss = Boss.new(100, 1)
    boss.apply_spell(Spell.recharge)
    assert_equal 100, boss.hit_points
  end
end
