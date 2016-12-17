defmodule PathCheckerTest do
  use ExUnit.Case
  alias AOCDay.PathChecker

  test "correctly answers the test data" do
    assert PathChecker.possible("hijkl") == ["U", "D", "L"]
  end
end
