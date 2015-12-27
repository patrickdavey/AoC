class Trip
  def initialize(places)
    @places = places
  end

  def distance
    trip_distance = 0
    places.each_cons(2).each do |(a, b)|
      trip_distance += a.distance_between(b)
    end
    trip_distance
  end

  def to_s
    "#{places.map(&:to_s).join("->")} : #{distance}"
  end

  private
  attr_reader :places
end
