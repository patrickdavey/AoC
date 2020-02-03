defmodule AOC.Runner do
  @pattern [0, 1, 0, -1]
  def part_1(inputs \\ structured_data(), iterations) do
    offsets_per_input = calculate_offsets(inputs |> length)
    require IEx
    IEx.pry


  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp calculate_offsets(length) do
    foo = Enum.map(1..length, fn(index) ->
      List.duplicate(@pattern, index) |> Enum.zip |> Enum.map(&(Tuple.to_list/1)) |> List.flatten |> Stream.cycle |> Enum.take(length + 1) |> List.delete_at(0)
    end)
    require IEx
    IEx.pry
  end
end
