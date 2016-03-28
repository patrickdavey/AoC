class AndLogic
  def initialize(first_input, second_input, wire)
    @first_input = first_input.match(/\d+/) ? Integer(first_input) : first_input
    @second_input = second_input.match(/\d+/) ? Integer(second_input) : second_input
    @wire = wire
  end

  def has_value?
    first_input.is_a?(Integer) && second_input.is_a?(Integer)
  end

  def value
    first_input & second_input
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
    @second_input = if second_input.is_a?(Integer)
              second_input
            else
              source = all_logics.find {|l| l.wire == second_input }
              return unless source.has_value?
              source.value
            end
  end

  attr_reader :first_input, :second_input,:wire
end
