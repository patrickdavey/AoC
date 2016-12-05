defmodule AOCDay.Crack do
  def code_for(init)do
    _code(init, 0, 0, "")
  end

  def _code(code, inc, search, acc) when search < 8 do
    hash = :crypto.hash(:md5, code <> Integer.to_string(inc)) |> Base.encode16()
    cond do
      String.starts_with?(hash, "00000") ->
        _code(code, inc + 1, search + 1, acc <> String.at(hash, 5))
      :otherwise -> _code(code, inc + 1, search, acc)
    end
  end

  def _code(_, _, 8, code) do
    code
  end

  def final_code_for(init)do
    _final_code(init, 0, 0, "--------")
  end

  def _final_code(code, inc, search, acc) when search < 8 do
    hash = :crypto.hash(:md5, code <> Integer.to_string(inc)) |> Base.encode16()
    cond do
      String.starts_with?(hash, "00000") && String.contains?("01234567", String.at(hash, 5)) ->
        idx = String.to_integer(String.at(hash, 5))
        cond do
          String.at(acc, idx) == "-" ->
            _final_code(code, inc + 1, search + 1, String.graphemes(acc) |> List.replace_at(idx, String.at(hash, 6)) |> Enum.join)
          :otherwise -> _final_code(code, inc + 1, search , acc)
        end
      :otherwise -> _final_code(code, inc + 1, search, acc)
    end
  end

  def _final_code(_, _, 8, code) do
    code
  end
end
