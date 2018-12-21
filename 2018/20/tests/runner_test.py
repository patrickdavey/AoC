import unittest
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../src')))

from runner import Runner

class RunnerTest(unittest.TestCase):
  def test_mapping(self):
    self.assertEqual(Runner("^WNE$").part1(), 3)
    self.assertEqual(Runner("^ENWWW(NEEE|SSE(EE|N))$").part1(), 10)
    self.assertEqual(Runner("^ENNWSWW(NEWS|)SSSEEN(WNSE|)EE(SWEN|)NNN$").part1(), 18)
    self.assertEqual(Runner("^ESSWWN(E|NNENN(EESS(WNSE|)SSS|WWWSSSSE(SW|NNNE)))$").part1(), 23)
    self.assertEqual(Runner("^WSSEESWWWNW(S|NENNEEEENN(ESSSSW(NWSW|SSEN)|WSWWN(E|WWS(E|SS))))$").part1(), 31)

