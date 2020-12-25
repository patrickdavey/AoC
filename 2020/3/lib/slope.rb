# frozen_string_literal: true

class Slope
  def initialize(terrain)
    @terrain = terrain
    @min_x = terrain.keys.map(&:first).min
    @max_x = terrain.keys.map(&:first).max
    @min_y = terrain.keys.map(&:last).min
    @max_y = terrain.keys.map(&:last).max
  end

  def trees_hit(x_inc:, y_inc: 1)
    points = []
    x, y = 0, 0

    (0..max_y).each do
      points << terrain[[x,y]]
      x = ((x + x_inc) % (max_x + 1))
      y = y + y_inc
    end

    points.count("#")
  end


  private

  attr_reader :terrain, :min_x, :max_x, :min_y, :max_y
end
