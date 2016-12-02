defmodule AOCDay.Runner do
  alias AOCDay.Line

  def combination(input \\ "") do
    { result, _ } = AOCDay.Parser.parse(input)
                    |> Enum.reduce({"", "5"}, &get_line/2)
    result
  end

  def final_combination(input \\ "") do
    { result, _ } = AOCDay.Parser.parse(input)
                    |> Enum.reduce({"", "5"}, &final_line/2)
    result
  end

  defp get_line(line, { combination_acc, current_position }) do
    code = Line.final(current_position, line, AOCDay.Keypad)
    { combination_acc <> code, code } 
  end

  defp final_line(line, { combination_acc, current_position }) do
    code = Line.final(current_position, line, AOCDay.KeypadFinal)
    { combination_acc <> code, code } 
  end
end
