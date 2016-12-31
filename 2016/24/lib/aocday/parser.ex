defmodule AOCDay.Parser do
  alias AOCDay.Board
  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    lines = binary
          |> String.trim
          |> String.split("\n")
    { width, height } = { String.length(Enum.at(lines, 0)), length(lines)}
    Board.init(width, height)

    lines
    |> Enum.with_index
    |> Enum.map(&set_line/1)
    |> List.flatten
    |> Enum.reject(&(&1 == nil))
    |> Enum.reduce(%{}, fn({point, {x, y}}, acc) ->
      Map.put(acc, point, {x, y})
    end)
  end

  defp set_line({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(&(insert_point(&1, y)))
  end

  defp insert_point({map_state, x}, y) when map_state in ["#", "."] do
    Board.set(x, y, map_state)
    nil
  end

  defp insert_point({to_visit, x}, y) do
    Board.set(x, y, ".") #set the point to empty
    {to_visit, {x, y}}
  end

end
