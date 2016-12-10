defmodule AOCDay.Parser do
  alias AOCDay.Dest
  @bot_match ~r/bot (?<bot_index>\d+) gives low to (?<low_dest_type>(bot|output)) (?<low_index>\d+) and high to (?<high_dest_type>bot|output) (?<high_index>\d+)/
  @value_match ~r/value (?<value>\d+) goes to bot (?<bot>\d+)/

  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    values = binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&formatted/1)

    {min, max} = Enum.map(values, &(&1.bot)) |> Enum.min_max
    {max, values}
  end

  def formatted(line = <<"value"::utf8, rest::binary>>) do
    match = Regex.named_captures(@value_match, line)
    v = %{value: String.to_integer(match["value"]),bot: String.to_integer(match["bot"])}
  end

  def formatted(line = <<"bot"::utf8, rest::binary>>) do
    match = Regex.named_captures(@bot_match, line)
    %{"bot_index" => "2", "high_dest_type" => "bot", "high_index" => "0",
      "low_dest_type" => "bot", "low_index" => "1"}
    %{
      bot: String.to_integer(match["bot_index"]),
      high_dest: %Dest{type: match["high_dest_type"], index: String.to_integer(match["high_index"])},
      low_dest: %Dest{type: match["low_dest_type"], index: String.to_integer(match["low_index"])}
    }
  end
end
