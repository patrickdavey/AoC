defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Parser

  test "returns ranges only" do
    input = "
5-8
0-2
4-7
"
    parsed = Parser.parse(input)
    assert Enum.count(parsed) == 2
    assert Enum.member?(parsed, 4..8)
  end
end
