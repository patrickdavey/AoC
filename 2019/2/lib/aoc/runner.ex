defmodule AOC.Runner do
  alias AOC.Intcode

  def part_1 do
    structured_data
    |> reset_to_error
    |> Intcode.execute
    |> Map.fetch!(0)
  end

  def part_2 do
    noun_verb_options
    |> Enum.find(fn {noun, verb} ->
      structured_data
      |> reset_to_error(noun, verb)
      |> Intcode.execute
      |> Map.fetch!(0)
      |> check_result
    end)
    |> calculate_result
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp reset_to_error(program, noun \\ 12, verb \\ 2) do
    program
    |> Map.put(1, noun)
    |> Map.put(2, verb)
  end

  defp noun_verb_options, do: (for noun <- 0..99, verb <- 0..99 do {noun, verb} end)
  defp check_result(19690720), do: true
  defp check_result(_), do: false
  defp calculate_result({noun, verb}) do
    noun * 100 + verb
  end
end
