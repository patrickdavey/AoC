defmodule AOCDay.Runner do
  def possible do
    AOCDay.Parser.parse
    |> Enum.filter(&(AOCDay.TriangleValidator.valid?/1))
    |> Enum.count
  end
end
