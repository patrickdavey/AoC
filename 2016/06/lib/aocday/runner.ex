defmodule AOCDay.Runner do
  def part_1 do
    File.read!("./input.txt")
    |> AOCDay.ErrorCorrector.message
    |> IO.puts
  end

  def part_2 do
    File.read!("./input.txt")
    |> AOCDay.ErrorCorrector.message
    |> IO.puts
  end

end
