class Item
  def initialize(name, cost:, damage:, armor:)
    @name = name
    @cost = cost
    @damage = damage
    @armor = armor
  end

  attr_reader :name, :cost, :damage, :armor
end
