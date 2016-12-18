defmodule AOCDay.RowGeneratorTest do
  use ExUnit.Case
  alias AOCDay.RowGenerator

  test "correctly finds next tiles for positions" do
    previous_row = String.graphemes("..^^.")
    row = RowGenerator.next_row(previous_row)
    assert row |> Enum.join == ".^^^^"

    row = RowGenerator.next_row(row)
    assert row |> Enum.join == "^^..^"
  end
end
