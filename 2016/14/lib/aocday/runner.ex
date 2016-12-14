defmodule AOCDay.Runner do
  alias AOCDay.Guesses
  @triple ~r/(.)\1\1/
  @one_time_pads_needed 64

  def solve do
    Guesses.start_link(:guesser)
    find(_start_index = 0, _start_count = 0, @one_time_pads_needed)
  end

  def find(index, count, max) when count == max do
    index - 1
  end

  def find(index, count, max) do
    { current, next_1000 } = GenServer.call(:guesser, {:get_and_update, index})

    case triple_letter(current) do
      nil -> find(index + 1, count, max)
      letter ->
        next_1000
          |> Enum.any?(&(string_contains_run_of_5_letters?(&1, letter)))
          |> next_find(index + 1, count, max)
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

  defp next_find(true, index, count, max) do
    find(index, count + 1 , max)
  end
  defp next_find(false, index, count, max) do
    find(index, count, max)
  end
end
