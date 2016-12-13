defmodule BoardTest do
  use ExUnit.Case
  alias AOCDay.Board

  test "more board positions" do
    Application.put_env(:aoc, :width, 10)
    Application.put_env(:aoc, :height, 7)
    Application.put_env(:aoc, :input, 10)
    Board.init
    Board.populate_initial
    assert Board.as_string == """
      .#.####.##
      ..#..#...#
      #....##...
      ###.#.###.
      .##..#..#.
      ..##....#.
      #...##.###
      """
  end
end
    # Board.set(0, 0, "#")

    # assert Board.as_string == """
    # #......
    # .......
    # .......
    # """
    # assert Board.at(0, 0) == "#"

    # Board.set(0, 1, "#")
    # assert Board.as_string == """
    # #......
    # #......
    # .......
    # """

    # Board.set(1, 1, "#")
    # assert Board.as_string == """
    # #......
    # ##.....
    # .......
    # """

    # Board.set(1, 0, "#")
    # assert Board.as_string == """
    # ##.....
    # ##.....
    # .......
    # """

    # Board.set(6, 2, "#")
    # assert Board.as_string == """
    # ##.....
    # ##.....
    # ......#
    # """
  # end
# end
