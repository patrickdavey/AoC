defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    assert Runner.combination(test_input) == "1985"
    assert Runner.final_combination(test_input) == "5DB3"
  end

  defp test_input do
"ULL
RRDDD
LURDL
UUUUD"
  end
end
