defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner
  alias AOCDay.Parser
  alias AOCDay.Disc

  test "test input correctly moves on" do
    disks = [
      %Disc{number: 1, positions: 5, position: 4},
      %Disc{number: 2, positions: 2, position: 1}
    ]

    assert Runner.updated_disks(disks) == [
      %Disc{number: 1, positions: 5, position: 0},
      %Disc{number: 2, positions: 2, position: 0}
    ]
  end

  test "finds correct sample answer" do
    disks = [
      %Disc{number: 1, positions: 5, position: 4},
      %Disc{number: 2, positions: 2, position: 1}
    ]
    Application.put_env(:aoc, :start_disks, disks)
    assert Runner.find_time == 5
  end
end
