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

distances = IO.readlines('test.txt')
PARSE = /(?<first_place>\w+) to (?<second_place>\w+) = (?<distance>\d+)/.freeze

distances.map do |distance|
  input = distance.match(PARSE)
  places[input[:first_place]] ||= Place.new(input[:first_place])
  places[input[:second_place]] ||= Place.new(input[:second_place])
  places[input[:first_place]].store_distance_to(places[input[:second_place]], input[:distance])
end

min = nil
best = nil

places.keys.permutation.each do |trip|
  trip_distance = 0
  trip.each_cons(2).each do |(a, b)|
    trip_distance += places[a].distance_between(places[b])
  end
  min ||= trip_distance

  if min <= trip_distance
    best = trip
  end

end

puts min
puts best
