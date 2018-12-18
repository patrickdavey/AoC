from PIL import Image

def print_board(board, name = "final"):
  board = board.copy()

  (max_x, max_y) = max(board.keys())
  (min_x, min_y) = min(board.keys())

  # print("")
  # for y in range(min_y, max_y + 1):
  #   s = ""
  #   for x in range(min_x, max_x + 1):
  #     s += board[(x, y)]
  #   print(s)
  # print("")

  im = Image.new("RGB", (max_x, max_y))
  pix = im.load()

  for y in range(0, max_y):
    for x in range(0, max_x):
      if (x, y) not in board:
        pix[x,y] = (255, 255, 255)
      elif board[(x, y)] == ".":
        pix[x,y] = (255, 255, 255)
      elif board[(x, y)] == "#":
        pix[x,y] = (0,0,0)
      elif board[(x, y)] == "~":
        pix[x,y] = (0, 255, 255)
      elif board[(x, y)] == "|":
        pix[x,y] = (255, 0, 0)
  im.save(str(name) + ".png", "PNG")
