import unittest
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(8).power_at(3, 5), 4)
    self.assertEqual(Runner(57).power_at(122, 79), -5)
    self.assertEqual(Runner(39).power_at(217, 196), 0)
    self.assertEqual(Runner(71).power_at(101, 153), 4)

    self.assertEqual(Runner(18).part1(), (33, 45, 29.0))

  def test_part2(self):
    self.assertEqual(Runner(18).part2(), (90,269,16))
