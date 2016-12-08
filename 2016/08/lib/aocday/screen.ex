defmodule AOCDay.Screen do
  alias AOCDay.Board
  def init do
    Board.init
  end

  def update(%{action: "rect", x: x, y: y}) do
    for i <- 0..(x - 1) do
      for j <- 0..(y - 1) do
        Board.set(i, j, "#")
      end
    end
  end

  def update(%{action: "column", column: x, amount: amount}) do
    copy = Board.copy
    for y <- 0..(Application.get_env(:caster, :height) - 1) do
      t = Board.at(copy, x, y)
      new_y = rem((y + amount), Application.get_env(:caster, :height))
      Board.set(x, new_y, t)
    end
  end

  def update(%{action: "row", row: y, amount: amount}) do
    copy = Board.copy
    for x <- 0..(Application.get_env(:caster, :width) - 1) do
      t = Board.at(copy, x, y)
      new_x = rem((x + amount), Application.get_env(:caster, :width))
      Board.set(new_x, y, t)
    end
  end

  def pixels_lit do
    as_string
    |> String.graphemes
    |> Enum.count(&(&1 == "#"))
  end

  def as_string do
    Board.current_state
    |> Matrix.to_list
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
  end
end
