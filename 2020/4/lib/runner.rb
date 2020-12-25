# frozen_string_literal: true

require_relative "./parser"

class Runner
  def self.part_1(parsed = nil)
    parsed ||= Parser.parse

    parsed.count(&:valid?)
  end

  def self.part_2(parsed = nil)
    parsed ||= Parser.parse

    parsed
      .select(&:valid?)
      .select(&:validated?)
      .count
  end
end
