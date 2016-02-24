class Reindeer
  def initialize(name)
    @name = name
  end

  def to_s
    name
  end


  private

  attr_reader :name
end
