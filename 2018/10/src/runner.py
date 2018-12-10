import re;
import math

def extract_ints(a_string):
  return tuple(map(int, re.findall(r'-?\d+', a_string)))

class Runner():
  def __init__(self, raw):
    lines = [line.strip() for line in raw.strip().splitlines()]
    self.stars = [extract_ints(line) for line in lines]

  def part1(self):
    self.print_board(self.writing_time())
    return True

  def print_board(self, time):
    min_x = min([x + (vx * time) for (x,y,vx,vy) in self.stars])
    max_x = max([x + (vx * time) for (x,y,vx,vy) in self.stars])
    min_y = min([y + (vy * time) for (x,y,vx,vy) in self.stars])
    max_y = max([y + (vy * time) for (x,y,vx,vy) in self.stars])

    star_positions = [(x + (vx * time), y + (vy * time)) for (x, y, vx, vy) in self.stars]
    for y in range(min_y - 1, max_y + 1):
      line = ""
      for x in range(min_x - 1, max_x + 1):
        if (x,y) in star_positions:
          line += "#"
        else:
          line += "."
      print(line)

  def writing_time(self):
    time = 0
    smallest_area = math.inf

    while time < 20000:
      min_x = min([x + (vx * time) for (x,y,vx,vy) in self.stars])
      max_x = max([x + (vx * time) for (x,y,vx,vy) in self.stars])
      min_y = min([y + (vy * time) for (x,y,vx,vy) in self.stars])
      max_y = max([y + (vy * time) for (x,y,vx,vy) in self.stars])

      area = (max_x - min_x) * (max_y - min_y)

      if area < smallest_area:
        smallest_area = area
      else:
        return time - 1 # we've just started growing again, so one less than current

      time += 1
