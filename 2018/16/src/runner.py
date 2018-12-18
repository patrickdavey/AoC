from checker import Checker
from machine import Machine
from collections import defaultdict, Counter

class Runner():
  def __init__(self, raw):
    self.lines = raw.splitlines()
    self.possibles = defaultdict(set)
    self.instructions = {}

  def part1(self):
    foo = [Checker(self.lines[i:i + 3], self.possibles).matches() for i in range(0, len(self.lines), 3)]
    while(len(self.instructions.keys()) < 16):
      for i in range(16):
        if self.possibles[i] and len(self.possibles[i]) == 1:
          self.instructions[i] = self.possibles[i].pop()
          for j in range(16):
            self.possibles[j].discard(self.instructions[i])

    return sum([1 for a in foo if a >= 3])

  def part2(self, code):
    return Machine(code, self.instructions).execute()
