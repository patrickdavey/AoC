defmodule AOC.CameraParser do
  def parse(scan) do
    scan
    |> List.to_string
    |> into_coordinates
  end

  defp into_coordinates(string) do
    foo = string
    |> String.trim
    |> String.split("\n")
    |> Enum.with_index
    |> Enum.map(&formatted/1)
    |> List.flatten
    |> Enum.into(%{})
  end

  def formatted({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(&(to_tuple(&1, y)))
  end

  defp to_tuple({".", x}, y), do: {{x, y}, :empty}
  defp to_tuple({"#", x}, y), do: {{x, y}, :scaffold}
  defp to_tuple({"^", x}, y), do: {{x, y}, :robot_up}
  defp to_tuple({">", x}, y), do: {{x, y}, :robot_right}
  defp to_tuple({"v", x}, y), do: {{x, y}, :robot_down}
  defp to_tuple({"<", x}, y), do: {{x, y}, :robot_left}
  defp to_tuple({"X", x}, y), do: {{x, y}, :robot_dead}
end
