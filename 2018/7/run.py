import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner
from runner2 import Runner2

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

# runner = Runner(Input())
# print(runner.part1())

runner = Runner2(Input(), 5, 61)
print(runner.part2())
