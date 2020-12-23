# frozen_string_literal: true

class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .map(&:to_i)
  end
end
