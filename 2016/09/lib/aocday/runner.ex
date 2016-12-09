defmodule AOCDay.Runner do
  def part_2 do
    File.read!("./input.txt")
    |> AOCDay.Decompress.expand_length
    |> IO.puts
  end
end
