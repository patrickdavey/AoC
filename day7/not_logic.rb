class NotLogic
  def initialize(first_input, wire)
    @first_input = first_input.match(/\d+/) ? Integer(first_input) : first_input
    @wire = wire
  end

  def has_value?
    first_input.is_a?(Integer)
  end

  def value
    ~first_input < 0 ? ~first_input + 2**16 : ~first_input
  end

  def try_resolve(all_logics)
    # if we're in here, then we know we are looking for a gate
    source = all_logics.find {|l| l.wire == first_input }
    @first_input = if first_input.is_a?(Integer)
              first_input
            else
              source = all_logics.find {|l| l.wire == first_input }
              return unless source.has_value?
              source.value
            end
  end

  attr_reader :first_input, :wire
end
