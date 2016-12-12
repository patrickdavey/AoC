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
    |> Enum.map(&formatted/1)
  end

  def formatted(<<"cpy "::binary, rest::binary>>) do
    cond do
      captures = Regex.named_captures(~r/(?<value>\d+) (?<register>\w)/, rest) ->
        { String.to_atom(captures["register"]), { :cpy, String.to_integer(captures["value"])}}
      captures = Regex.named_captures(~r/(?<value>\w) (?<register>\w)/, rest) ->
        { String.to_atom(captures["register"]), { :cpy, String.to_atom(captures["value"])}}
      :otherwise -> raise "badness"
    end
  end

  def formatted(<<"jnz "::binary, rest::binary>>) do
    captures = Regex.named_captures(~r/(?<register>\w) (?<minus>[-]*)(?<value>\d+)/, rest)
    register =
      if Regex.match?(~r/\d+/, captures["register"]) do
        String.to_integer(captures["register"])
      else
        String.to_atom(captures["register"])
      end

    cond do
      captures["minus"] == "-" ->
        { register, { :jnz, String.to_integer(captures["value"]) * -1}}
      :otherwise ->
        { register, { :jnz, String.to_integer(captures["value"])}}
    end
  end

  def formatted(<<"inc "::binary, register::binary>>) do
    { String.to_atom(register), { :inc }}
  end

  def formatted(<<"dec "::binary, register::binary>>) do
    { String.to_atom(register), { :dec }}
  end
end
