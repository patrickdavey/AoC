defmodule AOC.Intcode do
  def next(list, offset) do
    code = Enum.at(list, offset)
    _next(list, code, offset)
  end

  defp _next(list, 1, offset) do
    op1 = Enum.at(list, Enum.at(list, offset + 1))
    op2 = Enum.at(list, Enum.at(list, offset + 2))
    list = List.replace_at(list, Enum.at(list, offset + 3), op1 + op2)
    next(list, offset + 4)
  end

  defp _next(list, 2, offset) do
    op1 = Enum.at(list, Enum.at(list, offset + 1))
    op2 = Enum.at(list, Enum.at(list, offset + 2))
    list = List.replace_at(list, Enum.at(list, offset + 3), op1 * op2)
    next(list, offset + 4)
  end

  defp _next(list, 99, _offset) do
    list
  end
end
