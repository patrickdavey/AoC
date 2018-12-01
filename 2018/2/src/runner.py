from grouper import group_count

def run(input):
  ids = [line.strip() for line in input.splitlines()]
  counts = [group_count(id) for id in ids]
  twos = 0
  threes = 0

  for (two, three) in counts:
    twos += two
    threes += three
  return twos * threes
