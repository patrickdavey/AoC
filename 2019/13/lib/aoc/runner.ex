defmodule AOC.Runner do
  @paddle_type 3
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
        |> move_paddle(type)
        |> wait_loop(computer, [])
    end
  end

  defp process(board, -1, 0, score) do
    IO.puts("score: #{score}")
    board
  end

  defp process(board, x, y, type) do
    Map.put(board, {x, y}, type)
  end

  defp move_paddle(board, @ball_type) do
    ball = Enum.find(board, fn({{x,y}, v}) -> v == 4 end)
    paddle = Enum.find(board, nil, fn({{x,y}, v}) -> v == 3 end)

    move(ball, paddle)
    board
  end

  defp move_paddle(board, _), do: board

  defp move({{x, y}, _}, nil), do: nil
  defp move({{x, y}, _}, {{px, py}, _}) do
    require IEx
    IEx.pry
  end
end
