class Round
  attr_reader :spells
  def initialize(boss, wizard)
    @boss = boss
    @wizard = wizard
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
    if wizards_turn?
      spell = wizard.cast_spell(spells_in_effect)
      return unless spell
      spells << spell
      apply_spell(spell) if spell.immediate?
    else
      # do stuff
    end
    @turn += 1
  end


  private

  attr_reader :wizard, :boss

  def spells_in_effect
    spells.select { spell.turns > 0 }
  end

  def wizards_turn?
    @turn % 2 == 0
  end

  def apply_spell(spell)
    boss.apply_spell(spell)
    wizard.apply_spell(spell)
  end

end
