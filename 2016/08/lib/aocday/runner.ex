defmodule AOCDay.Runner do
  alias AOCDay.Screen
  def part_1 do
    Application.put_env(:caster, :width, 50)
    Application.put_env(:caster, :height, 6)
    Screen.init

    structured_data
    |> Enum.each(fn(command) -> update_screen(command) end)

    Screen.pixels_lit
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  def update_screen(e) do
    IO.puts("===============================\n")
    IO.inspect(e)
    IO.puts(Screen.as_string)
    Screen.update(e)
    IO.puts(Screen.as_string)
    IO.puts("===============================\n")
  end
end
