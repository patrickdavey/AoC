defmodule AOC.Runner do
  @pattern [0, 1, 0, -1]
  def part_1(iterations, inputs \\ structured_data()) do
    offsets = calculate_offsets(inputs |> length)

    calculate(inputs, offsets, iterations)
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp calculate_offsets(length) do
    Enum.map(1..length, fn(index) ->
      List.duplicate(@pattern, index) |> Enum.zip |> Enum.map(&(Tuple.to_list/1)) |> List.flatten |> Stream.cycle |> Enum.take(length + 1) |> List.delete_at(0)
    end)
  end

  defp calculate(inputs, offset, 0) do
    inputs |> Enum.join |> String.to_integer
  end

  defp calculate(inputs, offsets, n) do
    Enum.map(offsets, fn(o) ->
      Enum.zip(inputs, o) |> Enum.map(fn({a, b}) -> a * b end) |> Enum.sum |> abs |> Integer.digits |> List.last
    end)
    |> calculate(offsets, n - 1)
  end
end
