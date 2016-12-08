defmodule AOCDay.Runner do
  alias AOCDay.Screen
  def part_1 do
    Application.put_env(:aoc, :width, 50)
    Application.put_env(:aoc, :height, 6)
    Screen.init

    structured_data
    |> Enum.each(fn(command) -> update_screen(command) end)

    Screen.pixels_lit
  end

  def part_2 do
    IO.puts(Screen.as_string)
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  defp update_screen(e) do
    Screen.update(e)
  end
end
