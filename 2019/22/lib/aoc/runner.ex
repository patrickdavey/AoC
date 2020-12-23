defmodule AOC.Runner do
  def part_1(instructions \\ structured_data(), deck_size \\ 10007) do
    size = deck_size - 1
    foo = (0..size)
    |> Enum.map(&({&1, &1}))
    |> Enum.into(%{})
    |> process_instruction(size, instructions)
  end

  defp process_instruction(deck, _deck_size, []), do: deck

  defp process_instruction(deck, size, [{ :deal_with_increment, increment } | t]) do
    (0..size)
    |> Enum.reduce({%{}, 0}, fn(i, {acc, current}) ->
      acc = Map.put(acc, current, Map.get(deck, i))
      next_position = Integer.mod((current + increment), size + 1)
      { acc , next_position }
    end)
    |> elem(0)
    |> process_instruction(size, t)
  end

  defp process_instruction(deck, size, [{ :deal_into_new_stack } | t]) do
    (0..size)
    |> Enum.reduce(%{}, fn(i, acc) ->
      Map.put(acc, i, Map.fetch!(deck, size - i))
    end)
    |> process_instruction(size, t)
  end

  defp process_instruction(deck, size, [{ :cut, amount } | t]) when amount > 0 do
    (0..size)
    |> Enum.reduce(%{}, fn(i, acc) ->
      cond do
        i < amount ->
          index = size - amount + 1 + i
          Map.put(acc, index, Map.fetch!(deck, i))
        true ->
          index = i - amount
          Map.put(acc, index, Map.fetch!(deck, i))
      end
    end)
    |> process_instruction(size, t)
  end

  defp process_instruction(deck, size, [{ :cut, amount } | t]) when amount < 0 do
    (0..size)
    |> Enum.reduce(%{}, fn(i, acc) ->
      cond do
        i < abs(amount) ->
          index = size + amount + 1 + i
          Map.put(acc, i, Map.fetch!(deck, index))
        true ->
          index = i + amount
          Map.put(acc, i, Map.fetch!(deck, index))
      end
    end)
    |> process_instruction(size, t)
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
