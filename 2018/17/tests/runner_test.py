import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """
x=495, y=2..7
y=7, x=495..501
x=501, y=3..7
x=498, y=2..4
x=506, y=1..2
x=498, y=10..13
x=504, y=10..13
y=13, x=498..504
"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    (total, standing) = Runner(test_input.strip()).part1()
    self.assertEqual(total, 57)
    self.assertEqual(standing, 29)
