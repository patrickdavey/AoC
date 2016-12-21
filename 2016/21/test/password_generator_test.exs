defmodule PasswordGeneratorTest do
  use ExUnit.Case
  alias AOCDay.PasswordGenerator

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
  end
end
