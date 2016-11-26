require "./sleigh_packer.rb"
require "pry"

weights = IO.readlines("input.txt").map(&:to_i)
sp = SleighPacker.new(weights, 4)
puts sp.first_group.reduce(:*)
