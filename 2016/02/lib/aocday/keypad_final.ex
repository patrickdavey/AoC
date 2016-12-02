defmodule AOCDay.KeypadFinal do
  @moduledoc """
    1
  2 3 4
5 6 7 8 9
  A B C
    D
    """

  def next(current, direction) when current == "1" do
    cond do
      direction == "U" -> "1"
      direction == "D" -> "3"
      direction == "L" -> "1"
      direction == "R" -> "1"
    end
  end

  def next(current, direction) when current == "2" do
    cond do
      direction == "U" -> "2"
      direction == "D" -> "6"
      direction == "L" -> "2"
      direction == "R" -> "3"
    end
  end

  def next(current, direction) when current == "3" do
    cond do
      direction == "U" -> "1"
      direction == "D" -> "7"
      direction == "L" -> "2"
      direction == "R" -> "4"
    end
  end

  def next(current, direction) when current == "4" do
    cond do
      direction == "U" -> "4"
      direction == "D" -> "8"
      direction == "L" -> "3"
      direction == "R" -> "4"
    end
  end

  def next(current, direction) when current == "5" do
    cond do
      direction == "U" -> "5"
      direction == "D" -> "5"
      direction == "L" -> "5"
      direction == "R" -> "6"
    end
  end

  def next(current, direction) when current == "6" do
    cond do
      direction == "U" -> "2"
      direction == "D" -> "A"
      direction == "L" -> "5"
      direction == "R" -> "7"
    end
  end

  def next(current, direction) when current == "7" do
    cond do
      direction == "U" -> "3"
      direction == "D" -> "B"
      direction == "L" -> "6"
      direction == "R" -> "8"
    end
  end

  def next(current, direction) when current == "8" do
    cond do
      direction == "U" -> "4"
      direction == "D" -> "C"
      direction == "L" -> "7"
      direction == "R" -> "9"
    end
  end

  def next(current, direction) when current == "9" do
    cond do
      direction == "U" -> "9"
      direction == "D" -> "9"
      direction == "L" -> "8"
      direction == "R" -> "9"
    end
  end

  def next(current, direction) when current == "A" do
    cond do
      direction == "U" -> "6"
      direction == "D" -> "A"
      direction == "L" -> "A"
      direction == "R" -> "B"
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

  def next(current, direction) when current == "C" do
    cond do
      direction == "U" -> "8"
      direction == "D" -> "C"
      direction == "L" -> "B"
      direction == "R" -> "C"
    end
  end

  def next(current, direction) when current == "D" do
    cond do
      direction == "U" -> "B"
      direction == "D" -> "D"
      direction == "L" -> "D"
      direction == "R" -> "D"
    end
  end
end
