defmodule AOCDay.Hasher do
  def hash(index) do
    initial = Application.get_env(:aoc, :salt)
              |> Kernel.<>(Integer.to_string(index))

    num_times = (0..Application.get_env(:aoc, :num_hashes) - 1)

    Enum.reduce(num_times, initial, fn(_i, acc) ->
      :crypto.hash(:md5, acc) |> Base.encode16(case: :lower)
    end)
  end
end
