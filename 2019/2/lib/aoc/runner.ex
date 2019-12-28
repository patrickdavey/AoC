defmodule AOC.Runner do
  def part_1 do
    data = structured_data
    data = List.replace_at(data, 1, 12)
    data = List.replace_at(data, 2, 2)
    result = AOC.Intcode.next(data, 0)
    Enum.at(result, 0)
  end

  def part_2 do
    for noun <- 0..99, verb <- 0..99 do
      data = structured_data
      data = List.replace_at(data, 1, noun)
      data = List.replace_at(data, 2, verb)
      case AOC.Intcode.final(data) do
        19690720 -> IO.puts("part2: #{100 * noun + verb}")
        _ -> nil
      end
    end
  end

  defp structured_data do
    AOC.Parser.parse
  end
end
