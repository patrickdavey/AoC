import re
from print_board import print_board

def extract_ints(a_string):
    return tuple(map(int, re.findall(r'-?\d+', a_string)))

class Runner():
  def __init__(self, raw):
    self.ground = {}
    self.ground[(500, 0)] = "|"
    for line in raw.splitlines():
      (a, b, c) = extract_ints(line)
      if line[0] == 'x':
        for y in range(b, c + 1):
          self.ground[(a, y)] = "#"
      else:
        for x in range(b, c + 1):
          self.ground[(x, a)] = "#"

    min_x = min([x for (x, y) in self.ground.keys()])
    max_x = max([x for (x, y) in self.ground.keys()])
    min_y = min([y for (x, y) in self.ground.keys()])
    max_y = max([y for (x, y) in self.ground.keys()])
    self.max_y = max_y
    self.max_x = max_x
    self.min_x = min_x
    self.min_y = 1000
    for y in range(min_y, max_y + 1):
      for x in range(min_x, max_x + 1):
        if (x, y) not in self.ground:
          self.ground[(x, y)] = "."
        else:
          if y < self.min_y and  y > 0:
            self.min_y = y


  def part1(self):
    finished = False
    t = 0
    while True:
      init = self.ground.copy()
      self.add_water_at_bounds()

      if init == self.ground:
        print_board(self.ground)
        return self.total()
      t += 1

  def part2(self):
    return True

  def add_water_at_bounds(self):
    wet = (l for l, v in self.ground.items() if v == "|")
    for (x, y) in wet:
      if y + 1 > self.max_y:
        break
      if x + 1 > self.max_x:
        self.enlarge_board(x + 1)
        return
      elif x - 1 < self.min_x:
        self.enlarge_board(x - 1)
        return
      if self.ground[(x, y + 1)] == ".":
        self.ground[(x, y + 1)] = "|"
      if self.ground[(x, y + 1)] == "#" or self.ground[(x, y + 1)] == "~":
        # we're on solid ground
        if self.contained_at_both_sides(x, y):
          self.ground[(x, y)] = "~"
        else:
          if self.ground[(x + 1, y)] != "#":
            self.ground[(x + 1, y)] = "|"
          if self.ground[(x - 1, y)] != "#":
            self.ground[(x - 1, y)] = "|"

  def contained_at_both_sides(self, x, y):
    ok_left = False
    x_check = x - 1
    while ok_left == False:
      if self.ground[(x_check, y)] == "#" or self.ground[(x_check, y)] == "~":
        ok_left = True
      elif self.ground[(x_check, y)] == "|":
        x_check -= 1
      else:
        return False

    ok_right = False
    x_check = x + 1
    while ok_right == False:
      if self.ground[(x_check, y)] == "#" or self.ground[(x_check, y)] == "~":
        return True
      elif self.ground[(x_check, y)] == "|":
        x_check += 1
      else:
        return False

  def enlarge_board(self, x):
    for y in range(0, self.max_y + 1):
      self.ground[(x, y)] = "."

    if x < self.min_x:
      self.min_x = x
    else:
      self.max_x = x

  def total(self):
    total_standing = 0
    total_moving = 0
    for y in range(self.min_y, self.max_y + 1):
      for x in range(self.min_x, self.max_x + 1):
        if self.ground[(x, y)] == "~":
          total_standing += 1
        if self.ground[(x, y)] == "|":
          total_moving += 1
    return (total_standing + total_moving, total_standing)
