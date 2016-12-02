defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    assert Runner.combination(test_input) == "1985"
  end

  defp test_input do
"ULL
RRDDD
LURDL
UUUUD"
  end
end
