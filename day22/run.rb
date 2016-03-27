require "./wizard_finder.rb"
require "./boss.rb"
require "./wizard.rb"


wizard = Wizard.new(50, 500)
boss = Boss.new(51, 9)
finder = WizardFinder.new(boss, wizard)
puts finder.minimum_mana_after(50_000)
