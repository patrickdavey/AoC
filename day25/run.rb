require "./sequencer"
require "./code"

s = Sequencer.new(2947, 3029)

code = 20151125
(s.iterations_to - 1).times do |time|
  code = Code.new(code).next
end

puts code
