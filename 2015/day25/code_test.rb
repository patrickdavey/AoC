require "minitest/autorun"
require "./code.rb"
require "pry"

class CodeTest < Minitest::Test
  def test_basic_code
    c = Code.new(20151125)
    assert_equal 31916031, c.next
  end
end
