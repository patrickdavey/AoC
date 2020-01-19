defmodule AOC.Runner do
  alias AOC.LineOfSight

  def part_1(space \\ structured_data()) do
    space
    |> best_spot
    |> elem(1)
    |> Map.keys
    |> length
  end

  defp best_spot(space) do
    asteroids = asteroids(space)

    asteroids
    |> Enum.map(&({&1, can_view(&1, asteroids)}))
    |> Enum.max_by(fn({point, can_see}) -> can_see |> Map.keys |> length end)
  end



  def part_2(space \\ structured_data()) do
    foo = space
    |> best_spot
    |> elem(1)
    |> Enum.to_list
    |> Enum.sort_by(fn({d, _}) -> d end)
    |> Enum.map(&(elem(&1, 1)))
    |> Enum.map(fn(l) -> Enum.sort_by(l, &(elem(&1,0))) end)
    |> find_200th([])
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp asteroids(space) do
    space
    |> Enum.filter(fn ({_, v}) -> v == :asteroid end)
    |> Enum.map(fn({point, type}) -> point end)
  end

  defp can_view(point, asteroids) do
    asteroids
    |> Enum.map(&(LineOfSight.polar(point, &1)))
    |> Enum.filter(&!is_nil(&1))
    |> Enum.group_by(fn({dist, angle, _}) -> angle end)
  end

  defp find_200th(_, acc) when length(acc) == 200 do
    {x, y} = List.last(acc)
    x * 100 + y
  end

  defp find_200th([h | t], acc) do
    {{_dist, _angle, point }, rest} = List.pop_at(h, 0)
    acc = acc ++ [point]

    if (length(rest) > 0) do
      find_200th(t ++ rest, acc)
    else
      find_200th(t, acc)
    end
  end
end
