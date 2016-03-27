class World
  attr_accessor :x0, :y0, :x1, :y1, :houses
  attr_reader :directions

  def initialize(directions)
    @directions = directions.chars
    @x0 = 0
    @y0 = 0
    @x1 = 0
    @y1 = 0
    @houses = {"0,0" => true }
  end

  def deliver!
    @directions.each_with_index do |direction, index|
      x = "x" + (index % 2).to_s
      y = "y" + (index % 2).to_s

      case direction
      when "^"
        self.send("#{y}=", self.send(y) + 1)
      when "v"
        self.send("#{y}=", self.send(y) - 1)
      when "<"
        self.send("#{x}=", self.send(x) - 1)
      when ">"
        self.send("#{x}=", self.send(x) + 1)
      end
      @houses["#{self.send(x)},#{self.send(y)}"] = true
    end
    @houses.keys.count
  end
end

