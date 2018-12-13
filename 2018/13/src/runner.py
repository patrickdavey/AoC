from collections import Counter

class Runner():
  def __init__(self, raw):
    self.board = {}
    for (y, line) in enumerate(raw.splitlines()):
      for (x, c) in enumerate(line):
        self.board[(x, y)] = c

    self.setup_carts()

  def part1(self):
    while True:
      result = self.tick()
      if result:
        return result

  def part2(self):
    while True:
      result = self.tick(True)
      if len(self.carts) == 1:
        return (self.carts[0].x, self.carts[0].y)

  def setup_carts(self):
    carts = []
    for (x, y), v in self.board.items():
      if v == 'v':
        carts.append(Cart(self.board, x, y, 0, 1))
        self.board[(x, y)] = "|"
      elif v == '^':
        carts.append(Cart(self.board, x, y, 0, -1))
        self.board[(x, y)] = "|"
      elif v == '<':
        carts.append(Cart(self.board, x, y, -1, 0))
        self.board[(x, y)] = "-"
      elif v == '>':
        carts.append(Cart(self.board, x, y, 1, 0))
        self.board[(x, y)] = "-"
    self.carts = carts

  def print_board(self):
    (max_x, max_y) = max(self.board.keys())
    current_positions = self.cart_positions()
    print("")
    for y in range(max_y + 1):
      s = ""
      for x in range(max_x + 1):
        if (x, y) in current_positions:
          s += current_positions[(x, y)]
        else:
          s += self.board[(x, y)]
      print(s)

  def cart_positions(self):
    positions = {}
    for cart in self.carts:
      positions[(cart.x, cart.y)] = cart.travelling()
    return positions

  def sort_carts(self):
    self.carts.sort(key=lambda cart: (cart.x, cart.y))

  def tick(self, remove = False):
    self.sort_carts()

    for cart in self.carts:
      cart.tick()
      # check collision
      location = self.collision()
      if self.collision():
        if remove:
          self.carts = [cart for cart in self.carts if (cart.x, cart.y) != location]
        else:
          return location;

  def collision(self):
    counter = Counter()
    for cart in self.carts:
      counter[(cart.x, cart.y)] += 1
    (location, count) = counter.most_common()[0]

    if count > 1:
      return location;
    return None




class Cart:
  def __repr__(self):
    return f"(Cart({self.x}, {self.y}, {self.vx}, {self.vy})"
  def __str__(self):
    return f"(Cart({self.x}, {self.y}, {self.vx}, {self.vy})"
  def __init__(self, board, x, y, vx, vy):
    self.x = x
    self.y = y
    self.vx = vx
    self.vy = vy
    self.board = board
    self.turning = 0

  def travelling(self):
    if ((0, 1) == (self.vx, self.vy)):
      return "v"
    if ((0, -1) == (self.vx, self.vy)):
      return "^"
    if ((1, 0) == (self.vx, self.vy)):
      return ">"
    if ((-1, 0) == (self.vx, self.vy)):
      return "<"
    raise "invalid direction"

  def tick(self):
    self.x = self.x + self.vx
    self.y = self.y + self.vy

    track = self.board[(self.x, self.y)]

    if (track == "-" or track == "|"):
      return
    if (track == '/'):
      if self.travelling() == "<":
        self.face_down()
        return
      elif (self.travelling() == ">"):
        self.face_up()
        return
      elif (self.travelling() == "^"):
        self.face_right()
        return
      elif (self.travelling() == "v"):
        self.face_left()
        return

    if (track == '\\'):
      if self.travelling() == ">":
        self.face_down()
        return
      elif self.travelling() == "<":
        self.face_up()
        return
      elif (self.travelling() == "^"):
        self.face_left()
        return
      elif (self.travelling() == "v"):
        self.face_right()
        return

    if (track == "+"):
      if self.turning == 0:
        if self.travelling() == "^":
          self.face_left()
        elif self.travelling() == "v":
          self.face_right()
        elif self.travelling() == "<":
          self.face_down()
        elif self.travelling() == ">":
          self.face_up()
        # turn left
      elif self.turning == 1:
        pass
      elif self.turning == 2:
        if self.travelling() == "^":
          self.face_right()
        elif self.travelling() == "v":
          self.face_left()
        elif self.travelling() == "<":
          self.face_up()
        elif self.travelling() == ">":
          self.face_down()

      self.turning = (self.turning + 1) % 3

  def face_left(self):
    self.vx = -1
    self.vy = 0
  def face_right(self):
    self.vx = 1
    self.vy = 0
  def face_up(self):
    self.vx = 0
    self.vy = -1
  def face_down(self):
    self.vx = 0
    self.vy = 1
