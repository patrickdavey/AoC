class Sue
  attr_accessor :children, :cats, :samoyeds, :pomeranians, :akitas, :vizslas,
                :goldfish, :trees, :cars, :perfumes

  attr_reader :name

  def initialize(name)
    @name = name
  end

end
