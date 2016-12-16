defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "initial data encodes correctly" do
    assert Runner.part_1("10000", 20) == "01100"
  end
end
