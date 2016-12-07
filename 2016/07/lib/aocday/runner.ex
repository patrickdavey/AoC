defmodule AOCDay.Runner do
  @bad_match ~r/\[\w*(\w)(?!\1)(\w)\2\1\w*]/
  @good_match ~r/(?<first>\w)(?!\1)(?<second>\w)\2\1/

  def part_1 do
    structured_data
    |> Enum.filter(&valid_ipv7/1)
    |> Enum.count
    |> IO.puts
  end

  def part_2 do
    structured_data
    |> Enum.filter(&valid_ssl/1)
    |> Enum.count
    |> IO.puts
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  def valid_ipv7(string) do
    match1 = Regex.match?(@bad_match, string)
    match2 = Regex.named_captures(@good_match, string)
    match1 == false && match2
  end

  def valid_ssl(string) do
    inside_brackets = Regex.scan(~r/(\[\w+])/, string, capture: :all_but_first) |> List.flatten
    matches_outside_brackets = Regex.scan(~r/(?=(\w)(?!\1)(\w)\1(?![^[]*]))/, string, capture: :all_but_first)
    Enum.filter(matches_outside_brackets, &find_match(&1, inside_brackets))
    |> Enum.count
    |> Kernel.>(0)
  end

  def find_match([a, b], inside_brackets) do
    Enum.any?(inside_brackets, &(String.contains?(&1, "#{b}#{a}#{b}")))
  end
end
