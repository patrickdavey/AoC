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

  def find_best!(calories = false)
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

      if should_count_score?(recipe, calories) && recipe_score > @max_score
        @max_score = recipe_score
        puts @max_score
      end
    end

    return @max_score

  end


  private

  def should_count_score?(recipe, calories)
    return true unless calories

    recipe.total_calories == calories
  end
end
