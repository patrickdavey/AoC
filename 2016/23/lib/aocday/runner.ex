defmodule AOCDay.Runner do
  @valid_registers ["a", "b", "c", "d"]

  def part_1 do
    registers = %{"a" => 7, "b" => 0, "c" => 0, "d" => 0}
    run(structured_data, 0, registers)
  end

  def part_2 do
    registers = %{"a" => 12, "b" => 0, "c" => 0, "d" => 0}
    run(structured_data, 0, registers)
  end

  def run(instructions, index, registers) when index >= length(instructions) do
    registers
  end

  def run(instructions, index, registers) do
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

        run(instructions, index + 6, registers)
      _ ->
        instruction = Enum.at(instructions, index)
        { next_index, registers, instructions } = apply(__MODULE__, :inst, instruction ++ [registers, index, instructions])
        run(instructions, next_index, registers)
    end
  end

  defp value_for(registers, register) when register in @valid_registers, do: registers[register]
  defp value_for(_registers, value), do: value

  def inst("cpy", source_reg, register, registers, current_index, instructions) when source_reg in @valid_registers and register in @valid_registers do
    value = registers[source_reg]
    { current_index + 1, Map.put(registers, register, value), instructions }
  end

  def inst("cpy", value, register, registers, current_index, instructions) when register in @valid_registers do
    { current_index + 1, Map.put(registers, register, value), instructions }
  end

  def inst("inc", register, registers, current_index, instructions) when register in @valid_registers do
    { current_index + 1, Map.update!(registers, register, fn(current_value) ->
      current_value + 1
    end), instructions }
  end

  def inst("dec", register, registers, current_index, instructions) when register in @valid_registers do
    { current_index + 1, Map.update!(registers, register, fn(current_value) ->
      current_value - 1
    end), instructions }
  end

  def inst("jnz", register, value, registers, current_index, instructions) when register in @valid_registers and value in @valid_registers do
    if registers[register] != 0 do
      { current_index + registers[value], registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("jnz", register, value, registers, current_index, instructions) when register in @valid_registers do
    if registers[register] != 0 do
      { current_index + value, registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions) when value in @valid_registers do
    if number > 0 do
      { current_index + registers[value], registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions) do
    if number > 0 do
      { current_index + value, registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("tgl", register, registers, current_index, instructions) when register in @valid_registers do
    offset = registers[register]
    target_instruction = Enum.at(instructions, current_index + offset)
    if target_instruction do
      new_instruction = new_instruction(target_instruction)
      instructions= List.replace_at(instructions, current_index + offset, new_instruction)
      { current_index +  1, registers, instructions }
    else
      { current_index +  1, registers, instructions }
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
