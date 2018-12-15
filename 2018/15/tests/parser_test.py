import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from parser import Parser

test_input = """
#######
#E..G.#
#...#.#
#.G.#G#
#######
"""

class ParserTest(unittest.TestCase):
  def test_part1(self):
    parser = Parser(test_input.strip())
    parser.parse()
    self.assertEqual(parser.board[(0,0)], '#')
    self.assertEqual(parser.board[(1,1)], '.')
    self.assertTrue({"x": 1, "y": 1, "id": 1, "type": "E", "hit_points": 200} in parser.actors)
