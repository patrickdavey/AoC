require 'pry'
require './place'
require './trip'

places = {}
distances_between_points = IO.readlines('test.txt')

PARSE = /(?<first_place>\w+) to (?<second_place>\w+) = (?<distance>\d+)/.freeze

distances_between_points.each do |distance|
  input = distance.match(PARSE)
  places[input[:first_place]] ||= Place.new(input[:first_place])
  places[input[:second_place]] ||= Place.new(input[:second_place])
  places[input[:first_place]][places[input[:second_place]]] = input[:distance]
end

trips = places.keys.permutation.map do |trip|
  Trip.new(trip.map { |name| places[name] })
end

puts trips.min_by { |trip| trip.distance }
