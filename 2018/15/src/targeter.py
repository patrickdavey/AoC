import itertools
from collections import defaultdict
from print_board import print_board

def flatten(lists):
  return list(itertools.chain(*lists))

def options(vertex, board):
  (x, y) = vertex
  possibilities = []
  if (board[(x, y - 1)] == '.'):
    possibilities.append((x, y - 1))
  if (board[(x - 1, y)] == '.'):
    possibilities.append((x - 1, y))
  if (board[(x + 1, y)] == '.'):
    possibilities.append((x + 1, y))
  if (board[(x, y + 1)] == '.'):
    possibilities.append((x, y + 1))
  return possibilities

def points_reversed(point):
  (x, y) = point
  return (y, x)

def more_points_reversed(path):
  (x1, y1) = path[0]
  (x2, y2) = path[-1]
  return (y2, x2, y1, x1)

def bfs_paths(board, start, goal):
  queue = [(start, [])]

  while queue:
    (vertex, path) = queue.pop(0)
    board[vertex] = "#"

    for possible in options(vertex, board):
      if possible == goal:
        return path + [possible]
      else:
        board[possible] = "#"
        queue.append((possible, path + [possible]))

class Targeter:
  def __init__(self, state):
    self.state = state

  def best(self, attacker, actors):
    board = self.state.board.copy()
    for a in actors:
      board[(a["x"], a["y"])] = a["type"]

    to_check = [options((a["x"], a["y"]), board) for a in actors if a["type"] != attacker["type"] and a["id"] != attacker["id"] ]
    to_check = flatten(to_check)
    to_check.sort(key=points_reversed)

    paths = [bfs_paths(board.copy(), (attacker["x"], attacker["y"]), target) for target in to_check]
    paths = [p for p in paths if p != None]

    if len(paths) == 0:
      return None

    available = defaultdict(list)
    [available[len(p)].append(p) for p in paths]
    closest = available[min(available.keys())]
    closest.sort(key=more_points_reversed)
    return { "action": "move", "location": closest[0][0] }
