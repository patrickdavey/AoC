defmodule AOCDay.Runner do
  alias AOCDay.Register
  def part_1 do
    Register.start_link(:a)
    Register.start_link(:b)
    Register.start_link(:c)
    Register.start_link(:d)

    run_instruction(structured_data, 0)
  end

  def part_2 do
    "part 2"
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  def run_instruction(instructions, nil, index) do
    IO.puts GenServer.call(:a, { :current_value })
  end

  def run_instruction(instructions, {register, {:inc}}, index) do
    GenServer.call(register, {:inc})
    run_instruction(instructions, index + 1)
  end

  def run_instruction(instructions, {register, {:dec}}, index) do
    GenServer.call(register, {:dec})
    run_instruction(instructions, index + 1)
  end

  def run_instruction(instructions, {register, inst = {:cpy, value}}, index) do
    GenServer.call(register, inst)
    run_instruction(instructions, index + 1)
  end

  def run_instruction(instructions, {register, inst = {:jnz, value}}, index) when is_integer(register) and register != 0 do
    run_instruction(instructions, index + value)
  end

  def run_instruction(instructions, {register, inst = {:jnz, value}}, index) when is_integer(register) and register == 0 do
    run_instruction(instructions, index + 1)
  end

  def run_instruction(instructions, {register, inst = {:jnz, value}}, index) do
    register_value = GenServer.call(register, {:current_value})
    cond do
      register_value != 0 -> run_instruction(instructions, index + value )
      :otherwise -> run_instruction(instructions, index + 1)
    end
  end

  def run_instruction(instructions, index) do
    run_instruction(instructions, Enum.at(instructions, index), index)
  end

  defp tell(index) do
    IO.puts"\nA is :#{GenServer.call(:a, {:current_value})}"
    IO.puts"B is :#{GenServer.call(:b, {:current_value})}"
    IO.puts"C is :#{GenServer.call(:c, {:current_value})}"
    IO.puts"D is :#{GenServer.call(:d, {:current_value})}"
    IO.puts"index is: #{index}"
    IO.puts"\n\n\n"
  end
end
