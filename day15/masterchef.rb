require 'pry'
require "./recipe.rb"

class Masterchef
  def initialize
    @ingredients = []
    @max_score = 0
  end

  def <<(ingredient)
    @ingredients << ingredient
  end

  def find_best!(amounts = initial_amounts)
    raise "messup #{amounts}" if amounts.reduce(:+) != 100
    raise "messup #{amounts}" if amounts.find { |a| a < 0 }

    recipe = Recipe.new

    @ingredients.each_with_index do |ingredient, index|
      ingredient.amount = amounts[index]
      recipe << ingredient
    end
    recipe_score = recipe.score
    @max_score = recipe_score if recipe_score > @max_score

    return @max_score if amounts.last == 100 #we have iterated all the way to the end

    (1..(amounts.size - 1)).each do |index|
      amounts[0] = amounts[0] - 1
      amounts[index] = amounts[index] + 1
      find_best!(amounts)
    end

    return @max_score

  end

  def initial_amounts
    init = Array.new(@ingredients.size) { 0 }
    init[0] = 100
    init
  end
end
