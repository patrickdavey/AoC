# lib/aoc/available_keys.ex
defmodule AOC.AvailableKeys do
  def available_from(board, keys, pos, target \\ nil) do
    board = board
      |> Map.put(pos, {:wall, :wall}) # block our current position
      |> open_doors(keys)

    board
      |> next_available(pos)
      |> bfs(board, [], target)
  end

  def can_reach(board, keys, position, target) do
    available_from(board, keys, position, target)
  end

  defp open_doors(board, keys) do
    Enum.reduce(keys, board, fn(key, acc) ->
      find = Enum.find(board, fn({pos, v}) -> v == {:door, key |> String.upcase} end)
      if find do
        {pos, _} = find
        Map.put(acc, pos, {:empty, :empty})
      else
        acc
      end
    end)
  end

  defp next_available(board, {x, y}, distance \\ 1) do
    [{1, 0}, {0, -1}, { -1, 0}, {0, 1}]
    |> Enum.map(fn({x_off, y_off}) ->
      {{x + x_off, y + y_off }, Map.get(board, {x + x_off, y + y_off}, {:wall, :wall}) }
    end)
    |> Enum.filter(fn({a, b}) -> elem(b, 0) != :wall && elem(b, 0) != :door end)
    |> Enum.map(fn({a, b}) -> { a, distance} end)
  end

  defp bfs([], _, acc, _target), do: acc

  defp bfs([{pos, dist}|t], board, acc, target) do
    current = Map.get(board, pos)
    board = Map.put(board, pos, {:wall, :wall}) #close off current position

    cond do
      elem(current, 0) == :key && elem(current, 1) == target ->
        {target, dist, pos}
      elem(current, 0) == :key && target == nil -> bfs(t, board, acc ++ [{elem(current,1), dist, pos}], target)
      elem(current, 0) == :key -> bfs(t, board, nil, target)
      true ->
        t ++ next_available(board, pos, dist + 1)
        |> bfs(board, acc, target)
    end
  end
end
