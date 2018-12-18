def print_board(board):
  board = board.copy()

  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())

  print("")
  for y in range(min_y, max_y + 1):
    s = ""
    for x in range(min_x, max_x + 1):
      s += board[(x, y)]
    print(s)
  print("")
