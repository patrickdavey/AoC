require "minitest/autorun"
require "./sequencer.rb"
require "pry"

class SequencerTest < Minitest::Test
  def test_basic_inputs
    s = Sequencer.new(6, 1)
    assert_equal 16, s.iterations_to

    s = Sequencer.new(7, 1)
    assert_equal 22, s.iterations_to

    s = Sequencer.new(5, 2)
    assert_equal 17, s.iterations_to

    s = Sequencer.new(3, 4)
    assert_equal 19, s.iterations_to
  end
end
