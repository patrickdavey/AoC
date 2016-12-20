defmodule AOCDay.Parser do
  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    ranges_in_file = binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&formatted/1)
    |> Enum.sort_by(fn(a.._b) -> a end)
    |> Enum.to_list
    |> MapSet.new

    all = Enum.reduce(MapSet.to_list(ranges_in_file), ranges_in_file, &accumulate_ranges/2) |> MapSet.to_list
    Enum.reject(all, &(range_included?(&1, all)))
  end

  def formatted(line) do
    [a, b] = line
    |> String.split("-")
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))

    a..b
  end

  defp accumulate_ranges(a..b, mapset) do
    acc = MapSet.to_list(mapset) # there must be a nicer way to do this, can't think
    start_overlaps = Enum.filter(acc, &(Enum.member?(&1, a)))
    end_overlaps = Enum.filter(acc, &(Enum.member?(&1, b)))
    end_overlap = end_overlaps |> Enum.map(fn(_a..b) -> b end) |> Enum.max
    start_overlap = start_overlaps |> Enum.map(fn(a.._b) -> a end) |> Enum.min

    MapSet.put(mapset, start_overlap..end_overlap)
  end

  def range_included?(a..b, list) do
    Enum.any?(list, fn(c..d) -> (c <= a && d >= b) && (c != a || d != b) end)
  end
end
