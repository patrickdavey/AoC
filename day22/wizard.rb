require './player.rb'

class Wizard < Player
  def initialize(hit_points, mana)
    @mana = mana
    super(hit_points)
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


  private

  attr_reader :mana

end
