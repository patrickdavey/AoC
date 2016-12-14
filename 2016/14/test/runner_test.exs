defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "correctly finds first key" do
    Application.put_env(:aoc, :num_hashes, 1)
    Application.put_env(:aoc, :salt, "abc")
    assert 22728 = Runner.part_1

    Application.put_env(:aoc, :salt, "zpqevtbw")
    assert 16106 = Runner.part_1
  end
end
