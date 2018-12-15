import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from targeter import Targeter
from parser import Parser
from run_order import run_order

test_input_1 = """
#######
#E..G.#
#...#.#
#.G.#G#
#######
"""

test_input_2 = """
#######
#.E...#
#.....#
#...G.#
#######
"""

class TargeterTest(unittest.TestCase):
  def test_input_1(self):
    state = Parser(test_input_1.strip())
    state.parse()
    actors = run_order(state.actors)
    targeter = Targeter(state)
    self.assertEqual({"action": "move", "location": (2, 1)}, targeter.best(actors[0], actors))

  def test_input_2(self):
    state = Parser(test_input_2.strip())
    state.parse()
    actors = run_order(state.actors)
    targeter = Targeter(state)
    self.assertEqual({"action": "move", "location": (3, 1)}, targeter.best(actors[0], actors))
