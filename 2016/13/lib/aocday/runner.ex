defmodule AOCDay.Runner do
  alias AOCDay.Board
  alias AOCDay.State
  alias AOCDay.CoordinateChecker
  alias AOCDay.MapGenerator

  def part_1 do
    Application.put_env(:aoc, :width, 100)
    Application.put_env(:aoc, :height, 100)
    Application.put_env(:aoc, :input, 1352)
    shortest_path
  end

  def shortest_path do
    Board.init
    Board.populate_initial
    Board.set(1, 1, "#")
    map = Board.current_state

    state = %State{x: 1, y: 1, steps: [{1,1}]}
    visited = MapSet.new
    visited = MapSet.put(visited, {1, 1})
    queue = [state]
    check(queue, visited)
  end

  defp check([%State{x: 31, y: 39, steps: steps} | t], visited) do
    steps
    |> Enum.count
    |> Kernel.-(1)
  end

  defp check([], _), do: raise "nope"

  defp check([state |t], visited) do
    states = state
            |> MapGenerator.nodes
            |> Enum.filter(&(not_visited_yet?(visited, &1)))

    visited = Enum.reduce(states, visited, fn(%State{x: x, y: y }, acc) ->
      MapSet.put(acc, {x, y})
    end)
    check(t ++ states, visited)
  end

  defp not_visited_yet?(mapset, %State{x: x, y: y}) do
    MapSet.member?(mapset, {x, y}) == false
  end
end
