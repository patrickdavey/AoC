from collections import namedtuple
import re

def extract_ints(a_string):
    return tuple(map(int, re.findall(r'-?\d+', a_string)))

def manhattan_distance(point_a, point_b):
  return abs(point_a["x"] - point_b["x"]) + abs(point_a["y"] - point_b["y"]) + abs(point_a["z"] - point_b["z"]) + abs(point_a["t"] - point_b["t"])

class Runner():
  def __init__(self, raw):
    self.constallations = []
    for i, line in enumerate(raw.strip().splitlines()):
      (x, y, z, t) = extract_ints(line)
      self.constallations.append({"x": x, "y": y, "z": z, "t": t, "g": i, "c": False})

  def part1(self):
    for star in self.constallations:
      for other in self.constallations:
        if manhattan_distance(star, other) <= 3:
          new_group_id = min(star["g"], other["g"])
          for to_update in self.constallations:
            if to_update["g"] in [star["g"], other["g"]]:
              to_update["g"] = new_group_id

    print("")
    print("")
    print("")
    print("")
    print(self.constallations)
    groups = [s["g"] for s in self.constallations]
    groups = set(groups)
    return len(groups)

  def part2(self):
    return True
