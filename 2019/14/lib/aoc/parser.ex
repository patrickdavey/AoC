defmodule AOC.Parser do
  alias AOC.Reaction

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
    |> Enum.into(%{})
  end

  def formatted(line) do
    [input, output] = line
                      |> String.trim
                      |> String.split(" => ")
    [_, amount, element] = Regex.run(~r/(\d+) ([A-Z]+)/, output)

    dependencies = Regex.scan(~r/(\d+) ([A-Z]+)/, input)
                   |> Enum.map(fn([_, a, e]) ->  {e, a |> String.to_integer} end)

    {element, %Reaction{
      quantity: amount |> String.to_integer,
      dependencies: dependencies
    }}
  end
end
