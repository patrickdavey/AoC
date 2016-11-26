require 'pry'

class Box
  attr_reader :dimensions

  def initialize(box_string)
    @dimensions = box_string.strip.split('x').map(&:to_i).sort
  end

  def size
    side1 =  @dimensions[0] * @dimensions[1]
    side2 =  @dimensions[1] * @dimensions[2]
    side3 =  @dimensions[0] * @dimensions[2]
    (side1 * 3) + (side2 * 2) + (side3 * 2)
  end

  def ribbon
    (2 * @dimensions[0]) +
    (2 * @dimensions[1]) +
    @dimensions.reduce(&:*)
  end
end


boxes = []

lines = IO.readlines('input.txt')

lines.each do |line|
  boxes << Box.new(line)
end

puts "wrapping : #{boxes.map(&:size).reduce(&:+)}"
puts "ribbon : #{boxes.map(&:ribbon).reduce(&:+)}"
