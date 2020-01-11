defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.Parser

  test "initial config works" do
    assert(Parser.parse("1,0,0,0,99") == %{
      0 => 1,
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 99,
    })
  end
end
