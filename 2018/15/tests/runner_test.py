import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

test_input = """
#######
#.G...#
#...EG#
#.#.#G#
#..G#E#
#.....#
#######
"""

t2 = """
#######
#G..#E#
#E#E.E#
#G.##.#
#...#E#
#...E.#
#######
"""

t3 = """
#######
#E..EG#
#.#G.E#
#E.##E#
#G..#.#
#..E#.#
#######
"""

t4 = """
#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######

"""
t5 = """
#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######
"""

t6 = """
#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########
"""

# part 2
t2_1 = """
#######
#.G...#
#...EG#
#.#.#G#
#..G#E#
#.....#
#######
"""

t2_2 = """
#######
#E..EG#
#.#G.E#
#E.##E#
#G..#.#
#..E#.#
#######"""

t2_3="""#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######"""

t2_4="""#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######"""

t2_5 = """#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########"""

t1_sp = """####
##E#
#GG#
####"""

t1_sp2 = """
#####
#GG##
#.###
#..E#
#.#G#
#.E##
#####
"""

class RunnerTest(unittest.TestCase):
  def test_part1(self):
    self.assertEqual(Runner(test_input.strip()).part1(), 27730)
    self.assertEqual(Runner(t2.strip()).part1(), 36334)
    self.assertEqual(Runner(t3.strip()).part1(), 39514)
    self.assertEqual(Runner(t4.strip()).part1(), 27755)
    self.assertEqual(Runner(t5.strip()).part1(), 28944)
    self.assertEqual(Runner(t6.strip()).part1(), 18740)
    self.assertEqual(Runner(t1_sp.strip()).part1(), 67 * 200)
    self.assertEqual(Runner(t1_sp2.strip()).part1(), 71 * 197)

  def test_part2(self):
    self.assertEqual(Runner(t2_1.strip()).part2(), 4988)
    self.assertEqual(Runner(t2_2.strip()).part2(), 31284)
    self.assertEqual(Runner(t2_3.strip()).part2(), 3478)
    self.assertEqual(Runner(t2_4.strip()).part2(), 6474)
    self.assertEqual(Runner(t2_5.strip()).part2(), 1140)

