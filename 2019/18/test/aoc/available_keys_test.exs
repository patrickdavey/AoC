defmodule AOCAvailableKeysTest do
  use ExUnit.Case
  alias AOC.{AvailableKeys, Parser}

  test "first sample runs correctly" do
    first = """
       #########
       #b.A.@.a#
       #########
    """
    assert(AvailableKeys.available_from(Parser.parse(first), [], {5, 1}) == [{"a", 2, {7, 1}}])
  end

  test "first sample with open doors runs correctly" do
    first = """
       #########
       #b.A.@..#
       #########
    """
    assert(AvailableKeys.available_from(Parser.parse(first), ["a"], {5, 1}) == [{"b", 4, {1, 1}}])
  end


  test "patrick test 1" do
    first = """
       #########
       #A.b.@.a#
       #########
    """
    assert(AvailableKeys.available_from(Parser.parse(first), [], {5, 1}) == [{"a", 2, {7, 1}}, {"b", 2, {3, 1}}])
  end

  test "only shows first level keys" do
    first = """
       #########
       #dcb.@.a#
       #########
    """
    assert(AvailableKeys.available_from(Parser.parse(first), [], {5, 1}) == [{"a", 2, {7, 1}}, {"b", 2, {3, 1}}])
  end

  test "patrick test 2" do
    first = """
       #################
       #i.G..c...e..H.p#
       ########.########
       #j.A..b...f..D.o#
       ########@########
       #k.E..a...g..B.n#
       ########.########
       #l.F..d...h..C.m#
       #################
    """
    assert(AvailableKeys.available_from(Parser.parse(first), [], {8, 4}) |> Enum.sort == [{"a", 3, {6, 5}}, {"b", 3, {6, 3}}, {"c", 5, {6, 1}}, {"d", 5, {6, 7}}, {"e", 5, {10, 1}}, {"f", 3, {10, 3}}, {"g", 3, {10, 5}}, {"h", 5, {10, 7}}])
  end
end
