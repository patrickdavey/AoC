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
    |> Enum.with_index
    |> Enum.map(&formatted/1)
    |> List.flatten
    |> Enum.into(%{})
  end

  def formatted({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(&(to_tuple(&1, y)))
  end

  defp to_tuple({".", x}, y), do: {{x, y, 0}, :empty}
  defp to_tuple({"#", x}, y), do: {{x, y, 0}, :bug}
end
