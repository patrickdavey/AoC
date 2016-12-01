defmodule AOCDay.Runner do
  alias AOCDay.Distance
  def run do
    calculate
  end

  def calculate(input \\ "") do
    {x, y, _} = AOCDay.Parser.parse(input)
    |> Enum.reduce({0,0, "N"}, &new_position/2)

    abs(x) + abs(y)
  end

  defp new_position(%Distance{direction: turning, length: len}, {x, y, pointing}) do
    new_direction = direction(pointing, turning)
    _new_position(x, y, new_direction, len)
  end

  defp direction("N", "R"), do: "E"
  defp direction("E", "R"), do: "S"
  defp direction("S", "R"), do: "W"
  defp direction("W", "R"), do: "N"
  defp direction("N", "L"), do: "W"
  defp direction("W", "L"), do: "S"
  defp direction("S", "L"), do: "E"
  defp direction("E", "L"), do: "N"

  defp _new_position(x, y, new_direction, len) when new_direction == "E" do
    { x + len, y, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "S" do
    { x, y - len, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "W" do
    { x - len, y, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "N" do
    { x, y + len, new_direction }
  end
end

