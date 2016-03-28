class LShiftLogic
  def initialize(first_input, shift_by, wire)
    @first_input = first_input
    @shift_by = shift_by.to_i
    @wire = wire
  end

  attr_reader :first_input, :shift_by,:wire
end
