class Player
  attr_reader :hit_points

  def initialize(hit_points)
    @hit_points = hit_points
  end

  # def take_damage(attack_value)
  #   if total_armor >= attack_value
  #     @hit_points -= 1
  #   else
  #     @hit_points -= attack_value - total_armor
  #   end
  # end

  def dead?
    @hit_points <= 0
  end

end
