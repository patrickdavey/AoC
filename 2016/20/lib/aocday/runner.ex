defmodule AOCDay.Runner do
  def part_1 do
    s = structured_data
    Stream.iterate(0, &(&1+1))
    |> Stream.drop_while(fn(i) -> Enum.any?(s, &(Enum.member?(&1, i))) end)
    |> Enum.take(1)
    |> Enum.at(0)
    |> Integer.to_string
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse |> Enum.sort
  end
end
