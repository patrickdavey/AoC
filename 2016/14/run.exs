alias AOCDay.Runner

Application.put_env(:aoc, :num_hashes, 1)
Application.put_env(:aoc, :salt, "zpqevtbw")
IO.puts Runner.part_1

Application.put_env(:aoc, :num_hashes, 2017)
Application.put_env(:aoc, :salt, "zpqevtbw")
IO.puts Runner.part_1
