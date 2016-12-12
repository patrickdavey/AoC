defmodule AOCDay.Register do
  use GenServer

  def start_link(name, start \\ 0) do
    GenServer.start_link(__MODULE__, start, [name: name])
  end

  ## Server Callbacks

  def init(start) do
    {:ok, start }
  end

  def handle_call({:current_value}, _from, value) do
    {:reply, value, value}
  end

  def handle_call({:inc, index}, _from, value) do
    {:reply, index + 1, value + 1}
  end

  def handle_call({:dec, index}, _from, value) do
    {:reply, index + 1, value - 1}
  end

  def handle_call({:cpy, new_value, index}, _from, value) when is_integer(new_value) do
    {:reply, index + 1, new_value }
  end

  def handle_call({:cpy, register, index}, _from, value) do
    register_value = GenServer.call(register, {:current_value})
    {:reply, index + 1, register_value }
  end

  def handle_call({:jnz, offset, index}, _from, value) do
    if value != 0 do
      {:reply, index + offset, value }
    else
      {:reply, index + 1, value }
    end
  end
end

