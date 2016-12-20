defmodule AOCDay.Runner do
  def part_1 do
    s = structured_data

    Stream.iterate(0, &(&1+1))
    |> Stream.drop_while(fn(i) -> Enum.any?(s, &(Enum.member?(&1, i))) end)
    |> Enum.take(1)
    |> Enum.at(0)
    |> Integer.to_string
  end

  def part_2 do
    t = structured_data
    |> Enum.chunk(2, 1)
    g = t |> Enum.map(&gap/1)
    require IEx
    IEx.pry
    #|> Enum.sum
  end

  defp structured_data do
    AOCDay.Parser.parse
    |> Enum.sort_by(fn(a..b) -> a end)
  end

  defp gap([(a..b), (c..d)]) do
    (c - b) - 1
  end
end

# [0, 0, 0, 0, 0, 1, 1, 2587847, 1, 0, 1, 2794942, 1, -14181751, 4251014,
#  -15171036, 15059092, 1, 1, -19822412, 18928070, 1, 0, 1, -6409100, 3603210, 1,
#  0, 1, 1, 1, 1, 0, 1, 0, -5126178, 5080910, 0, 1, 18952842, 1, 1, 1, 235330, 1,
#  -20075397, 12938285, 0, -26699189, 10177324, ...]
