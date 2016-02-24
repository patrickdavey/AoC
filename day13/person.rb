require 'pry'

class Person
  attr_reader :name

  def initialize(name)
    @name = name
    @seatings = {}
  end

  def hash
    @name.hash
  end

  def ==(other)
    name == other.name
  end

  def []=(person, value)
    @seatings[person.hash] = value
  end

  def [](person)
    return 0 if person.is_a?(ApatheticPerson)
    @seatings[person.hash]
  end
end

class ApatheticPerson < Person
  def [](index)
    0
  end
end
