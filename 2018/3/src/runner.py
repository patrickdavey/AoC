import re
from collections import defaultdict

def parse(raw):
  lines = [line.strip() for line in raw.split("\n")]
  parsed = [re.search("#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line).groups() for line in lines]
  return [list(map(int, line)) for line in parsed]

def run(raw):
  claims = parse(raw)
  d = defaultdict(int)

  for claim in claims:
    (_id, x, y, width, height) = claim
    for x_pos in range(x, x + width):
      for y_pos in range(y, y + height):
        d[(x_pos, y_pos)] += 1
  return len([i for i in d.values() if i >= 2])
