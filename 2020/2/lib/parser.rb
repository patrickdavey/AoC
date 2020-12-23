# frozen_string_literal: true

class Parser
  PASS_REGEX = /(?<low>\d+)\-(?<high>\d+) (?<letter>[a-z]): (?<password>[a-z]+)/.freeze

  def self.parse(input = nil)
    input ||= File.read(File.join(File.dirname(__FILE__), "../input.txt"))

    input
      .strip
      .split("\n")
      .map { |l| parse_line(l) }
  end

  def self.parse_line(line)
    Password.new(PASS_REGEX.match(line))
  end
end

class Password
  def initialize(match)
    @low = match["low"].to_i
    @high = match["high"].to_i
    @letter = match["letter"]
    @password = match["password"]
  end

  def valid?
    password.count(letter).between?(low, high)
  end

  def valid2?
    [password[low - 1], password[high - 1]].count(letter) == 1
  end

  private

  attr_reader :low, :high, :letter, :password
end
