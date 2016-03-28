require "minitest/autorun"
require "./signal_finder.rb"
require "pry"

class SignalFinderTest < Minitest::Test
  def test_sample_input
    sf = SignalFinder.new(IO.readlines("test.txt"))
    assert_equal 123, sf.signal_on("x")
    assert_equal 123, sf.signal_on("b")
    assert_equal 456, sf.signal_on("y")
    assert_equal 72, sf.signal_on("d")
    assert_equal 507, sf.signal_on("e")
    assert_equal 492, sf.signal_on("f")
    assert_equal 114, sf.signal_on("g")
    assert_equal 65412, sf.signal_on("h")
    assert_equal 65079, sf.signal_on("i")
  end
end
