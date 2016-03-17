require "pry"
require "./light"

class Grid
  def initialize(initial_state)
    @board = []
    initial_state.strip.each_line do |line|
      row_of_lights = []
      line.strip.chars.each do |light|
        row_of_lights << Light.new(light)
      end
      @board << row_of_lights
    end
    turn_corners_on
  end

  def [](row, col)
    @board[row][col]
  end

  def next
    next_state = []
    @board.each_with_index do |row, row_index|
      new_row = []
      row.each_with_index do |light, col_index|
        new_row << light.next_state(lights_around(row_index, col_index))
      end
      next_state << new_row
    end
    @board = next_state
    turn_corners_on
    to_s
  end

  def number_on
    @board.flatten.select(&:on?).size
  end

  def to_s
    @board.map do |row|
      row.map(&:to_s).join("")
    end.join("\n")
  end

  def lights_around(row_index, col_index)
    lights = []
    lights << @board[row_index - 1][col_index - 1] if row_index - 1 >= 0 && col_index - 1 >= 0
    lights << @board[row_index - 1 ][col_index] if row_index - 1 >= 0
    lights << @board[row_index - 1 ][col_index + 1] if row_index - 1 >= 0
    lights << @board[row_index][col_index - 1] if col_index - 1 >= 0
    lights << @board[row_index][col_index + 1]
    lights << @board[row_index + 1][col_index - 1] if @board[row_index + 1] && col_index - 1 >= 0
    lights << @board[row_index + 1 ][col_index] if @board[row_index + 1]
    lights << @board[row_index + 1 ][col_index + 1] if @board[row_index + 1]
    lights.compact
  end


  private

  def turn_corners_on
    @board[0][0] = Light.new("#")
    @board[@board.size - 1][0] = Light.new("#")
    @board[0][@board.size - 1] = Light.new("#")
    @board[@board.size - 1][@board.size - 1] = Light.new("#")
  end
end
