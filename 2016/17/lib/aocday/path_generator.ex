defmodule AOCDay.PathGenerator do
  alias AOCDay.PathChecker

  def available_from(string, current_position) do
    PathChecker.possible(string)
    |> Enum.map(&(next_position(&1, current_position, string)))
    |> Enum.filter(&allowed?/1)
  end

  defp next_position("U", {x, y}, string), do: {string <> "U", {x, y - 1}}
  defp next_position("D", {x, y}, string), do: {string <> "D", {x, y + 1}}
  defp next_position("L", {x, y}, string), do: {string <> "L", {x - 1, y}}
  defp next_position("R", {x, y}, string), do: {string <> "R", {x + 1, y}}

  defp allowed?({_, {x, y}}) when x in (0..3) and y in(0..3), do: true
  defp allowed?(_), do: false
end
