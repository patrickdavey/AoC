from grouper import group_count

def run(input):
  ids = [line.strip() for line in input.splitlines()]
  counts = [group_count(id) for id in ids]
  twos = 0
  threes = 0

  for (two, three) in counts:
    twos += two
    threes += three
  return twos * threes

def find_match(letters):
  for string in letters:
    for other in letters:
      diff = 0
      for first, second in zip(string, other):
        if first != second:
          diff += 1

      if diff == 1:
        return(string, other)

def run2(input):
  ids = [line.strip() for line in input.splitlines()]
  letters = [[char for char in line] for line in ids]

  (a, b) = find_match(letters)
  acc = []
  for first, second in zip(a, b):
    if first == second:
      acc.append(first)
  return "".join(acc)
