require 'pry'

class Reindeer
  attr_reader :distance

  def initialize(name:, speed:, duration:, rest:)
    @name = name
    @speed = speed
    @duration = duration
    @rest = rest
    @distance = 0
  end

  def to_s
    name
  end

  def tick
    @distance += speed
  end


  private

  attr_reader :name, :speed, :duration, :rest
end
