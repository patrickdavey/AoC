import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """ dabAcCaCBAcCcaDA """

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner().part1(test_input.strip()), 10 )

  def test_part2(self):
    self.assertEqual(Runner().part2(test_input.strip()), 4 )
