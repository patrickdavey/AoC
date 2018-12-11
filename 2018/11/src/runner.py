import numpy
import math

class Runner():
  def __init__(self, grid_serial_number):
    self.grid_serial_number = grid_serial_number
    self.grid = numpy.fromfunction(self.power_at, (300, 300))

  def power_at(self, x, y):
    rack_id = x + 10
    power_level = rack_id * (y)
    power_level += self.grid_serial_number
    power_level = power_level * rack_id
    return (power_level // 100 % 10) - 5

  def part1(self):
    return self.best_for_square_size(3)

  def part2(self, size = 3):
    grid = numpy.fromfunction(self.power_at, (300, 300))
    best_score = 0
    result = None
    for square_size in range(1, 300):
      (x, y, score) = self.best_for_square_size(square_size)
      if (score > best_score):
        best_score = score
        result = (x, y, square_size)
        print(result)

    return result

  def best_for_square_size(self, square_size):
    best_score = -math.inf
    for x in range(300 - square_size):
      for y in range(300 - square_size):
        slice_score = self.grid[x:x+square_size, y:y+square_size].sum()
        if slice_score > best_score:
          result = (x, y, slice_score)
          best_score = slice_score
    return result
