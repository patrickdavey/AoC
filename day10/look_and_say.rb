require 'pry'

class LookAndSay
  def initialize(init)
    @initial = split_to_digits(init)
  end

  def next
    intermediate_list.map do |number, length|
      "#{number}#{length}"
    end.join.to_i
  end


  private

  def intermediate_list
    list = []
    numbers = initial.clone
    while (numbers.size > 0) do
      number = numbers.first
      run_of_numbers = numbers.take_while { |n| n == number }.length
      list << [run_of_numbers, number]
      numbers = numbers.drop(run_of_numbers)
    end
    list
  end

  def split_to_digits(number)
    number.to_s.chars.map(&:to_i)
  end

  attr_reader :initial
end

