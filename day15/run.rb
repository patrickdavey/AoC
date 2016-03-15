require "pry"
require './masterchef.rb'

PARSE = /^(?<name>\w+):\scapacity\s(?<capacity>[\d\-]+),\s
  durability\s(?<durability>[\d\-]+),\s
  flavor\s(?<flavor>[\d\-]+),\s
  texture\s(?<texture>[\d\-]+),\s
  calories\s(?<calories>[\d\-]+)/x

masterchef = Masterchef.new
IO.read("./input.txt").each_line do |ingredient|
  parsed = ingredient.strip.match(PARSE)
  ingredient = Ingredient.new(capacity: parsed[:capacity].to_i,
                              durability: parsed[:durability].to_i,
                              flavor: parsed[:flavor].to_i,
                              texture: parsed[:texture].to_i,
                              calories: parsed[:calories].to_i)
  masterchef << ingredient
end

puts masterchef.find_best!(500)
