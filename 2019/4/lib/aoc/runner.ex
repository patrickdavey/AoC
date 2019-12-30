defmodule AOC.Runner do
  alias AOC.PasswordValidator

  def part_1 do
    range
    |> Enum.filter(&(PasswordValidator.check/1))
    |> length
  end

  def part_2 do
    range
    |> Enum.filter(&(PasswordValidator.check2/1))
    |> length
  end

  defp range do
    AOC.Parser.parse
  end
end
