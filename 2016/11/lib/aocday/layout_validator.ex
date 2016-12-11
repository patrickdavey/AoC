defmodule AOCDay.LayoutValidator do
  alias AOCDay.Layout

  def valid?(%Layout{elevator: e}) when e > 3, do: false
  def valid?(%Layout{elevator: e}) when e < 0, do: false
  def valid?(layout) do
    [:floor_0, :floor_1, :floor_2, :floor_3]
    |> Enum.map(&(Map.fetch!(layout, &1)))
    |> Enum.all?(&floor_valid?/1)
  end

  defp floor_valid?([]), do: true
  defp floor_valid?(floor) do
    t = floor
    |> Enum.reject(&(has_pair?(&1, floor)))
    |> Enum.join
    |> check
  end

  defp check(""), do: true
  defp check(s) do
    Regex.match?(~r/M.*G/, s) == false && Regex.match?(~r/G.*M/, s) == false
  end

  defp safe?(item, []), do: true
  defp safe?(<<element::binary-size(1), "M"::binary>>, others) do
    require IEx
    IEx.pry
  end
  defp safe?(item, _), do: false

  defp has_pair?(<<element::binary-size(1), "M"::binary>>, others) do
    Enum.member?(others, element <> "G")
  end
  defp has_pair?(<<element::binary-size(1), "G"::binary>>, others) do
    Enum.member?(others, element <> "M")
  end
  defp has_pair?(_,_), do: false
end
