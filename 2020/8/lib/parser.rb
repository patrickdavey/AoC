# frozen_string_literal: true

class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .each_with_object([]) do |l, acc|
        inst, value = l.split
        acc << {
          instruction: inst,
          value: value.to_i
        }
      end
  end
end
