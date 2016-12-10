defmodule AOCDay.Bot do
  def init do
    Agent.start_link(fn -> %{low: nil, high: nil, low_dest: nil, high_dest: nil} end)
  end

  def set_value(pid, value) do
    Agent.update(pid, fn( state = %{low: low, high: high, low_dest: low_dest, high_dest: high_dest} ) ->
      cond do
        low == nil && high == nil ->
           %{state | low: value}
        :otherwise ->
          Map.merge(state, new_values(state, value))
      end
     end)
  end

  def set_dest_info(pid, values) do
    Agent.update(pid, fn( state ) ->
      Map.merge(state, values)
     end)
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
