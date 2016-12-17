defmodule AOCDay.Runner do
  alias AOCDay.{PathGenerator, Found}
  def shortest_path_for(initial) do
    queue = [{initial, {0,0}}]

    find_shortest_way_out(queue)
    |> String.replace(initial, "")
  end

  def longest_path_for(initial) do
    Found.init
    queue = [{initial, {0,0}}]

    find_longest_way_out(queue)
    |> Kernel.-(String.length(initial))
  end

  defp find_shortest_way_out([]), do: raise "no way out, trapped"
  defp find_shortest_way_out([{string, {3, 3}} | _t]), do: string
  defp find_shortest_way_out([h | t]) do
    possible = PathGenerator.available_from(h)
    queue = t ++ possible
    find_shortest_way_out(queue)
  end

  defp find_longest_way_out([]) do
    Found.current_state
    |> Enum.uniq
    |> Enum.map(&(String.length(&1)))
    |> Enum.max
  end

  defp find_longest_way_out([{string, {3, 3}} | t]) do
    Found.add(string)
    find_longest_way_out(t)
  end

  defp find_longest_way_out([h | t]) do
    possible = PathGenerator.available_from(h)
    queue = t ++ possible
    find_longest_way_out(queue)
  end
end
