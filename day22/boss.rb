require './player.rb'

class Boss < Player
  def initialize(hit_points, damage)
    @damage = damage
    super(hit_points)
  end
end
