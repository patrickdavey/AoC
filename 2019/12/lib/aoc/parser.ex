defmodule AOC.Parser do
  alias AOC.{Point, Velocity}
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
    match = Regex.named_captures(~r/<x=(?<x>[-\d]+), y=(?<y>[-\d]+), z=(?<z>[-\d]+)>/, line)
    {
      %Point{
      x: match["x"] |> String.to_integer,
      y: match["y"] |> String.to_integer,
      z: match["z"] |> String.to_integer
    },
      %Velocity{
      vx: 0,
      vy: 0,
      vz: 0
      }
    }
  end
end
