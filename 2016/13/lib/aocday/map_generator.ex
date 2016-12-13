defmodule AOCDay.MapGenerator do
  alias AOCDay.State
  alias AOCDay.Board
  alias AOCDay.CoordinateChecker

  def nodes(initial = %State{x: x, y: y, steps: steps}) do
    coords = [
      {x, y + 1},
      {x, y - 1},
      {x + 1, y},
      {x - 1, y}
    ]
    |> Enum.filter(&valid_coordinate?/1)
    |> Enum.map(&(create(&1, steps)))
  end

  defp valid_coordinate?({x, y}) when x < 0 or y < 0, do: false
  defp valid_coordinate?({x, y}) do
    cond do
      x > Application.get_env(:aoc, :width) -> false
      y > Application.get_env(:aoc, :height) -> false
      :otherwise -> Board.at(x, y) == "."
    end
  end

  defp create({x, y}, steps) do
    %State{x: x, y: y, steps: List.insert_at(steps, -1, {x, y})}
  end
end
