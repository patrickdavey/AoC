defmodule AOCDay.Decompress do
  @encoding ~r/\((?<char_length>\d+)x(?<repeat_times>\d+)\)/

  def expand_length(input, current_multiplier \\ 1) do
    match = nicer_captures(input)
    cond do
      match ->
        { {r, multiplier}, rest } = repeat(input, match)
        current_multiplier * (match.start_offset + expand_length(r, multiplier) + expand_length(rest))
      :otherwise ->
        String.length(input) * current_multiplier
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
