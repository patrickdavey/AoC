require "./sleigh_packer.rb"
require "pry"

weights = IO.readlines("input.txt").map(&:to_i)
sp = SleighPacker.new(weights)
puts sp.first_group.reduce(:*)
