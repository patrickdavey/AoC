# frozen_string_literal: true

class Parser
  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .each_with_object({}) { |l, acc| parse_line(l, acc) }
  end

  def self.parse_line(line, acc)
    outer, contained = line.split("bags contain").map(&:strip)
    acc[outer] = contained
      .split(",")
      .map { |l| l.match(/(?<number>\d+) (?<bag>[\w\s]+) bag/) }
      .each_with_object({}) do |match, acc2|
        acc2[match["bag"]] = match["number"].to_i if match
        acc2
      end
  end
end
