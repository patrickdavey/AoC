class Code
  def initialize(previous)
    @previous = previous
  end

  def next
    (previous * 252533) % 33554393
  end


  private

  attr_reader :previous
end
