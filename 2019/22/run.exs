p1 = AOC.Runner.part_1
     |> Enum.find(fn({k, v}) -> v == 2019 end)

IO.puts "part1 : #{ p1 }"
IO.puts "part2: #{ AOC.Runner.part_2 }"
