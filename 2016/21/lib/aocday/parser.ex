defmodule AOCDay.Parser do
  @rotate_capture ~r/rotate (?<dir>(left|right)) (?<amount>\d+) steps/
  @rotate_letter ~r/rotate based on position of letter (?<letter>[a-z])/

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
    line
  end
end
