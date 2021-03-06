require "minitest/autorun"
require "./recipe.rb"

class RecipeTest < Minitest::Test
  def test_sample_calculation
    butterscotch = Ingredient.new(capacity: -1,
                                durability: -2,
                                flavor: 6,
                                texture: 3,
                                calories: 8,
                                amount: 44)

    cinnamon = Ingredient.new(capacity: 2,
                                durability: 3,
                                flavor: -2,
                                texture: -1,
                                calories: 3,
                                amount: 56)
    recipe = Recipe.new
    recipe << butterscotch
    recipe << cinnamon
    assert_equal recipe.score, 62842880
  end

  def test_total_calories
    butterscotch = Ingredient.new(capacity: -1,
                                durability: -2,
                                flavor: 6,
                                texture: 3,
                                calories: 8,
                                amount: 44)

    cinnamon = Ingredient.new(capacity: 2,
                                durability: 3,
                                flavor: -2,
                                texture: -1,
                                calories: 3,
                                amount: 56)
    recipe = Recipe.new
    recipe << butterscotch
    recipe << cinnamon
    assert_equal recipe.total_calories, (44*8 + 56 * 3)
  end

  def test_zero_recipe
    butterscotch = Ingredient.new(capacity: -10,
                                durability: -2,
                                flavor: 6,
                                texture: 3,
                                calories: 8,
                                amount: 44)

    cinnamon = Ingredient.new(capacity: 2,
                                durability: 3,
                                flavor: -2,
                                texture: -1,
                                calories: 3,
                                amount: 56)
    recipe = Recipe.new
    recipe << butterscotch
    recipe << cinnamon
    assert_equal 0, recipe.score
  end
end
