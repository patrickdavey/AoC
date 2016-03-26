require './player.rb'

class Wizard < Player
  attr_reader :mana, :armor # will become private variable later

  def initialize(hit_points, mana)
    @mana = mana
    @armor = 0
    super(hit_points)
  end

  def remove_armor!
    @armor = 0
  end



  def attacked_with!(attack_strength)
    if armor >= attack_strength
      @hit_points -= 1
    else
      @hit_points -= (attack_strength - armor)
    end
  end

  def apply_spell(spell)
    # only apply positive effects to wizards
    @armor = spell.armor if spell.armor > 0
    @hit_points += spell.heals
    @mana += spell.mana
  end

  def possible_spells(spells_in_effect)
    spell_names = spells_in_effect.map(&:name)
    Spell.all.reject { |s| spell_names.include?(s.name) }.
                                       reject { |s| s.cost > mana}
  end

  def cast_spell(spells_in_effect)
    spell = possible_spells(spells_in_effect).sample

    unless spell
      @hit_points = 0
      return false
    end

    @mana -= spell.cost
    spell
  end
end
