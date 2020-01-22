defmodule AOC.Scaffold do
  alias AOC.Board

  def sum_crossings(camera_info) do
    camera_info
    |> Map.keys
    |> Enum.filter(&(is_crossing?(&1, camera_info)))
    |> Enum.map(fn({a, b}) -> a * b end)
    |> Enum.sum
  end

  defp is_crossing?({x, y}, camera_info) do
    Regex.match?(~r/(scaffold|robot)/, Map.get(camera_info, {x - 1, y}, "empty") |> to_string) &&
    Regex.match?(~r/(scaffold|robot)/, Map.get(camera_info, {x + 1, y}, "empty") |> to_string) &&
    Regex.match?(~r/(scaffold|robot)/, Map.get(camera_info, {x, y + 1}, "empty") |> to_string) &&
    Regex.match?(~r/(scaffold|robot)/, Map.get(camera_info, {x, y - 1}, "empty") |> to_string) &&
    Regex.match?(~r/(scaffold|robot)/, Map.get(camera_info, {x, y}) |> to_string)
  end
end
