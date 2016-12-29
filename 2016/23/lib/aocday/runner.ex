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
    { offset, registers } = apply(__MODULE__, :inst, instruction ++ [registers])

    run(instructions, index + offset, registers)
  end

  def inst("cpy", source_reg, register, registers) when source_reg in @valid_registers do
    value = registers[source_reg]
    { 1, Map.put(registers, register, value) }
  end

  def inst("cpy", value, register, registers) do
    value = String.to_integer(value)
    { 1, Map.put(registers, register, value) }
  end

  def inst("inc", register, registers) when register in @valid_registers do
    { 1, Map.update!(registers, register, fn(current_value) ->
      current_value + 1
    end) }
  end

  def inst("dec", register, registers) when register in @valid_registers do
    { 1, Map.update!(registers, register, fn(current_value) ->
      current_value - 1
    end) }
  end

  def inst("jnz", register, value, registers) when register in @valid_registers do
    if registers[register] != 0 do
      { String.to_integer(value), registers }
    else
      { 1, registers }
    end
  end

  def inst("jnz", number, value, registers) do
    if String.to_integer(number) != 0 do
      { String.to_integer(value), registers }
    else
      { 1, registers }
    end
  end

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
