class PresentCalculator

  def initialize(number_presents, house_checked_to = 1)
    @number_presents = number_presents
    @house_checked_to = house_checked_to
    @factors = {}
  end

  def house_number
    while presents_accum(house_checked_to) < number_presents
      @house_checked_to = @house_checked_to + 1
    end
    house_checked_to
  end

  private


  def presents_accum(house)
    factors[house] = []

    common_elf = (house.to_f / 2).ceil.downto(2).find do |elf|
      house % elf == 0 && factors[elf]
    end

    if common_elf
      factors[house] = house * 10 + factors[common_elf]
    else
      factors[house] << 1 << house
      factors[house] = factors[house].map { |elf| elf * 10 }.reduce(:+)
    end

    puts "total for house #{house} was #{factors[house]}" if house % 4000 == 0
    factors[house]
  end

  attr_reader :number_presents, :house_checked_to, :factors
end

