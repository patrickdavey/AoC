class SleighPacker
  def initialize(weights)
    @weights = weights.freeze
    @target_weight = weights.reduce(:+) / 3
  end

  def first_group
    possible_groups.find do |group|
      can_make_two_equal_groups?(weights - group)
    end
  end


  private

  attr_reader :weights, :target_weight

  def possible_groups
    @possible_groups ||= begin
      possibilities = []
      (1..weights.size).each do |group_size|
        weights.combination(group_size).each do |grouping|
          possibilities << grouping if grouping.reduce(:+) == target_weight
        end
      end
      sorter = ->(a,b) do
        if a.length < b.length
          -1
        elsif a.length > b.length
          1
        else
          a.reduce(:*) <=> b.reduce(:*)
        end
      end
      possibilities.sort(&sorter)
    end
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
