# frozen_string_literal: true

class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .map(&:chars)
      .each_with_object({}).with_index do |(line, acc), y|
        line.each_with_index do |e, x|
          acc[[x, y]] = e
        end
      end
  end
end
