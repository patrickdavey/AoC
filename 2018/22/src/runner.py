from collections import defaultdict, namedtuple
from queue import PriorityQueue
Position = namedtuple("Position", "x, y, equipment")

LOCATIONS = [
    (0, -1),
    (-1, 0),
    (1, 0),
    (0, 1)
    ]
def print_map(board):
  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())
  s = ""
  for y in range(min_y, max_y + 1):
    for x in range(min_x, max_x + 1):
      if (x, y) in board:
        s += board[(x, y)]
      else:
        s += " "
    s +="\n"
  print(s)

class Runner():
  def __init__(self, depth, target):
    self.target = target
    self.erosions = {}
    self.terrain = {}
    self.depth = depth

  def part1(self):
    self.calculate_erosions()
    self.calculate_terrain()
    return self.calculate_score()

  def part2(self):
    return self.best_path()

  def calculate_erosions(self):
    (tx, ty) = self.target
    to_find = set()
    for y in range(ty + 1000):
      for x in range(tx + 1000):
        to_find.add((x, y))

    for point in to_find.copy():
      value = self.erosion_for(point)
      if value != None:
        self.erosions[point] = value
        to_find.remove(point)

  def erosion_for(self, point):
    (x, y) = point
    if point == (0,0) or point == self.target:
      return self.depth % 20183
    elif y == 0:
      return ((x * 16807) + self.depth) % 20183
    elif x == 0:
      return ((y * 48271) + self.depth) % 20183
    elif (x - 1, y) in self.erosions and (x, y - 1) in self.erosions:
      return ((self.erosions[(x - 1, y)] * self.erosions[(x, y - 1)]) + self.depth) % 20183
    else:
      return None

  def calculate_terrain(self):
    for point, level in self.erosions.items():
      if level % 3 == 0:
        self.terrain[point] = "."
      elif level % 3 == 1:
        self.terrain[point] = "="
      else:
        self.terrain[point] = "|"

  def calculate_score(self):
    score = 0
    (x, y) = self.target
    for y in range(y + 1):
      for x in range(x + 1):
        t = self.terrain[(x, y)]
        if t == "=":
          score += 1
        elif t == "|":
          score += 2
    return score

  def best_path(self):
    start = Position(0, 0, "T")
    goal  = Position(*self.target, "T")
    frontier = PriorityQueue()
    frontier.put((0, start))
    cost_so_far = {}
    cost_so_far[start] = 0

    while not frontier.empty():
      current = frontier.get()

      (final_cost, test) = current
      if test == goal:
        print(test)
        return final_cost

      for next_position in options(current, self.terrain):
        (cost, position) = next_position
        if position not in cost_so_far or cost < cost_so_far[position]:
          cost_so_far[position] = cost
          frontier.put(next_position)

def options(vertex, board):
  (cost, (x, y, equip)) = vertex
  possibilities = []
  for (dx, dy) in LOCATIONS:
    point = (x + dx, y + dy)
    if point in board:
      current_terrain = board[(x, y)]
      terrain_type = board[point]
      if can_move_into_terrain_cost_free(terrain_type, equip):
        # move, can be no point in swiching tools right now
        possibilities.append((cost + 1, Position(*point, equip)))
      else:
        # add all possible options for the next location.
        if current_terrain == ".":
          possibilities.append((cost + 7, Position(x, y, "T")))
          possibilities.append((cost + 7, Position(x, y, "C")))
        elif current_terrain == "=":
          possibilities.append((cost + 7, Position(x, y, "N")))
          possibilities.append((cost + 7, Position(x, y, "C")))
        else:
          possibilities.append((cost + 7, Position(x, y, "N")))
          possibilities.append((cost + 7, Position(x, y, "T")))
  return possibilities


def can_move_into_terrain_cost_free(terrain, equip):
  if terrain == "." and (equip == "T" or equip == "C"):
    return True
  elif terrain == "=" and (equip == "N" or equip == "C"):
    return True
  elif terrain == "|" and (equip == "N" or equip == "T"):
    return True

  return False


# 981 is too low
