defmodule AOC.Parser do
  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    binary
    |> String.trim
    |> String.split("\n")
    |> Enum.reduce(%{}, &formatted/2)
  end

  def formatted(line, acc) do
    [parent, child] = line |> String.trim |> String.split(")")
    Map.update(acc, parent, [child], &([child | &1]))
  end
end
