VOWEL_MATCH = /.*[aeiou].*[aeiou].*[aeiou].*/
BAD_MATCH = /(ab|cd|pq|xy)/
DUP_MATCH = /(.)\1/


strings = IO.readlines('input.txt')
count = 0

strings.each do |string|
  next if string.match(BAD_MATCH)

  count +=1 if string.match(DUP_MATCH) && string.match(VOWEL_MATCH)
end

puts count
