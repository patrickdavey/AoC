require './seating.rb'

puts Seating.new(IO.read("./input.txt"), with_me = true).optimal
