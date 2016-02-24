require './race.rb'

puts Race.new(IO.read("./input.txt")).winner_after(2503).distance
