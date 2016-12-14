defmodule AOCDay.Guesses do
  @mds5_to_check 1000

  alias AOCDay.Hasher
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, initial_guesses, [name: name])
  end

  ## Server Callbacks

  def init(map) do
    {:ok, map }
  end

  def handle_call(:reinit, _from, _map) do
    {:reply, :ok, initial_guesses}
  end

  def handle_call({:get_and_update, index}, _from, map) do
    current = map[rem(index, @mds5_to_check)]

    map = Map.update!(map, rem(index, @mds5_to_check), fn(_) ->
      Hasher.hash(index + @mds5_to_check)
    end)

    {:reply, {current, Map.values(map)}, map}
  end

  defp initial_guesses do
    (0..999)
      |> Enum.reduce(%{}, fn(i, acc) ->
         Map.put(acc, i, Hasher.hash(i))
      end)
  end
end

