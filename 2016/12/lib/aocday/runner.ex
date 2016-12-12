defmodule AOCDay.Runner do
  def part_1 do
    s = structured_data
    require IEx
    IEx.pry
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
