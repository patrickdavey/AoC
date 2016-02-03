require './look_and_say.rb'

value = 1321131112
40.times { value = LookAndSay.new(value).succ }
puts value.to_s.length
