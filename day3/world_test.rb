require "minitest/autorun"
require "./world.rb"
require "pry"

class WorldTest < Minitest::Test
  def test_initial_scenarios
    world = World.new("^v")
    assert_equal world.deliver!, 3

    world = World.new("^>v<")
    assert_equal world.deliver!, 3

    world = World.new("^v^v^v^v^v")
    assert_equal world.deliver!, 11
  end
end
