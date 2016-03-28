require "minitest/autorun"
require "./encoded_string.rb"
require "pry"

class EncodedStringTest < Minitest::Test
  def test_sample_data
    string = EncodedString.new('""')
    assert_equal 4, string.increase

    string = EncodedString.new('"abc"')
    assert_equal 4, string.increase

    string = EncodedString.new('"aaa\"aaa"')
    assert_equal 6, string.increase

    string = EncodedString.new('"\x27"')
    assert_equal 5, string.increase
  end
end
