require "minitest/autorun"
require "./armor.rb"

class ArmorTest < Minitest::Test
  def test_basic_values
    leather = Armor.new("Leather", cost: 13, damage: 0, armor: 1)
    assert_equal 13, leather.cost
  end
end
