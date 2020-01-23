defmodule AOC.Runner do
  @block_type 2
  alias AOC.{IntcodeAgent, Board}


  def part_1(program \\ structured_data()) do
    initial_board
    |> Board.print
    |> Map.values
    |> Enum.count(&(&1 == @block_type))
  end

  def initial_board(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), program})
    send(computer, :run)

    wait_loop(%{}, computer, [])
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(board, computer, acc) when length(acc) < 2 do
    receive do
      {:terminating, ^computer} ->
        board
      {:input, value, ^computer} ->
        wait_loop(board, computer, acc ++ [value])
    end
  end

  defp wait_loop(board, computer, [x, y]) do
    receive do
      {:terminating, ^computer} ->
        board
      {:input, type, ^computer} ->
        board
        |> Map.put({x, y}, type)
        |> wait_loop(computer, [])
    end
  end
end
