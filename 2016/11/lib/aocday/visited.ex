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
    Enum.member?(current_state, struct)
  end

  def add(struct) do
    Agent.update(__MODULE__,
    fn mapset ->
      MapSet.put(mapset, struct)
    end)
  end
end
