defmodule AOCDay.Sector do
  defstruct [:code, :sector, :checksum, :first_five]

  def rotated(%{code: code, sector: sector, checksum: _checksum}) do
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

