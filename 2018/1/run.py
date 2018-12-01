import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import run
from runner import run2

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

print(run(Input()))
print(run2(Input()))
