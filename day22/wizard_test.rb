require "minitest/autorun"
require "./wizard.rb"
require "./spell.rb"
require "pry"

class WizardTest < Minitest::Test
  def test_basic_wiazrd
    wizard = Wizard.new(0, 0)
    assert_equal true, wizard.dead?
  end

  def test_apply_missile
    wizard = Wizard.new(1, 1)
    wizard.apply_spell(Spell.missile)
    assert_equal 1, wizard.hit_points
  end

  def test_apply_drain
    wizard = Wizard.new(1, 1)
    wizard.apply_spell(Spell.drain)
    assert_equal 3, wizard.hit_points
  end

  def test_apply_shield
    wizard = Wizard.new(1, 1)
    wizard.apply_spell(Spell.shield)
    assert_equal 7, wizard.armor
  end

  def test_apply_poison
    wizard = Wizard.new(1, 1)
    wizard.apply_spell(Spell.poison)
    assert_equal 1, wizard.hit_points
  end

  def test_apply_recharge
    wizard = Wizard.new(1, 1)
    wizard.apply_spell(Spell.recharge)
    assert_equal 102, wizard.mana
  end

  def test_attack_no_armor
    wizard = Wizard.new(10, 1)
    wizard.attacked_with!(5)
    assert_equal 10 - 5, wizard.hit_points
  end

  def test_attack_with_sufficient_armor
    wizard = Wizard.new(10, 1)
    wizard.apply_spell(Spell.shield)
    wizard.attacked_with!(5)
    assert_equal 10 - 1, wizard.hit_points
  end

  def test_attack_with_partial_armor
    wizard = Wizard.new(10, 1)
    wizard.apply_spell(Spell.shield)
    wizard.attacked_with!(9)
    assert_equal 10 - 2, wizard.hit_points
  end

  def test_reset!
    wizard = Wizard.new(10, 1)
    wizard.attacked_with!(5)
    assert_equal 10 - 5, wizard.hit_points
    wizard.reset!
    assert_equal 10, wizard.hit_points
    assert_equal 1, wizard.mana
  end

end
