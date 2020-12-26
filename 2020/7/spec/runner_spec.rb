# frozen_string_literal: true

require "runner"
require "parser"

describe Runner do
  it "calculates the correct answer for the test input for part1" do
    expect(Runner.part_1(Parser.parse(sample_input))).to eq(4)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(sample_input))).to eq(32)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(second_sample))).to eq(126)
  end

  def sample_input
    <<~INPUT.strip
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    INPUT
  end

  def second_sample
    <<~INPUT.strip
      shiny gold bags contain 2 dark red bags.
      dark red bags contain 2 dark orange bags.
      dark orange bags contain 2 dark yellow bags.
      dark yellow bags contain 2 dark green bags.
      dark green bags contain 2 dark blue bags.
      dark blue bags contain 2 dark violet bags.
      dark violet bags contain no other bags.
    INPUT
  end
end
