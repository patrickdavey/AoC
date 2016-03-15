require 'pry'
require "./recipe.rb"
require "./teaspoon_iterator.rb"

class Masterchef
  def initialize
    @ingredients = []
    @max_score = 0
  end

  def <<(ingredient)
    @ingredients << ingredient
  end

  def find_best!
    iterator = TeaspoonIterator.new(@ingredients.size)
    while(iterator.has_next?) do
      amounts = iterator.succ
      break unless amounts

      recipe = Recipe.new

      @ingredients.each_with_index do |ingredient, index|
        ingredient.amount = amounts[index]
        recipe << ingredient
      end
      recipe_score = recipe.score

      if recipe_score > @max_score
        @max_score = recipe_score
        puts @max_score
      end
    end

    return @max_score

  end
end
