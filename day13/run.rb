require './seating.rb'

puts Seating.new(IO.read("./input.txt")).optimal
