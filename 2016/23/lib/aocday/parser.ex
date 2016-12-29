defmodule AOCDay.Parser do
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
    |> Enum.map(&String.split/1)
    |> Enum.map(&set_values/1)
  end

  defp set_values([inst, a, b]) do
    [inst, get_value(a), get_value(b)]
  end

  defp set_values([inst, a]) do
    [inst, get_value(a)]
  end

  defp get_value(val) when val in ["a", "b", "c", "d"], do: val
  defp get_value(val), do: String.to_integer(val)
end
