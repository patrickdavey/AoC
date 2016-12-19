defmodule AOCDay.Runner do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..number_elves)
    last_elf_standing(elves_in_game)
  end

  def last_elf_standing([h | []]), do: h

  def last_elf_standing(elves_in_game = [h | t]) do
    elves = List.replace_at(elves_in_game, div(length(elves_in_game), 2), nil)
    elves = List.delete_at(elves, 0)
    last_elf_standing(List.insert_at(elves, -1, h))
  end
end
