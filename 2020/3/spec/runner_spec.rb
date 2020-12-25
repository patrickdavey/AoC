# frozen_string_literal: true

require "runner"
require "parser"

describe Runner do
  it "calculates the correct answer for the test input for part1" do
    expect(Runner.part_1(Parser.parse(sample_input))).to eq(7)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(sample_input))).to eq(336)
  end

  def sample_input
    <<~INPUT.strip
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    INPUT
  end
end
