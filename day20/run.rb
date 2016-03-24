require './present_calculator'

MIN_PRESENTS = 34_000_000
START_FROM = 1

calc = PresentCalculator.new(MIN_PRESENTS)

puts calc.house_number

