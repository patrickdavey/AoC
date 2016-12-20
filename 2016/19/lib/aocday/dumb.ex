defmodule AOCDay.Dumb do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..number_elves)
    last_elf_standing(elves_in_game)
  end

  def last_elf_standing([elf]), do: elf
  def last_elf_standing(elves) do
    to_delete = Enum.at(elves, div(length(elves), 2))
    elves = List.delete_at(elves, div(length(elves), 2))
    [h | t] = elves
    last_elf_standing(t ++ [h])
  end
end
