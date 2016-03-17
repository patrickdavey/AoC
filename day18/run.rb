require "./grid.rb"
require "pry"

grid = Grid.new(IO.read("./input.txt"))

100.times { grid.next }

puts grid.number_on
