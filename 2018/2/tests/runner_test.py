import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import run
from runner import run2


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.3.0

class RunnerTest(unittest.TestCase):
  def test_part0(self):
    string = """abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab"""
    self.assertEqual(run(string), 12)

  def test_part1(self):
    string = """abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz"""
    self.assertEqual(run2(string), "fgij")
