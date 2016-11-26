class MoleculeGenerator
  def initialize(desired_molecule:, replacements:)
    @desired_molecule = desired_molecule
    @replacements = replacements.freeze
  end

  def steps_required
    attempts = 0
    match = false
    while attempts < 100 || !match
      match = find_attempt(desired_molecule, 0)
      attempts += 1
    end
    return match
  end


  private

  def find_attempt(molecule, steps_required)
    if steps_required > 1000
      return false
    end

    if replacements.find { |r| r.inserted_molecule == molecule && r.starting_molecule == "e"}
      return steps_required + 1
    else
      return false unless replacements.find { |r| molecule.match(r.inserted_molecule) }
      # perform a substitution and recurse
      possible_match = false
      replacement = nil

      until possible_match
        replacement = replacements.sample
        possible_match = molecule.match(/#{replacement.inserted_molecule}/)
      end

      molecule = molecule.sub(replacement.inserted_molecule, replacement.starting_molecule)
      return find_attempt(molecule, steps_required + 1)
    end
  end

  private

  attr_reader :desired_molecule, :replacements
end
