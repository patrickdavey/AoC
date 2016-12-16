defmodule AOCDay.Runner do
  alias AOCDay.DragonEncoder
  alias AOCDay.Checksum
  def part_1(init, length) do
    string = Enum.reduce_while(1..1000, init, fn _i, acc ->
      acc = DragonEncoder.encode(acc)
      if String.length(acc) >= length do
        {:halt, String.slice(acc, 0, length)}
      else
        {:cont, acc}
      end
    end)

    string |> Checksum.create!
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end
end
