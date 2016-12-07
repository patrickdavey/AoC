defmodule AOCDay.Runner do
  @bad_match ~r/\[\w*(\w)(\w)\2\1\w*]/
  @good_match ~r/(?<first>\w)(?<second>\w)\2\1/
  @good_ahead ~r/(\w)(\w)\1(?=.*\[\w*\2\1\2\w*])/
  @brackets_first ~r/\w*\[\w*(\w)(\w)\1\w*](?=.*\2\1\2.*)/

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
    match1 == false && match2 && match2["first"] != match2["second"]
  end

  def valid_ssl(string) do
  #    not_bracketed_content = Regex.scan(~r/(\w+)(?![^[]*])/, capture: :all_but_first)
    match1 = Regex.run(@good_ahead, string, capture: :all_but_first)
    match2 = Regex.run(@brackets_first, string, capture: :all_but_first)
    match1 && test(match1) || match2 && test(match2)
  end

  def test([]), do: false
  def test([a,a]), do: false
  def test([a,b]), do: true
  def test(_), do: false
end
