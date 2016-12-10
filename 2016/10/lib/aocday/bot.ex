defmodule AOCDay.Bot do
  alias AOCDay.Dest
  alias AOCDay.Runner

  def init do
    Agent.start_link(fn -> %{low: nil, high: nil, low_dest: nil, high_dest: nil} end)
  end

  def set_value(pid, value) do
    Agent.update(pid, fn( state = %{low: low, high: high, low_dest: low_dest, high_dest: high_dest} ) ->
      new_map = cond do
        low == nil && high == nil ->
           %{state | low: value}
        :otherwise ->
          Map.merge(state, new_values(state, value))
      end
      use_map(new_map)
      new_map
     end)
  end

  def set_dest_info(pid, values) do
    Agent.update(pid, fn( state ) ->
      new_map = Map.merge(state, values)
      use_map(new_map)
      new_map
     end)
  end

  def use_map(%{low: nil}), do: false
  def use_map(%{high: nil}), do: false
  def use_map(%{low_dest: nil}), do: false
  def use_map(%{high_dest: nil}), do: false
  def use_map(%{
    low: low,
    high: high,
    low_dest: %Dest{type: low_type, index: low_index},
    high_dest: %Dest{type: high_type, index: high_index}}) do
    Runner.instruction_in({ low_index, low_type, low })
    Runner.instruction_in({ high_index, high_type, high })
  end

  def get(pid) do
    Agent.get(pid, fn(n) -> n end)
  end

  def new_values(%{low: low, high: nil}, new_value) when new_value > low do
    %{low: low, high: new_value}
  end

  def new_values(%{low: low, high: nil}, new_value) when new_value <= low do
    %{low: new_value, high: low}
  end
end
