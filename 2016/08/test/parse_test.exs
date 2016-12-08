defmodule ParserTest do
  use ExUnit.Case
  alias AOCDay.Parser

  test "can parse test column correctly" do
    assert Map.get(Parser.matched("rotate column x=1 by 5"), :action) == "column"
    assert Map.get(Parser.matched("rotate column x=1 by 5"), :column) == 1
    assert Map.get(Parser.matched("rotate column x=1 by 5"), :amount) == 5
  end

  test "can parse test rect correctly" do
    assert Map.get(Parser.matched("rect 1x1"), :action) == "rect"
    assert Map.get(Parser.matched("rect 1x1"), :x) == 1
    assert Map.get(Parser.matched("rect 1x2"), :y) == 2
  end

  test "can parse test row correctly" do
    assert Map.get(Parser.matched("rotate row y=0 by 5"), :action) == "row"
  end
end
