defmodule AOCRLineOfSightTest do
  use ExUnit.Case
  alias AOC.LineOfSight

  test "first sample works" do
    {dist1, angle1} = LineOfSight.polar({3,4}, { 1, 0})
    {dist2, angle2} = LineOfSight.polar({3,4}, { 2, 2})

    assert(angle1 == angle2)
  end
end
