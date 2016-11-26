require "minitest/autorun"
require "./logic.rb"
require "pry"

class LogigTest < Minitest::Test
  def test_integer_signal
    s = Logic.build("123 -> x")
    assert_equal(s.wire, "x")
    assert_equal(s.value, 123)
  end

  def test_and_gate
    s = Logic.build("x AND y -> d")
    assert_equal(s.wire, "d")
    assert_equal(s.first_input, "x")
    assert_equal(s.second_input, "y")
  end

  def test_and_gate_integer_value
    s = Logic.build("1 AND y -> d")
    assert_equal(s.wire, "d")
    assert_equal(s.first_input, 1)
    assert_equal(s.second_input, "y")
  end

  def test_or_gate
    s = Logic.build("x OR y -> d")
    assert_equal(s.wire, "d")
    assert_equal(s.first_input, "x")
    assert_equal(s.second_input, "y")
  end

  def test_lshift_gate
    s = Logic.build("xa LSHIFT 2 -> d")
    assert_equal(s.wire, "d")
    assert_equal(s.first_input, "xa")
    assert_equal(s.shift_by, 2)
  end

  def test_rshift_gate
    s = Logic.build("xa RSHIFT 2 -> d")
    assert_equal(s.wire, "d")
    assert_equal(s.first_input, "xa")
    assert_equal(s.shift_by, 2)
  end

  def test_not_gate
    s = Logic.build("NOT e -> f")
    assert_equal(s.wire, "f")
    assert_equal(s.first_input, "e")

    s = Logic.build("NOT 123 -> f")
    assert_equal(s.wire, "f")
    assert_equal(s.first_input, 123)
  end
end
