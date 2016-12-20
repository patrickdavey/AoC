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

  test "returns ranges only high overlap" do
    input = "
      4-7
      0-2
      5-8
      "
    parsed = Parser.parse(input)
    assert Enum.count(parsed) == 2
    assert Enum.member?(parsed, 4..8)
  end

  test "removes an overlapped range" do
    input = "
      3-9
      4-7
      0-2
      "
    parsed = Parser.parse(input)
    assert Enum.count(parsed) == 2

    assert Enum.member?(parsed, 3..9)
  end

  test "replaces an entire range" do
    input = "
      4-7
      0-2
      3-9
      "
    parsed = Parser.parse(input)
    assert Enum.count(parsed) == 2

    assert Enum.member?(parsed, 3..9)
  end
end
