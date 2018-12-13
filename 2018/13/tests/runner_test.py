import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

def test_input():
  filename = './sample.txt'
  return open(filename).read()

def test2_input():
  filename = './sample2.txt'
  return open(filename).read()

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(test_input()).part1(), (7,3))

  def test_part2(self):
    self.assertEqual(Runner(test2_input()).part2(), (6, 4))
