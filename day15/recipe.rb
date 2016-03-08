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
    combined_ingredients.map do |sum|
      added = sum.reduce(:+)
      added > 0 ? added : 0
    end.reduce(:*)
  end
end
