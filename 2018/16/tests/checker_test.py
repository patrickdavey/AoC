import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from checker import Checker
from collections import defaultdict, Counter

test_input = """3 2 1 1
9 2 1 2
3 2 2 1

"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Checker(test_input.strip().splitlines(), defaultdict(set)).matches(), 3)
