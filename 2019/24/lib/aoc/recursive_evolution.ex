defmodule AOC.RecursiveEvolution do
  def next(state) do
    state
    |> Enum.filter(fn({_k, v}) -> v == :bug end)
    |> Enum.map(fn({k, _v}) -> k end)
    |> Enum.map(&(find_points_bordering(&1)))
    |> List.flatten
    |> Enum.map(fn(point) -> next_for(point, state) end)
    |> Enum.into(%{})
  end

  defp next_for(point, state) do
    point
    |> find_points_bordering
    |> next_state_for(point, state, Map.get(state, point, :empty))
  end

  defp next_state_for(surrounds, point, state, :empty) do
    number_of_bugs = Enum.map(surrounds, &(Map.get(state, &1, :empty)))
                  |> Enum.filter(&(&1 == :bug))
                  |> length
    cond do
      number_of_bugs == 1 || number_of_bugs == 2 ->
        { point, :bug }
      true ->
        { point, :empty }
    end
  end

  defp next_state_for(surrounds, point, state, :bug) do
    number_of_bugs = Enum.map(surrounds, &(Map.get(state, &1, :empty)))
                  |> Enum.filter(&(&1 == :bug))
                  |> length

    cond do
      number_of_bugs == 1 ->
        { point, :bug }
      true ->
        { point, :empty }
    end
  end

  defp find_points_bordering({0, 0, level}) do
    [
      {1, 0, level},
      {0, 1, level},
      {2, 1, level + 1},
      {1, 2, level + 1},
    ]
  end

  defp find_points_bordering({1, 0, level}) do
    [
      {0, 0, level},
      {1, 1, level},
      {2, 0, level},
      {2, 1, level + 1},
    ]
  end

  defp find_points_bordering({2, 0, level}) do
    [
      {1, 0, level},
      {2, 1, level},
      {3, 0, level},
      {2, 1, level + 1},
    ]
  end

  defp find_points_bordering({3, 0, level}) do
    [
      {2, 0, level},
      {3, 1, level},
      {4, 0, level},
      {2, 1, level + 1},
    ]
  end

  defp find_points_bordering({4, 0, level}) do
    [
      {3, 0, level},
      {4, 1, level},
      {2, 1, level + 1},
      {3, 2, level + 1},
    ]
  end

  defp find_points_bordering({0, 1, level}) do
    [
      {0, 0, level},
      {1, 1, level},
      {0, 2, level},
      {1, 2, level + 1},
    ]
  end

  defp find_points_bordering({1, 1, level}) do
    [
      {0, 1, level},
      {1, 0, level},
      {2, 1, level},
      {1, 2, level},
    ]
  end

  defp find_points_bordering({2, 1, level}) do
    [
      {1, 1, level},
      {2, 0, level},
      {3, 1, level},
      {0, 0, level - 1},
      {1, 0, level - 1},
      {2, 0, level - 1},
      {3, 0, level - 1},
      {4, 0, level - 1},
    ]
  end

  defp find_points_bordering({3, 1, level}) do
    [
      {2, 1, level},
      {3, 0, level},
      {4, 1, level},
      {3, 2, level},
    ]
  end

  defp find_points_bordering({4, 1, level}) do
    [
      {3, 1, level},
      {4, 0, level},
      {3, 2, level + 1},
      {4, 2, level},
    ]
  end

  defp find_points_bordering({0, 2, level}) do
    [
      {0, 1, level},
      {1, 2, level},
      {0, 3, level},
      {1, 2, level + 1},
    ]
  end

  defp find_points_bordering({1, 2, level}) do
    [
      {0, 2, level},
      {1, 1, level},
      {1, 3, level},
      {0, 0, level - 1},
      {0, 1, level - 1},
      {0, 2, level - 1},
      {0, 3, level - 1},
      {0, 4, level - 1},
    ]
  end

  defp find_points_bordering({3, 2, level}) do
    [
      {3, 1, level},
      {4, 2, level},
      {3, 3, level},
      {4, 0, level - 1},
      {4, 1, level - 1},
      {4, 2, level - 1},
      {4, 3, level - 1},
      {4, 4, level - 1},
    ]
  end

  defp find_points_bordering({4, 2, level}) do
    [
      {4, 1, level},
      {3, 2, level},
      {4, 3, level},
      {3, 2, level + 1},
    ]
  end

  defp find_points_bordering({0, 3, level}) do
    [
      {0, 2, level},
      {1, 3, level},
      {0, 4, level},
      {1, 2, level + 1},
    ]
  end

  defp find_points_bordering({1, 3, level}) do
    [
      {1, 2, level},
      {2, 3, level},
      {1, 4, level},
      {0, 3, level},
    ]
  end

  defp find_points_bordering({2, 3, level}) do
    [
      {1, 3, level},
      {3, 3, level},
      {2, 4, level},
      {0, 4, level - 1},
      {1, 4, level - 1},
      {2, 4, level - 1},
      {3, 4, level - 1},
      {4, 4, level - 1},
    ]
  end

  defp find_points_bordering({3, 3, level}) do
    [
      {2, 3, level},
      {4, 3, level},
      {3, 4, level},
      {3, 2, level},
    ]
  end

  defp find_points_bordering({4, 3, level}) do
    [
      {3, 3, level},
      {4, 2, level},
      {4, 4, level},
      {3, 2, level + 1},
    ]
  end

  defp find_points_bordering({0, 4, level}) do
    [
      {0, 3, level},
      {1, 4, level},
      {1, 2, level + 1},
      {2, 3, level + 1},
    ]
  end

  defp find_points_bordering({1, 4, level}) do
    [
      {0, 4, level},
      {1, 3, level},
      {2, 4, level},
      {2, 3, level + 1},
    ]
  end

  defp find_points_bordering({2, 4, level}) do
    [
      {1, 4, level},
      {2, 3, level},
      {3, 4, level},
      {2, 3, level + 1},
    ]
  end

  defp find_points_bordering({3, 4, level}) do
    [
      {2, 4, level},
      {3, 3, level},
      {4, 4, level},
      {2, 3, level + 1},
    ]
  end

  defp find_points_bordering({4, 4, level}) do
    [
      {3, 4, level},
      {4, 3, level},
      {2, 3, level + 1},
      {3, 2, level + 1},
    ]
  end
end

