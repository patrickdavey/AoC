defmodule AOCDay.Runner do
  def sum_sector do
    valid_codes
    |> Enum.map(&(&1.sector))
    |> Enum.sum
  end

  def north do
    valid_codes
    |> Enum.map(&AOCDay.Sector.rotated/1)
    |> Enum.filter(fn({w, _i}) -> Regex.match?(~r/northpole/, w) end)
    |> List.first
    |> Kernel.elem(1)
  end

  defp valid_codes do
    AOCDay.Parser.parse
    |> Enum.filter(&(&1.checksum == &1.first_five))
  end
end
