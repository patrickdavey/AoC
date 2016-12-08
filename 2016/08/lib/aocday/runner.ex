defmodule AOCDay.Runner do
  alias AOCDay.Screen
  def part_1 do
    Application.put_env(:caster, :width, 50)
    Application.put_env(:caster, :height, 6)
    screen = Screen.init
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
    IO.puts("===============================\n")
    IO.inspect(e)
    IO.puts(Screen.as_string(screen))
    Screen.update(screen, e)
    IO.puts(Screen.as_string(screen))
    IO.puts("===============================\n")
  end
end
