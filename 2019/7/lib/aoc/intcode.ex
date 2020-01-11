defmodule AOC.Intcode do
  alias AOC.Input

  @add_opcode 1
  @mult_opcode 2
  @input_opcode 3
  @output_opcode 4
  @jump_if_true 5
  @jump_if_false 6
  @less_than_opcode 7
  @equals_opcode 8
  @terminate_opcode 99

  @position_mode 0
  @immediate_mode 1

  def execute(program, instruction_pointer \\ 0) do
    execute(parse_command(Map.fetch!(program, instruction_pointer)), program, instruction_pointer)
  end

  def execute({ @add_opcode, params }, program, instruction_pointer) do
    [op1, op2] = fetch_n_params(program, params, instruction_pointer, 2)

    Map.put(program, Map.fetch!(program, instruction_pointer + 3), op1 + op2)
    |> execute(instruction_pointer + 4)
  end

  def execute({ @mult_opcode, params }, program, instruction_pointer) do
    [op1, op2] = fetch_n_params(program, params, instruction_pointer, 2)

    Map.put(program, Map.fetch!(program, instruction_pointer + 3), op1 * op2)
    |> execute(instruction_pointer + 4)
  end

  def execute({ @input_opcode, params }, program, instruction_pointer) do
    save_position = Map.fetch!(program, instruction_pointer + 1)
    val = Input.value

    Map.put(program, save_position, val)
    |> execute(instruction_pointer + 2)
  end

  def execute({ @output_opcode, params }, program, instruction_pointer) do
    [value] = fetch_n_params(program, params, instruction_pointer, 1)

    Map.update(program, "output", [value], &([value | &1]))
    |> execute(instruction_pointer + 2)
  end

  def execute({ @jump_if_true, params }, program, instruction_pointer) do
    [test_value, true_value] = fetch_n_params(program, params, instruction_pointer, 2)

    pointer = if test_value != 0 do true_value else instruction_pointer + 3 end

    execute(program, pointer)
  end

  def execute({ @jump_if_false, params }, program, instruction_pointer) do
    [test_value, true_value] = fetch_n_params(program, params, instruction_pointer, 2)

    pointer = if test_value == 0 do true_value else instruction_pointer + 3 end

    execute(program, pointer)
  end

  def execute({ @less_than_opcode, params }, program, instruction_pointer) do
    [op1, op2] = fetch_n_params(program, params, instruction_pointer, 2)

    store = if op1 < op2 do 1 else 0 end

    Map.put(program, Map.fetch!(program, instruction_pointer + 3), store)
    |> execute(instruction_pointer + 4)
  end

  def execute({ @equals_opcode, params }, program, instruction_pointer) do
    [op1, op2] = fetch_n_params(program, params, instruction_pointer, 2)

    store = if op1 == op2 do 1 else 0 end

    Map.put(program, Map.fetch!(program, instruction_pointer + 3), store)
    |> execute(instruction_pointer + 4)
  end

  def execute({ @terminate_opcode, _params }, program, _instruction_pointer) do
    program
  end

  defp parse_command(value) do
    instruction_code = value
                       |> Integer.digits
                       |> Enum.take(-2)
                       |> Enum.join
                       |> String.to_integer #there has to be a better way

    param_codes = value |> Integer.digits
                  |> Enum.reverse
                  |> Enum.drop(2)
                  |> Enum.with_index
                  |> Enum.into(%{}, fn({i, j}) -> { j, i } end)
    { instruction_code, param_codes }
  end

  defp fetch_value(program, @position_mode, address), do: lookup(program, address)
  defp fetch_value(program, @immediate_mode, position), do: Map.fetch!(program, position)
  defp lookup(program, address), do: Map.fetch!(program, Map.fetch!(program, address))

  defp param_value(program, params, instruction_pointer, param_number) do
    fetch_value(program, Map.get(params, param_number, @position_mode), instruction_pointer + 1 + param_number)
  end

  defp fetch_n_params(program, params, instruction_pointer, number) do
    (0..(number - 1))
    |> Enum.map(&(param_value(program, params, instruction_pointer, &1)))
  end
end
