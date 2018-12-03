import re
from collections import defaultdict, namedtuple

Claim = namedtuple('Claim', 'id x y width height')

def parse(raw):
  lines = [line.strip() for line in raw.split("\n")]
  parsed = [re.search("#(\d+) @ (\d+),(\d+): (\d+)x(\d+)", line).groups() for line in lines]
  return [Claim(*list(map(int, line))) for line in parsed]

def run(raw):
  claims = parse(raw)
  d = defaultdict(int)

  for claim in claims:
    for x_pos in range(claim.x, claim.x + claim.width):
      for y_pos in range(claim.y, claim.y + claim.height):
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


### elegant solution from https://www.reddit.com/r/adventofcode/comments/a2lesz/2018_day_3_solutions/eazoznn
# import re
# from collections import Counter

# claims = [[*map(int, re.findall(r'\d+', l))] for l in input.splitlines() if l]
# squares = lambda c: ((i, j) for i in range(c[1], c[1]+c[3])
#                             for j in range(c[2], c[2]+c[4]))
# fabric = Counter(s for c in claims for s in squares(c))

# part1 = sum(1 for v in fabric.values() if v > 1)
# part2 = next(c[0] for c in claims if all(fabric[s] == 1 for s in squares(c)))
