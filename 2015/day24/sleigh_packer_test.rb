require "minitest/autorun"
require "./sleigh_packer.rb"
require "pry"

class SleighPackerTest < Minitest::Test
  def test_sample_input
    sp = SleighPacker.new([1,2,3,4,5,7,8,9,10,11], 4)
    assert_equal [4, 11], sp.first_group
  end
end
