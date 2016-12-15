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
Runner.find_time
