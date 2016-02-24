require 'pry'
require './reindeer.rb'

class Race
  PARSE = /^(?<name>\w+) .+ fly (?<speed>\d+) .+ for (?<duration>\d+) .+ for (?<rest>\d+)/
  def initialize(race_info)
    @entrants = []
    parse_race_info(race_info)
  end

  def winner_after(number_of_seconds)
    number_of_seconds.times do
      @entrants.map(&:tick)
    end

    @entrants.max_by(&:distance)
  end


  private

  def parse_race_info(race_info)
    race_info.each_line do |line|
      info = line.strip.match(PARSE)
      @entrants << Reindeer.new(name: info[:name],
                                speed: info[:speed].to_i,
                                duration: info[:duration].to_i,
                                rest: info[:rest].to_i)
    end
  end
end
