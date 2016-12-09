defmodule AOCDay.Decompress do
  @encoding ~r/\((?<char_length>\d+)x(?<repeat_times>\d+)\)/

  def word_length(input) do
    input
    |> scan_it("")
    |> String.length
  end

  defp scan_it(input, acc) do
    match = nicer_captures(input)
    cond do
      match ->
        expand(input)
      :otherwise -> acc <> input
    end
  end

  defp repeat(input, %{ char_length: len, repeat_times: repeat, start_offset: start_offset, capture_len: len2}) do
    String.duplicate(String.slice(input, start_offset + len2, len), repeat)
  end

  def expand(input) do
    match = nicer_captures(input)
    cond do
      match ->
        before_capture = String.slice(input, 0, match.start_offset)
        after_capture = String.slice(input, match.start_offset + match.capture_len + match.char_length , String.length(input))
        mini = String.duplicate(String.slice(input, match.start_offset + match.capture_len, match.char_length), match.repeat_times)
        expand(before_capture <> mini <> after_capture)
      :otherwise -> input
    end
  end

  def nicer_captures(input) do
    match = Regex.named_captures(@encoding, input)
    cond do
      match ->
        len = String.to_integer(match["char_length"])
        repeat = String.to_integer(match["repeat_times"])
        [{start_offset, len2}] = Regex.run(@encoding, input, return: :index, capture: :first)
        %{ char_length: len, repeat_times: repeat, start_offset: start_offset, capture_len: len2}
      :otherwise -> nil
    end
  end
end
