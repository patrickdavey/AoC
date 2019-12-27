defmodule AOC.Runner do
  def part_1 do
    data = structured_data
    data = List.replace_at(data, 1, 12)
    data = List.replace_at(data, 2, 2)
    result = AOC.Intcode.next(data, 0)
    Enum.at(result, 0)
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
