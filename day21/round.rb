require 'pry'
require './player'

class Round
  def initialize(boss, player)
    @boss = boss
    @player = player
    @turn = 0
  end

  def player_wins?
    until player.dead? || boss.dead?
      if players_turn?
        boss.take_damage(player.total_damage)
      else
        player.take_damage(boss.total_damage)
      end
      puts "after turn #{@turn}: player has #{player.hit_points} , boss has  #{boss.hit_points}"
      @turn += 1

    end
    boss.dead?
  end


  private

  attr_reader :player, :boss

  def players_turn?
    @turn % 2 == 0
  end

end
