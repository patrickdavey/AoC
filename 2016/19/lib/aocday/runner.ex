defmodule AOCDay.Runner do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..number_elves)
    last_elf_standing(elves_in_game, [])
  end

  def last_elf_standing([], [e]), do: e
  def last_elf_standing([elf], rest) do
    last_elf_standing([elf | Enum.reverse(rest)], [])
  end

  def last_elf_standing([], rest) do
    last_elf_standing(Enum.reverse(rest), [])
  end

  def last_elf_standing([a, b | t], rest) do
    last_elf_standing(t, [a | rest])
  end
end
