def print_board(board):
  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())
  board[(0,0)] = "X"
  print("")
  for y in range(min_y, max_y + 1):
    s = ""
    for x in range(min_x, max_x + 1):
      if (x, y) in board:
        s += board[(x, y)]
      else:
        s += " "

    print(s)

