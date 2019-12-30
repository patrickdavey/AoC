defmodule AOC.Runner do
  alias AOC.PasswordValidator
  def part_1 do
    range
    |> Enum.filter(&(PasswordValidator.check(range, &1)))
    |> length
  end

  def part_2 do
    "part 2"
  end

  defp range do
    AOC.Parser.parse
  end
end
