# frozen_string_literal: true

require_relative "./parser"
require_relative "./handheld"

class Runner
  def self.part_1(instructions = nil)
    instructions ||= Parser.parse

    handheld = Handheld.new(instructions)

    handheld.run!

    handheld.accumulator
  end

  def self.part_2(instructions = nil)
    instructions ||= Parser.parse

    tweaked_instructions = tweaked(instructions)

    while (set = tweaked_instructions.pop)
      handheld = Handheld.new(set)

      handheld.run!

      return handheld.accumulator if handheld.finished_normally?
    end

    raise "didn't find a happy path"
  end

  def self.tweaked(instructions)
    noops = instructions.each_with_index.map do |inst, index|
      if inst.fetch(:instruction) == "nop"
        tmp = instructions.dup
        tmp[index] = { instruction: "jmp", value: inst.fetch(:value) }
        tmp
      end
    end

    jumps = instructions.each_with_index.map do |inst, index|
      if inst.fetch(:instruction) == "jmp"
        tmp = instructions.dup
        tmp[index] = { instruction: "nop", value: inst.fetch(:value) }
        tmp
      end
    end

    [noops.compact, jumps.compact].flatten(1)
  end
end
