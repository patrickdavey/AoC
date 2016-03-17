require "pry"
require "./point"

class Grid
  def initialize(initial_state)
    @board = []
    initial_state.strip.each_line do |line|
      row_of_lights = []
      line.strip.chars.each do |light|
        row_of_lights << Point.new(light)
      end
      @board << row_of_lights
    end
  end

  def [](row, col)
    @board[row][col]
  end

  def to_s
    @board.map do |row|
      row.map(&:to_s).join("")
    end.join("\n")
  end
end
