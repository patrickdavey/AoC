require "./filler.rb"
require "pry"

buckets = []
IO.read("./input.txt").each_line do |bucket|
  buckets << bucket.to_i
end

filler = Filler.new(buckets, 150)

puts filler.find_possible_fills
