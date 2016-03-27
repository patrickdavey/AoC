require 'pry'

class Round
  attr_reader :spells
  def initialize(boss, wizard)
    @boss = boss
    @wizard = wizard
    @turn = 0
    @spells = []
  end

  def tick!
    wizard.remove_armor!
    spells_in_effect.each do |spell|
      boss.apply_spell(spell)
      wizard.apply_spell(spell)
      spell.use_one_day!
    end

    return true if round_finished?

    if wizards_turn?
      spell = wizard.cast_spell(spells_in_effect)
      return unless spell
      spells << spell
      apply_spell(spell) if spell.immediate?
    else
      wizard.attacked_with!(boss.damage)
    end
    @turn += 1
  end

  def wizard_wins?
    boss.dead? && !wizard.dead?
  end

  def round_finished?
    boss.dead? || wizard.dead?
  end

  def mana_used
    spells.map(&:cost).reduce(:+)
  end


  private

  attr_reader :wizard, :boss

  def spells_in_effect
    spells.select { |spell| spell.turns_left > 0 }
  end

  def wizards_turn?
    @turn % 2 == 0
  end

  def apply_spell(spell)
    boss.apply_spell(spell)
    wizard.apply_spell(spell)
  end

end
