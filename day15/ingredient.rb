require 'pry'

class Ingredient
  attr_reader :capacity, :durability, :flavor, :texture, :calories, :amount

  def initialize(capacity:, durability:, flavor:, texture:, calories:, amount:)
    @capacity = capacity
    @durability = durability
    @flavor = flavor
    @texture = texture
    @calories = calories
    @amount = amount
  end

  def method_missing(method)
    if match = method.to_s.match(/^total_(?<name>\w+)/)
      send(match[:name]) * amount
    end
  end
end

