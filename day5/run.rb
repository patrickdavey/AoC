require "pry"
require "./nice_string"

strings = IO.readlines('input.txt')
count = 0

strings.each_with_index do |string, index|
  count +=1 if NiceString.new(string.strip).nice?
end

puts count
