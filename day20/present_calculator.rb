class PresentCalculator

  def initialize(number_presents, house_checked_to = 1)
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
    factors = []
    (house.to_f ** 0.5).ceil.downto(1).each do |elf|
      q, m = house.divmod(elf)
      factors << q << elf if m == 0
    end
    # how do we know if we have passed the 50th house?
    # well, we have the factors, and we have the house we are at.
    # so, reject any factor which divides more than 50 times in
    total = factors.uniq.reject { |f| house / f > 50 }.reduce(0) { |sum,e| sum + e*11}
    puts "total: #{total} for house #{house}" if (house % 4000).zero?
    total
  end

  attr_reader :number_presents, :house_checked_to, :factors
end

