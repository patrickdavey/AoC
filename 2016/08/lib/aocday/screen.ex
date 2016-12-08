defmodule AOCDay.Screen do
  alias AOCDay.AsyncMatrix

  def init(width, height) do
    empty_row = Enum.map 1..width, fn _ -> "." end
    AsyncMatrix.from_list(Enum.map 1..height, fn _ -> empty_row end)
  end

  def update(matrix, %{action: "rect", x: x, y: y}) do
    for i <- 0..(x - 1) do
      for j <- 0..(y - 1) do
        AsyncMatrix.update(matrix, i, j, "x")
      end
    end
  end

  def as_string(matrix) do
    matrix
    |> AsyncMatrix.to_list
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
  end

end
