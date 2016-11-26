require "minitest/autorun"
require "./nice_string.rb"
require "pry"

class NiceStringTest < Minitest::Test
  def test_given_samples
    s = NiceString.new("qjhvhtzxzqqjkmpb")
    assert s.nice?

    s = NiceString.new("xxyxx")
    assert s.nice?

    s = NiceString.new("xyxy")
    assert s.nice?

    s = NiceString.new("uurcxstgmygtbstg")
    assert !s.nice?

    s = NiceString.new("ieodomkazucvgmuy")
    assert !s.nice?
  end
end
