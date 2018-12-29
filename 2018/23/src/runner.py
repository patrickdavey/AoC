import re
from queue import PriorityQueue
from collections import defaultdict, namedtuple, Counter
Point = namedtuple("Point", "x, y, z")

def extract_ints(a_string):
    return tuple(map(int, re.findall(r'-?\d+', a_string)))

def manhattan_distance(point_a, point_b):
  (x1, y1, z1) = point_a
  (x2, y2, z2) = point_b
  return abs(x1 - x2) + abs(y1 - y2) + abs(z1 - z2)

class Runner():
  def __init__(self, raw):

    self.bots = {}
    max_power = 0
    best_bot = None
    for line in raw.splitlines():
      (x, y, z, radius) = extract_ints(line)

      p = Point(x, y, z)
      if radius > max_power:
        max_power = radius
        best_bot = p
      self.bots[p] = radius
    self.best_bot = best_bot
    self.best_bot_power = max_power

  def part1(self):
    in_range = 0
    for b in self.bots:
      if manhattan_distance(self.best_bot, b) <= self.best_bot_power:
        in_range += 1
    return in_range

  def part2(self):
    q = PriorityQueue()
    for (x, y, z), r in self.bots.items():
      dist = abs(x) + abs(y) + abs(z)
      if dist == 0:
        import ipdb; ipdb.set_trace()

      q.put((max(0, dist - r),1))
      q.put((dist + r + 1,-1))
    count = 0
    maxCount = 0
    result = 0
    while not q.empty():
      dist,e = q.get()
      import ipdb; ipdb.set_trace()
      count += e
      if count > maxCount:
        result = dist
        maxCount = count
    print(result)

# 84087794 is too low
