require 'pry'
require 'set'

class Password
  def initialize(password)
    @password = password
  end

  def valid?
    contains_no_invalid_chars? &&
    contains_two_different_pairs? &&
    has_straight?
  end

  def to_s
    "#{password}"
  end

  private

  attr_reader :password

  def has_straight?
    password.chars.each_cons(3).to_a.each do |(first, second, third)|
      return true if first.succ == second && second.succ == third
    end
    false
  end

  def contains_no_invalid_chars?
    !password.match(/[iol]/)
  end

  def contains_two_different_pairs?
    pairs = password.chars.each_cons(2).map do |(first, second)|
      first == second ? first : nil
    end.compact
    Set.new(pairs).size > 1
  end

end

class PasswordGenerator
  def initialize(current_password)
    @current_password = current_password
  end

  def succ(count = 1)
    possible = current_password
    found = 0
    while found < count do
      possible = Password.new(possible.to_s.succ)
      found += 1 if possible.valid?
    end
    return possible
  end

  private

  attr_reader :current_password
end
