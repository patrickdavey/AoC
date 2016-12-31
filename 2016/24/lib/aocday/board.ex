defmodule AOCDay.Board do
  def init(width, height) do
    __MODULE__.start_link(width, height)
  end

  def start_link(width, height) do
    Agent.start_link(fn ->
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
