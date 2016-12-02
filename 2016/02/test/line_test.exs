defmodule LineTest do
  use ExUnit.Case
  alias AOCDay.Line

  test "calulates final code correctly for test lines" do
    assert Line.final("5", ["U", "L", "L"], AOCDay.Keypad) == "1"
    assert Line.final("1", ["R", "R", "D", "D", "D"], AOCDay.Keypad) == "9"
    assert Line.final("9", ["L", "U", "R", "D", "L"], AOCDay.Keypad) == "8"
    assert Line.final("8", ["U", "U", "U", "U", "D"], AOCDay.Keypad) == "5"
  end
end
