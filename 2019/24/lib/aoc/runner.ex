defmodule AOC.Runner do
  alias AOC.{Parser, Evolution, RecursiveEvolution}

  def part_1(input \\ structured_data()) do
    previous_states = %{}

    find_first_match(input, previous_states)
    |> Enum.filter(fn({k, v}) -> v == :bug end)
    |> calculate_biodiversity
  end

  def part_2(input \\ structured_data(), runs \\ 200) do
    run_full_evolution(input, runs)
    |> Map.values
    |> Enum.filter(&(&1 == :bug))
    |> length
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp find_first_match(state, previous) do
    if Map.has_key?(previous, state) do
      state
    else
      find_first_match(Evolution.next(state), Map.put(previous, state, true))
    end
  end

  defp calculate_biodiversity(bugs) do
    bugs
    |> Enum.map(fn({{x, y}, :bug}) ->
      :math.pow(2,(x + y * 5))
    end)
    |> Enum.sum
  end

  defp run_full_evolution(state, 0), do: state
  defp run_full_evolution(state, runs) do
    state
    |> RecursiveEvolution.next
    |> run_full_evolution(runs - 1)
  end
end
