defmodule AOCDay.Screen do
  def start_link do
    Agent.start_link(fn ->
    width = Application.get_env(:caster, :width)
    height = Application.get_env(:caster, :height)
    Matrix.new([], height, width, ".")
    end, name: __MODULE__)
  end

  def current_state do
    Agent.get(__MODULE__, fn matrix -> matrix end)
  end

  def set(j, i, value) do
    Agent.update(__MODULE__,
    fn matrix ->
      put_in matrix[j][i], value
    end)
  end

  def init do
    __MODULE__.start_link
  end

  def update(%{action: "rect", x: x, y: y}) do
    for i <- 0..(x - 1) do
      for j <- 0..(y - 1) do
        set(j, i, "#")
      end
    end
  end

  def update(%{action: "column", column: x, amount: amount}) do
    copy = Matrix.from_rows(current_state |> Matrix.to_list)
    for j <- 0..(Application.get_env(:caster, :height) - 1) do
      t = copy[j][x]
      new_j = rem((j + amount), Application.get_env(:caster, :height))
      set(new_j, x, t)
    end
  end

  def update(%{action: "row", row: y, amount: amount}) do
    copy = Matrix.from_rows(current_state |> Matrix.to_list)
    for i <- 0..(Application.get_env(:caster, :width) - 1) do
      t = copy[y][i]
      new_i = rem((i + amount), Application.get_env(:caster, :width))
      set(y, new_i, t)
    end
  end

  def pixels_lit do
    as_string
    |> String.graphemes
    |> Enum.count(&(&1 == "#"))
  end

  def as_string do
    __MODULE__.current_state
    |> Matrix.to_list
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
  end

end
