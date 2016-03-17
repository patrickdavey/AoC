require "minitest/autorun"
require "./point.rb"
require "pry"

class PointTest < Minitest::Test
  def test_point_to_s
    point = Point.new("#")
    assert_equal point.to_s, "#"
  end

  def test_point_on
    point = Point.new("#")
    assert_equal point.on?, true
  end

  def test_point_off
    point = Point.new(".")
    assert_equal point.off?, true
  end
end
