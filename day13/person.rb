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

  def [](index)
    @seatings[index.hash]
  end
end
