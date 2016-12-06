defmodule AOCDay.ErrorCorrector do
  def message(input) do
    input
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.graphemes(&1))
    |> List.zip
    |> Enum.map(&Tuple.to_list(&1))
    |> Enum.map(&max_letters/1)
    |> Enum.join
  end

  defp max_letters(letters) do
    letters
    |> Enum.reduce(%{}, &max_letter/2)
    |> Map.to_list
    |> applied_min_max
    |> Kernel.elem(0)
  end

  defp max_letter(letter, acc) do
    Map.update(acc, letter, 1, &(&1 + 1))
  end

  defp applied_min_max(letters) do
    apply(Enum, Application.get_env(AOCDay, :min_max), [letters, fn({_l,c}) -> c end])
  end
end
