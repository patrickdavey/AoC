=begin

The elves bought too much eggnog again - 150 liters this time. To fit it all into your refrigerator, you'll need to move it into smaller containers. You take an inventory of the capacities of the available containers.

For example, suppose you have containers of size 20, 15, 10, 5, and 5 liters. If you need to store 25 liters, there are four ways to do it:

    15 and 10
    20 and 5 (the first 5)
    20 and 5 (the second 5)
    15, 5, and 5

Filling all containers entirely, how many different combinations of containers can exactly fit all 150 liters of eggnog?

To begin, get your puzzle input.


=end

require "minitest/autorun"
require "./filler.rb"

class FillerTest < Minitest::Test
  def test_sample_input
    filler = Filler.new([20, 15, 10, 5, 5], 25)
    assert_equal 3, filler.find_possible_fills
  end
end
