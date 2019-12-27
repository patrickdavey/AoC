defmodule AOC.Calculator do
  def calculate(input) do
    input
    |> Kernel./(3)
    |> Float.floor
    |> Kernel.trunc
    |> Kernel.-(2)
  end

  def full_calculate(input) do
    _full_calculate(calculate(input), [])
  end

  defp _full_calculate(input, acc) when input <= 0 do
    acc |> Enum.sum
  end

  defp _full_calculate(input, acc) do
    _full_calculate(calculate(input), [input | acc])
  end
end
