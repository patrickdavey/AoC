def run_order(actors):
  actors.sort(key=lambda actor: (actor["y"], actor["x"]))
  return actors
