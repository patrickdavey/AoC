# lib/aoc/password_validator.ex
defmodule AOC.PasswordValidator do
  def check(range, number) do
    Regex.match?(~r/(\d)\1/, to_string(number)) &&
    only_increasing(String.graphemes(to_string(number)))
  end

  defp only_increasing(chars) do
    chars == Enum.sort(chars)
  end
end
