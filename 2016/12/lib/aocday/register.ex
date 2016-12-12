defmodule AOCDay.Register do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, [name: name])
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, 0 }
  end

  def handle_call({:current_value}, _from, value) do
    {:reply, value, value}
  end

  def handle_call({:inc}, _from, value) do
    {:reply, value + 1, value + 1}
  end

  def handle_call({:dec}, _from, value) do
    {:reply, value - 1, value - 1}
  end

  def handle_call({:cpy, new_value}, _from, value) when is_integer(new_value) do
    {:reply, new_value, new_value }
  end

  def handle_call({:cpy, register}, _from, value) do
    register_value = GenServer.call(register, {:current_value})
    {:reply, register_value, register_value }
  end
end

