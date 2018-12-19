CHECK = 10551410
10551410
total = 0
factors = []
(1..(10551410)).each do |i|

  if CHECK % i == 0
    factors << i
  end
end
puts factors
