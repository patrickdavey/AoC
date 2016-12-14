defmodule AOCDay.Runner do
  alias AOCDay.Hasher


  def part_1 do
    starting_hashes = (0..999)
                      |> Enum.reduce(%{}, fn(i, acc) ->
                        Map.put(acc, i, Hasher.hash(Application.get_env(:aoc, :salt), i))
                      end)

    find(0, 0, starting_hashes, 64)
  end

  def find(index, count, _, max) when count == max do
    index - 1
  end

  def find(index, count, hashes, max) do
    current = hashes[rem(index, 1000)]
    hashes = Map.update!(hashes, rem(index, 1000), fn(_) ->
      Hasher.hash(Application.get_env(:aoc, :salt), index + 1000)
    end)

    case Regex.run(~r/(.)\1\1/, current, capture: :all_but_first) do
      nil -> find(index + 1, count, hashes, max)
      [hex] ->
        match = Map.values(hashes)
                |> Enum.any?(&(String.contains?(&1, String.duplicate(hex, 5))))
        if match do
          find(index + 1, count + 1, hashes, max)
        else
          find(index + 1, count, hashes, max)
        end
    end
  end
end
