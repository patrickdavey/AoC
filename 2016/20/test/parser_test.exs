defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Parser

  # @tag :skip
  # test "returns ranges only" do
  #   input = "
  #     5-8
  #     0-2
  #     4-7
  #     "
  #   parsed = Parser.parse(input)
  #   assert Enum.count(parsed) == 2
  #   assert Enum.member?(parsed, 4..8)
  # end

  # @tag :skip
  # test "returns ranges only high overlap" do
  #   input = "
  #     4-7
  #     0-2
  #     5-8
  #     "
  #   parsed = Parser.parse(input)
  #   assert Enum.count(parsed) == 2
  #   assert Enum.member?(parsed, 4..8)
  # end

  # @tag :skip
  # test "removes an overlapped range" do
  #   input = "
  #     3-9
  #     4-7
  #     0-2
  #     "
  #   parsed = Parser.parse(input)
  #   assert Enum.count(parsed) == 2

  #   assert Enum.member?(parsed, 3..9)
  # end

  # @tag :skip
  # test "replaces an entire range" do
  #   input = "
  #     4-7
  #     0-2
  #     3-9
  #     "
  #   parsed = Parser.parse(input)
  #   assert Enum.count(parsed) == 2

  #   assert Enum.member?(parsed, 3..9)
  # end

  test "should not include bad data" do
    mapset = Parser.parse
    t = MapSet.member?(mapset, 181708677..181820620)
    IO.puts "After first member"
    t2 = MapSet.member?(mapset, 545671618..553124641)
    IO.puts "After second member"

    IO.puts t
    IO.puts t2

    require IEx
    IEx.pry
    refute t
    refute t2
  end
end
