require 'pry'
strings = IO.readlines('input.txt')

puts(strings.map do |string|
  string.strip.length - eval(string).length
end.reduce(&:+))

# second part
require "./encoded_string"

puts(strings.map do |string|
  EncodedString.new(string.strip).increase
end.reduce(&:+))
