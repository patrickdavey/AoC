defmodule AOCDay.Runner do
  def possible do
    AOCDay.Parser.parse
    |> Enum.filter(&(AOCDay.TriangleValidator.valid?/1))
    |> Enum.count
  end

  def column_possible do
    AOCDay.Parser.parse
    |> List.zip
    |> Enum.map(&Tuple.to_list(&1))
    |> List.flatten
    |> Enum.chunk(3)
    |> Enum.filter(&(AOCDay.TriangleValidator.valid?/1))
    |> Enum.count
  end
end
