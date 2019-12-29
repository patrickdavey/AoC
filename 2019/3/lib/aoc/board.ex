defmodule AOC.Board do
  def to_string(board) do
    {{min_x, min_y}, {max_x, max_y}} = get_extents(board)

    for y <- min_y..max_y do
      for x <- min_x..max_x do
        Map.get(board, { x, y }, ["."]) |> print_value
      end |> Enum.join("")
    end |> Enum.join("\n")
  end

  defp get_extents(board) do
    board
    |> Map.keys
    |> Enum.reduce({{0,0},{0,0}}, fn({x, y}, {{min_x, min_y}, {max_x, max_y}}) ->
      {
        {
          Enum.min([x, min_x]),
          Enum.min([y, min_y]),
        },
        {
          Enum.max([x, max_x]),
          Enum.max([y, max_y])
        }
      }
    end)
  end

  defp print_value(["."]), do: "."
  defp print_value([a]), do: "#{a}"
  defp print_value(_), do: "x"
end
