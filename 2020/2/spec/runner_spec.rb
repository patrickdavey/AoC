# frozen_string_literal: true

require "runner"
require "parser"

describe Runner do
  it "calculates the correct answer for the test input for part1" do
    expect(Runner.part_1(Parser.parse(sample_input))).to eq(2)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(sample_input))).to eq(1)
  end

  def sample_input
    <<~INPUT.strip
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    INPUT
  end
end
