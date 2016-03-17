require "minitest/autorun"
require "./light.rb"
require "pry"

class LightTest < Minitest::Test
  def test_light_to_s
    light = Light.new("#")
    assert_equal light.to_s, "#"
  end

  def test_light_on
    light = Light.new("#")
    assert_equal light.on?, true
  end

  def test_light_off
    light = Light.new(".")
    assert_equal light.off?, true
  end
end
