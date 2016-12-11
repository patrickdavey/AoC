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

  defp check([%Layout{floor_0: [], floor_1: [], floor_2: [], steps: steps} | t], _) do
    answer = steps
    |> Enum.count
    |> Kernel.-(1)

    answer
    |> IO.puts

    answer
  end

  defp check([], _), do: raise "nope"

  defp check([state |t], visited) do
    edges = LayoutGenerator.nodes(state)
            |> Enum.filter(&(not_visited_yet?(visited, &1)))

    visited = Enum.reduce(edges, visited, fn(x, acc) ->
      MapSet.put(acc, Map.delete(x, :steps))
    end)

    new_list = t ++ edges
    |> Enum.sort_by(&fancy_sort/1)
    |> Enum.reverse

    check(new_list, visited)
  end

  def fancy_sort(layout) do
    (layout.steps |> Enum.count) +
    (layout.floor_1 |> Enum.count) * 1.5 +
    (layout.floor_2 |> Enum.count) * 1.7 +
    (layout.floor_3 |> Enum.count) * 3
  end

  defp not_visited_yet?(mapset, struct) do
    struct = Map.delete(struct, :steps)
    MapSet.member?(mapset, struct) == false
  end

end

# procedure BFS(G,v) is // G is the graph, v is the start node
#       create a queue Q
#       create a vector set V
#       enqueue v onto Q // put v into the queue
#       add v to V // add v to the set of used nodes
#       while Q is not empty loop
#          t ← Q.dequeue() // remove the first element from the queue
#          if t is what we are looking for then
#             return t
#         end if
#         for all edges e in G.adjacentEdges(t) loop
#            u ← G.adjacentVertex(t,e)
#            if u is not in V then
#                add u to V // all nodes connected the current node are
#                enqueue u onto Q // added to the queue and to the set of used nodes
#            end if
#         end loop
#      end loop
#      return none
#  end BFS
