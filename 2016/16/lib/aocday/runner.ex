defmodule AOCDay.Runner do
  alias AOCDay.{DragonEncoder, Checksum}

  def find_checksum_for(init, length) do
    DragonEncoder.encode(init)
    |> Stream.iterate(&DragonEncoder.encode/1)
    |> Stream.drop_while(&(String.length(&1) < length))
    |> Enum.take(1)
    |> List.first()
    |> String.slice(0, length)
    |> Checksum.create!
  end
end
