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
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.into(%{}, fn { i, j } -> { j, i } end)
  end

  def parse_2(binary) do
    foo = binary
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

  def parse_2 do
    {:ok, binary} = File.read("./input2.txt")
    parse_2(binary)
  end

  defp to_tuple({".", x}, y), do: {{x, y}, 1}
  defp to_tuple({"#", x}, y), do: {{x, y}, 0}
  defp to_tuple({"O", x}, y), do: {{x, y}, 2}
end
