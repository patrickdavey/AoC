defmodule AOCDay.LayoutValidator do
  alias AOCDay.Layout

  def valid?(layout = %Layout{elevator: e}) when e > 3, do: false
  def valid?(layout = %Layout{elevator: e}) when e < 0, do: false
end
