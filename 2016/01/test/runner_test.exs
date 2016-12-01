defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    assert Runner.calculate("R2, L3") == 5
    assert Runner.calculate("R2, R2, R2") == 2
    assert Runner.calculate("R5, L5, R5, R3") == 12
  end
end
