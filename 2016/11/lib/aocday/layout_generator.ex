defmodule AOCDay.LayoutGenerator do
  alias AOCDay.Layout
  alias AOCDay.LayoutValidator
  alias AOCDay.Visited

  def nodes(initial) do
    Visited.add(initial)
    items_on_my_floor = Map.get(initial, String.to_atom("floor_#{initial.elevator}"))
    t = comb(2, items_on_my_floor) ++ comb(1, items_on_my_floor)
    |> Enum.map(&create(&1, initial))
    |> List.flatten
    |> Enum.filter(&LayoutValidator.valid?/1)
    |> Enum.filter(&not_visited_yet?/1)
  end

  # def create(items_to_move, state = %{elevator: 0}) do
  #   floor_above = state.floor_1
  #   new_floor = (floor_above ++ items_to_move) |> Enum.sort
  #   old_floor = MapSet.difference(MapSet.new(state.floor_0), MapSet.new(items_to_move)) |> MapSet.to_list |> Enum.sort
  #   %{state | elevator: 1, floor_0: old_floor, floor_1: new_floor}
  # end

  def create(items_to_move, state = %{elevator: x}) do
    my_floor_id = String.to_atom("floor_#{x}")
    my_floor = Map.get(state, my_floor_id)
    old_floor = MapSet.difference(MapSet.new(my_floor), MapSet.new(items_to_move)) |> MapSet.to_list |> Enum.sort

    s_up =
      cond do
        x + 1 < 4  ->
          above = String.to_atom("floor_#{x + 1}")
          floor_above = Map.get(state, above)
          new_floor = (floor_above ++ items_to_move) |> Enum.sort
          s_up = Map.put(state, :elevator, x + 1)
          s_up = Map.put(s_up, my_floor_id, old_floor)
          s_up = Map.put(s_up, above, new_floor)
          s_up
        :otherwise -> []
      end

    s_down =
      cond do
        x - 1 > -1  ->
          below = String.to_atom("floor_#{x - 1}")
          floor_below = Map.get(state, below)
          new_floor = (floor_below ++ items_to_move) |> Enum.sort
          s_down = Map.put(state, :elevator, x - 1)
          s_down = Map.put(s_down, my_floor_id, old_floor)
          s_down = Map.put(s_down, below, new_floor)
          s_down
        :otherwise -> []
      end

    [s_up, s_down]
  end

  defp not_visited_yet?(struct) do
    cond do
      Visited.visited?(struct) -> false
      :otherwise ->
        Visited.add(struct)
        true
    end
  end

  def comb(0, _), do: [[]]
  def comb(_, []), do: []
  def comb(m, [h|t]) do
    (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
  end
end
