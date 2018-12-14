import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner().part1(9), "5158916779")
    self.assertEqual(Runner().part1(5), "0124515891")
    self.assertEqual(Runner().part1(18), "9251071085")
    self.assertEqual(Runner().part1(2018), "5941429882")

  def test_part2(self):
    self.assertEqual(Runner().part2("51589"), 9)
    self.assertEqual(Runner().part2("01245"), 5)
    self.assertEqual(Runner().part2("92510"), 18)
    self.assertEqual(Runner().part2("59414"), 2018)
