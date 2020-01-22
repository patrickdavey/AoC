defmodule AOC.Evolution do
  def next(state) do
    for x <- (0..4), y <- (0..4) do
      positions_around({x, y}, state)
      |> next_for(Map.fetch!(state, {x, y}), {x, y})
    end |> Enum.into(%{})
  end

  defp positions_around({x, y}, state) do
    [
      Map.get(state, {x - 1, y}, :empty),
      Map.get(state, {x + 1, y}, :empty),
      Map.get(state, {x, y - 1}, :empty),
      Map.get(state, {x, y + 1}, :empty),
    ]
  end

  defp next_for(surrounds, :empty, position) do
    number_of_bugs = surrounds |> Enum.filter(&(&1 == :bug)) |> length

    cond do
      number_of_bugs == 1 || number_of_bugs == 2 ->
        { position, :bug }
      true ->
        { position, :empty }
    end
  end

  defp next_for(surrounds, :bug, position) do
    number_of_bugs = surrounds |> Enum.filter(&(&1 == :bug)) |> length

    cond do
      number_of_bugs == 1 ->
        { position, :bug }
      true ->
        { position, :empty }
    end
  end
end
