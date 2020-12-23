# frozen_string_literal: true

require_relative "./parser"

class Runner
  def self.part_1(parsed = nil)
    parsed ||= Parser.parse

    parsed
      .combination(2)
      .find { |a, b| a + b == 2020 }
      .inject(&:*)
  end

  def self.part_2(parsed = nil)
    parsed ||= Parser.parse

    parsed
      .combination(3)
      .find { |a, b, c| a + b + c == 2020 }
      .inject(&:*)
  end
end
