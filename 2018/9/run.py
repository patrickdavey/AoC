import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), './src')))

from runner import Runner

runner = Runner(486, 70833)
print(runner.part1())
# print(runner.part2())
