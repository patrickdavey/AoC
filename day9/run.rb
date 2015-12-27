require 'pry'

places = {}

class Place
  def initialize(name)
    @name = name
    @distances = {}
  end

  def store_distance_to(place, distance)
    @distances[place.to_s] = distance.to_i
  end

  def distance_to(place)
    @distances[place.to_s]
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

distances = IO.readlines('test.txt')
PARSE = /(?<first_place>\w+) to (?<second_place>\w+) = (?<distance>\d+)/.freeze

distances.map do |distance|
  input = distance.match(PARSE)
  places[input[:first_place]] ||= Place.new(input[:first_place])
  places[input[:second_place]] ||= Place.new(input[:second_place])
  places[input[:first_place]].store_distance_to(places[input[:second_place]], input[:distance])
end

trips = places.keys.permutation.map do |trip|
  Trip.new(trip.map { |name| places[name] })
end

puts trips

puts trips.min_by { |trip| trip.distance }
