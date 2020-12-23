defmodule AOC.Runner do
  @hit 1
  @ship_size 99

  alias AOC.{IntcodeAgent, Parser, Board}

  def part_1(program \\ structured_data()) do
    Enum.map(coordinates(50), &(result_for_point(&1)))
    |> Enum.sum
  end

  def part_2 do
    scan_for({0, 400})
  end

  defp scan_for({x, y}) do
    first_x = find_first_hit(x, y)
    if result_for_point({first_x + @ship_size, y - @ship_size}) == @hit do
      (first_x * 10_000) + y - @ship_size
    else
      scan_for({first_x, y + 1})
    end
  end

  defp find_first_hit(x, y) do
    result = result_for_point({x, y})
    cond do
      result == @hit -> x
      true -> find_first_hit(x + 1, y)
    end
  end

  defp result_for_point(point) do
    intcode = start_intcode
    send_intcode(intcode, point)

    receive do
      {:input, value, ^intcode} ->
        value
    end
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp send_intcode(intcode, {x, y}) do
    send(intcode, {:input, x })
    send(intcode, {:input, y })
  end

  defp coordinates(size, point \\ {0, 0}) do
    {x_start, y_start} = point
    for x <- (x_start..(x_start + size - 1)), y <- (y_start..(y_start + size - 1)), do:  {x, y}
  end

  defp start_intcode do
    supervisor = self()
    intcode = spawn_link(fn -> IntcodeAgent.init(%{supervisor: supervisor}) end)
    send(intcode, {:set_initial, self(), structured_data()})
    send(intcode, :run)
    intcode
  end
end
