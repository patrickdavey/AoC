require 'pry'

class EncodedString
  def initialize(input)
    @input = input
  end

  def increase
    input.inspect.chars.count - input.strip.length
  end


  private

  attr_reader :input
end
