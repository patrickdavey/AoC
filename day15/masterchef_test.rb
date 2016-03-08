require "minitest/autorun"
require "./masterchef.rb"

class MasterchefTest < Minitest::Test
  def test_sample_calculation
    butterscotch = Ingredient.new(capacity: -1,
                                durability: -2,
                                flavor: 6,
                                texture: 3,
                                calories: 8)

    cinnamon = Ingredient.new(capacity: 2,
                                durability: 3,
                                flavor: -2,
                                texture: -1,
                                calories: 3)
    masterchef = Masterchef.new
    masterchef << butterscotch
    masterchef << cinnamon
    assert_equal masterchef.find_best!, 62842880
  end
end
