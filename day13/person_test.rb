require "minitest/autorun"
require "./person.rb"
class PersonTest < Minitest::Test

  def test_person_initialization
    sample_data ="Alice"
    assert_equal "Alice", Person.new(sample_data).name
  end

  def test_add_happiness_information
    alice = Person.new("Alice")
    bob = Person.new("Bob")
    alice[bob] = 54
    assert_equal 54, alice[bob]
    bob = Person.new("Bob")
    assert_equal 54, alice[bob]
  end

  def test_equality
    alice = Person.new("Alice")
    alice2 = Person.new("Alice")
    assert alice == alice2
  end
end
