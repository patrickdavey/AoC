=begin
    Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
=end

require "minitest/autorun"
require "./reindeer.rb"

class ReindeerTest < Minitest::Test
  def test_reindeer_to_s
    reindeer = Reindeer.new(name: "rudolf", speed: 14, duration: 10, rest: 127)

    assert_equal reindeer.to_s, "rudolf"
  end

  def test_tick
    reindeer = Reindeer.new(name: "rudolf", speed: 14, duration: 1, rest: 2)
    reindeer.tick
    assert_equal reindeer.distance, 14
    reindeer.tick
    assert_equal reindeer.distance, 14
    reindeer.tick
    assert_equal reindeer.distance, 14
    reindeer.tick
    assert_equal reindeer.distance, 28
    reindeer.tick
    assert_equal reindeer.distance, 28
  end
end
