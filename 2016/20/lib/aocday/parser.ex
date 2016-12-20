defmodule AOCDay.Parser do
  @capture ~r/(?<letters>\D+)(?<sector>\d+)\[(?<check>\w+)\]/

  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    something = binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&formatted/1)
    |> Enum.reduce(MapSet.new, &accumulate_ranges/2)
    |> reduce_further
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
    start_overlap = Enum.find(acc, &(Enum.member?(&1, a)))
    end_overlap = Enum.find(acc, &(Enum.member?(&1, b)))

    cond do
      start_overlap == nil && end_overlap == nil ->
        MapSet.put(mapset, a..b)
      start_overlap != nil && end_overlap == nil ->
        start_over..end_over = start_overlap
        mapset = MapSet.delete(mapset, start_overlap)
        MapSet.put(mapset, start_over..b)
      start_overlap == nil && end_overlap != nil ->
        # we know that b is inside the end of a range,
        # therefore we extend the _start_ of that range by a
        start_over..end_over = end_overlap
        mapset = MapSet.delete(mapset, end_overlap)
        MapSet.put(mapset, a..end_over)
      :otherwise ->
        if (a..b) == start_overlap || (a..b) == end_overlap do
          mapset
        else
          MapSet.delete(mapset, a..b)
        end
    end
  end

  def reduce_further(mapset) do
    IO.puts "reducing further"
    list = MapSet.to_list(mapset)
    next = Enum.reduce(list, mapset, &accumulate_ranges/2)
    list = MapSet.to_list(next)
    list2 = Enum.reject(list, fn(r) -> range_contained?(r, MapSet.delete(next, r) |> MapSet.to_list) end)
    next = MapSet.new(list2)

    if next != mapset do
      reduce_further(next)
    else
      mapset
    end
  end

  def range_contained?(a..b, list) do
    t = Enum.any?(list, fn(c..d) -> c <= a && b <= d end)
    IO.puts t
    t


  end
end
