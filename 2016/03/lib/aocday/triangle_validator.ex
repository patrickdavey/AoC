defmodule AOCDay.TriangleValidator do
  def valid?([a,b,c]) do
    (a + b) > c && (a + c) > b && (b + c) > a
  end
end
