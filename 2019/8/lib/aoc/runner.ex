defmodule AOC.Runner do
  def part_1 do
    structured_data(25, 6)
    |> Enum.min_by(&count_zeros/1)
    |> result_part_1
  end

  def part_2 do
    foo =  structured_data(25, 6)
    |> Enum.zip
    |> Enum.map(&find_visible/1)
    |> print(25, 6)
  end

  defp structured_data(width, height) do
    AOC.Parser.parse(width, height)
  end

  defp count_zeros(list) do
    Enum.count(list, &(&1 == 0))
  end

  defp result_part_1(list) do
    Enum.count(list, &(&1 == 1)) * Enum.count(list, &(&1 == 2))
  end

  defp find_visible(list) do
    list |> Tuple.to_list |> Enum.find(&(&1 != 2))
  end

  defp print(image, width, height) do
    image
    |> Enum.chunk_every(width)
    |> Enum.map(&replace_letters/1)
    |> Enum.map(&(Enum.join(&1, "")))
    |> Enum.join("\n")
    |> IO.puts
  end

  defp replace_letters(list) do
    list |> Enum.map(&(if &1 == 0 do " " else "1" end))
  end
end
