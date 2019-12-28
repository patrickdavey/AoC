defmodule AOCPlotterTest do
  use ExUnit.Case
  alias AOC.Parser
  alias AOC.Plotter
  alias AOC.Board

  test "initial config works" do
    board1 = """
    ...000000
    ...0....0
    ...0....0
    ...0....0
    ........0
    o00000000
    """ |> String.trim

    foo = Parser.parse("R8,U5,L5,D3")
      |> Plotter.plot
      |> Board.to_string

    IO.puts(foo)

    assert(foo == board1)
  end
end
