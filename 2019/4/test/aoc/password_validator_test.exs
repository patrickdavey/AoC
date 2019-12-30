defmodule AOCPasswordValidatorTest do
  use ExUnit.Case
  alias AOC.PasswordValidator

  test "sample tests work" do
    assert(PasswordValidator.check((0..999999), 111111) == true)
    assert(PasswordValidator.check((0..999999), 123789) == false)
    assert(PasswordValidator.check((0..999999), 223450) == false)
  end
end
