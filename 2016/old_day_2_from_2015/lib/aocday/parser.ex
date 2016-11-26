defmodule AOCDay.Parser do
  alias AOCDay.Box

  def parse do
    {:ok, binary} = File.read("./input.txt")

    binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(line) -> String.split(line, "x") end)
    |> Enum.map(fn(line) -> Enum.map(line, &String.to_integer/1) end)
    |> Enum.map(&parse/1)
  end

  def parse([length, width, height] = _line) do
    %Box{length: length, width: width, height: height}
  end
end
