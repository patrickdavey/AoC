defmodule AOCRunnerTest do
  use ExUnit.Case
  alias AOC.{Runner, Parser}

  test "first sample works" do
    input = """
    deal with increment 7
    deal into new stack
    deal into new stack
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "0 3 6 9 2 5 8 1 4 7")
  end

  test "cut positive works" do
    input = """
    cut 3
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "3 4 5 6 7 8 9 0 1 2")
  end

  test "cut negative works" do
    input = """
    cut -4
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "6 7 8 9 0 1 2 3 4 5")
  end

  test "second sample works" do
    input = """
    cut 6
    deal with increment 7
    deal into new stack
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "3 0 7 4 1 8 5 2 9 6")
  end

  test "third sample works" do
    input = """
      deal with increment 7
      deal with increment 9
      cut -2
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "6 3 0 7 4 1 8 5 2 9")
  end

  test "fourth sample works" do
    input = """
      deal into new stack
      cut -2
      deal with increment 7
      cut 8
      cut -4
      deal with increment 7
      cut 3
      deal with increment 9
      deal with increment 3
      cut -1
    """

    parsed = Parser.parse(input)
    result = Runner.part_1(parsed, 10)
    to_test = (0..9) |> Enum.map(&(Map.fetch!(result, &1))) |> Enum.join(" ")
    assert(to_test == "9 2 5 8 1 4 7 0 3 6")
  end
end
