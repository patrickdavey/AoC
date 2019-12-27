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
    |> Enum.map(&String.to_integer/1)
  end

  def formatted(line) do
    line
  end
end
