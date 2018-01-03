require 'prime'

b = 109300
count = 0

while (b <= 126300) do
  count += 1 unless Prime.prime?(b)
  b += 17
end

puts count;
