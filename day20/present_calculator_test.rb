require "minitest/autorun"
require "./present_calculator.rb"
require "pry"

class PresentCalculatorTest < Minitest::Test
  def test_find_smallest_house
    calc = PresentCalculator.new(150)
    assert_equal 8, calc.house_number
  end
end
