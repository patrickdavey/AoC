defmodule AOCDay.Runner do
  alias AOCDay.Screen
  def part_1 do
    screen = Screen.init(50, 6)
    s = structured_data
    structured_data
    |> Enum.each(fn(command) -> update_screen(command, screen) end)

    Screen.pixels_lit(screen)
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  def update_screen(e, screen) do
    Screen.update(screen, e)
  end
end
