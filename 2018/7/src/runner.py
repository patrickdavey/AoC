import re
from collections import defaultdict

class Runner():
  INSTRUCTION_MATCHER = "Step (?P<prerequisite>[A-Z]) must be finished before step (?P<step>[A-Z])"
  def __init__(self, raw):
    self.dependencies = defaultdict(list)
    prerequisites = set()
    steps = set()
    for line in raw.splitlines():
      instruction  = re.search(self.INSTRUCTION_MATCHER, line).groupdict()
      prerequisites.add(instruction["prerequisite"])
      steps.add(instruction["step"])

      self.dependencies[instruction["step"]].append(instruction["prerequisite"])
    no_dependencies =  sorted(list(prerequisites.difference(steps)))
    self.steps_taken = []
    for extra in no_dependencies:
      self.dependencies[extra] = []

  def part1(self):
    while True:
      to_add = self.next_step()
      if to_add == True:
        return ''.join(self.steps_taken)

      self.steps_taken.append(to_add)
      self.mark_completed_dependencies()
      self.dependencies.pop(to_add, None)

  def mark_completed_dependencies(self):
    for key, value in self.dependencies.items():
      self.dependencies[key] = [v for v in value if v not in self.steps_taken]

  def next_step(self):
    if all(v == [] for k, v in self.dependencies.items()):
      self.steps_taken.append(list(self.dependencies.keys())[0])
      return True

    possible = [k for k, v in self.dependencies.items() if v == []]
    return sorted(possible)[0]
