require 'pry'
PARSE=/(:?turn )?(?<command>on|toggle|off) (?<x1>\d+),(?<y1>\d+) through (?<x2>\d+),(?<y2>\d+)/

instructions = IO.readlines('input.txt')
instructions.map! { |instruction| instruction.match(PARSE) }

class Light
  def initialize
    @lit = 0
  end

  def on
    @lit += 1
  end

  def off
    @lit -= 1 if @lit > 0
  end

  def toggle
    @lit = @lit + 2
  end

  def is_lit?
    @lit == true
  end

  def value
    @lit
  end
end

class Board
  SIZE = 1000
  attr_reader :state

  def initialize
    @state = Array.new(SIZE) { Array.new(SIZE) }
    @state.each do |row|
      row.fill { |_| Light.new }
    end
  end

  def process!(instructions)
    instructions.each do |instruction|
      (instruction[:x1].to_i..instruction[:x2].to_i).each do |x|
        (instruction[:y1].to_i..instruction[:y2].to_i).each do |y|
          @state[x][y].send(instruction[:command])
        end
      end
    end
  end

  def number_on
    @num = 0
    @state.each do |row|
      row.each do |light|
        @num += light.value
      end
    end

    @num
  end
end

board = Board.new

board.process!(instructions)

puts board.number_on


