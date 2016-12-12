defmodule AOCDay.Runner do
  alias AOCDay.Register
  def part_1 do
    Register.start_link(:a)
    Register.start_link(:b)
    Register.start_link(:c)
    Register.start_link(:d)
    Register.start_link(:always_on, 10)

    run_instruction(structured_data, 0)
  end

  def part_2 do
    GenServer.call(:a, {:cpy, 0, 0})
    GenServer.call(:b, {:cpy, 0, 0 })
    GenServer.call(:c, {:cpy, 1, 0 })
    GenServer.call(:d, {:cpy, 0, 0 })

    run_instruction(structured_data, 0)
  end

  defp structured_data do
    AOCDay.Parser.parse
  end

  def run_instruction(_instructions, nil, _index) do
    IO.puts GenServer.call(:a, { :current_value })
  end

  def run_instruction(instructions, index) do
    run_instruction(instructions, Enum.at(instructions, index), index)
  end

  def run_instruction(instructions, {reg, instruction}, index) when is_atom(reg) do
    run_instruction(instructions, GenServer.call(reg, Tuple.append(instruction, index)))
  end

end
