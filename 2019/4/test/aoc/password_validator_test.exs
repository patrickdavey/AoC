defmodule AOCPasswordValidatorTest do
  use ExUnit.Case
  alias AOC.PasswordValidator

  test "sample tests work" do
    assert(PasswordValidator.check(111111) == true)
    assert(PasswordValidator.check(123789) == false)
    assert(PasswordValidator.check(223450) == false)
  end
end
