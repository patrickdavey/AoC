defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner
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
    Application.put_env(:aoc, :final_position, 2)
    assert Runner.find_time_alignment(disks, 0)
  end
end
