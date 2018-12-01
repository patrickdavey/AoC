import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import run

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

print(run(Input()))
