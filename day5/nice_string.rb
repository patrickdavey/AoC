class NiceString
  GROUP_MATCH = /(..)(?:.)+\1/.freeze
  SINGLE_LETTER_MATCH = /(.).\1/.freeze

  def initialize(string)
    @string = string
  end

  def nice?
    string.match(GROUP_MATCH) && string.match(SINGLE_LETTER_MATCH)
  end


  private

  attr_reader :string
end
