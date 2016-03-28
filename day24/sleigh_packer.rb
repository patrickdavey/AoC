class SleighPacker
  SORTER = ->(a,b) do
      if a.length < b.length
        -1
      elsif a.length > b.length
        1
      else
        a.reduce(:*) <=> b.reduce(:*)
      end
    end
  def initialize(weights)
    @weights = weights.freeze
    @target_weight = weights.reduce(:+) / 3
  end

  def first_group
    (1..weights.size).each do |group_size|
      best_group = possible_groups(group_size).find do |group|
                      can_make_two_equal_groups?(weights - group)
                    end
      return best_group if best_group
    end
  end


  private

  attr_reader :weights, :target_weight

  def possible_groups(group_size)
    possibilities = []

    weights.combination(group_size).each do |grouping|
        possibilities << grouping if grouping.reduce(:+) == target_weight
      end

    possibilities.sort(&SORTER)
  end

  def can_make_two_equal_groups?(remaining_buckets)
    (1..remaining_buckets.size).each do |group_size|
      remaining_buckets.combination(group_size).each do |grouping|
        if grouping.reduce(:+) == target_weight && (remaining_buckets - grouping).reduce(:+) == target_weight
          return true
        end
      end
    end
    return false
  end

end
