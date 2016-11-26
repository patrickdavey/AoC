defmodule Day2.Runner do
  alias Day2.Box
  alias Day2.Dimensions

  def run do
    {:ok, binary} = File.read("./input.txt")

    boxes = binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(line) -> String.split(line, "x") end)
    |> Enum.map(fn(line) -> Enum.map(line, &String.to_integer/1) end)
    |> Enum.map(&parse/1)

    wrapping = boxes
             |> Enum.map(&Dimensions.wrapping/1)
             |> Enum.reduce(&+/2)
    IO.puts "wrapping required: #{wrapping}"

    ribbon = boxes
             |> Enum.map(&Dimensions.ribbon/1)
             |> Enum.reduce(&+/2)
    IO.puts "ribbon required: #{ribbon}"
  end

  def parse([length, width, height] = _line) do
    %Box{length: length, width: width, height: height}
  end
end

