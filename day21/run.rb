require "./weapon"
require "./armor"
require "./ring"
require "./player"
require "./round"
require "pry"

@weapons = []
@weapons << Weapon.new("Dagger", cost: 8, damage:4, armor: 0)
@weapons << Weapon.new("Shortsword", cost: 10, damage:5, armor: 0)
@weapons << Weapon.new("Warhammer", cost: 25, damage:6, armor: 0)
@weapons << Weapon.new("Longsword", cost: 40, damage:7, armor: 0)
@weapons << Weapon.new("Greataxe", cost: 74, damage:8, armor: 0)

@armors = []
@armors << Armor.new("Leather", cost: 13, damage:0, armor: 1)
@armors << Armor.new("Chainmail", cost: 31, damage:0, armor: 2)
@armors << Armor.new("Splintmail", cost: 53, damage:0, armor: 3)
@armors << Armor.new("Bandedmail", cost: 75, damage:0, armor: 4)
@armors << Armor.new("Platemail", cost: 102, damage:0, armor: 5)

@rings = []
@rings << Ring.new("Damage+1", cost: 25, damage:1, armor: 0)
@rings << Ring.new("Damage+2", cost: 50, damage:2, armor: 0)
@rings << Ring.new("Damage+3", cost: 100, damage:3, armor: 0)
@rings << Ring.new("Defense+1", cost: 20, damage:0, armor: 1)
@rings << Ring.new("Defense+2", cost: 40, damage:0, armor: 2)
@rings << Ring.new("Defense+3", cost: 80, damage:0, armor: 3)

def new_boss
  boss = Player.new(104)
  boss_weapon = Weapon.new("boss", cost: 0, damage: 8, armor: 1)
  boss << boss_weapon
  boss
end

# function returns the next least costly player
def get_player(cash_available)
  puts cash_available
  player = Player.new(100)
  # looks like we should always choose the most expensive weapon for our available cash (guess)
  weapon = @weapons.reject { |w| w.cost > cash_available }.max_by(&:cost)
  player << (weapon || @weapons.first)
  cash_available -= weapon.cost if weapon

  # now ... eek... use the rest of the cash somehow
  available_items_left = [@armors, @rings, @rings].flatten.
                                                  sort_by(&:cost).
                                                  reject { |w| w.cost > cash_available }
  while(available_items_left.count > 0)
    item_to_add = available_items_left.shift
    player << item_to_add
    available_items_left = available_items_left.reject{ |i| i == item_to_add }
  end

  player
end

player_wins = false
player = nil
cash = 0

until player_wins
  player = get_player(cash += 1)
  round = Round.new(new_boss, player)
  puts round.player_wins?
  player_wins = round.player_wins?
end
binding.pry

puts "cash used: #{cash}"
