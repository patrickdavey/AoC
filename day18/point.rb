class Point
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

  private

  attr_reader :intial_state
end
