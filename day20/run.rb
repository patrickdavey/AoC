require './present_calculator'

MIN_PRESENTS = 34_000_000
START_FROM = 534_584

calc = PresentCalculator.new(MIN_PRESENTS, START_FROM)

puts calc.house_number

