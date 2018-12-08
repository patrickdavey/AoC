import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    input = [int(x) for x in test_input.split()]
    self.assertEqual(Runner().part1(input), 138)

  def test_part2(self):
    input = [int(x) for x in test_input.split()]
    self.assertEqual(Runner().part2(input), 66)
