defmodule AOC.Parser do
  alias AOC.{Donut, Board}
  @letters ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    foo = binary
    |> String.trim("\n")
    |> String.split("\n")
    |> Enum.with_index
    |> Enum.map(&formatted/1)
    |> List.flatten
    |> Enum.into(%{})
    |> get_structure
  end

  def formatted({line, y}) do
    line
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(fn({e, x}) -> {{x, y}, e} end)
  end

  def get_structure(map) do
    dimensions = Board.get_dimensions(map)
    vertical_portals = get_vertical_portals(dimensions, map)
    horizontal_portals = get_horizontal_portals(dimensions, map)
    portals = Map.merge(vertical_portals, horizontal_portals)
    {start, {"AA", :outer}} = Enum.find(portals, fn({point, info}) -> elem(info, 0) == "AA" end)
    {finish, {"ZZ", :outer}} = Enum.find(portals, fn({point, info}) -> elem(info, 0) == "ZZ" end)
    %Donut{
      start: start,
      finish: finish,
      portals: portals,
      board: map
    }
  end

  defp get_horizontal_portals({x1, y1, x2, y2}, map) do
    for x <- (x1..(x2 - 2)), y <- (y1..y2) do
      s1 = Map.fetch!(map, {x, y})
      s2 = Map.fetch!(map, {x + 1, y})
      s3 = Map.fetch!(map, {x + 2, y})
      horizontal_portal(s1, s2, s3, x, y)
    end |> Enum.filter(&(&1 != nil))
    |> Enum.map(&(updown(&1, {x1, x2})))
    |> Enum.into(%{})
  end

  defp get_vertical_portals({x1, y1, x2, y2}, map) do
    for x <- (x1..x2), y <- (y1..(y2 - 2)) do
      s1 = Map.fetch!(map, {x, y})
      s2 = Map.fetch!(map, {x, y + 1})
      s3 = Map.fetch!(map, {x, y + 2})
      vertical_portal(s1, s2, s3, x, y)
    end 
    |> Enum.filter(&(&1 != nil))
    |> Enum.map(&(updown2(&1, {y1, y2})))
    |> Enum.into(%{})
  end

  defp updown({{x, y}, id}, {lower_x, upper_x}) do
    if x - lower_x <= 2 || upper_x - x <= 2 do
      {{x, y}, {id, :outer}}
    else
      {{x, y}, {id, :inner}}
    end
  end

  defp updown2({{x, y}, id}, {lower_y, upper_y}) do
    if y - lower_y <= 2 || upper_y - y <= 2 do
      {{x, y}, {id, :outer}}
    else
      {{x, y}, {id, :inner}}
    end
  end


  defp vertical_portal(s1, s2, ".", x, y) when s1 in @letters and s2 in @letters do
    {{x, y + 2}, "#{s1}#{s2}"}
  end

  defp vertical_portal(".", s1, s2, x, y) when s1 in @letters and s2 in @letters do
    {{x, y}, "#{s1}#{s2}"}
  end

  defp vertical_portal(_, _, _, _, _), do: nil

  defp horizontal_portal(s1, s2, ".", x, y) when s1 in @letters and s2 in @letters do
    {{x + 2, y}, "#{s1}#{s2}"}
  end

  defp horizontal_portal(".", s1, s2, x, y) when s1 in @letters and s2 in @letters do
    {{x, y}, "#{s1}#{s2}"}
  end

  defp horizontal_portal(_, _, _, _, _), do: nil
end
