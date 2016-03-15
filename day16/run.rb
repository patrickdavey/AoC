require './searcher.rb'

PARSE = /^(?<name>.+):\s(?<attr1>[\w]+):\s(?<attr1_value>[\d]+),\s
(?<attr2>[\w]+):\s(?<attr2_value>[\d]+),\s
(?<attr3>[\w]+):\s(?<attr3_value>[\d]+)/x

searcher = Searcher.new({
  children: 3,
  cats: 10,
  samoyeds: 2,
  pomeranians: 3,
  akitas: 0,
  vizslas: 2,
  goldfish: 5,
  trees: 3,
  cars: 2,
  perfumes: 1
})

IO.read("./input.txt").each_line do |sue|
  parsed = sue.strip.match(PARSE)
  new_aunt = Sue.new(parsed[:name])

  new_aunt.send("#{parsed[:attr1]}=", parsed[:attr1_value].to_i)
  new_aunt.send("#{parsed[:attr2]}=", parsed[:attr2_value].to_i)
  new_aunt.send("#{parsed[:attr3]}=", parsed[:attr3_value].to_i)

  searcher << new_aunt
end

puts searcher.find_matching_sue!
