require "pry"

class Filler
  def initialize(buckets, litres_to_fill)
    @buckets = buckets
    @num_possible_fills = 0
    @litres_to_fill = litres_to_fill
  end

  def possible_fills(remaining_buckets = buckets.dup, remaining_to_fill = litres_to_fill)
    return unless remaining_buckets.size > 0

    remaining_to_fill = remaining_to_fill - remaining_buckets.pop

    if remaining_to_fill == 0
      @litres_to_fill += 1
    elsif remaining_to_fill < 0
      return
    elsif remaining_to_fill > 0 && remaining_buckets.size > 0
      binding.pry
      # do_something_recursive
    end
  end

  private

  attr_reader :buckets, :litres_to_fill
end
