require './player.rb'

class Boss < Player
  def initialize(hit_points, damage)
    @damage = damage
    super(hit_points)
  end

  def apply_spell(spell)
    # only apply positive effects to wizards
    @hit_points -= spell.damage
  end
end
