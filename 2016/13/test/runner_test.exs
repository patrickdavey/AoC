defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "" do
    Application.put_env(:aoc, :width, 11)
    Application.put_env(:aoc, :height, 8)
    Application.put_env(:aoc, :input, 10)
    Application.put_env(:aoc, :x_dest, 7)
    Application.put_env(:aoc, :y_dest, 4)
    Application.put_env(:aoc, :max_steps, 20)
    assert Runner.solve(&Runner.shortest_path/2) == 11
  end
end
