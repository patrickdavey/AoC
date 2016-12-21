defmodule PasswordGeneratorTest do
  use ExUnit.Case
  alias AOCDay.PasswordGenerator

  test "parses test inputs correctly" do
    PasswordGenerator.start_link("abcde", :generator)
    assert GenServer.call(:generator, :current_password) == "abcde"
    GenServer.call(:generator, "swap position 4 with position 0", 10000000)

    assert GenServer.call(:generator, :current_password) == "ebcda"

    GenServer.call(:generator, "swap letter d with letter b", 10000000)
    assert GenServer.call(:generator, :current_password) == "edcba"
  end
end
