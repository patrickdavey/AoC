defmodule AOCDay.Runner do
  alias AOCDay.Hasher


  def part_1 do
    (0..999)
      |> Enum.reduce(%{}, fn(i, acc) ->
         Map.put(acc, i, Hasher.hash(Application.get_env(:aoc, :salt), i))
      end)
    |> find(0, 0, 64)
  end

  def find(_, index, count, max) when count == max do
    index - 1
  end

  def find(hashes, index, count, max) do
    current = hashes[rem(index, 1000)]
    hashes = Map.update!(hashes, rem(index, 1000), fn(_) ->
      Hasher.hash(Application.get_env(:aoc, :salt), index + 1000)
    end)

    case Regex.run(~r/(.)\1\1/, current, capture: :all_but_first) do
      nil -> find(hashes, index + 1, count, max)
      [hex] ->
        match = Map.values(hashes)
                |> Enum.any?(&(String.contains?(&1, String.duplicate(hex, 5))))
        if match do
          find(hashes, index + 1, count + 1, max)
        else
          find(hashes, index + 1, count, max)
        end
    end
  end
end
