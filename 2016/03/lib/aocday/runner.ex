defmodule AOCDay.Runner do
  def possible do
    AOCDay.Parser.parse
    |> Enum.filter(&(AOCDay.TriangleValidator.valid?/1))
    |> Enum.count
  end

  def column_possible do
    AOCDay.Parser.parse
    |> Enum.reduce([[],[],[]], &(line_to_col/2))
    |> List.flatten
    |> Enum.chunk(3)
    |> Enum.filter(&(AOCDay.TriangleValidator.valid?/1))
    |> Enum.count
  end

  defp line_to_col([a, b, c], [col1, col2, col3]) do
    [
      List.insert_at(col1, -1 , a),
      List.insert_at(col2, -1 , b),
      List.insert_at(col3, -1 , c)
    ]
  end
end
