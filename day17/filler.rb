require "pry"

class Filler
  def initialize(buckets, litres_to_fill)
    @buckets = buckets
    @num_possible_fills = 0
    @litres_to_fill = litres_to_fill
  end

  def find_possible_fills
    first_bucket = buckets.pop
    remaining_to_fill = litres_to_fill - first_bucket
    return possible_fills(buckets, remaining_to_fill)
  end

  def possible_fills(remaining_buckets, remaining_to_fill)
    return @num_possible_fills if finished?(remaining_buckets.size)

    # for the remaining buckets, try all permutations from 1..n
    (1..remaining_buckets.size).each do |combination_size|
      remaining_buckets.combination(combination_size).each do |combination|
        if remaining_to_fill - combination.reduce(:+) == 0
          @num_possible_fills += 1
        end
      end
    end

    first_bucket = buckets.pop
    remaining_to_fill = litres_to_fill - first_bucket
    return possible_fills(buckets, remaining_to_fill)
  end

  private


  def finished?(size_remaining_buckets)
    size_remaining_buckets == 0
  end


  attr_reader :buckets, :litres_to_fill
end
