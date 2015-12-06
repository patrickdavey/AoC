require 'pry'

directions = IO.read('input.txt')

class World
  attr_accessor :x, :y, :houses
  attr_reader :directions

  def initialize(directions)
    @directions = directions.chars
    @x = 0
    @y = 0
    @houses = {"0,0" => true }
  end

  def deliver!
    @directions.each do |direction|
      case direction
      when "^"
        @y = @y + 1
        @houses["#{x},#{y}"] = true
      when "v"
        @y = @y - 1
        @houses["#{x},#{y}"] = true
      when "<"
        @x = @x - 1
        @houses["#{x},#{y}"] = true
      when ">"
        @x = @x + 1
        @houses["#{x},#{y}"] = true
      end
    end
    puts @houses.keys.count
  end
end


World.new(directions).deliver!
