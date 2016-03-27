require './round.rb'

class WizardFinder
  def initialize(boss, wizard)
    @boss = boss
    @wizard = wizard
    @minimum_mana = 10000
  end

  def minimum_mana_after(rounds)
    rounds.times do
      round = Round.new(boss.reset!, wizard.reset!)
      round.tick! until round.round_finished?
      if round.mana_used < @minimum_mana && round.wizard_wins?
        @minimum_mana = round.mana_used
      end
    end
    @minimum_mana
  end


  private

  attr_reader :boss, :wizard
end
