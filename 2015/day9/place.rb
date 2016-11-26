class Place
  def initialize(name)
    @name = name
    @distances = {}
  end

  def []=(place, distance)
    @distances[place] = distance.to_i
  end

  def distance_to(place)
    @distances[place]
  end

  def distance_between(place)
    distance_to(place) || place.distance_to(self) || raise("error in place")
  end

  def to_s
    name
  end


  private
  attr_reader :name
end
