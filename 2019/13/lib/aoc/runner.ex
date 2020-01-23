defmodule AOC.Runner do
  @ball_type 4

  alias AOC.{IntcodeAgent, Board}


  def part_2(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), program})
    send(computer, {:input, 2})
    send(computer, :run)

    wait_loop(%{}, computer, [])
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(board, computer, acc) when length(acc) < 2 do
    Board.print(board)
    receive do
      {:terminating, ^computer} ->
        board
      {:input, value, ^computer} ->
        wait_loop(board, computer, acc ++ [value])
    end
  end

  defp wait_loop(board, computer, [x, y]) do
    Board.print(board)
    receive do
      {:terminating, ^computer} ->
        board
      {:input, type, ^computer} ->
        board
        |> process(x, y, type)
        |> wait_loop(computer, [])
    end
  end

  defp process(board, -1, 0, score) do
    IO.puts("score: #{score}")
    board
  end

  defp process(board, x, y, @ball_type) do
    require IEx
    IEx.pry
  end

  defp process(board, x, y, type) do
    Map.put(board, {x, y})
    require IEx
    IEx.pry
  end
end
