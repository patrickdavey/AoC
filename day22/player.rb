class Player
  attr_reader :hit_points

  def initialize(hit_points)
    @hit_points = hit_points
    @original_hit_points = hit_points
  end

  def reset!
    @hit_points = @original_hit_points
    self
  end

  def dead?
    @hit_points <= 0
  end

end
