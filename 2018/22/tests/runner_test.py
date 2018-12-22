import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_find_person(self):
    runner = Runner(510, (10,10))
    self.assertEqual(runner.part1(), 114)
    self.assertEqual(runner.part2(), 45)
