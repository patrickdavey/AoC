defmodule AOCDay.Runner do
  @valid_registers ["a", "b", "c", "d"]

  def part_1 do
    registers = %{"a" => 0, "b" => 0, "c" => 0, "d" => 0}
    run(structured_data, 0, registers)
  end

  def part_2 do
    registers = %{"a" => 0, "b" => 0, "c" => 1, "d" => 0}
    run(structured_data, 0, registers)
  end

  def run(instructions, index, registers) when index >= length(instructions) do
    registers
  end

  def run(instructions, index, registers) do
    instruction = Enum.at(instructions, index)
    { next_index, registers, instructions } = apply(__MODULE__, :inst, instruction ++ [registers, index, instructions])

    run(instructions, next_index, registers)
  end

  def inst("cpy", source_reg, register, registers, current_index, instructions) when source_reg in @valid_registers do
    value = registers[source_reg]
    { current_index + 1, Map.put(registers, register, value), instructions }
  end

  def inst("cpy", value, register, registers, current_index, instructions) do
    value = String.to_integer(value)
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
      { current_index + String.to_integer(value), registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions) when value in @valid_registers do
    if String.to_integer(number) > 0 do
      { current_index + registers[value], registers, instructions }
    else
      { current_index +  1, registers, instructions }
    end
  end

  def inst("jnz", number, value, registers, current_index, instructions) do
    if String.to_integer(number) > 0 do
      { current_index + String.to_integer(value), registers, instructions }
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

  # defp value(x, regs) do
  #   case Integer.parse(x) do
  #     {n, _} -> n
  #     :error -> regs[String.to_atom(x)]
  #   end
  # end
end
