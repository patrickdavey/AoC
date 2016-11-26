defmodule Day2.Dimensions do
  alias Day2.Box

  def wrapping(%Box{length: length, width: width, height: height}) do
    areas = [ length * width , length * height, width * height]
    (Enum.reduce(areas, &+/2) * 2) + Enum.min(areas)
  end

  def ribbon(%Box{length: length, width: width, height: height}) do
    perim = (Enum.sort([length, width, height]) |> Enum.take(2) |> Enum.reduce(&+/2)) * 2
    volume = length * width * height
    perim + volume
  end
end
