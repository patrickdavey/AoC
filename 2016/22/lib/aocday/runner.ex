defmodule AOCDay.Runner do
  def part_1 do
    s = structured_data
    c = combinations
    m = Enum.map(c, fn([pos1, pos2]) ->
      {size1, used1, avail1} = Map.get(s, pos1)
      {size2, used2, avail2} = Map.get(s, pos2)
      if ((used1 < avail2) && used1 != 0) || ((used2 < avail1) && used2 != 0) do
        1
      else
        0
      end
    end)
    |> Enum.sum

  require IEx
  IEx.pry

    "part 1"
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  defp combinations do
    CombinePermute.comb(2, coordinate_pairs)
  end

  defp coordinate_pairs do
    for x <- (0..37), y <- (0..27), do:  {x, y}
  end
end

defmodule CombinePermute do
  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end

  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end
end
