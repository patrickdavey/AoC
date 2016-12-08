defmodule AOCDay.AsyncMatrix do
  @moduledoc """
  Builds a matrix with mutable values using Agent processes.
      iex> list = [["x", "x", "o"], ["o", "x", "o"], ["x", "o", "x"]]
      [["x", "x", "o"], ["o", "x", "o"], ["x", "o", "x"]]
      iex> matrix = AsyncMatrix.from_list(list)
      %{0 => %{0 => #PID<0.143.0>, 1 => #PID<0.144.0>, 2 => #PID<0.145.0>},
        1 => %{0 => #PID<0.146.0>, 1 => #PID<0.147.0>, 2 => #PID<0.148.0>},
        2 => %{0 => #PID<0.149.0>, 1 => #PID<0.150.0>, 2 => #PID<0.151.0>}}
      iex> AsyncMatrix.to_list(matrix)
      [["x", "x", "o"], ["o", "x", "o"], ["x", "o", "x"]]
      iex> AsyncMatrix.update(matrix, 1, 0, "x")
      :ok
      iex> AsyncMatrix.to_list(matrix)
      [["x", "x", "o"], ["x", "x", "o"], ["x", "o", "x"]]
  """

  def from_list(list) when is_list(list) do
    do_from_list(list)
  end

  defp do_from_list(list) when is_list(list) do
    for i <- 0..(length(list) - 1), into: %{} do
      v = Enum.at(list, i)
      {i, do_from_list(v)}
    end
  end

  defp do_from_list(value) do
    {:ok, m} = Agent.start_link(fn () -> value end)
    m
  end

  def to_list(matrix) when is_map(matrix) do
    do_to_list(matrix)
  end

  defp do_to_list(matrix) when is_map(matrix) do
    for {_index, value} <- matrix, into: [], do: do_to_list(value)
  end

  defp do_to_list(pid) when is_pid(pid) do
    Agent.get(pid, fn (v) -> v end)
  end

  def update(matrix, x, y, new_value) do
    pid = matrix[x][y]
    Agent.update(pid, fn (_old) -> new_value end)
    :ok
  end

  def get(matrix, x, y) do
    pid = matrix[x][y]
    Agent.get(pid, fn (old) -> old end)
  end
end
