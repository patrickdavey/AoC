defmodule AOCDay.Parser do
  @capture ~r/(?<letters>\D+)(?<sector>\d+)\[(?<check>\w+)\]/

  def parse do
    {:ok, binary} = File.read("./input.txt")
    _parse(binary)
  end

  def parse(binary) do
    _parse(binary)
  end

  defp _parse(binary) do
    binary
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&formatted/1)
  end

  def formatted(["cpy", value, destination]) do
    {String.to_atom(destination), { :cpy, integer_or_atom(value)}}
  end

  def formatted(["jnz", test, offset]) do
    offset = String.to_integer(offset)
    register = case integer_or_atom(test) do
                i when is_integer(i) -> :always_on
                j -> j
    end
    {register, { :jnz, offset}}
  end

  def formatted(["inc", register]) do
    { String.to_atom(register), { :inc }}
  end

  def formatted(["dec", register]) do
    { String.to_atom(register), { :dec }}
  end

  defp integer_or_atom(value) do
    case Integer.parse(value) do
      {x, _} -> x
      :error -> String.to_atom(value)
    end
  end

end
