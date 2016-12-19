defmodule AOCDay.Runner do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..number_elves)
    last_elf_standing(elves_in_game)
  end

  def last_elf_standing([h | []]), do: h
  def last_elf_standing(elves_in_game) when rem(length(elves_in_game), 2) == 0 do
    l = Enum.take_every(elves_in_game, 2)
    last_elf_standing(l)
  end
  def last_elf_standing([h | t]) do
    list = [h] ++ t ++ [h] # ourself at the end
    element_to_drop = MapSet.new(Enum.drop_every(list, 2))
    list = Enum.reject(list, &(MapSet.member?(element_to_drop, &1)))
    last_elf_standing(list)
  end
end
