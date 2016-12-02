defmodule AOCDay.KeypadFinal do
  def next(current, direction) when current == "1" do
    cond do
      direction == "U" -> "1"
      direction == "D" -> "3"
      direction == "L" -> "1"
      direction == "R" -> "1"
    end
  end

  def next(current, direction) when current == "B" do
    cond do
      direction == "U" -> "7"
      direction == "D" -> "D"
      direction == "L" -> "A"
      direction == "R" -> "C"
    end
  end
end
