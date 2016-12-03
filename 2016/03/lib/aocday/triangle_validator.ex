defmodule AOCDay.TriangleValidator do
  def valid?(sides_list) do
    [s1, s2, largest_side] = sides_list |> Enum.sort
    s1 + s2 > largest_side
  end
end
