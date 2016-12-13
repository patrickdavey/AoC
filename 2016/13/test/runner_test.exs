defmodule RunnerTest do
  use ExUnit.Case
  alias AOCDay.Runner

  test "" do
    Application.put_env(:aoc, :width, 10)
    Application.put_env(:aoc, :height, 7)
    Application.put_env(:aoc, :input, 10)
    assert Runner.shortest_path == 11
  end
end
