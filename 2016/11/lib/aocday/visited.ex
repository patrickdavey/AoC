defmodule AOCDay.Visited do
  def init do
    __MODULE__.start_link
  end

  def start_link do
    Agent.start_link(fn ->
      MapSet.new
    end, name: __MODULE__)
  end

  def current_state do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def visited?(struct) do
    Enum.member?(current_state, Map.delete(struct, :steps))
  end

  def add(struct) do
    Agent.update(__MODULE__,
    fn mapset ->
      MapSet.put(mapset, Map.delete(struct, :steps))
    end)
  end
end
