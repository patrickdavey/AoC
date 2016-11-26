require "minitest/autorun"
require "./ring.rb"

class RingTest < Minitest::Test
  def test_basic_values
    d1 = Ring.new("Damage +1", cost: 25, damage: 1, armor: 0)
    assert_equal 25, d1.cost
  end
end
