import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """
.#.#...|#.
.....#|##|
.|..|...#.
..|#.....#
#.#|||#|#|
...#.||...
.|....|...
||...#|.#|
|.||||..|.
...#.|..|.
"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(test_input.strip()).part1(), 1147)

  def test_part2(self):
    self.assertEqual(Runner(test_input.strip()).part2(), True)
