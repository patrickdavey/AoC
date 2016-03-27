require 'pry'
require './world.rb'

puts World.new(IO.read("input.txt")).deliver!
