require 'pry'

class Reindeer
  attr_reader :distance

  def initialize(name:, speed:, duration:, rest:)
    @name = name
    @speed = speed
    @duration = duration
    @rest = rest
    @distance = 0
    @time = 0
  end

  def to_s
    name
  end

  def tick
    @distance += speed unless resting?
    @time += 1
  end


  private

  attr_reader :name, :speed, :duration, :rest, :time

  def resting?
    left_time = time.modulo(duration + rest)
    left_time - duration >= 0
  end

end
