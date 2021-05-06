# frozen_string_literal: true

require_relative "./parser"

class Runner
  def self.part_1(parsed = nil)
    parsed ||= Parser.parse

    parsed.map(&:length).sum
  end

  def self.part_2(parsed = nil)
    parsed ||= Parser.parse

    parsed.map(&:group_yes).sum
  end
end