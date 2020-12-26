# frozen_string_literal: true

require_relative "./parser"

class Runner
  def self.part_1(parsed = nil)
    seats ||= Parser.parse

    seats.map(&:id).max
  end

  def self.part_2(parsed = nil)
    seats ||= Parser.parse

    plane = seats.each_with_object({}) do |seat, acc|
      acc[{row: seat.row, col: seat.col}] = true
    end

    # our id is the first missing one after we have filled seats
    found_occupied = false

    (0..127).each do |row|
      (0..7).each do |col|
        if !found_occupied
          next unless plane.key?(row: row, col: col)

          found_occupied = true
        else
          next if plane.key?(row: row, col: col)

          return 8 * row + col
        end
      end
    end
  end
end
