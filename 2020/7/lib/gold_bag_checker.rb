# frozen_string_literal: true

class GoldBagChecker
  def initialize(bags)
    @bags = bags
    @gold_containers = {}
  end

  def count
    # need to check all the way down for each bag

    bags.map do |(bag, children)|
      gold_containers[bag] = can_contain_gold?(children)
    end

    gold_containers.count { |_k, v| v }
  end

  def gold_total
    containing(bags["shiny gold"].to_a, 0)
  end


  private

  attr_reader :bags, :gold_containers

  def can_contain_gold?(children)
    return false if children.empty?
    return true if children.keys.include?("shiny gold")

    children.keys.any? { |c| can_contain_gold?(bags[c]) }
  end

  def containing(queue, count)
    return count if queue.empty?

    (bag, amount) = queue.pop

    (count + amount) + (amount * (containing(bags[bag].to_a, 0))) + containing(queue, 0)
  end
end
