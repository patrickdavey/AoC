# frozen_string_literal: true

require "set"
class Handheld
  attr_reader :accumulator

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
    @index = 0
    @indexes_executed = Set.new
  end

  def run!
    until indexes_executed.include?(index)
      indexes_executed.add(index)

      send(current.fetch(:instruction), current.fetch(:value))
      return if finished_normally?
    end
  end

  def nop(_inc)
    @index += 1
  end

  def acc(inc)
    @accumulator += inc
    @index += 1
  end

  def jmp(offset)
    @index += offset
  end

  def current
    instructions[index]
  end

  def finished_normally?
    index >= instructions.length
  end

  private

  attr_reader :index, :instructions, :indexes_executed
end
