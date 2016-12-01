defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    AOCDay.Map.start_link
    assert Runner.calculate("R2, L3") == 5
    assert Runner.calculate("R2, R2, R2") == 2
    assert Runner.calculate("R5, L5, R5, R3") == 12
  end

  test "finds twice correctly" do
    AOCDay.Map.start_link
    Runner.calculate("R8, R4, R4, R8")
    assert AOCDay.Map.crossing_distance == 4
  end
end
