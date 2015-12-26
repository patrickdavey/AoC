require 'pry'
strings = IO.readlines('input.txt')

puts(strings.map do |string|
  string.strip.length - eval(string).length
end.reduce(&:+))

