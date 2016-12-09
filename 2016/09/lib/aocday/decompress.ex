defmodule AOCDay.Decompress do
  @encoding ~r/\((?<char_length>\d+)x(?<repeat_times>\d+)\)/

  def expand_length(input, current_multiplier \\ 1, count \\ 0) do
    match = nicer_captures(input)
    cond do
      match ->
        count = count + String.length(String.slice(input, 0, match.start_offset))
        { {r, multiplier}, rest } = repeat(input, match)
        count + expand_length(r, multiplier * current_multiplier) + expand_length(rest)
      :otherwise -> count + String.length(input) * current_multiplier
    end
  end

  defp repeat(input, %{ char_length: len, repeat_times: repeat, start_offset: start_offset, capture_len: capture_len}) do
    { { String.slice(input, start_offset + capture_len, len), repeat },
      String.slice(input, start_offset + capture_len + len, String.length(input))}
  end

  defp nicer_captures(input) do
    match = Regex.named_captures(@encoding, input)
    cond do
      match ->
        len = String.to_integer(match["char_length"])
        repeat = String.to_integer(match["repeat_times"])
        [{start_offset, capture_len}] = Regex.run(@encoding, input, return: :index, capture: :first)
        %{ char_length: len, repeat_times: repeat, start_offset: start_offset, capture_len: capture_len}
      :otherwise -> nil
    end
  end
end
