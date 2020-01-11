defmodule AOC.Input do
  use Agent

  def start_link(initial_value \\ 0) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def set(value) do
    Agent.update(__MODULE__, fn(_val) -> value end)
  end
end
