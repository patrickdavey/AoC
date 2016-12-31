defmodule AOCDay.BFS do
  alias AOCDay.State
  alias AOCDay.MapGenerator

  def shortest_path(a, b) do
    solve(a, b)
  end

  def solve({x1, y1}, {x2, y2}) do
    state = %State{x: x1, y: y1, steps: [{x1,y1}]}
    visited = MapSet.new
    visited = MapSet.put(visited, {x1, y1})
    queue = [state]
    check(queue, visited, {x2, y2})
  end

  defp check([%State{x: x, y: y, steps: steps} | _t], visited, wanted = {x, y}) do
    steps
    |> Enum.count
    |> Kernel.-(1)
  end

  defp check([], _, _, _, _), do: raise "nope"

  defp check([state |t], visited, wanted) do
    states = state
            |> MapGenerator.nodes
            |> Enum.filter(&(not_visited_yet?(visited, &1)))
    visited = Enum.reduce(states, visited, fn(%State{x: x, y: y }, acc) ->
      MapSet.put(acc, {x, y})
    end)
    check(t ++ states, visited, wanted)
  end

  defp not_visited_yet?(mapset, %State{x: x, y: y}) do
    MapSet.member?(mapset, {x, y}) == false
  end
end
