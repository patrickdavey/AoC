defmodule AOCDay.Board do
  def init do
    __MODULE__.start_link
  end

  def start_link do
    Agent.start_link(fn ->
    width = Application.get_env(:aoc, :width)
    height = Application.get_env(:aoc, :height)
    Matrix.new([], height, width, ".")
    end, name: __MODULE__)
  end

  def current_state do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def set(x, y, value) do
    Agent.update(__MODULE__,
    fn matrix ->
      put_in matrix[y][x], value
    end)
  end

  def copy do
    Matrix.from_rows(current_state |> Matrix.to_list)
  end

  def at(matrix, x, y) do
    matrix[y][x]
  end

  def at(x, y) do
    current_state[y][x]
  end

  def as_string do
    current_state
    |> Matrix.to_list
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end
end
