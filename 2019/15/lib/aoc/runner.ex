defmodule AOC.Runner do
  @north 1
  @south 2
  @west 3
  @east 4

  @wall 0
  @empty_space 1
  @oxygen 2

  alias AOC.{IntcodeAgent, Board}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    repair_droid = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(repair_droid, :repair_droid)
    send(repair_droid, {:set_initial, self(), program})
    send(repair_droid, :run)
    board = %{{0,0}=> 1}

    wait_loop(board, repair_droid, initial_paths(), {0, 0}, [])
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp maze_data do
    AOC.Parser.parse_2
  end

  defp wait_loop(board, repair_droid, [], {0,0}, []) do
    Board.print(board)
  end

  defp wait_loop(board, repair_droid, path_remainder = [path|t], current_position, current_path) do
    [move | rest] = path
    send(:repair_droid, {:input, move})
    current_position = new_position(current_position, move)

    receive do
      {:terminating, ^repair_droid} ->
        board
      {:input, @wall, ^repair_droid} ->
        #ignore this entire path
        send(repair_droid, {:reset, self(), structured_data()})
        wait_loop(Map.put(board, current_position, @wall), repair_droid, t, {0,0}, [])
      {:input, value, ^repair_droid} ->
        board = Map.put(board, current_position, value)
        if value == @oxygen do
          IO.puts("oxygen found at #{current_path |> length |> Kernel.+(1)}")
        end
        cond do
          rest == [] ->
            # means we have reached the end of this track, add routes onto tail
            # and continue _from start_
            new_paths = add_paths(t, move, current_path ++ [move])
            send(repair_droid, {:reset, self(), structured_data()})
            wait_loop(board, repair_droid, new_paths, {0,0}, [])
          true ->
            wait_loop(board, repair_droid, [rest] ++ t, current_position, current_path ++ [move])
        end
    end
  end

  def initial_paths() do
    [
      [@north],
      [@south],
      [@east],
      [@west]
    ]
  end

  def add_paths(tail, @north, whole) do
    tail ++ [whole ++ [@north]] ++ [whole ++ [@east]] ++ [whole ++ [@west]]
  end

  def add_paths(tail, @south, whole) do
    tail ++ [whole ++ [@south]] ++ [whole ++ [@east]] ++ [whole ++ [@west]]
  end

  def add_paths(tail, @east, whole) do
    tail ++ [whole ++ [@south]] ++ [whole ++ [@east]] ++ [whole ++ [@north]]
  end

  def add_paths(tail, @west, whole) do
    tail ++ [whole ++ [@south]] ++ [whole ++ [@west]] ++ [whole ++ [@north]]
  end

  def new_position({x, y}, @north), do: {x, y - 1}
  def new_position({x, y}, @south), do: {x, y + 1}
  def new_position({x, y}, @east), do: {x + 1, y}
  def new_position({x, y}, @west), do: {x - 1, y}


  # part 2 functions
  def part_2(maze \\ maze_data()) do
    Board.print(maze)

    fill_maze(maze, 0)
  end

  defp fill_maze(maze, steps) do
    if Map.values(maze) |> Enum.uniq |> length == 1 do
      steps - 1
    else
      maze
      |> Enum.filter(fn({point, v}) -> v == 2 end)
      |> Enum.reduce(maze, &fill_oxygen/2)
      |> fill_maze(steps + 1)
    end
  end

  defp fill_oxygen({{x, y}, _oxygen}, maze) do
    maze
    |> Map.put({x, y}, @wall)
    |> expand_oxygen({x - 1, y})
    |> expand_oxygen({x + 1, y})
    |> expand_oxygen({x, y - 1})
    |> expand_oxygen({x, y + 1})
  end

  def fill_maze(maze, point, @wall), do: maze
  def fill_maze(maze, point, @oxygen), do: maze
  def fill_maze(maze, point, @empty_space), do: Map.put(maze, point, @oxygen)

  defp expand_oxygen(maze, point) do
    fill_maze(maze, point, Map.get(maze, point, @wall))
  end
end
