defmodule AOC.Parser do
  alias AOC.Trace
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
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.with_index
    |> Enum.map(fn({line, index}) ->
      Enum.map(line, fn(e) -> formatted(e, index) end)
    end)
  end

  def formatted(element, index) do
    match = Regex.named_captures(~r/(?<dir>[UDLR])(?<length>\d+)/, element)

    %Trace{
      dir: match["dir"],
      length: String.to_integer(match["length"]),
      trace_id: index
    }
  end
end
