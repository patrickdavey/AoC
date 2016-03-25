class Round
  attr_reader :spells
  def initialize(boss, player)
    @boss = boss
    @player = player
    @turn = 0
    @spells = []
  end

  def tick!
    spells_in_effect.each do |spell|
      binding.pry
    end
    # apply any existing spells
    # if boss' turn - take damage
    # if my turn, pick a random allowable spell
    if players_turn?
      spell = player.cast_spell(spells_in_effect)
      return unless spell
      spells << spell
    else
      # do stuff
    end
    @turn += 1
  end


  private

  attr_reader :player, :boss

  def spells_in_effect
    spells.select { spell.turns > 0 }
  end

  def players_turn?
    @turn % 2 == 0
  end

end
