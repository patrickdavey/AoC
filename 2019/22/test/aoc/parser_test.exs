defmodule AOCParserTest do
  use ExUnit.Case
  alias AOC.{Parser, Reaction}

  test "initial config works" do
    parsed = Parser.parse(
      """
        deal with increment 65
        deal into new stack
        cut -6735
        cut 123
      """)
    assert(parsed == [
      { :deal_with_increment, 65 },
      { :deal_into_new_stack },
      { :cut, -6735 },
      { :cut, 123 },
    ])
  end
end
