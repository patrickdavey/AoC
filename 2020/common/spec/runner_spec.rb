# frozen_string_literal: true

require "runner"
require "parser"

describe Runner do
  it "calculates the correct answer for the test input for part1" do
    expect(Runner.part_1(Parser.parse(sample_input))).to eq(514_579)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(sample_input))).to eq(241_861_950)
  end

  def sample_input
    <<~INPUT.strip
      1721
      979
      366
      299
      675
      1456
    INPUT
  end
end
