defmodule AOCDay.Runner do
  @bad_match ~r/\[\w*(\w)(\w)\2\1\w*]/
  @good_match ~r/(?<first>\w)(?<second>\w)\2\1/

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
    ins = Regex.scan(~r/(\[\w+])/, string, capture: :all_but_first) |> List.flatten
    ts = Regex.scan(~r/(?=(\w)(\w)\1(?![^[]*]))/, string, capture: :all_but_first)
    t = Enum.filter(ts, &find_match(&1, ins))
    |> Enum.count
    |> Kernel.>(0)
  end

  def find_match([a, a], ins), do: false
  def find_match([a, b], ins) do
    Enum.any?(ins, &(String.contains?(&1, "#{b}#{a}#{b}")))
  end

  def test([]), do: false
  def test([a,a]), do: false
  def test([a,b]), do: true
  def test(_), do: false
end
