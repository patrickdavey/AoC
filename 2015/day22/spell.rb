class Spell
  def initialize(name, cost:, damage: 0, heals: 0, armor: 0, mana: 0, turns: 0)
    @name = name
    @cost = cost
    @damage = damage
    @heals = heals
    @armor = armor
    @mana = mana
    @turns = turns
    @turns_left = turns

  end

  def immediate?
    @turns == 0
  end

  def use_one_day!
    @turns_left -= 1
  end

  attr_reader :cost, :damage, :heals, :turns_left, :name, :armor, :mana

  class << self
    def all
      [
        Spell.new("Missile", cost: 53, damage: 4),
        Spell.new("Drain", cost: 73, damage: 2, heals: 2),
        Spell.new("Shield", cost: 113, armor: 7, turns: 6),
        Spell.new("Poison", cost: 173, damage: 3, turns: 6),
        Spell.new("Recharge", cost: 229, mana: 101, turns: 5)
      ]
    end

    # a few helper methods
    def missile
      all[0]
    end

    def drain
      all[1]
    end

    def shield
      all[2]
    end

    def poison
      all[3]
    end

    def recharge
      all[4]
    end
  end
end
