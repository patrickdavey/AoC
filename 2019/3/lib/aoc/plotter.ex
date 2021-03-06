defmodule AOC.Plotter do
  def plot(paths) do
    _plot(paths, %{{0, 0} => [{"o", 0}]}, {0,0,0})
  end

  defp _plot([traces | t], board, position) do
    board = _plot_traces(traces, board, position)
    _plot(t, board, {0,0,0})
  end

  defp _plot([], board, position) do
    board
  end

  defp _plot_traces([%{dir: "U", length: length, trace_id: id} | t], board, {x, y, steps}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x, y - &1 }, {id, steps + &1})))
    _plot_traces(t, board, {x, y - length, steps  + length})
  end

  defp _plot_traces([%{dir: "D", length: length, trace_id: id} | t], board, {x, y, steps}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x, y + &1 }, {id, steps + &1})))
    _plot_traces(t, board, {x, y + length, steps  + length})
  end

  defp _plot_traces([%{dir: "L", length: length, trace_id: id} | t], board, {x, y, steps}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x - &1, y }, {id, steps + &1})))
    _plot_traces(t, board, {x - length, y, steps + length})
  end

  defp _plot_traces([%{dir: "R", length: length, trace_id: id} | t], board, {x, y, steps}) do
    board = (1..length) |> Enum.reduce(board, &(plot_point(&2, { x + &1, y }, {id, steps + &1})))
    _plot_traces(t, board, {x + length, y, steps  + length})
  end

  defp _plot_traces([], board, position) do
    board
  end

  defp plot_point(board, point, {id, count}) do
    Map.update(board, point , [{id, count}], &([{id, count} | &1]))
  end
end
