defmodule AOCDay.Parser do
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
    |> Enum.map(fn(line) ->
      line
      |> String.trim
      |> String.split(~r/\s+/)
      |> Enum.map(&(String.to_integer/1))
      |> Enum.map(&(abs/1))
    end)
  end
end
