defmodule AOC.Parser do
  def parse(width, height) do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary, width, height)
  end

  def parse(binary, width, height) do
    _parse(binary, width, height)
  end

  defp _parse(binary, width, height) do
    binary
    |> String.trim
    |> String.graphemes
    |> Enum.map(&(String.to_integer/1))
    |> Enum.chunk_every(width * height)
  end

  def formatted(line) do
    line
  end
end
