require "./turing.rb"
require "./instruction_set.rb"

parsed_instructions = InstructionSet.new(IO.read("./input.txt"))
turing = Turing.new(parsed_instructions)
turing.run!
puts turing.register("b")
