from collections import defaultdict, namedtuple
Rule = namedtuple("Rule", "a, b, c, d, e, output")

class Runner():
  def __init__(self, raw):
    lines = raw.splitlines()
    self.plants = defaultdict(int)
    initial_state = lines[0].replace("initial state: ", "").replace(".", "0").replace("#", "1")
    for i in range(0, len(initial_state)):
      self.plants[i] = int(initial_state[i])

    rules = []
    for i in range(2, len(lines)):
      numbers = map(int, lines[i].replace(" => ", "").replace(".", "0").replace("#", "1"))
      rules.append(Rule(*numbers))
    self.rules = rules


  def part1(self):
    last = 0
    for i in range(50000000000):
      if i % 10 == 0:
        new_score = self.calculate_score()
        print(i, new_score, new_score - last)
        last = new_score

      self.apply_rules()

    return self.calculate_score()

  def print_plants(self):
    min_value = min(self.plants.keys())
    max_value = max(self.plants.keys())

    s = ""
    for i in range(min_value, max_value + 1):
      s += "." if self.plants[i] == 0 else "#"
    print(s)


  def apply_rules(self):
    min_value = min(self.plants.keys())
    max_value = max(self.plants.keys())

    s = ""

    next_state = defaultdict(int)
    for i in range(min_value - 5, max_value + 5):
      for (a, b, c, d, e, output) in self.rules:
        if self.plants[i] == a and self.plants[i + 1] == b and self.plants[i + 2] == c and self.plants[i + 3] == d and self.plants[i + 4] == e:
          next_state[i + 2] = output

    self.plants = next_state

  def calculate_score(self):
    min_value = min(self.plants.keys())
    max_value = max(self.plants.keys())

    total = 0
    for i in range(min_value, max_value + 1):
      if self.plants[i] == 1:
        total += i

    return total
