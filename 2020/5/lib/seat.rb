# frozen_string_literal: true

class Seat
  def initialize(classification)
    @rows = classification.chars.slice(0, 7)
    @cols = classification.chars.slice(-3, 3)
  end

  def row
    @row ||= rows.reduce((0..127).to_a) do |rem, group|
      next_rows = rem.each_slice((rem.size / 2.0).round).to_a
      group == "F" ? next_rows.first : next_rows.last
    end.first
  end

  def col
    @col ||= cols.reduce((0..7).to_a) do |rem, group|
      next_cols = rem.each_slice((rem.size / 2.0).round).to_a
      group == "L" ? next_cols.first : next_cols.last
    end.first
  end

  def id
    row * 8 + col
  end

  private

  attr_reader :rows, :cols
end
