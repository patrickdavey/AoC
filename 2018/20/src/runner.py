from collections import defaultdict
from print_board import print_board

LOCATIONS = [
    [-1, -1],
    [0, -1],
    [1, -1],
    [-1, 0],
    [1, 0],
    [-1, 1],
    [0, 1],
    [1, 1]
    ]

def options(vertex, board):
  (x, y) = vertex
  possibilities = []
  if (board[(x, y - 1)] == '-'):
    possibilities.append([(x, y - 1), (x, y - 2)])
  if (board[(x - 1, y)] == '|'):
    possibilities.append([(x - 1, y), (x - 2, y)])
  if (board[(x + 1, y)] == '|'):
    possibilities.append([(x + 1, y), (x + 2, y)])
  if (board[(x, y + 1)] == '-'):
    possibilities.append([(x, y + 1), (x, y + 2)])
  return possibilities

def bfs(board):
  queue = [((0,0),0)]
  most_doors = 0
  thousand_doors = 0

  while queue:
    (vertex, length) = queue.pop(0)
    if length >= most_doors:
      most_doors = length
    if length >= 1000:
      thousand_doors += 1
    board[vertex] = "#"

    for possible in options(vertex, board):
      board[possible[0]] = "#" # seal off door
      board[possible[1]] = "#" # move into room and seal it
      queue.append((possible[1], length + 1))
  return (most_doors, thousand_doors)

class Runner():
  def __init__(self, raw):
    self.raw = list(raw.strip())
    self.board = {}
    self.board[(0,0)] = "X"
    self.build_map(0, (0,0), (0,0), [])
    (longest, thousand) = bfs(self.board.copy())
    self.longest = longest
    self.thousand = thousand


  def part1(self):
    return self.longest

  def part2(self):
    return self.thousand

  def build_map(self, index, location, location_before_branch, backtrack):
    (x, y) = location
    while True:
      self.mark_positions_as_unknown((x, y))

      char = self.raw[index]
      if char == "N":
        self.board[(x, y - 1)] = "-"
        y -= 2
        self.board[(x, y)] = "."
        index += 1
      elif char == "S":
        self.board[(x, y + 1)] = "-"
        y += 2
        self.board[(x, y)] = "."
        index += 1
      elif char == "E":
        self.board[(x + 1, y)] = "|"
        x += 2
        self.board[(x, y)] = "."
        index += 1
      elif char == "W":
        self.board[(x - 1, y)] = "|"
        x -= 2
        self.board[(x, y)] = "."
        index += 1
      elif char == "$":
        print("we have reached the end")
        self.fill_walls()
        return
      elif char == "^":
        self.board[(x, y)] = "X"
        index += 1
      elif char == "(":
        backtrack.append((x, y))
        index += 1
        # we're starting a branch
      elif char == ")":
        (x, y) = backtrack.pop()
        index += 1
        pass
        # help
      elif char == "|":
        #reset position
        last_branch = backtrack[-1]
        (x, y) = last_branch
        index += 1
      else:
        raise "should not get here"

  def fill_walls(self):
    for key, value in self.board.items():
      if value == "?":
        self.board[key] = "#"

  def mark_positions_as_unknown(self, location):
    (x, y) = location
    for (x_off, y_off) in LOCATIONS:
      check = (x + x_off, y + y_off)
      if check not in self.board:
        self.board[check] = "?"
