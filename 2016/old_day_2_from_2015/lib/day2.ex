defmodule Box do
  defstruct [:length, :width, :height]
  @enforce_keys [:length, :width, :height]
end

defmodule Loader do
  def load do
    {:ok, binary} = File.read("./input.txt")

    IO.puts binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(line) -> String.split(line, "x") end)
    |> Enum.map(fn(line) -> Enum.map(line, &String.to_integer/1) end)
    |> Enum.map(&parse/1)
    |> Enum.map(&wrapping_for_box/1)
    |> Enum.reduce(&+/2)
  end

  def parse([length, width, height] = line) do
    %Box{length: length, width: width, height: height}
  end

  defp wrapping_for_box(%Box{length: length, width: width, height: height}) do
    areas = [ length * width , length * height, width * height]
    (Enum.reduce(areas, &+/2) * 2) + Enum.min(areas)
  end
end

defmodule Day2 do

end
