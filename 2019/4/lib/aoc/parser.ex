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
    |> String.split("-")
    |> make_range
  end

  def make_range([low, high]) do
    (String.to_integer(low)..String.to_integer(high))
  end
end
