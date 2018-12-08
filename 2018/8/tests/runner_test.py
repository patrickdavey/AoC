import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(test_input.strip()).part1(), 138)

  def test_part2(self):
    self.assertEqual(Runner(test_input.strip()).part2(), 66)
