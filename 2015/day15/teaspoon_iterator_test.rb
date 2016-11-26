require "minitest/autorun"
require "./teaspoon_iterator.rb"

class TeaspoonIteratorTest < Minitest::Test
  def test_iteration_two_items
    iterator = TeaspoonIterator.new(2)
    assert_equal(iterator.has_next?, true)
    assert_equal(iterator.succ, [1,99])
    assert_equal(iterator.succ, [2,98])
  end

  def test_iteration_ends
    iterator = TeaspoonIterator.new(1)
    assert_equal(iterator.has_next?, true)
    100.times { iterator.succ }
    assert_equal(iterator.has_next?, false)
  end

  def test_iteration_three_items
    iterator = TeaspoonIterator.new(3)
    assert_equal(iterator.has_next?, true)
    assert_equal(iterator.succ, [1, 1, 98])
  end
end
