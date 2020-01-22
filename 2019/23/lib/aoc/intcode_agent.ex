defmodule AOC.IntcodeAgent do
  alias AOC.ArgFetcher

  def init(state) do
    state
    |> Map.put(:instruction_pointer, 0)
    |> Map.put(:relative_base, 0)
    |> loop
  end

  defp loop(state) do
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
    |> update_program(address, a * b)
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
      {:reset, output_pid, program} ->
        %{}
        |> Map.put(:supervisor, output_pid)
        |> Map.put(:instruction_pointer, 0)
        |> Map.put(:relative_base, 0)
        |> Map.put(:program, program)
        |> run
    after
      100 ->
        send(Map.fetch!(state, :supervisor), {:idle, self()})
        send(self(), {:input, -1 })
        execute({:input, {address}}, state)
    end
  end

  defp execute({:output, {value}}, state) do
    send(Map.fetch!(state, :supervisor), {:input, value, self()})

    state
    |> advance_pointer(2)
    |> run
  end

  defp execute({:jump_if_true, {a, address}}, state) do
    cond do
      a != 0 -> state |> set_pointer(address)
      true -> state |> advance_pointer(3)
    end |> run
  end

  defp execute({:jump_if_false, {a, address}}, state) do
    cond do
      a == 0 -> state |> set_pointer(address)
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

  defp execute({:relative_base, {offset}}, state) do
    state
    |> update_relative_base(offset)
    |> advance_pointer(2)
    |> run
  end


  defp execute({:terminate, _}, state) do
    send(Map.fetch!(state, :supervisor), {:terminating, self()})
  end

  defp update_program(state, address, value) do
    state
    |> Map.put(:program, Map.put(Map.get(state, :program), address, value))
  end

  defp update_relative_base(state, offset) do
    state
    |> Map.put(:relative_base, Map.get(state, :relative_base) + offset)
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
    IO.puts("#{inspect state} at #{ints}")
    state
  end
end
