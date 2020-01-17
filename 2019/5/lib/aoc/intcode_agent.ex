defmodule AOC.IntcodeAgent do
  alias AOC.ArgFetcher

  def init(state) do
    state
    |> Map.put(:instruction_pointer, 0)
    |> loop
  end

  def loop(state) do
    receive do
      {:set_initial, output_pid, program} ->
        loop(state
        |> Map.put(:output_pid, output_pid)
        |> Map.put(:program, program)
        )
      :run -> run(state)
     end
  end

  defp run(state) do
    state
    |> ArgFetcher.fetch
    |> execute(state)
  end

  defp execute({:add, {a, b, address}}, state) do
    state
    |> update_program(address, a + b)
    |> advance_pointer(4)
    |> run
  end

  defp execute({:mult, {a, b, address}}, state) do
    state
    |> update_program(address, a*b)
    |> advance_pointer(4)
    |> run
  end

  defp execute({:input, {address}}, state) do
    receive do
      {:input, value } ->
        state
        |> update_program(address, value)
        |> advance_pointer(2)
        |> run
    end
  end

  defp execute({:output, {value}}, state) do
    send(Map.fetch!(state, :output_pid), {:input, value})
    send(Map.fetch!(state, :supervisor), {:input, value, self()})

    state
    |> advance_pointer(2)
    |> run
  end

  defp execute({:jump_if_true, {a, value}}, state) do
    cond do
      a != 0 -> state |> set_pointer(value)
      true -> state |> advance_pointer(3)
    end |> run
  end

  defp execute({:jump_if_false, {a, value}}, state) do
    cond do
      a == 0 -> state |> set_pointer(value)
      true -> state |> advance_pointer(3)
    end |> run
  end

  defp execute({:less_than, {a, b, address}}, state) do
    state
    |> update_program(address, (if a < b, do: 1, else: 0))
    |> advance_pointer(4)
    |> run
  end

  defp execute({:equals, {a, b, address}}, state) do
    state
    |> update_program(address, (if a == b, do: 1, else: 0))
    |> advance_pointer(4)
    |> run
  end

  defp execute({:terminate, _}, state) do
    send(Map.fetch!(state, :supervisor), {:terminating, self()})
  end

  defp update_program(state, address, value) do
    state
    |> Map.put(:program, Map.put(Map.get(state, :program), address, value))
  end

  defp advance_pointer(state, offset) do
    state
    |> Map.put(:instruction_pointer, Map.get(state, :instruction_pointer) + offset)
  end

  defp set_pointer(state, value) do
    state
    |> Map.put(:instruction_pointer, value)
  end

  defp debug(state) do
    ints = Map.get(state, :instruction_pointer)
    pid = self()
    IO.puts("#{inspect pid} at #{ints}")
  end
end
