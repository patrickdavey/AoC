import re;
from collections import defaultdict
from guard import Guard

class Runner:
  STARTING_SHIFT = 0
  FALLING_ALSEEP = 1
  WAKING_UP = 2
  SHIFT_MATCHER = "(?P<hour>\d\d):(?P<minute>\d\d).*(?P<type>Guard #(?P<id>\d+)|falls|wakes)"

  def __init__(self, raw):
    lines = [line.strip() for line in raw.split("\n")]
    self.schedule = [re.search(self.SHIFT_MATCHER, line).groupdict() for line in lines]
    self.guards = self.calculate_sleeping_patterns()

  def part1(self):
    sleepiest_guard = max(self.guards, key = lambda g: g.total_time_asleep)
    return int(sleepiest_guard.id) * sleepiest_guard.sleepiest_minute()

  def part2(self):
    consistently_asleep_guard = max(self.guards, key = lambda g: g.sleepiest_minute_count())
    return int(consistently_asleep_guard.id) * consistently_asleep_guard.sleepiest_minute()

  def calculate_sleeping_patterns(self):
    guards = {}

    guard_on_duty = None
    for item in self.schedule:
      id = item["id"]
      behavior = self.action(item["type"])
      hour = int(item["hour"])
      minute = int(item["minute"])

      if behavior == self.STARTING_SHIFT:
        if id not in guards: guards[id] = Guard(id)
        guard_on_duty = guards[id]
        guard_on_duty.start_shift(hour, minute)
      elif behavior == self.FALLING_ALSEEP:
        guard_on_duty.falls_asleep(minute)
      elif behavior == self.WAKING_UP:
        guard_on_duty.wakes_up(minute)
    return guards.values()

  def action(self, s):
    if s.startswith("Guard"):
      return self.STARTING_SHIFT
    elif s.startswith("falls"):
      return self.FALLING_ALSEEP
    else:
      return self.WAKING_UP


