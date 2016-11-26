class Replacement
  attr_reader :starting_molecule, :inserted_molecule

  def initialize(starting_molecule:, inserted_molecule:)
    @starting_molecule = starting_molecule
    @inserted_molecule = inserted_molecule
  end

end
