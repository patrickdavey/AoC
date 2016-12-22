defmodule AOCDay.Parser do
  @xy_capture ~r/.*x(?<x>\d+)-y(?<y>\d+)$/
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
    |> Enum.reduce(%{}, &into_map/2)
  end

  def formatted(line) do
    [position, size, used, available, _] = String.split(line)
    size = String.replace(size, "T", "") |> String.to_integer
    used = String.replace(used, "T", "") |> String.to_integer
    available = String.replace(available, "T", "") |> String.to_integer
    captures = Regex.named_captures(@xy_capture, position)
    x = captures["x"] |> String.to_integer
    y = captures["y"] |> String.to_integer
    { {x, y}, size, used, available}
  end

  defp into_map({pos, size, used, available}, acc) do
    Map.put(acc, pos, {size, used, available})
  end
end
