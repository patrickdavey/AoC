import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import run


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.3.0

class RunnerTest(unittest.TestCase):
  def test_basic(self):
    string = """abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab"""
    self.assertEqual(run(string), 12)
