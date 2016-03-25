require "./weapon"
require "./player"
require "./round"
require "./player_generator"
require "pry"

def new_boss
  boss = Player.new(104)
  boss_weapon = Weapon.new("boss", cost: 0, damage: 8, armor: 1)
  boss << boss_weapon
  boss
end

player_wins = false
cash = 0

until player_wins
  cash += 1
  player_generator = PlayerGenerator.new(cash)
  player_generator.each do |player|
    round = Round.new(new_boss, player)
    player_wins = round.player_wins?
    break if round.player_wins?
  end
end

puts "cash used: #{cash}"
