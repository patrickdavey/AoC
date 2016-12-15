alias AOCDay.Runner
alias AOCDay.Disc

disks = [
  %Disc{number: 1, positions: 17, position: 5},
  %Disc{number: 2, positions: 19, position: 8},
  %Disc{number: 3, positions: 7, position: 1},
  %Disc{number: 4, positions: 13, position: 7},
  %Disc{number: 5, positions: 5, position: 1},
  %Disc{number: 6, positions: 3, position: 0}
]
Application.put_env(:aoc, :start_disks, disks)
Application.put_env(:aoc, :final_position, 6)

Runner.find_time
|> fn(start_time) -> "Part 1 - start at time #{start_time}" end.()
|> IO.puts

disks = List.insert_at(disks, -1, %Disc{number: 7, positions: 11, position: 0})

Application.put_env(:aoc, :start_disks, disks)
Application.put_env(:aoc, :final_position, 7)

Runner.find_time
|> fn(start_time) -> "Part 2 - start at time #{start_time}" end.()
|> IO.puts
