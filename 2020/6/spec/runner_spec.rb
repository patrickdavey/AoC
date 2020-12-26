# frozen_string_literal: true

require "runner"
require "parser"

describe Runner do
  it "calculates the correct answer for the test input for part1" do
    expect(Runner.part_1(Parser.parse(sample_input))).to eq(11)
  end

  it "calculates the correct answer for the test input part2" do
    expect(Runner.part_2(Parser.parse(sample_input))).to eq(6)
  end

  def sample_input
    <<~INPUT.strip
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    INPUT
  end
end
