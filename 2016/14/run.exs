alias AOCDay.Runner

Application.put_env(:aoc, :num_hashes, 1)
Application.put_env(:aoc, :salt, "zpqevtbw")
IO.puts Runner.solve

GenServer.call(:guesser, :reinit)
Application.put_env(:aoc, :num_hashes, 2017)
IO.puts Runner.solve
