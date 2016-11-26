class FloorScanner
  attr_accessor :floor

  def initialize(floor_string)
    @floors = floor_string
    @floor = 0
  end

  def enters_basement_at
    floors.chars.each_with_index do |char, index|
      if char == '('
        self.floor += 1
      else
        self.floor -= 1
      end
      return(index + 1) if floor == -1
    end
  end


  private

  attr_reader :floors
end
