defmodule AOCDay.Runner do
  alias AOCDay.Distance
  alias AOCDay.Map

  def run do
    calculate
  end

  def calculate(input \\ "") do
    {x, y, _} = AOCDay.Parser.parse(input)
    |> Enum.reduce({0,0, "N"}, &new_position/2)

    abs(x) + abs(y)
  end

  defp new_position(%Distance{direction: turning, length: len}, {x, y, pointing}) do
    new_direction = direction(pointing, turning)
    {x2, y2, _} = _new_position(x, y, new_direction, len)
    add_positions({x, y}, {x2, y2})

    {x2, y2, new_direction}
  end

  defp direction("N", "R"), do: "E"
  defp direction("E", "R"), do: "S"
  defp direction("S", "R"), do: "W"
  defp direction("W", "R"), do: "N"
  defp direction("N", "L"), do: "W"
  defp direction("W", "L"), do: "S"
  defp direction("S", "L"), do: "E"
  defp direction("E", "L"), do: "N"

  defp _new_position(x, y, new_direction, len) when new_direction == "E" do
    { x + len, y, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "S" do
    { x, y - len, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "W" do
    { x - len, y, new_direction }
  end

  defp _new_position(x, y, new_direction, len) when new_direction == "N" do
    { x, y + len, new_direction }
  end

  def add_positions({x, y1}, {x, y2 }) do
    y1..y2
    |> Enum.map(&({x, &1}))
    |> Enum.slice(1..10000)
    |> Enum.each(fn(point) -> Map.add_location(point) end)
  end

  def add_positions({x1, y}, {x2, y}) do
    x1..x2
    |> Enum.map(&({&1, y}))
    |> Enum.slice(1..10000)
    |> Enum.each(fn(point) -> Map.add_location(point) end)
  end

end

# defmodule AOCDay.Runner do
#   alias AOCDay.Distance
#   def run do
#     calculate
#   end

#   def calculate(input \\ "") do
#     {x, y, _} = AOCDay.Parser.parse(input)
#     |> Enum.reduce({{0,0, "N"}, MapSet.new()}, &new_position/2)

#     abs(x) + abs(y)
#   end

#   defp new_position(%Distance{direction: turning, length: len}, {{x, y, pointing}, visited}) do
#     new_direction = direction(pointing, turning)
#     new_position = _new_position(x, y, new_direction, len)
#     {new_x, new_y, _} = new_position
#     # store new directions
#     visited = add_positions({x, y}, {new_x, new_y}, visited)
#     { new_position, visited }
#   end

#   def add_positions({x, y1}, {x, y2 }, visited) do
#     y1..y2
#     |> Enum.map(&({x, &1}))
#     |> Enum.slice(1..10000)
#     |> Enum.reduce(visited, &store_or_raise/2)
#   end

#   def add_positions({x1, y}, {x2, y}, visited) do
#     t = x1..x2
#     |> Enum.map(&({&1, y}))
#     |> Enum.slice(1..10000)
#     |> Enum.reduce(visited, &store_or_raise/2)
#   end

#   def store_or_raise(position, visited) do
#     cond do
#       MapSet.member?(visited, position) -> raise position
#       :otherwise ->
#         IO.inspect(position)
#         MapSet.put(visited, position)
#     end
#   end

#   defp direction("N", "R"), do: "E"
#   defp direction("E", "R"), do: "S"
#   defp direction("S", "R"), do: "W"
#   defp direction("W", "R"), do: "N"
#   defp direction("N", "L"), do: "W"
#   defp direction("W", "L"), do: "S"
#   defp direction("S", "L"), do: "E"
#   defp direction("E", "L"), do: "N"

#   defp _new_position(x, y, new_direction, len) when new_direction == "E" do
#     { x + len, y, new_direction }
#   end

#   defp _new_position(x, y, new_direction, len) when new_direction == "S" do
#     { x, y - len, new_direction }
#   end

#   defp _new_position(x, y, new_direction, len) when new_direction == "W" do
#     { x - len, y, new_direction }
#   end

#   defp _new_position(x, y, new_direction, len) when new_direction == "N" do
#     { x, y + len, new_direction }
#   end
# end

