class LShiftLogic
  def initialize(first_input, shift_by, wire)
    @first_input = first_input
    @shift_by = shift_by.to_i
    @wire = wire
  end

  def has_value?
    first_input.is_a?(Integer)
  end

  def value
    first_input << shift_by
  end

  def try_resolve(all_logics)
    # if we're in here, then we know we are looking for a gate
    @first_input = if first_input.is_a?(Integer)
              first_input
            else
              source = all_logics.find {|l| l.wire == first_input }
              return unless source.has_value?
              source.value
            end
  end

  attr_reader :first_input, :shift_by,:wire
end
