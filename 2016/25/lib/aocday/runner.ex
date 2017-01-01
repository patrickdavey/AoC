defmodule AOCDay.Runner do
  @valid_registers ["a", "b", "c", "d"]

  def part_1 do
    registers = %{"a" => 0, "b" => 0, "c" => 0, "d" => 0}
    p = Stream.iterate(0, &(&1+1))
    |> Stream.drop_while(fn(i) -> 
      r = Map.put(registers, "a", i)
      run(structured_data, 0, r, [1, 0, i])
    end)
    |> Enum.take(1)
  end

  def run(instructions, index, registers, output) when length(output) > 1000 do
    IO.inspect registers
    IO.inspect instructions
    output
    |> Enum.reverse
    |> Enum.at(0)
    |> IO.puts
    false
  end

  def run(instructions, index, registers, output) when index > length(instructions) do
    true
  end

  def run(instructions, index, registers, output) do
    case Enum.map(index..index+5, &Enum.at(instructions, &1)) do
      [["cpy", b, c], ["inc", a], ["dec", c], ["jnz", c, -2], ["dec", d], ["jnz", d, -5]] ->
        # this is a multiply instruction
        # d is being multiplied by b and the result stored in a
        # at the end, d, c are 0
        # a = d * b
        # b is unchanged
        registers = registers
        |> Map.put(a, value_for(registers, a) + (value_for(registers, d) * value_for(registers, b)))
        |> Map.put(d, 0)
        |> Map.put(c, 0)

        run(instructions, index + 6, registers, output)
      _ ->
        instruction = Enum.at(instructions, index)
        { next_index, registers, instructions, output } = apply(__MODULE__, :inst, instruction ++ [registers, index, instructions, output])
        run(instructions, next_index, registers, output)
    end
  end

  defp value_for(registers, register) when register in @valid_registers, do: registers[register]
  defp value_for(_registers, value), do: value

  def inst("cpy", source_reg, register, registers, current_index, instructions, output) when source_reg in @valid_registers and register in @valid_registers do
    value = registers[source_reg]
    { current_index + 1, Map.put(registers, register, value), instructions, output }
  end

  def inst("cpy", value, register, registers, current_index, instructions, output) when register in @valid_registers do
    { current_index + 1, Map.put(registers, register, value), instructions, output }
  end

  def inst("inc", register, registers, current_index, instructions, output) when register in @valid_registers do
    { current_index + 1, Map.update!(registers, register, fn(current_value) ->
      current_value + 1
    end), instructions, output }
  end

  def inst("out", register, registers, current_index, instructions, output = [1 | t]) when register in @valid_registers do
    out = registers[register]
    if out == 0 do
      { current_index +  1, registers, instructions, [out] ++ output }
    else
      { length(instructions) + 1, registers, instructions, [out] ++ output }
    end
  end

  def inst("out", register, registers, current_index, instructions, output = [0 | t]) when register in @valid_registers do
    out = registers[register]
    if out == 1 do
      { current_index +  1, registers, instructions, [out] ++ output }
    else
      { length(instructions) + 1, registers, instructions, [out] ++ output }
    end
  end

  def inst("dec", register, registers, current_index, instructions, output) when register in @valid_registers do
    { current_index + 1, Map.update!(registers, register, fn(current_value) ->
      current_value - 1
    end), instructions, output}
  end

  def inst("jnz", register, value, registers, current_index, instructions, output) when register in @valid_registers and value in @valid_registers do
    if registers[register] != 0 do
      { current_index + registers[value], registers, instructions, output }
    else
      { current_index +  1, registers, instructions, output}
    end
  end

  def inst("jnz", register, value, registers, current_index, instructions, output) when register in @valid_registers do
    if registers[register] != 0 do
      { current_index + value, registers, instructions, output }
    else
      { current_index +  1, registers, instructions, output }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions, output) when value in @valid_registers do
    if number > 0 do
      { current_index + registers[value], registers, instructions, output }
    else
      { current_index +  1, registers, instructions, output }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions, output) do
    if number > 0 do
      { current_index + value, registers, instructions, output }
    else
      { current_index +  1, registers, instructions, output }
    end
  end

  def inst("tgl", register, registers, current_index, instructions, output) when register in @valid_registers do
    offset = registers[register]
    target_instruction = Enum.at(instructions, current_index + offset)
    if target_instruction do
      new_instruction = new_instruction(target_instruction)
      instructions= List.replace_at(instructions, current_index + offset, new_instruction)
      { current_index +  1, registers, instructions, output }
    else
      { current_index +  1, registers, instructions, output }
    end
  end

  defp new_instruction(["tgl" | rest]), do: ["inc"] ++ rest
  defp new_instruction(["inc" | rest]), do: ["dec"] ++ rest
  defp new_instruction(["dec" | rest]), do: ["inc"] ++ rest
  defp new_instruction(["cpy" | rest]), do: ["jnz"] ++ rest
  defp new_instruction(["jnz" | rest]), do: ["cpy"] ++ rest

  defp structured_data do
    AOCDay.Parser.parse
  end
end
