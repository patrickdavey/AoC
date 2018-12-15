def print_board(state):
  board = state.board.copy()
  for a in state.actors:
    board[(a["x"], a["y"])] = a["type"]

  (max_x, max_y) = max(board.keys())
  print("")
  for y in range(max_y + 1):
    s = ""
    for x in range(max_x + 1):
        s += board[(x, y)]
    print(s)

