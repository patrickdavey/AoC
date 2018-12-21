import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

sample_1 = """#####
#.|.#
#-###
#.|X#
#####"""

sample_2 = """#########
#.|.|.|.#
#-#######
#.|.|.|.#
#-#####-#
#.#.#X|.#
#-#-#####
#.|.|.|.#
#########"""

sample_3="""###########
#.|.#.|.#.#
#-###-#-#-#
#.|.|.#.#.#
#-#####-#-#
#.#.#X|.#.#
#-#-#####-#
#.#.|.|.|.#
#-###-###-#
#.|.|.#.|.#
###########"""

sample_4="""#############
#.|.|.|.|.|.#
#-#####-###-#
#.#.|.#.#.#.#
#-#-###-#-#-#
#.#.#.|.#.|.#
#-#-#-#####-#
#.#.#.#X|.#.#
#-#-#-###-#-#
#.|.#.|.#.#.#
###-#-###-#-#
#.|.#.|.|.#.#
#############"""

sample_5="""###############
#.|.|.|.#.|.|.#
#-###-###-#-#-#
#.|.#.|.|.#.#.#
#-#########-#-#
#.#.|.|.|.|.#.#
#-#-#########-#
#.#.#.|X#.|.#.#
###-#-###-#-#-#
#.|.#.#.|.#.|.#
#-###-#####-###
#.|.#.|.|.#.#.#
#-#-#####-#-#-#
#.#.|.|.|.#.|.#
###############"""

def printed_map(board):
  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())
  board[(0,0)] = "X"
  s = ""
  for y in range(min_y, max_y + 1):
    for x in range(min_x, max_x + 1):
      if (x, y) in board:
        s += board[(x, y)]
      else:
        s += " "
    s +="\n"

  return s.strip()

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_mapping(self):
    runner = Runner("^WNE$")
    runner.part1()
    self.assertEqual(printed_map(runner.board), sample_1.strip())

    runner = Runner("^ENWWW(NEEE|SSE(EE|N))$")
    runner.part1()
    self.assertEqual(printed_map(runner.board), sample_2.strip())

    runner = Runner("^ENNWSWW(NEWS|)SSSEEN(WNSE|)EE(SWEN|)NNN$")
    runner.part1()
    self.assertEqual(printed_map(runner.board), sample_3.strip())

    runner = Runner("^ESSWWN(E|NNENN(EESS(WNSE|)SSS|WWWSSSSE(SW|NNNE)))$")
    runner.part1()
    self.assertEqual(printed_map(runner.board), sample_4.strip())

    runner = Runner("^WSSEESWWWNW(S|NENNEEEENN(ESSSSW(NWSW|SSEN)|WSWWN(E|WWS(E|SS))))$")
    runner.part1()
    self.assertEqual(printed_map(runner.board), sample_5.strip())

