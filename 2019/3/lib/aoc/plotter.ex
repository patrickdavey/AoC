defmodule AOC.Plotter do
  alias AOC.Trace

  def plot(paths) do
    _plot(paths, %{{0, 0} => ["o"]}, {0,0})
  end

  defp _plot([traces | t], board, position) do
    { board, position } = _plot_traces(traces, board, position)
    _plot(t, board, position)
  end

  defp _plot([], board, position) do
    board
  end

  defp _plot_traces([%{dir: "U", length: length, trace_id: id} | t], board, {x, y}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x, y - &1 }, id)))
    _plot_traces(t, board, {x, y - length})
  end

  defp _plot_traces([%{dir: "D", length: length, trace_id: id} | t], board, {x, y}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x, y + &1 }, id)))
    _plot_traces(t, board, {x, y + length})
  end

  defp _plot_traces([%{dir: "L", length: length, trace_id: id} | t], board, {x, y}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x - &1, y }, id)))
    _plot_traces(t, board, {x - length, y})
  end

  defp _plot_traces([%{dir: "R", length: length, trace_id: id} | t], board, {x, y}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x + &1, y }, id)))
    _plot_traces(t, board, {x + length, y})
  end

  defp _plot_traces([], board, position) do
    { board, position }
  end

  defp plot_point(board, point , id) do
    Map.update(board, point , [id], &([id | &1]))
  end
end

#   defp plot_path(traces, acc) do
#     traces
#     |> Enum.reduce(acc, fn (trace, acc2) -> plot_trace(acc2, trace, ) end)
#   end

#   defp plot_trace(acc, %{dir: "R", length: length, trace_id: id}, {x, y}) do
#     (1..length)
#     |> Enum.reduce(acc, &(plot_point(&2, { x + &1, y }, id)))
#   end

#   defp plot_trace(acc, %{dir: "L", length: length, trace_id: id}, {x, y}) do
#     (1..length)
#     |> Enum.reduce(acc, &(plot_point(&2, { x - &1, y }, id)))
#   end

#   defp plot_trace(acc, %{dir: "U", length: length, trace_id: id}, {x, y}) do
#     (1..length)
#     |> Enum.reduce(acc, &(plot_point(&2, { x, y - &1 }, id)))
#   end

#   defp plot_trace(acc, %{dir: "D", length: length, trace_id: id}, {x, y}) do
#     (1..length)
#     |> Enum.reduce(acc, &(plot_point(&2, { x, y + &1 }, id)))
#   end

# end
