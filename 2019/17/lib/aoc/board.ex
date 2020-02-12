defmodule AOC.Board do
  @pieces %{
    :scaffold => "#",
    :empty => ".",
    :robot_up => "^",
    :robot_down => "v",
    :robot_left => "<",
    :robot_right => ">",
    :robot_dead => "X",
  }

  def print(board) do
    if (board |> Map.keys |> length > 5) do

      {min_x, min_y, max_x, max_y} = get_dimensions(board)

      b = Enum.map(min_y..max_y, &(get_row(&1, board, min_x, max_x)))
      |> Enum.join("\n")
      IO.puts("\n\n#{b}\n\n")
    end

    board
  end


  defp get_dimensions(board) do
    keys = board |> Map.keys |> Enum.map(&([elem(&1, 0), elem(&1, 1)]))
    {min_x, max_x} = keys |> Enum.map(fn([a, _]) -> a end) |> Enum.min_max
    {min_y, max_y} = keys |> Enum.map(fn([_, a]) -> a end) |> Enum.min_max
    {min_x, min_y, max_x, max_y}
  end

  defp get_row(y, board, min_x, max_x) do
    Enum.map(min_x..max_x, &(Map.get(board, {&1,y}, 0)))
    |> Enum.map(&(Map.fetch!(@pieces, &1)))
    |> Enum.join("")
  end
end
