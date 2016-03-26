class Player
  def initialize(hit_points)
    @hit_points = hit_points
  end

  # def cast_spell(spells_in_effect)
  #   spell_names = spells_in_effect.map(&:name)
  #   possible_spells = Spell.all.reject { |s| spell_names.include?(s.name) }.
  #                               reject { |s| s.cost > mana}
  #   spell = possible_spells.sample

  #   unless spell
  #     @hit_points = 0
  #     return false
  #   end

  #   @mana -= spell.cost
  #   spell
  # end

  # def take_damage(attack_value)
  #   if total_armor >= attack_value
  #     @hit_points -= 1
  #   else
  #     @hit_points -= attack_value - total_armor
  #   end
  # end

  def dead?
    @hit_points <= 0
  end

  attr_reader :hit_points
end
