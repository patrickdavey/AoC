import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from parser import Parser
from run_order import run_order

test_input = """
#######
#E..G.#
#...#.#
#.G.#G#
#######
"""

class RunOrderTest(unittest.TestCase):
  def test_ordering(self):
    parser = Parser(test_input.strip())
    parser.parse()
    order = run_order(parser.actors)
    self.assertEqual(order[0], {"id": 1, "x": 1, "y": 1, "type": "E", "hit_points": 200})
    self.assertEqual(order[1], {"id": 2, "x": 4, "y": 1, "type": "G", "hit_points": 200})
    self.assertEqual(order[2], {"id": 3, "x": 2, "y": 3, "type": "G", "hit_points": 200})
    self.assertEqual(order[3], {"id": 4, "x": 5, "y": 3, "type": "G", "hit_points": 200})
