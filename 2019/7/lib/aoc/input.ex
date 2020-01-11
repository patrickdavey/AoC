defmodule AOC.Input do
  use Agent

  def start_link(values) do
    Agent.start_link(fn -> values end, name: __MODULE__)
  end

  def value do
    Agent.get_and_update(__MODULE__, fn([h |t]) -> { h, t} end)
  end

  def set(value) do
    Agent.update(__MODULE__, fn(_val) -> value end)
  end
end
