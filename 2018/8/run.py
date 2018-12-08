import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

runner = Runner()
input = [int(x) for x in Input().split()]
print(runner.part1(input))
input = [int(x) for x in Input().split()]
print(runner.part2(input))
