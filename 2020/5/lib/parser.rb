# frozen_string_literal: true

require_relative "seat"

class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .map { |c| Seat.new(c) }
  end
end
