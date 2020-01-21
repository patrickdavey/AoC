defmodule AOC.Runner do
  alias AOC.{IntcodeAgent, Board}
  @turn_left 0
  @turn_right 1

  def part_1(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), program})
    send(computer, {:input, 0})
    send(computer, :run)

    wait_loop({{0,0, :north}, %{}, []}, computer)
    |> Map.keys
    |> length
  end

  def part_2(program \\ structured_data()) do
    supervisor_pid = self()
    computer = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor_pid}) end)
    send(computer, {:set_initial, self(), program})
    send(computer, {:input, 1})
    send(computer, :run)

    wait_loop({{0,0, :north}, %{}, []}, computer)
    |> Board.print
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp wait_loop({dir, ship, []}, computer) do
    receive do
      {:terminating, ^computer} ->
        ship
      {:input, value, ^computer} ->
        wait_loop({dir, ship, [value]}, computer)
    end
  end

  defp wait_loop({dir, ship, [color]}, computer) do
    receive do
      {:terminating, ^computer} ->
        ship
      {:input, turn, ^computer} ->
        {dir, ship} = process({color, turn}, dir, ship, computer)

        wait_loop({dir, ship, []}, computer)
    end
  end

  defp process({color, turn}, {x, y, current_direction}, ship, computer) do
    ship = Map.put(ship, {x, y}, color)
    {x, y, current_direction } = next_position(x, y, current_direction, turn)
    send(computer, {:input, Map.get(ship, {x, y}, 0)})
    {{x, y, current_direction}, ship }
  end

  defp next_position(x, y, :north, @turn_left), do: {x - 1, y, :left}
  defp next_position(x, y, :north, @turn_right), do: {x + 1, y, :right}
  defp next_position(x, y, :left, @turn_left), do: {x, y + 1, :south}
  defp next_position(x, y, :left, @turn_right), do: {x, y - 1, :north}
  defp next_position(x, y, :right, @turn_left), do: {x, y - 1, :north}
  defp next_position(x, y, :right, @turn_right), do: {x, y + 1, :south}
  defp next_position(x, y, :south, @turn_left), do: {x + 1, y, :right}
  defp next_position(x, y, :south, @turn_right), do: {x - 1, y, :left}
end
