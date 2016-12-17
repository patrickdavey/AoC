defmodule PathGeneratorTest do
  use ExUnit.Case
  alias AOCDay.PathGenerator

  test "correctly finds the available next positions from a point" do
    assert PathGenerator.available_from("hijkl", {0, 0}) == [{"hijklD", {0, 1}}]

    assert PathGenerator.available_from("hijklD", {0, 1}) == [{"hijklDU", {0, 0}}, {"hijklDR", {1, 1}}]

    assert PathGenerator.available_from("hijklDR", {1, 1}) == []
  end
end
