defmodule AOCDay.CleverCircle do
  def who_has_all_presents?(number_elves) do
    Integer.digits(number_elves, 3)
    |> Enum.count
    |> Kernel.-(1)
    |> fn(highest_power_three) -> :math.pow(3, highest_power_three) end.()
    |> round
    |> Kernel.*(-1)
    |> Kernel.+(number_elves)
  end
end
