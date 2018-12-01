import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from grouper import group_count


# Tests adapted from `problem-specifications//canonical-data.json` @ v1.3.0

class GrouperTest(unittest.TestCase):
  def test_basic(self):
    self.assertEqual(group_count("abcdef"), (0,0))
    self.assertEqual(group_count("bababc"), (1,1))
    self.assertEqual(group_count("abbcde"), (1,0))
    self.assertEqual(group_count("abcccd"), (0,1))
    self.assertEqual(group_count("aabcdd"), (1,0))
    self.assertEqual(group_count("abcdee"), (1,0))
    self.assertEqual(group_count("ababab"), (0,1))
