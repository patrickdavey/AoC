class Light
  def initialize(intial_state)
    @intial_state = intial_state
  end

  def to_s
    intial_state
  end

  def on?
    intial_state == "#"
  end

  def off?
    !on?
  end

  def next_state(neighbours)
    num_on_neighbours = neighbours.select(&:on?).size
    if on?
      if [2,3].include?(num_on_neighbours)
        Light.new("#")
      else
        Light.new(".")
      end
    else
      if num_on_neighbours == 3
        Light.new("#")
      else
        Light.new(".")
      end
    end
  end

  private

  attr_reader :intial_state
end
