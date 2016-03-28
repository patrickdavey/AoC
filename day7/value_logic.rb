class ValueLogic
  def initialize(value, wire)
    @value = value.match(/\d+/) ? Integer(value) : value
    @wire = wire
  end

  def has_value?
    value.is_a?(Integer)
  end

  def try_resolve(all_logics)
    # if we're in here, then we know we are looking for a gate
    source = all_logics.find {|l| l.wire == value }
    @value = source.value if source.has_value?
  end

  attr_reader :value, :wire
end
