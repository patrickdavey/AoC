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

  def test_long_tick
    comet = Reindeer.new(name: "comet", speed: 14, duration: 10, rest: 127)
    1000.times { comet.tick }
    assert_equal comet.distance, 1120

    dancer = Reindeer.new(name: "dancer", speed: 16, duration: 11, rest: 162)
    1000.times { dancer.tick }
    assert_equal dancer.distance, 1056
  end
end
