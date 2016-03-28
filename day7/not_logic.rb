class NotLogic
  def initialize(first_input, wire)
    @first_input = first_input.match(/\d+/) ? Integer(first_input) : first_input
    @wire = wire
  end

  attr_reader :first_input, :wire
end
