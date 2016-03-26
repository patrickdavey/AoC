require './player.rb'

class Wizard < Player
  def initialize(hit_points, mana)
    @mana = mana
    super(hit_points)
  end
end
