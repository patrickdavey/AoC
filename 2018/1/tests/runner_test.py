import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import run
from runner import run2


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.3.0

class RunnerTest(unittest.TestCase):
    def test_part_1(self):
        string = "+1\n+1\n+1"
        self.assertEqual(run(string), 3)
    def test_part_2(self):
        string = "+1\n-2\n+3\n+1"
        self.assertEqual(run2(string), 2)
