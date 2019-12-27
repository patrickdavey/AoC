defmodule AOC.Calculator do
  def calculate(input) do
    input
    |> Kernel./(3)
    |> Float.floor
    |> Kernel.trunc
    |> Kernel.-(2)
  end
end
