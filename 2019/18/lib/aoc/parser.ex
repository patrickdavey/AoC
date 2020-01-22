defmodule AOC.Parser do
  @doors ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  @keys ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.with_index
    |> Enum.map(&formatted/1)
    |> List.flatten
    |> Enum.into(%{})
    |> final
  end

  def formatted({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(&(to_tuple(&1, y)))
  end

  defp to_tuple({".", x}, y), do: {{x, y}, :empty }
  defp to_tuple({"@", x}, y), do: {{x, y}, :us}
  defp to_tuple({"#", x}, y), do: {{x, y}, :wall}
  defp to_tuple({door, x}, y) when door in @doors, do: {{x, y}, door}
  defp to_tuple({key, x}, y) when key in @keys, do: {{x, y}, key}

  defp final(board) do
    { start, :us } = board |> Enum.find(fn({k, v}) -> v == :us end)

    { start, Map.put(board, start, :empty) }
  end
end
