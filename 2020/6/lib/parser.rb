# frozen_string_literal: true

require "set"
class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split(/^$/)
      .map { |l| QuestionSet.new(l) }
  end
end

class QuestionSet
  def initialize(group)
    @group = group
  end

  def length
    Set.new(group.scan(/[a-z]/)).length
  end

  def group_yes
    group
      .strip
      .lines
      .map { |l| Set.new(l.scan(/[a-z]/)) }
      .reduce(Set.new("a".."z")) do |acc, s|
        acc & s
      end.length
  end


  attr_reader :group
end
