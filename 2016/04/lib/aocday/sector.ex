defmodule AOCDay.Sector do
  def letters(%{code: code, sector: sector, checksum: checksum}) do
    ls = Regex.scan(~r/[a-z]/, code) |> Enum.sort

    freq = Enum.reduce(ls, %{}, fn([l], acc) ->
      num = acc[l] || 0
      num = num + 1
      Map.put(acc, l, num)
    end)
    sorted = freq
    |> Map.to_list
    |> Enum.group_by(fn({_k, v}) -> v end)
    |> Enum.sort
    |> Enum.reverse
    |> Enum.map(fn({_k, ls}) ->
      ls |> Enum.map(fn({l,_}) -> l end)
    end)
    |> Enum.join
    |> String.graphemes
    |> Enum.take(5)
    |> Enum.join

    cond do
      sorted == checksum -> sector
      :otherwise -> false
    end
  end

  def rotated(%{code: code, sector: sector, checksum: checksum}) do
    rotate = rem(sector, 26)
    ls = Regex.scan(~r/[a-z-]/, code)
    |> Enum.map(fn([l]) ->
      cond do
        l == "-" -> " "
        :otherwise ->
          [i] = to_charlist(l)
          i = i - ?a
          n = rem((i + rotate),26)
          to_string([n + ?a])
      end

    end)
    |> Enum.join
    { ls, sector }
  end
end

