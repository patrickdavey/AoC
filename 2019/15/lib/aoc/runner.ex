defmodule AOC.Runner do
  @north 1
  @south 2
  @west 3
  @east 4

  @hit_wall 0
  @moved 1
  @found_oxygen 2

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

  defp wait_loop(board, repair_droid, path_remainder = [path|t], current_position, current_path) do
    [move | rest] = path
    send(:repair_droid, {:input, move})
    current_position = new_position(current_position, move)

    Board.print(board)
    receive do
      {:terminating, ^repair_droid} ->
        board
      {:input, @hit_wall, ^repair_droid} ->
        #ignore this entire path
        send(repair_droid, {:reset, self(), structured_data()})
        wait_loop(Map.put(board, current_position, @hit_wall), repair_droid, t, {0,0}, [])
      {:input, @moved, ^repair_droid} ->
        board = Map.put(board, current_position, @moved)
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
      {:input, @found_oxygen, ^repair_droid} ->
        current_path |> length |> Kernel.+(1)
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
end
