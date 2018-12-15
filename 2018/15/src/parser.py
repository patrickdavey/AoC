class Parser():
  def __init__(self, raw):
    self.raw = raw
    self.board = {}
    self.actors = []

  def parse(self):
    id = 1
    for y, line in enumerate(self.raw.strip().splitlines()):
      for x, c in enumerate(line):
        if c == "#":
          self.board[(x, y)] = "#"
        elif c == "G":
          #technically it's going to be an open square
          self.board[(x, y)] = "."
          self.actors.append({"id": id, "x":x, "y": y, "type": "G", "hit_points": 200})
          id += 1
        elif c == "E":
          #technically it's going to be an open square
          self.board[(x, y)] = "."
          self.actors.append({"id": id, "x":x, "y": y, "type": "E", "hit_points": 200})
          id += 1
        else:
          self.board[(x, y)] = "."
