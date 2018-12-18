import numpy as np
import random
from PIL import Image
from collections import defaultdict, namedtuple, Counter

Point = namedtuple("Point", "x, y, name, r, g, b")
class Runner():
  def __init__(self, raw):
    self.raw = raw
    self.points = []
    for idx, line in enumerate(raw.splitlines()):
      self.points.append(Point(*(map(int, line.strip().split(","))), chr(97 + idx), random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))

    self.max_x = max(point.x for point in self.points)
    self.max_y = max(point.y for point in self.points)
    self.grid = {}


  def part1(self):
    self.find_closest_points()
    return self.biggest_gap()

  def part2(self, target):
    self.target = target
    self.find_total_within_target()
    return list(self.grid.values()).count("#")

  def manhattan_distance(self, point_a, point_b):
    (x1, y1) = point_a
    (x2, y2) = point_b
    return abs(x1 - x2) + abs(y1 - y2)

  def closest_point_for(self, x, y):
    distances = defaultdict(list)
    for point in self.points:
      distances[self.manhattan_distance((point.x, point.y), (x, y))].append(point.name)

    if len(distances[min(distances)]) == 1:
      return distances[min(distances)][0];
    else:
      return "."

  def find_closest_points(self):
    for x in range(0, self.max_x):
      for y in range(0, self.max_y):
        self.grid[(x, y)] = self.closest_point_for(x, y)

  def print_grid(self):
    im = Image.new("RGB", (self.max_x, self.max_y))
    pix = im.load()

    colors = {}
    colors["."] = (255, 255, 255)
    for point in self.points:
      colors[point.name] = (point.r, point.g, point.b)

    for y in range(0, self.max_y):
      for x in range(0, self.max_x):
        name = self.grid[(x, y)]
        pix[x,y] = colors[name]

    im.save("test.png", "PNG")


  def touching_edges(self):
    edges = set()
    for x in range(0, self.max_x):
      edges.add(self.grid[(x, 0)])
      edges.add(self.grid[(x, self.max_y - 1)])
    for y in range(0, self.max_y):
      edges.add(self.grid[(0, y)])
      edges.add(self.grid[(self.max_x - 1, y)])
    return edges

  def biggest_gap(self):
    counter = Counter()
    for x in range(0, self.max_x):
      for y in range(0, self.max_y):
        counter[self.grid[(x, y)]] += 1

    edges = self.touching_edges()
    possible = [(key, value) for (key, value) in counter.most_common() if key not in edges]
    (_key, size) = possible[0]
    return size;

  def find_total_within_target(self):
    for x in range(0, self.max_x):
      for y in range(0, self.max_y):
        self.grid[(x, y)] = self.total_for(x, y)

  def total_for(self, x, y):
    total = 0
    for point in self.points:
      total += self.manhattan_distance((point.x, point.y), (x, y))

    return "#" if total < self.target else "."
