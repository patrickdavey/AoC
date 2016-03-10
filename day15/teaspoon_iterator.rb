require 'bigdecimal'
require 'pry'

class TeaspoonIterator
  MAX_TEASPOONS = 100
  def initialize(number_of_ingredients)
    @number_of_ingredients = number_of_ingredients
    @max_possible_combinations = MAX_TEASPOONS ** @number_of_ingredients
    @combination = BigDecimal.new(0)
  end

  def has_next?
    @combination < @max_possible_combinations
  end

  def succ
    next_iteration = []
    until next_iteration.reduce(:+) == 100 && next_iteration.none? { |n| n == 0 }
      return false unless has_next?
      next_iteration = []
      to_split = combination.dup
      (0...@number_of_ingredients).to_a.reverse.each do |power|
        div, to_split = to_split.divmod(MAX_TEASPOONS**power)
        next_iteration << div
      end
      @combination += 1
    end
    next_iteration.map(&:to_i)
  end

  private

  attr_accessor :combination
end
