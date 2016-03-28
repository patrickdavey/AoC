class OrLogic
  def initialize(first_input, second_input, wire)
    @first_input = first_input.match(/\d+/) ? Integer(first_input) : first_input
    @second_input = second_input.match(/\d+/) ? Integer(second_input) : second_input
    @wire = wire
  end

  attr_reader :first_input, :second_input,:wire
end
