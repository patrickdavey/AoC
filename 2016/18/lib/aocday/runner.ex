defmodule AOCDay.Runner do
  alias AOCDay.RowGenerator

  def part_1 do
    structured_data
    |> List.first
    |> safe_tiles_for(40)
    |> IO.puts
  end

  def part_2 do
    structured_data
    |> List.first
    |> safe_tiles_for(400_000)
    |> IO.puts
  end

  def safe_tiles_for(input, count) do
    String.graphemes(input)
    |> Stream.iterate(&RowGenerator.next_row/1)
    |> Enum.take(count)
    |> List.flatten
    |> Enum.filter(&(&1 == "."))
    |> Enum.count
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
