defmodule AOCDay.Keypad do
  def next(current, direction) when current == 1 do
    cond do
      direction == "U" -> 1
      direction == "D" -> 4
      direction == "L" -> 1
      direction == "R" -> 2
    end
  end

  def next(current, direction) when current == 2 do
    cond do
      direction == "U" -> 2
      direction == "D" -> 5
      direction == "L" -> 1
      direction == "R" -> 3
    end
  end

  def next(current, direction) when current == 3 do
    cond do
      direction == "U" -> 3
      direction == "D" -> 6
      direction == "L" -> 2
      direction == "R" -> 3
    end
  end

  def next(current, direction) when current == 4 do
    cond do
      direction == "U" -> 1
      direction == "D" -> 7
      direction == "L" -> 4
      direction == "R" -> 5
    end
  end

  def next(current, direction) when current == 5 do
    cond do
      direction == "U" -> 2
      direction == "D" -> 8
      direction == "L" -> 4
      direction == "R" -> 6
    end
  end

  def next(current, direction) when current == 6 do
    cond do
      direction == "U" -> 3
      direction == "D" -> 9
      direction == "L" -> 5
      direction == "R" -> 6
    end
  end

  def next(current, direction) when current == 7 do
    cond do
      direction == "U" -> 4
      direction == "D" -> 7
      direction == "L" -> 7
      direction == "R" -> 8
    end
  end

  def next(current, direction) when current == 8 do
    cond do
      direction == "U" -> 5
      direction == "D" -> 8
      direction == "L" -> 7
      direction == "R" -> 9
    end
  end

  def next(current, direction) when current == 9 do
    cond do
      direction == "U" -> 6
      direction == "D" -> 9
      direction == "L" -> 8
      direction == "R" -> 9
    end
  end
end
