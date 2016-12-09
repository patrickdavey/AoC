defmodule AOCDay.Decompress do
  @encoding ~r/\((?<char_length>\d+)x(?<repeat_times>\d+)\)/

  def word_length(input) do
    input
    |> String.trim
    |> scan_it(0)
  end

  defp scan_it(input, acc) do
    match = Regex.run(@encoding, input, return: :index, capture: :first)
    cond do
      match ->
        [{start_offset, len}] = match
        captures = Regex.named_captures(@encoding, input)
        acc = acc + String.length(String.slice(input, 0, start_offset))
        after_capture = String.slice(input, start_offset + len, String.length(input))
        { repeat, rest } = repeated(after_capture, captures)
        acc = acc + String.length(repeat)
        scan_it(rest, acc)
      :otherwise -> acc + String.length(input)
    end
  end

  defp repeated(input, %{"char_length" => len, "repeat_times" => repeat}) do
    len = String.to_integer(len)
    repeat = String.to_integer(repeat)
    { String.duplicate(String.slice(input, 0, len), repeat),
      String.slice(input, len, String.length(input)) }
  end

end
