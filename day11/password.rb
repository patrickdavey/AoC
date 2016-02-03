require 'pry'
require 'set'

class Password
  def initialize(starting_password)
    @starting_password = starting_password
  end

  def succ
    valid = false; next_valid = starting_password
    until valid
      next_valid = next_valid.succ
      valid = true if is_valid?(next_valid)
    end
    next_valid
  end

  private

  attr_reader :starting_password

  def is_valid?(password)
    contains_no_invalid_chars?(password) &&
    contains_two_different_pairs?(password) &&
    has_straight?(password)
  end

  def has_straight?(password)
    password.chars.each_cons(3).to_a.each do |(first, second, third)|
      return true if first.succ == second && second.succ == third
    end
    false
  end

  def contains_no_invalid_chars?(password)
    !password.match(/[iol]/)
  end

  def contains_two_different_pairs?(password)
    pairs = password.chars.each_cons(2).map do |(first, second)|
      first == second ? first : nil
    end.compact
    Set.new(pairs).size > 1
  end

end
