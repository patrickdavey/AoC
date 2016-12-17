defmodule AOCDay.PathChecker do
  @open_letters ["b", "c", "d", "e", "f"]

  def possible(string) do
    s = :crypto.hash(:md5, string)
    |> Base.encode16(case: :lower)
    |> String.slice(0, 4)
    |> String.graphemes
    |> Enum.map(&letter_check/1)
    |> Enum.zip(["U", "D", "L", "R"])
    |> Enum.filter_map(&only_open/1, fn({_, door}) -> door end)
  end

  defp letter_check(l) when l in @open_letters, do: :open
  defp letter_check(l), do: :closed

  defp only_open({:open, _}), do: true
  defp only_open({:closed, _}), do: false
end
