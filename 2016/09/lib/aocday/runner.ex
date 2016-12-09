defmodule AOCDay.Runner do
  def part_1 do
    File.read!("./input.txt")
    |> AOCDay.Decompress.word_length
    |> IO.puts
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
