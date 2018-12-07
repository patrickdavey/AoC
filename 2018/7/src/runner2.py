import re
from collections import defaultdict, namedtuple

class Runner2():
  INSTRUCTION_MATCHER = "Step (?P<prerequisite>[A-Z]) must be finished before step (?P<step>[A-Z])"
  def __init__(self, raw, number_workers, time_penalty):
    self.workers = [{"minutes": 0, "task": None} for i in range(0, number_workers)]
    self.time_penalty = time_penalty
    self.dependencies = defaultdict(list)
    prerequisites = set()
    steps = set()
    for line in raw.splitlines():
      instruction  = re.search(self.INSTRUCTION_MATCHER, line).groupdict()
      prerequisites.add(instruction["prerequisite"])
      steps.add(instruction["step"])

      self.dependencies[instruction["step"]].append(instruction["prerequisite"])
    no_dependencies =  sorted(list(prerequisites.difference(steps)))
    self.target_length = len(prerequisites.union(steps))
    for extra in no_dependencies:
      self.dependencies[extra] = []
    self.steps_taken = []

  def part2(self):
    seconds_used = 0
    while len(self.steps_taken) < self.target_length:
      self.freeup_workers()
      self.use_available_workers()
      seconds_used += 1

    return seconds_used - 1

  def freeup_workers(self):
    for worker in self.workers:
      worker["minutes"] -= 1

    for worker in self.workers:
      if worker["minutes"] <= 0 and worker["task"] != None:
        self.steps_taken.append(worker["task"])
        self.dependencies.pop(worker["task"], None)
        worker["task"] = None
        self.mark_completed_dependencies()


  def use_available_workers(self):
    for worker in (y for y in self.workers if y["minutes"] <= 0):
      step = self.next_step()
      if step:
        worker["task"] = step
        worker["minutes"] = ord(step) - ord("A") + self.time_penalty
      else:
        return

  def mark_completed_dependencies(self):
    for key, value in self.dependencies.items():
      self.dependencies[key] = [v for v in value if v not in self.steps_taken]

  def in_process(self):
    return [worker["task"] for worker in (w for w in self.workers if w["task"] != None )]

  def next_step(self):
    possible = [k for k, v in self.dependencies.items() if v == [] and k not in self.in_process()]
    if len(possible) == 0:
      return None
    else:
      return sorted(possible)[0]
