defmodule AOCDay.DragonEncoder do
  def encode(string) do
    string
    |> String.reverse
    |> String.graphemes
    |> Enum.map(fn(c) ->
      rem(String.to_integer(c) + 1, 2) |> Integer.to_string
    end)
    |> Enum.join
    |> fn(b) -> "#{string}0#{b}" end.()
  end
end
