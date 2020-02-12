defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board}

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    Process.register(intcode, :intcode)
    send(intcode, {:set_initial, self(), program})
    send(intcode, :run)

    wait_loop(%{}, intcode)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop(board, intcode) do
    receive do
      {:terminating, ^intcode} ->
        require IEx
        IEx.pry
        board
      {:input, value, ^intcode} ->
        require IEx
        IEx.pry
        wait_loop(board, intcode)
    end
  end
end
