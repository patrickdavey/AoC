defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "calulates test distances correctly" do
    Application.put_env(AOCDay, :keypad, AOCDay.Keypad)
    assert Runner.combination(test_input) == "1985"
    Application.put_env(AOCDay, :keypad, AOCDay.KeypadFinal)
    assert Runner.combination(test_input) == "5DB3"
  end

  defp test_input do
"ULL
RRDDD
LURDL
UUUUD"
  end
end
