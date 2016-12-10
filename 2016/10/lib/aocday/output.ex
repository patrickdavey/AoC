defmodule AOCDay.Output do
  def init do
    __MODULE__.start_link
  end

  def start_link do
    Agent.start_link(fn ->
      %{}
    end, name: __MODULE__)
  end

end
