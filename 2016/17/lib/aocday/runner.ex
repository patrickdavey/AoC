defmodule AOCDay.Runner do
  alias AOCDay.PathGenerator
  def shortest_path_for(string) do
    queue = [{string, {0,0}}]

    find_way_out(queue)
    |> String.replace(string, "")
  end

  defp find_way_out([]), do: raise "no way out, trapped"
  defp find_way_out([{string, {3, 3}} | t]), do: string
  defp find_way_out([h | t]) do
    possible = PathGenerator.available_from(h)
    queue = t ++ possible
    find_way_out(queue)
  end
end
