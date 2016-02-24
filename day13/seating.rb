require 'pry'
require './person.rb'

class Seating
  PARSE = /^(?<name>\w+) would (?<change>(gain|lose)) (?<value>\d+) happiness units by sitting next to (?<partner>\w+)\.$/

  def initialize(happiness_information)
    @people = []
    setup_people(happiness_information)
  end

  def optimal
    plans = @people.permutation.map do |seating_plan|
      seating = seating_plan.each_cons(2).to_a << [seating_plan.first, seating_plan.last]
      seating.map do |(first, second)|
        first[second] + second[first]
      end.reduce(&:+)
    end
    plans.max
  end


  private

  def setup_people(happiness_information)
    happiness_information.each_line do |line|
      info = line.strip.match(PARSE)
      value = info[:change] == "gain" ? info[:value].to_i : info[:value].to_i * -1
      guest = find_or_initialize(info[:name])
      partner = find_or_initialize(info[:partner])
      guest[partner] = value
    end
  end

  def find_or_initialize(name)
    guest = @people.find { |person| person.name == name }
    unless guest
      guest = Person.new(name)
      @people << guest
    end

    guest
  end

end
