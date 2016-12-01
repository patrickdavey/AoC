defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    assert Runner.calculate("R2, L3") == 5
  end
end
