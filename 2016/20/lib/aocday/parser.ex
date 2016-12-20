defmodule AOCDay.Parser do
  @capture ~r/(?<letters>\D+)(?<sector>\d+)\[(?<check>\w+)\]/

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
    |> Enum.map(&formatted/1)
  end

  def formatted(line) do
    [a, b] = line
    |> String.split("-")
    |> Enum.map(&(String.to_integer(&1)))

    a..b
  end
end
