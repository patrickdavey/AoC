defmodule AOCDay.Parser do
  alias AOCDay.Sector
  @crypto_capture ~r/(?<letters>\D+)(?<sector>\d+)\[(?<check>\w+)\]/

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
    |> Enum.map(&formatted/1)
  end

  def formatted(line) do
    captures = Regex.named_captures(@crypto_capture, line)
    sector = captures["sector"] |> String.to_integer

    %Sector{
      code: captures["letters"],
      sector: sector,
      checksum: captures["check"],
      first_five: five_common(captures["letters"])
    }
  end

  defp five_common(code) do
    code
    |> String.graphemes
    |> Enum.sort
    |> Enum.filter(&(&1 != "-"))
    |> Enum.reduce(%{}, &groupings/2)
    |> Enum.sort(&sorter/2)
    |> Enum.take(5)
    |> Enum.map(fn({l,_c}) -> l end)
    |> Enum.join
  end

  defp groupings(letter, map) do
    Map.update(map, letter, 1, &(&1 + 1))
  end

  defp sorter({letter_a, count}, {letter_b, count}) do
    letter_a < letter_b
  end

  defp sorter({_, count_a}, {_, count_b}) do
    count_a > count_b
  end
end
