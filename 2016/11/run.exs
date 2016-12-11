initial = %AOCDay.Layout{
  steps: [],
  elevator: 0,
  floor_0: ["CG", "CM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

layout = %AOCDay.Layout{
  steps: [initial],
  elevator: 0,
  floor_0: ["CG", "CM", "LG", "PG", "RG", "RM", "TG", "TM"],
  floor_1: ["LM", "PM"],
  floor_2: [],
  floor_3: []
}

AOCDay.Runner.shortest_path(layout)
