defmodule AOC.Board do
  def print(board) do
    {min_x, min_y, max_x, max_y} = get_dimensions(board)

    Enum.map(min_y..max_y, &(get_row(&1, board, min_x, max_x)))
    |> Enum.join("\n")
  end


  defp get_dimensions(board) do
    keys = board |> Map.keys |> Enum.map(&([elem(&1, 0), elem(&1, 1)]))
    {min_x, max_x} = keys |> Enum.map(fn([a, _]) -> a end) |> Enum.min_max
    {min_y, max_y} = keys |> Enum.map(fn([_, a]) -> a end) |> Enum.min_max
    {min_x, min_y, max_x, max_y}
  end

  defp get_row(y, board, min_x, max_x) do
    Enum.map(min_x..max_x, &(Map.get(board, {&1,y}, 0)))
    |> Enum.map(&(if &1 == 0, do: ".", else: "#"))
    |> Enum.join("")
  end
end
