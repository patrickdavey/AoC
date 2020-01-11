defmodule AOC.Runner do
  def part_1(input \\ structured_data) do
    input
    |> AOC.Orbiter.calculate
    |> Map.values
    |> Enum.map(fn({dist, _path}) -> dist end)
    |> Enum.sum
  end

  def part_2(input \\ structured_data) do
    paths =  input |> AOC.Orbiter.calculate
    {_dist, [you | you_rest] } = Map.get(paths, "YOU")
    {_dist, [san | san_rest] } = Map.get(paths, "SAN")

    comm = Enum.find(you_rest, &(Enum.member?(san_rest, &1)))
    Enum.find_index(you_rest, &(&1 == comm)) + Enum.find_index(san_rest, &(&1 == comm))
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
