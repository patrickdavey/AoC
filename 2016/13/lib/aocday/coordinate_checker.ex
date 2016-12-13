defmodule AOCDay.CoordinateChecker do
  require Integer
  def type(x, y) do
    initial = x*x + (3*x) + (2*x*y) + y + (y*y)
    initial + Application.get_env(:aoc, :input)
    |> bits
    |> Enum.sum
    |> Integer.is_odd
    |> type
  end

  defp bits(number) do
    for(<<bit::1 <- :binary.encode_unsigned(number)>>, do: bit)
  end

  def type(true), do: "#"
  def type(false), do: "."
end
