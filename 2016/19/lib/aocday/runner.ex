defmodule AOCDay.Runner do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..number_elves)
    last_elf_standing(elves_in_game)
  end

  def last_elf_standing([h | []]), do: h
  def last_elf_standing([h | [h2 | []]]) do
    h
  end
  def last_elf_standing([h | [h2 | t]]) do
    l = Enum.take_every(t ++ [h], 2)
    last_elf_standing(l)
  end
end
