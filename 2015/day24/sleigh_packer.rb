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

  def initialize(weights, number_of_groups = 3)
    @weights = weights.freeze
    @number_of_groups = number_of_groups
    @target_weight = weights.reduce(:+) / number_of_groups

  end

  def first_group
    (1..weights.size).each do |group_size|
      best_group = possible_groups(group_size).find do |group|
                      can_make_equal_groups?(weights - group)
                    end
      return best_group if best_group
    end
  end


  private

  attr_reader :weights, :target_weight, :number_of_groups

  def possible_groups(group_size)
    possibilities = []

    weights.combination(group_size).each do |grouping|
        possibilities << grouping if grouping.reduce(:+) == target_weight
      end

    possibilities.sort(&SORTER)
  end

  def can_make_equal_groups?(remaining_weights)
    (1..remaining_weights.size).each do |group_size|
      remaining_weights.combination(group_size).each do |grouping|
        if grouping.reduce(:+) == target_weight && can_make_two_equal_groups?(remaining_weights - grouping)
          return true
        end
      end
    end
  end

  def can_make_two_equal_groups?(remaining_weights)
    (1..remaining_weights.size).each do |group_size|
      remaining_weights.combination(group_size).each do |grouping|
        if grouping.reduce(:+) == target_weight && (remaining_weights - grouping).reduce(:+) == target_weight
          return true
        end
      end
    end
    return false
  end

end
