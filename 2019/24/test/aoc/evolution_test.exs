defmodule AOCEvolutionTest do
  use ExUnit.Case
  alias AOC.{Parser, Evolution, Board}

  test "first sample works" do
    input = """
    ....#
    #..#.
    #..##
    ..#..
    #....
    """

    parsed = Parser.parse(input)
    next_state = Evolution.next(parsed)


    assert(Board.as_string(next_state) |> String.trim == sample_after_1 |> String.trim)
  end

  test "after 4 runs is correct" do
    input = """
    ....#
    #..#.
    #..##
    ..#..
    #....
    """

    parsed = Parser.parse(input)
    result = parsed
    |> Evolution.next
    |> Evolution.next
    |> Evolution.next
    |> Evolution.next


    assert(Board.as_string(result) |> String.trim == sample_after_4 |> String.trim)
  end

  defp sample_after_1 do
    """
    #..#.
    ####.
    ###.#
    ##.##
    .##..
    """
  end

  defp sample_after_4 do
    """
    ####.
    ....#
    ##..#
    .....
    ##...
    """
  end
end
