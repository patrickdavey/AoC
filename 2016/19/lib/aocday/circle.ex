defmodule AOCDay.Circle do
  def who_has_all_presents?(number_elves) do
    elves_in_game = Enum.to_list(1..div(number_elves, 2))
    elves_in_game2 = Enum.to_list((div(number_elves, 2) + 1)..number_elves)

    last_elf_standing(elves_in_game2 ++ elves_in_game, 1, [])
  end

  def last_elf_standing([a | []], _count, []) do
    a
  end

  def last_elf_standing([a | []], count, remainder) when rem(count, 3) == 0 do
    last_elf_standing(Enum.reverse([a] ++ remainder), count + 1, [])
  end

  def last_elf_standing([a | []], count, remainder) when rem(count, 3) != 0 do
    last_elf_standing(Enum.reverse(remainder), count + 1, [])
  end
  def last_elf_standing([a | t], count, remainder) when rem(count, 3) != 0 do
    last_elf_standing(t, count + 1, remainder)
  end

  def last_elf_standing([a | t], count, remainder) when rem(count, 3) == 0 do
    last_elf_standing(t, count + 1, [a] ++ remainder)
  end
end
