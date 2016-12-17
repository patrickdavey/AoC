defmodule AOCDay.Found do
  def init do
    __MODULE__.start_link
  end

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def current_state do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def add(string) do
    Agent.update(__MODULE__,
    fn list ->
      List.insert_at(list, -1, string)
    end)
  end
end
