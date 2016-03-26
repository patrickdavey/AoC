require "minitest/autorun"
require "./wizard.rb"
require "pry"

class WizardTest < Minitest::Test
  def test_basic_wiazrd
    wizard = Wizard.new(0, 0)
    assert_equal true, wizard.dead?
  end
end
