defmodule AOCDay.Runner do
  alias AOCDay.Hasher
  @triple ~r/(.)\1\1/
  @one_time_pads_needed 64
  @mds5_to_check 1000

  def part_1 do
    (0..999)
      |> Enum.reduce(%{}, fn(i, acc) ->
         Map.put(acc, i, Hasher.hash(i))
      end)
    |> find(_start_index = 0, _start_count = 0, @one_time_pads_needed)
  end

  def find(_, index, count, max) when count == max do
    index - 1
  end

  def find(hashes, index, count, max) do
    current = hashes[rem(index, @mds5_to_check)]
    hashes = Map.update!(hashes, rem(index, @mds5_to_check), fn(_) ->
      Hasher.hash(index + @mds5_to_check)
    end)

    case triple_letter(current) do
      nil -> find(hashes, index + 1, count, max)
      letter ->
        Map.values(hashes)
          |> Enum.any?(&(string_contains_run_of_5_letters?(&1, letter)))
          |> next_find(hashes, index + 1, count, max)
    end
  end

  defp triple_letter(string) do
    Regex.run(@triple, string, capture: :all_but_first)
    |> letter_or_nil
  end

  defp letter_or_nil([letter]), do: letter
  defp letter_or_nil(_), do: nil

  defp string_contains_run_of_5_letters?(string, letter) do
    String.contains?(string, String.duplicate(letter, 5))
  end

  defp next_find(true, hashes, index, count, max) do
    find(hashes, index, count + 1 , max)
  end
  defp next_find(false, hashes, index, count, max) do
    find(hashes, index, count, max)
  end
end
