class PresentCalculator

  def initialize(number_presents, house_checked_to = 0)
    @number_presents = number_presents
    @house_checked_to = house_checked_to
  end

  def house_number
    while presents_accum(house_checked_to) < number_presents
      @house_checked_to = @house_checked_to + 1
    end
    house_checked_to
  end

  private


  def presents_accum(house)

    total = 0
    (1..house).each do |elf|
      total += elf * 10 if house % elf == 0
    end
    puts "total for house #{house} was #{total}"
    total
  end

  attr_reader :number_presents, :house_checked_to
end

