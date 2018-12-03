from grouper import group_count
from itertools import combinations, compress

def run(input):
  ids = [line.strip() for line in input.splitlines()]
  counts = [group_count(id) for id in ids]
  twos = 0
  threes = 0

  for (two, three) in counts:
    twos += two
    threes += three
  return twos * threes

def run2(input):
  ids = [line.strip() for line in input.splitlines()]
  for (first, second) in combinations(ids, 2):
    diff = [c1 == c2 for (c1, c2) in zip(first, second)]
    if sum(diff) == (len(first) - 1):
      return "".join(compress(first, diff))
