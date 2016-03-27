require "minitest/autorun"
require "./wizard_finder.rb"
require "./boss.rb"
require "./wizard.rb"

class WizardFinderTest < Minitest::Test
  def test_find_first_scenario_wizard
    wizard = Wizard.new(10, 250)
    boss = Boss.new(13, 8)
    finder = WizardFinder.new(boss, wizard)
    assert_equal(173 + 53, finder.minimum_mana_after(10_000))
  end
end
