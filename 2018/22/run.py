import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

runner = Runner(3879, (8, 713))
print(runner.part1())
print(runner.part2())
