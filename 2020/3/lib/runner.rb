# frozen_string_literal: true

require_relative "./parser"
require_relative "./slope"

class Runner
  def self.part_1(parsed = nil)
    parsed ||= Parser.parse

    Slope.new(parsed).trees_hit(x_inc: 3, y_inc: 1)
  end

  def self.part_2(parsed = nil)
    parsed ||= Parser.parse

    slopes = [
      [1, 1],
      [3, 1],
      [5, 1],
      [7, 1],
      [1, 2]
    ]

    slopes.map do |(x_inc, y_inc)|
      Slope.new(parsed).trees_hit(x_inc: x_inc, y_inc: y_inc)
    end.reduce(&:*)
  end
end
