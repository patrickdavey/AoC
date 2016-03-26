require './player.rb'

class Wizard < Player
  attr_reader :mana, :armor # will become private variable later

  def initialize(hit_points, mana)
    @mana = mana
    @armor = 0
    super(hit_points)
  end

  def apply_spell(spell)
    # only apply positive effects to wizards
    @armor = spell.armor if spell.armor > 0
    @hit_points += spell.heals
    @mana += spell.mana
  end

  def cast_spell(spells_in_effect)
    spell_names = spells_in_effect.map(&:name)
    possible_spells = Spell.all.reject { |s| spell_names.include?(s.name) }.
                                reject { |s| s.cost > mana}
    spell = possible_spells.sample

    unless spell
      @hit_points = 0
      return false
    end

    @mana -= spell.cost
    spell
  end
end
