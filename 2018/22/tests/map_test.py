import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """.=.|=.|.|=.
.|=|=|||..|
.==|....||=
=.|....|.==
=|..==...=.
=||.=.=||=|
|.=.===|||.
|..==||=.|=
.=..===..=|
.======|||=
.===|=|===."""

def printed_map(board):
  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())
  s = ""
  for y in range(11):
    for x in range(11):
      if (x, y) in board:
        s += board[(x, y)]
      else:
        s += " "
    s +="\n"
  return s

class MapTest(unittest.TestCase):
  def test_part1(self):
    runner = Runner(510, (10, 10))
    runner.part1()
    print(printed_map(runner.terrain))
    self.assertEqual(printed_map(runner.terrain).strip(), test_input.strip())
