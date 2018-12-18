import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner

def Input():
  filename = './samples.txt'
  return open(filename).read().strip()

def Code():
  filename = './input.txt'
  return open(filename).read().strip()

runner = Runner(Input())
print(runner.part1())
print(runner.part2(Code().splitlines()))
