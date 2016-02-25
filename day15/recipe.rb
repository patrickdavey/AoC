require './ingredient.rb'

class Recipe
  def initialize
    @ingredients = []
  end

  def <<(ingredient)
    @ingredients << ingredient
  end

  def score
    combined_ingredients = @ingredients.map do |ingredient|
      [ingredient.total_capacity,
       ingredient.total_durability,
       ingredient.total_flavor,
       ingredient.total_texture ]
    end.transpose
    combined_ingredients.map { |sum| sum.reduce(:+) }.reduce(:*)
  end
end
