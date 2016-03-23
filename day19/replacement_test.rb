require "minitest/autorun"
require "./replacement.rb"
require "pry"
class ReplacementTest < Minitest::Test
  def test_initialization
    replacement = Replacement.new(starting_molecule: "H", inserted_molecule: "HO")
    assert_equal "H", replacement.starting_molecule
  end
end
