defmodule AOCDay.Runner do
  alias AOCDay.Parser
  alias AOCDay.Dimensions

  def run do
    boxes = Parser.parse

    wrapping = boxes
             |> Enum.map(&Dimensions.wrapping/1)
             |> Enum.reduce(&+/2)
    IO.puts "wrapping required: #{wrapping}"

    ribbon = boxes
             |> Enum.map(&Dimensions.ribbon/1)
             |> Enum.reduce(&+/2)
    IO.puts "ribbon required: #{ribbon}"
  end
end

