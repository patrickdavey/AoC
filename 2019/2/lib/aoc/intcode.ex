defmodule AOC.Intcode do
  @add_opcode 1
  @mult_opcode 2
  @terminate 99

  def execute(program, instruction_pointer \\ 0) do
    execute(Map.fetch!(program, instruction_pointer), program, instruction_pointer)
  end

  def execute(@add_opcode, program, instruction_pointer) do
    program
    |> execute_opcode(instruction_pointer, &Kernel.+/2)
    |> execute(instruction_pointer + 4)
  end

  def execute(@mult_opcode, program, instruction_pointer) do
    program
    |> execute_opcode(instruction_pointer, &Kernel.*/2)
    |> execute(instruction_pointer + 4)
  end

  def execute(@terminate, program, _instruction_pointer) do
    program
  end

  def execute_opcode(program, instruction_pointer, op) do
    Map.put(
      program,
      Map.fetch!(program, instruction_pointer + 3),
      op.(
        lookup(program, instruction_pointer + 1),
        lookup(program, instruction_pointer + 2)
      )
    )
  end

  defp lookup(program, address), do: Map.fetch!(program, Map.fetch!(program, address))
end
