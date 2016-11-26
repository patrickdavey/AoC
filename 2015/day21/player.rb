class Player
  def initialize(hit_points)
    @hit_points = hit_points
    @items = []
  end

  def <<(item)
    @items << item
  end

  def <=>(player)
    player.total_cost <=> self.total_cost
  end

  def take_damage(attack_value)
    if total_armor >= attack_value
      @hit_points -= 1
    else
      @hit_points -= attack_value - total_armor
    end
  end

  def dead?
    @hit_points <= 0
  end

  def total_damage
    @items.map(&:damage).reduce(:+)
  end

  def total_armor
    @items.map(&:armor).reduce(:+)
  end

  def total_cost
    @items.map(&:cost).reduce(:+)
  end

  attr_reader :hit_points
end
