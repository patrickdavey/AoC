class ValueLogic
  def initialize(value, wire)
    @value = value.to_i
    @wire = wire
  end

  attr_reader :value, :wire
end
