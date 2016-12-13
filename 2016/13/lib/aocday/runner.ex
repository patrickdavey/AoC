defmodule AOCDay.Runner do
  alias AOCDay.Board
  alias AOCDay.State
  alias AOCDay.MapGenerator

  def part_1 do
    Application.put_env(:aoc, :width, 100)
    Application.put_env(:aoc, :height, 100)
    Application.put_env(:aoc, :input, 1352)
    Application.put_env(:aoc, :x_dest, 31)
    Application.put_env(:aoc, :y_dest, 39)
    Application.put_env(:aoc, :max_steps, 1000)
    solve(&shortest_path/2)
  end

  def part_2 do
    Application.put_env(:aoc, :x_dest, 90)
    Application.put_env(:aoc, :y_dest, 90)
    Application.put_env(:aoc, :max_steps, 50)
    solve(&number_visited/2)
  end

  def solve(callback) do
    Board.init
    Board.populate_initial
    Board.set(1, 1, "#")

    state = %State{x: 1, y: 1, steps: 1}
    visited = MapSet.new
    visited = MapSet.put(visited, {1, 1})
    queue = [state]
    check(queue, visited, {Application.get_env(:aoc, :x_dest), Application.get_env(:aoc, :y_dest)}, Application.get_env(:aoc, :max_steps), callback)
  end

  defp check(state = [%State{steps: steps} | _t], visited, _after, max , callback) when steps > max do
    callback.(Enum.at(state, 0), visited)
  end

  defp check(state = [%State{x: x, y: y} | _t], visited, {x, y}, _max, callback) do
    callback.(Enum.at(state, 0), visited)
  end

  defp check([], _, _, _, _), do: raise "nope"

  defp check([state |t], visited, wanted, max, callback) do
    states = state
            |> MapGenerator.nodes
            |> Enum.filter(&(not_visited_yet?(visited, &1)))
    visited = Enum.reduce(states, visited, fn(%State{x: x, y: y }, acc) ->
      MapSet.put(acc, {x, y})
    end)
    check(t ++ states, visited, wanted, max, callback)
  end

  defp not_visited_yet?(mapset, %State{x: x, y: y}) do
    MapSet.member?(mapset, {x, y}) == false
  end

  def shortest_path(%State{steps: steps}, _visited) do
    steps
    |> Kernel.-(1)
  end

  def number_visited(_state, visited) do
    visited
    |> MapSet.size
  end

end
