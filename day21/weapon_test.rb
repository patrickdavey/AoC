require "minitest/autorun"
require "./weapon.rb"

class WeaponTest < Minitest::Test
  def test_basic_values
    dagger = Weapon.new("Dagger", cost: 8, damage: 4, armor: 0)
    assert_equal 8, dagger.cost
  end
end
