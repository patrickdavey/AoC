require "minitest/autorun"
require "./molecule_generator.rb"
require "./replacement.rb"
require "pry"
class MoleculeCalibratorTest < Minitest::Test
  def test_simple_input
    replacements = []
    replacements << Replacement.new(starting_molecule: "e", inserted_molecule: "H")
    replacements << Replacement.new(starting_molecule: "e", inserted_molecule: "O")
    replacements << Replacement.new(starting_molecule: "H", inserted_molecule: "HO")
    replacements << Replacement.new(starting_molecule: "H", inserted_molecule: "OH")
    replacements << Replacement.new(starting_molecule: "O", inserted_molecule: "HH")
    desired_molecule = "HOH"
    generator = MoleculeGenerator.new(desired_molecule: desired_molecule, replacements: replacements)
    assert_equal 3, generator.steps_required
  end
end
