defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.Parser
  alias AOC.Trace

  test "initial config works" do
    assert(Parser.parse("R8,U5,L5,D3") == [[
      %Trace{trace_id: 0, length: 8, dir: "R"},
      %Trace{trace_id: 0, length: 5, dir: "U"},
      %Trace{trace_id: 0, length: 5, dir: "L"},
      %Trace{trace_id: 0, length: 3, dir: "D"}
    ]])
  end
end
