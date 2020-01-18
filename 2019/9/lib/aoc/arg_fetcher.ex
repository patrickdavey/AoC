# lib/aoc/arg_fetcher.ex
defmodule AOC.ArgFetcher do
  @position_mode 0
  @immediate_mode 1
  @relative_mode 2
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
    9 => :relative_base,

    99 => :terminate
  }

  def fetch(state) do
    instruction_pointer = Map.fetch!(state, :instruction_pointer)
    relative_base = Map.fetch!(state, :relative_base)
    program = Map.fetch!(state, :program)
    instruction = Map.fetch!(program, instruction_pointer)

    { instruction_code, param_codes } = parse_command(instruction)
    { instruction_code, values_for_params(instruction_code, param_codes, program, instruction_pointer, relative_base) }
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

  defp values_for_params(:terminate, _, _, _, _), do: {}
  defp values_for_params(code, param_codes, program, location, relative_base) when code in @two_param_codes do
    [{:value, 0}, {:value, 1}, {:write_location, 2}]
    |> Enum.map(&(interpret(&1, param_codes, program, location, relative_base)))
    |> List.to_tuple
  end

  defp values_for_params(code, param_codes, program, location, relative_base) when code in @jump_codes do
    [{:value, 0}, {:value, 1}]
    |> Enum.map(&(interpret(&1, param_codes, program, location, relative_base)))
    |> List.to_tuple
  end

  defp values_for_params(:input, param_codes, program, location, relative_base) do
    { interpret({:write_location, 0}, param_codes, program, location, relative_base) }
  end

  defp values_for_params(:output, param_codes, program, location, relative_base) do
    { interpret({:value, 0}, param_codes, program, location, relative_base) }
  end

  defp values_for_params(:relative_base, param_codes, program, location, relative_base) do
    { interpret({:value, 0}, param_codes, program, location, relative_base) }
  end

  defp param_value(@position_mode, program, location, _), do: lookup(program, location)
  defp param_value(@immediate_mode, program, location, _), do: Map.fetch!(program, location)
  defp param_value(@relative_mode, program, location, relative_base), do: Map.get(program, Map.fetch!(program, location) + relative_base, 0)

  defp lookup(program, address), do: Map.get(program, Map.get(program, address, 0), 0)

  defp write_location(@position_mode, program, location, _), do: Map.get(program, location, 0)
  defp write_location(@relative_mode, program, location, relative_base), do: Map.get(program, location, 0) + relative_base

  defp interpret({:value, param}, param_codes, program, location, relative_base) do
    code = Map.get(param_codes, param, @position_mode)
    param_value(code, program, location + param + 1, relative_base)
  end

  defp interpret({:write_location, param}, param_codes, program, location, relative_base) do
    code = Map.get(param_codes, param, @position_mode)
    write_location(code, program, location + param + 1, relative_base)
  end
end
