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

  def test_next_state_on_to_off
    light = Light.new("#")
    light.next_state(array_of_on_lights)

  end

  def array_of_on_lights
    @on_lights ||= begin
      on_lights = []
      8.times { on_lights << Light.new("#") }
      on_lights
    end
  end
end
