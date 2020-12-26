# frozen_string_literal: true

require_relative "./parser"
require_relative "./gold_bag_checker"

class Runner
  def self.part_1(parsed = nil)
    parsed ||= Parser.parse
    GoldBagChecker.new(parsed).count
  end

  def self.part_2(parsed = nil)
    parsed ||= Parser.parse


    GoldBagChecker.new(parsed).gold_total
  end
end
