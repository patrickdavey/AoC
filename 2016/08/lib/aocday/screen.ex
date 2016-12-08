defmodule AOCDay.Screen do
  @screen_height 6
  @screen_width 50
  alias AOCDay.AsyncMatrix

  def init do
    width = Application.get_env(:caster, :width)
    height = Application.get_env(:caster, :height)
    empty_row = Enum.map 1..width, fn _ -> "." end
    AsyncMatrix.from_list(Enum.map 1..height, fn _ -> empty_row end)
  end

  def update(matrix, %{action: "rect", x: x, y: y}) do
    for i <- 0..(x - 1) do
      for j <- 0..(y - 1) do
        AsyncMatrix.update(matrix, j, i, "#")
      end
    end
  end

  def update(matrix, %{action: "column", column: x, amount: amount}) do
    copy = AsyncMatrix.from_list(AsyncMatrix.to_list(matrix))
    for j <- 0..(Application.get_env(:caster, :height) - 1) do
      t = AsyncMatrix.get(copy, j, x)
      AsyncMatrix.update(matrix, rem((j + amount), Application.get_env(:caster, :height)), x, t)
    end
  end

  def update(matrix, %{action: "row", row: y, amount: amount}) do
    copy = AsyncMatrix.from_list(AsyncMatrix.to_list(matrix))
    for i <- 0..(Application.get_env(:caster, :width) - 1) do
      t = AsyncMatrix.get(copy, y, i)
      AsyncMatrix.update(matrix, y, rem((i + amount), Application.get_env(:caster, :width)), t)
    end
  end

  def pixels_lit(matrix) do
    matrix
    |> as_string
    |> String.graphemes
    |> Enum.count(&(&1 == "#"))
  end

  def as_string(matrix) do
    matrix
    |> AsyncMatrix.to_list
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
  end

end
