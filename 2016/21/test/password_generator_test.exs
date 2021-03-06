defmodule PasswordGeneratorTest do
  use ExUnit.Case
  alias AOCDay.PasswordGenerator

  test "more specific tests" do
    PasswordGenerator.start_link("abcde", :generator)
    GenServer.call(:generator, "move position 0 to position 1")
    assert GenServer.call(:generator, :current_password) == "bacde"

    GenServer.call(:generator, "move position 1 to position 0")
    assert GenServer.call(:generator, :current_password) == "abcde"

    GenServer.call(:generator, "move position 4 to position 3")
    assert GenServer.call(:generator, :current_password) == "abced"

    GenServer.call(:generator, "move position 2 to position 0")
    assert GenServer.call(:generator, :current_password) == "cabed"
  end

  test "letter based rotations" do
    PasswordGenerator.start_link("cdhegfab", :generator)
    GenServer.call(:generator, "rotate based on position of letter b")
  end

  test "extra reversals" do
    PasswordGenerator.start_link("abcde", :generator)
    GenServer.call(:generator, "reverse positions 1 through 3")
    assert GenServer.call(:generator, :current_password) == "adcbe"
    GenServer.call(:generator, "reverse positions 1 through 3")
    assert GenServer.call(:generator, :current_password) == "abcde"
    GenServer.call(:generator, "reverse positions 0 through 3")
    assert GenServer.call(:generator, :current_password) == "dcbae"
    GenServer.call(:generator, "reverse positions 0 through 3")
    assert GenServer.call(:generator, :current_password) == "abcde"
  end

  test "extra swaps" do
    PasswordGenerator.start_link("abcde", :generator)
    GenServer.call(:generator, "swap position 3 with position 0")
    assert GenServer.call(:generator, :current_password) == "dbcae"
    GenServer.call(:generator, "swap position 0 with position 4")
    assert GenServer.call(:generator, :current_password) == "ebcad"
  end

  test "extra rotation right" do
    PasswordGenerator.start_link("abcde", :generator)
    GenServer.call(:generator, "rotate right 4 steps")
    assert GenServer.call(:generator, :current_password) == "bcdea"
    GenServer.call(:generator, "rotate left 4 steps")
    assert GenServer.call(:generator, :current_password) == "abcde"
    GenServer.call(:generator, "rotate left 5 steps")
    assert GenServer.call(:generator, :current_password) == "abcde"
    GenServer.call(:generator, "rotate right 1 steps")
    assert GenServer.call(:generator, :current_password) == "eabcd"
  end

  test "parses test inputs correctly" do
    PasswordGenerator.start_link("abcde", :generator)
    assert GenServer.call(:generator, :current_password) == "abcde"
    GenServer.call(:generator, "swap position 4 with position 0")

    assert GenServer.call(:generator, :current_password) == "ebcda"

    GenServer.call(:generator, "swap letter d with letter b")
    assert GenServer.call(:generator, :current_password) == "edcba"

    GenServer.call(:generator, "reverse positions 0 through 4", 10000000)
    assert GenServer.call(:generator, :current_password) == "abcde"

    GenServer.call(:generator, "reverse positions 0 through 1", 10000000)
    assert GenServer.call(:generator, :current_password) == "bacde"

    GenServer.call(:generator, "reverse positions 0 through 1", 10000000)
    assert GenServer.call(:generator, :current_password) == "abcde"

    GenServer.call(:generator, "rotate left 1 steps")
    assert GenServer.call(:generator, :current_password) == "bcdea"

    GenServer.call(:generator, "rotate left 2 steps")
    assert GenServer.call(:generator, :current_password) == "deabc"

    GenServer.call(:generator, "rotate right 2 steps", 10000000)
    assert GenServer.call(:generator, :current_password) == "bcdea"

    GenServer.call(:generator, "move position 1 to position 4", 10000000)
    assert GenServer.call(:generator, :current_password) == "bdeac"

    GenServer.call(:generator, "move position 3 to position 0", 10000000)
    assert GenServer.call(:generator, :current_password) == "abdec"

    GenServer.call(:generator, "move position 4 to position 0", 10000000)
    assert GenServer.call(:generator, :current_password) == "cabde"

    GenServer.call(:generator, "move position 0 to position 4", 10000000)
    assert GenServer.call(:generator, :current_password) == "abdec"

    GenServer.call(:generator, "rotate based on position of letter b", 10000000)
    assert GenServer.call(:generator, :current_password) == "ecabd"

    GenServer.call(:generator, "rotate based on position of letter d", 10000000)
    assert GenServer.call(:generator, :current_password) == "decab"
  end
end
