# lib/aoc/arg_fetcher.ex
defmodule AOC.ArgFetcher do
  @position_mode 0
  @immediate_mode 1
  @jump_codes [:jump_if_true, :jump_if_false]
  @two_param_codes [:add, :mult, :less_than, :equals]
  @opcode_map %{
    1 => :add,
    2 => :mult,
    3 => :input,
    4 => :output,
    5 => :jump_if_true,
    6 => :jump_if_false,
    7 => :less_than,
    8 => :equals,

    99 => :terminate
  }

  def fetch(state) do
    instruction_pointer = Map.fetch!(state, :instruction_pointer)
    program = Map.fetch!(state, :program)
    instruction = Map.fetch!(program, instruction_pointer)

    { instruction_code, param_codes } = parse_command(instruction)
    { instruction_code, values_for_params(instruction_code, param_codes, program, instruction_pointer) }
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
    { Map.fetch!(@opcode_map, instruction_code), param_codes }
  end

  defp values_for_params(:terminate, _, _, _), do: {}
  defp values_for_params(code, param_codes, program, location) when code in @two_param_codes do
    param_code_1 = Map.get(param_codes, 0, @position_mode)
    param_code_2 = Map.get(param_codes, 1, @position_mode)

    value1 = param_value(param_code_1, program, location + 1)
    value2 = param_value(param_code_2, program, location + 2)
    output_location = Map.get(program, location + 3) # always just the position (at the moment)

    { value1, value2, output_location }
  end

  defp values_for_params(code, param_codes, program, location) when code in @jump_codes do
    param_code_1 = Map.get(param_codes, 0, @position_mode)
    param_code_2 = Map.get(param_codes, 1, @position_mode)

    value1 = param_value(param_code_1, program, location + 1)
    value2 = param_value(param_code_2, program, location + 2)

    { value1, value2 }
  end
  defp values_for_params(:input, param_codes, program, location) do
    { Map.get(program, location + 1) }
  end

  defp values_for_params(:output, param_codes, program, location) do
    param_code_1 = Map.get(param_codes, 0, @position_mode)
    { param_value(param_code_1, program, location + 1) }
  end

  defp param_value(@position_mode, program, location), do: lookup(program, location)
  defp param_value(@immediate_mode, program, location), do: Map.fetch!(program, location)

  defp lookup(program, address), do: Map.fetch!(program, Map.fetch!(program, address))
end
