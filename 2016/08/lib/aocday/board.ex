defmodule AOCDay.Board do
  def init do
    __MODULE__.start_link
  end

  def start_link do
    Agent.start_link(fn ->
    width = Application.get_env(:caster, :width)
    height = Application.get_env(:caster, :height)
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
end
