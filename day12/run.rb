require './json_walker.rb'

puts JsonWalker.new(IO.read("./input.txt")).sum
