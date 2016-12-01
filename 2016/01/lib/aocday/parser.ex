defmodule AOCDay.Parser do
  alias AOCDay.Distance

  def parse("") do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    binary
    |> String.trim
    |> String.split(", ")
    |> Enum.map(fn(dist) -> Regex.named_captures(~r/(?<direction>L|R)(?<length>\d+)/, dist) end)
    |> Enum.map(&to_dist/1)
  end

  defp to_dist(%{"direction" => dir, "length" => len} = _line) do
    %Distance{length: String.to_integer(len), direction: dir}
  end
end
