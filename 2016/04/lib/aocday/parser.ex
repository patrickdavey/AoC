defmodule AOCDay.Parser do
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

    %{
      code: captures["letters"],
      sector: sector,
      checksum: captures["check"]
    }
  end
end
