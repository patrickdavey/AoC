defmodule AOCDay.Parser do
  @column_match ~r/rotate column x=(?<col>\d+) by (?<amount>\d+)/
  @row_match ~r/rotate row y=(?<row>\d+) by (?<amount>\d+)/
  @rect_match ~r/rect (?<x>\d+)x(?<y>\d+)/

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
    |> Enum.map(&matched/1)
  end

  def matched(line) do
    cond do
      match = Regex.named_captures(@column_match, line) ->
          %{
            action: "column",
            column: String.to_integer(match["col"]),
            amount: String.to_integer(match["amount"])
          }
      match = Regex.named_captures(@rect_match, line) ->
          %{
            action: "rect",
            x: String.to_integer(match["x"]),
            y: String.to_integer(match["y"])
          }
      match = Regex.named_captures(@row_match, line) ->
          %{
            action: "row",
            row: String.to_integer(match["row"]),
            amount: String.to_integer(match["amount"])
          }
    end
  end
end
