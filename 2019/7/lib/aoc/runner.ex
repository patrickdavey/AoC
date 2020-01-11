defmodule AOC.Runner do
  alias AOC.{Intcode, Input}

  def part_1(program \\ structured_data) do
    Input.start_link([])

    AOC.CombinePermute.permute(Enum.to_list((0..4)))
    |> Enum.map(&(calculate_run(program, &1)))
    |> Enum.max
  end

  defp structured_data do
    AOC.Parser.parse
  end

  def calculate_run(program, inputs) do
    inputs
    |> Enum.reduce(0, fn(phase, acc) ->
      Input.set([phase, acc])

      program
      |> Intcode.execute
      |> Map.fetch!("output")
      |> List.first
    end)
  end
end
