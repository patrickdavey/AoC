import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """
foo
"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(9, 25).part1(), 32)
    self.assertEqual(Runner(10, 1618).part1(), 8317)
    self.assertEqual(Runner(13, 7999).part1(), 146373)
    self.assertEqual(Runner(17, 1104).part1(), 2764)
    self.assertEqual(Runner(21, 6111).part1(), 54718)
    self.assertEqual(Runner(30, 5807).part1(), 37305)

  # def test_part2(self):
  #   self.assertEqual(Runner(test_input.strip()).part2(), True)
