import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner

def Input():
  filename = './input.txt'
  return open(filename).read().strip()

runner = Runner(Input())
print(runner.part1())

finished = False
amount = 1
while finished == False:
  print("trying:", amount)
  runner = Runner(Input())
  result = runner.part2(amount)
  if result:
    print(result)
    finished = True
  else:
    amount += 1
