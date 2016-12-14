defmodule AOCDay.Hasher do
  def hash(salt, index) do
    md5 = Enum.reduce((0..(Application.get_env(:aoc, :num_hashes) - 1)), salt <> Integer.to_string(index), fn(_i, acc) ->
      :crypto.hash(:md5, acc) |> Base.encode16(case: :lower)
    end)
  end
end
