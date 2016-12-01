defmodule AOCDay.Map do
  def start_link do
    Agent.start_link(fn -> { MapSet.new, nil } end, name: __MODULE__)
  end

  def add_location(position) do Agent.update(__MODULE__,
    fn { map, crossing } ->
      cond do
        MapSet.member?(map, position) ->
          crossing = crossing || position
        :otherwise ->
          map = MapSet.put(map, position)
       end
       { map, crossing }
    end)
  end

  def crossing_distance do
    Agent.get(__MODULE__, fn { map, crossing } ->
      {x, y } = crossing
      abs(x) + abs(y)
    end)
  end

  def current_state do
    Agent.get(__MODULE__, fn { map, crossing } -> { map, crossing} end)
  end
end
