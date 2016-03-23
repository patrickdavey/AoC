require 'set'

class MoleculeCalibrator
  def initialize(initial_molecule:, replacements:)
    @initial_molecule = initial_molecule.freeze
    @replacements = replacements
    @combinations = Set.new
  end

  def distinct_molecules
    replacements.each do |replacement|
      initial_molecule.clone.gsub(/#{replacement.starting_molecule}/) do |match|
        combinations << ($` << replacement.inserted_molecule << $')
      end
    end
    combinations.count
  end

  private

  attr_reader :initial_molecule, :replacements, :combinations
end
