defmodule AOCDay.Runner do
  alias AOCDay.State
  alias AOCDay.MapGenerator

  def part_1 do
    Application.put_env(:aoc, :print_map_x, 60)
    Application.put_env(:aoc, :print_map_y, 42)
    Application.put_env(:aoc, :input, 1352)
    Application.put_env(:aoc, :x_dest, 31)
    Application.put_env(:aoc, :y_dest, 39)
    Application.put_env(:aoc, :max_steps, 1000)
    solve(&shortest_path/2)
  end

  def part_2 do
    Application.put_env(:aoc, :print_map_x, 30)
    Application.put_env(:aoc, :print_map_y, 30)
    Application.put_env(:aoc, :input, 1352)
    Application.put_env(:aoc, :x_dest, 51)
    Application.put_env(:aoc, :y_dest, 51)
    Application.put_env(:aoc, :max_steps, 50)
    solve(&number_visited/2)
  end

  def solve(callback) do
    state = %State{x: 1, y: 1, steps: [{1,1}]}
    visited = MapSet.new
    visited = MapSet.put(visited, {1, 1})
    queue = [state]
    check(queue, visited, {Application.get_env(:aoc, :x_dest), Application.get_env(:aoc, :y_dest)}, Application.get_env(:aoc, :max_steps), callback)
  end

  defp check(state = [%State{steps: steps} | _t], visited, wanted, max , callback) when length(steps) > max do
    print_map(Enum.at(state,0), visited, wanted, :max_steps)
    callback.(Enum.at(state, 0), visited)
  end

  defp check(state = [%State{x: x, y: y} | _t], visited, wanted = {x, y}, _max, callback) do
    print_map(Enum.at(state,0), visited, wanted, :shortest)
    callback.(Enum.at(state, 0), visited)
  end

  defp check([], _, _, _, _), do: raise "nope"

  defp check([state |t], visited, wanted, max, callback) do
    print_map(state, visited, wanted, false)
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

  def shortest_path(%State{steps: steps}, visited) do
    steps
    |> Enum.count
    |> Kernel.-(1)
  end

  def number_visited(_state, visited) do
    visited
    |> MapSet.size
  end

  def print_map(%State{x: x, y: y, steps: steps}, visited, wanted, final \\ false) do
    x_size = Application.get_env(:aoc, :print_map_x) || 30
    y_size = Application.get_env(:aoc, :print_map_y) || 20
    coords = for y <- 0..(y_size - 1),
                 x <- 0..(x_size - 1),
                 do: { x, y }

    maze = Enum.reduce(coords, [], fn({x, y}, acc) ->
      value = cond do
                wanted == {x, y} -> destination("X")
                Enum.member?(steps, {x, y}) && final == :shortest -> blue("O")
                Enum.member?(visited, {x, y}) && final == :max_steps -> blue("O")
                Enum.member?(steps, {x, y}) -> green("O")
                MapSet.member?(visited, {x, y}) -> red("O")
                :otherwise -> white(AOCDay.CoordinateChecker.type(x, y))
      end
      List.insert_at(acc, -1, value)
    end)
    IO.puts(IO.ANSI.clear)
    maze
    |> Enum.chunk(x_size)
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join("\n")
    |> Kernel.<>("\n")
    |> IO.puts
    :timer.sleep(50)

    # if final do
    #   :timer.sleep(50000)
    # end
  end

  defp red(s) do
    "#{IO.ANSI.color(5, 0, 0)}#{s}"
  end

  defp blue(s) do
    "#{IO.ANSI.color(0, 0, 5)}#{s}"
  end

  defp green(s) do
    "#{IO.ANSI.color(0, 5, 0)}#{s}"
  end

  defp destination(s) do
    "#{IO.ANSI.color(5, 5, 0)}#{s}"
  end

  defp white(s) do
    "#{IO.ANSI.color(5, 5, 5)}#{s}"
  end

end
