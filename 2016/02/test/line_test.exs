defmodule LineTest do
  use ExUnit.Case
  alias AOCDay.Line

  test "calulates final code correctly for test lines" do
    assert Line.final(5, ["U", "L", "L"]) == 1
    assert Line.final(1, ["R", "R", "D", "D", "D"]) == 9
    assert Line.final(9, ["L", "U", "R", "D", "L"]) == 8
    assert Line.final(8, ["U", "U", "U", "U", "D"]) == 5
  end
end
