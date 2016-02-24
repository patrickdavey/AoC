=begin
    Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
=end

require "minitest/autorun"
require "./reindeer.rb"

class ReindeerTest < Minitest::Test
  def test_reindeer_to_s
    reindeer = Reindeer.new("rudolf")

    assert_equal reindeer.to_s, "rudolf"
  end
end
