from collections import defaultdict, Counter
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
def around(x, y, board):
  surrounds = []
  for (x_off, y_off) in LOCATIONS:
    check = (x + x_off, y + y_off)
    if check in board:
      surrounds.append(board[check])
  return Counter(surrounds)




class Runner():
  def __init__(self, raw):
    self.board = {}
    for y, line in enumerate(raw.splitlines()):
      for x, c in enumerate(line):
        self.board[(x, y)] = c
    (max_x, max_y) = max(self.board.keys())
    (min_x, min_y) = min(self.board.keys())
    self.min_x = min_x
    self.min_y = min_y
    self.max_x = max_x
    self.max_y = max_y
    print((min_x, min_y))
    print((max_x, max_y))

  def part1(self):
    t = 0
    while t < 10:
      self.update_board()
      print_board(self.board)
      t += 1
    return self.total()

  def part2(self):
    seen_repeat = False
    seen_before = defaultdict(list)
    repeated_times = []
    t = 0
    while len(repeated_times) == 0:
      seen_before[self.position()].append(t)
      repeated_times = [v for v in seen_before.values() if len(v) > 1]
      self.update_board()
      t += 1

    (first, second) = repeated_times[0]
    start_minute = 1000000000 - first
    offset = start_minute % (second - first + 1)
    matching_minute = first + offset

    for (k, v) in seen_before.items():
      if matching_minute in v:
        c = Counter(k)
        return c["|"] * c["#"]

  def total(self):
    c = Counter(self.board.values())
    return c["|"] * c["#"]

  def position(self):
    s = ""
    for y in range(self.max_y + 1):
      for x in range(self.max_x + 1):
        s += self.board[(x, y)]
    return s

  def update_board(self):
    board = self.board.copy()

    for y in range(self.max_y + 1):
      for x in range(self.max_x + 1):
        surrounds = around(x, y, board)
        current = board[(x, y)]
        if current == ".":
          if surrounds["|"] >= 3:
            self.board[(x, y)] = "|"
        elif current == "|":
          if surrounds["#"] >= 3:
            self.board[(x, y)] = "#"
        elif current == "#":
          if not (surrounds["#"] >= 1 and surrounds["|"] >= 1):
            self.board[(x, y)] = "."
        else:
          raise "should not get here"
