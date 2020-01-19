defmodule AOC.LineOfSight do
  def polar(a, a), do: nil
  def polar({ox, oy}, {px, py}) do
    x = px - ox
    y = py - oy

    distance = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
    angle = :math.atan2(y, x)
    angle = angle * 180/:math.pi
    angle = if angle < 0, do: angle + 360 , else: angle
    angle = angle - 270
    angle = if angle < 0, do: angle + 360 , else: angle

    { distance, angle, {px, py} }
  end
end

