defmodule AOCDay.Checksum do
  def create!(init) do
    new_string = init
    |> String.graphemes
    |> Enum.chunk(2)
    |> Enum.map(&each_pair/1)
    |> Enum.join

    if rem(String.length(new_string), 2) == 0 do
      create!(new_string)
    else
      new_string
    end
  end

  defp each_pair([a, a]), do: "1"
  defp each_pair(_), do: "0"
end
