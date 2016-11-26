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

player_wins = true
cash = 1000

while player_wins
  cash -= 1
  player_generator = PlayerGenerator.new(cash)
  player_generator.each do |player|
    round = Round.new(new_boss, player)
    player_wins = round.player_wins?
    cash = player.total_cost unless player_wins
    break unless round.player_wins?
  end
end

puts "cash used: #{cash}"
