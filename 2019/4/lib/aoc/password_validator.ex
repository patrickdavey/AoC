# lib/aoc/password_validator.ex
defmodule AOC.PasswordValidator do
  def check(number) do
    Regex.match?(~r/(\d)\1/, to_string(number)) &&
    only_increasing(String.graphemes(to_string(number)))
  end

  def check2(number) do
    only_increasing(String.graphemes(to_string(number))) && check_duplicates(number)
  end

  defp only_increasing(chars) do
    chars == Enum.sort(chars)
  end

  defp check_duplicates(number) do
    lengths = Regex.scan(~r/(\d)\1+/, to_string(number)) |> Enum.map(&(Enum.at(&1 || [0], 0))) |> Enum.map(&(String.length/1))

    lengths != [] && Enum.any?(lengths, &(&1 == 2))
  end
end
