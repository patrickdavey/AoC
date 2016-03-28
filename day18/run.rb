require "./grid.rb"
require "pry"

grid = Grid.new(IO.read("./input.txt"))
grid[0,0].stuck_on!
grid[99,0].stuck_on!
grid[0,99].stuck_on!
grid[99,99].stuck_on!

100.times { grid.next }

puts grid.number_on
