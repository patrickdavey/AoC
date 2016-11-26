require "minitest/autorun"
require "./player.rb"
require "./weapon.rb"
require "./ring.rb"
require "./armor.rb"

class PlayerTest < Minitest::Test
  def test_basic_values
    player = Player.new(10)
    player << Weapon.new("test", cost: 1, damage: 10, armor: 0)
    player << Ring.new("ring", cost: 1, damage: 15, armor: 0)
    assert_equal 25, player.total_damage
  end

  def test_basic_damage_less_than_armor
    player = Player.new(10)
    player << Armor.new("test", cost: 1, damage: 0, armor: 10)
    player.take_damage(4)
    assert_equal 9, player.hit_points
  end

  def test_basic_damage_greather_than_armor
    player = Player.new(20)
    player << Armor.new("test", cost: 1, damage: 0, armor: 10)
    player.take_damage(15)
    assert_equal 15, player.hit_points
  end
end
