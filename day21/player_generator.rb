require "./weapon"
require "./armor"
require "./ring"
require "./player"
require "pry"

class PlayerGenerator
  include Enumerable

  PLAYER_HIT_POINTS = 100

  def initialize(cash_available)
    @weapons = []
    @weapons << Weapon.new("Dagger", cost: 8, damage:4, armor: 0)
    @weapons << Weapon.new("Shortsword", cost: 10, damage:5, armor: 0)
    @weapons << Weapon.new("Warhammer", cost: 25, damage:6, armor: 0)
    @weapons << Weapon.new("Longsword", cost: 40, damage:7, armor: 0)
    @weapons << Weapon.new("Greataxe", cost: 74, damage:8, armor: 0)
    @weapons.freeze

    @armors = []
    @armors << Armor.new("Leather", cost: 13, damage:0, armor: 1)
    @armors << Armor.new("Chainmail", cost: 31, damage:0, armor: 2)
    @armors << Armor.new("Splintmail", cost: 53, damage:0, armor: 3)
    @armors << Armor.new("Bandedmail", cost: 75, damage:0, armor: 4)
    @armors << Armor.new("Platemail", cost: 102, damage:0, armor: 5)
    @armors.freeze

    @rings = []
    @rings << Ring.new("Damage+1", cost: 25, damage:1, armor: 0)
    @rings << Ring.new("Damage+2", cost: 50, damage:2, armor: 0)
    @rings << Ring.new("Damage+3", cost: 100, damage:3, armor: 0)
    @rings << Ring.new("Defense+1", cost: 20, damage:0, armor: 1)
    @rings << Ring.new("Defense+2", cost: 40, damage:0, armor: 2)
    @rings << Ring.new("Defense+3", cost: 80, damage:0, armor: 3)
    @rings.freeze

    @cash_available = cash_available
  end

  def each
    players.each do |player|
      yield player
    end
  end


  private

  attr_reader :cash_available

  def players
    players = []
    combinations_of_valid_items.each do |items_list|
      p = Player.new(PLAYER_HIT_POINTS)
      items_list.each do |item|
        p << item
      end
      players << p
    end
    players.sort.reverse
  end

  def items_available
    @items_available ||= [@armors, @rings, @weapons].flatten.
                                reject { |w| w.cost > cash_available }
  end

  def combinations_of_valid_items
    combinations = []
    (1..items_available.size).each do |group_size|
      combinations << items_available.combination(group_size).to_a
    end
    combinations.flatten(1).reject do |item_list|
      item_list.reduce(0) {|sum, i| sum = sum + i.cost } > cash_available ||
      item_list.count {|i| i.instance_of?(Weapon) } != 1 ||
      item_list.count {|i| i.instance_of?(Ring) } > 2
    end
  end
end

