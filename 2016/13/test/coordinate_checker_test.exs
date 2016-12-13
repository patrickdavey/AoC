defmodule CoordinateCheckerTest do
  use ExUnit.Case
  alias AOCDay.CoordinateChecker

  test "gives correct answer for test walls" do
    Application.put_env(:aoc, :input, 10)
    assert CoordinateChecker.type?(0,0) == "."
    assert CoordinateChecker.type?(1,0) == "#"
    assert CoordinateChecker.type?(6,9) == "#"
  end
end
