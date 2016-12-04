defmodule AOCDay.Runner do
  def sum_sector do
    AOCDay.Parser.parse
    |> Enum.map(&(AOCDay.Sector.letters/1))
    |> Enum.filter(&(&1 != false))
    |> Enum.sum
  end

  def north do
    { _, north } = AOCDay.Parser.parse
    |> Enum.map(&(AOCDay.Sector.rotated/1))
    |> Enum.filter(fn({w, _i}) -> Regex.match?(~r/orth/, w) end)
    |> List.first

    north
  end
end
