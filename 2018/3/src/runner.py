import re
from collections import defaultdict

def parse(raw):
  lines = [line.strip() for line in raw.split("\n")]
  parsed = [re.search("#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line).groups() for line in lines]
  return [list(map(int, line)) for line in parsed]

def run(raw):
  claims = parse(raw)
  d = defaultdict(int)

  for (id, x, y, width, height) in claims:
    for x_pos in range(x, x + width):
      for y_pos in range(y, y + height):
        d[(x_pos, y_pos)] += 1
  return len([i for i in d.values() if i >= 2])

def run2(raw):
  claims = parse(raw)
  d = defaultdict(list)
  more_than_one_claim = set()

  for (id, x, y, width, height) in parse(raw):
    for x_pos in range(x, x + width):
      for y_pos in range(y, y + height):
        d[(x_pos, y_pos)].append(id)
        if len(d[(x_pos, y_pos)]) > 1:
          more_than_one_claim.update(set(d[(x_pos, y_pos)]))


  for (id, x, y, width, height) in claims:
    if id not in more_than_one_claim:
      return id

