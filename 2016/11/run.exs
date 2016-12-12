
initial = %AOCDay.Layout{
  steps: [],
  elevator: 0,
  floor_0: ["EG", "EM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

layout = %AOCDay.Layout{
  steps: [initial],
  elevator: 0,
  floor_0: ["EG", "EM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

IO.puts "part1: #{AOCDay.Runner.shortest_path(layout)}"

initial = %AOCDay.Layout{

  steps: [],
  elevator: 0,
  floor_0: ["CG", "CM", "DG", "DM", "EG", "EM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

layout = %AOCDay.Layout{
  steps: [initial],
  elevator: 0,
  floor_0: ["CG", "CM", "DG", "DM", "EG", "EM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

IO.puts "part2: #{AOCDay.Runner.shortest_path(layout)}"
