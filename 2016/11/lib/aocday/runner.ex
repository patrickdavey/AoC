defmodule AOCDay.Runner do
  alias AOCDay.Layout
  alias AOCDay.LayoutGenerator

  def shortest_path(layout) do
    visited = MapSet.new
    queue = []
    queue = List.insert_at(queue, -1, layout)
    visited = MapSet.put(visited, Map.delete(layout, :steps))
    check(queue, visited)
  end

  defp check([%Layout{floor_0: [], floor_1: [], floor_2: [], steps: steps} | _t], _) do
    answer = steps
    |> Enum.count
    |> Kernel.-(1)

    answer
    |> IO.puts

    answer
  end

  defp check([], _), do: raise "nope"

  defp check([state |t], visited) do
    edges = state
            |> LayoutGenerator.nodes
            |> Enum.filter(&(not_visited_yet?(visited, &1)))

    visited = Enum.reduce(edges, visited, fn(x, acc) ->
      MapSet.put(acc, Map.delete(x, :steps))
    end)

    new_list = t ++ edges
    |> Enum.sort_by(&fancy_sort/1)

    check(new_list, visited)
  end

  def fancy_sort(layout) do
    (layout.floor_0 |> Enum.count) * 3 +
    (layout.floor_1 |> Enum.count) * 2 +
    (layout.floor_2 |> Enum.count) * 1 +
    (layout.floor_3 |> Enum.count) * 0
  end

  defp not_visited_yet?(mapset, struct) do
    struct = Map.delete(struct, :steps)
    MapSet.member?(mapset, struct) == false
  end
end
