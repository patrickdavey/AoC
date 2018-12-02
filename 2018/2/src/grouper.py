from collections import Counter

def group_count(string):
  cnt = Counter(string)

  twos = 1 if 2 in cnt.values() else 0
  threes = 1 if 3 in cnt.values() else 0
  return (twos, threes)

