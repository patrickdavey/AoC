defmodule AOC.Parser do
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
    |> Enum.map(&formatted/1)
  end

  def formatted("deal into new stack") do
    { :deal_into_new_stack }
  end

  def formatted(<<"deal with increment "::utf8, amount::binary>>) do
    { :deal_with_increment, amount |> String.to_integer }
  end

  def formatted(<<"cut "::utf8, amount::binary>>) do
    { :cut, amount |> String.to_integer }
  end
end
