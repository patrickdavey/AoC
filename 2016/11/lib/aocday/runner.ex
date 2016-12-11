defmodule AOCDay.Runner do
  alias AOCDay.Layout
  alias AOCDay.LayoutGenerator

  def shortest_path(layout) do
    AOCDay.Visited.init
    queue = []
    queue = List.insert_at(queue, -1, layout)
    check(queue, 1)
  end

  defp check([%Layout{floor_0: [], floor_2: [], floor_3: []} | t], steps), do: steps
  defp check(queue = [state |t], steps) do
    edges = LayoutGenerator.nodes(state)
    check(t ++ edges, 1)
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
