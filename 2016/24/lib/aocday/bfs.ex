defmodule AOCDay.BFS do
  alias AOCDay.State
  alias AOCDay.MapGenerator
  alias AOCDay.Board

  def shortest_path(a, b, map) do
    solve(a, b, map)
  end

  def solve({x1, y1}, {x2, y2}, map) do
    state = %State{x: x1, y: y1, steps: 0}
    visited = MapSet.new
    visited = MapSet.put(visited, {x1, y1})
    queue = [state]
    check(queue, visited, {x2, y2}, map)
  end

  defp check([%State{x: x, y: y, steps: steps} | _t], visited, wanted = {x, y}, _map) do
    steps
  end

  defp check([], _, _, _, _, _), do: raise "nope"

  defp check([state |t], visited, wanted, board) do
    states = state
            |> MapGenerator.nodes(board)
            |> Enum.filter(&(not_visited_yet?(visited, &1)))
    visited = Enum.reduce(states, visited, fn(%State{x: x, y: y }, acc) ->
      MapSet.put(acc, {x, y})
    end)
    check(t ++ states, visited, wanted, board)
  end

  defp not_visited_yet?(mapset, %State{x: x, y: y}) do
    MapSet.member?(mapset, {x, y}) == false
  end
end
