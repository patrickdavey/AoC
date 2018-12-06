import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """
    1, 1
    1, 6
    8, 3
    3, 4
    5, 5
    8, 9
"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(test_input.strip()).part1(), 17)

  def test_part2(self):
    self.assertEqual(Runner(test_input.strip()).part2(32), 16)
