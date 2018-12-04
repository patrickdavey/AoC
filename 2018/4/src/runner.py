import re;
from collections import defaultdict
from guard import Guard

STARTING_SHIFT = 0
FALLING_ALSEEP = 1
WAKING_UP = 2

def action(s):
  if s.startswith("Guard"):
    return STARTING_SHIFT
  elif s.startswith("falls"):
    return FALLING_ALSEEP
  else:
    return WAKING_UP


SHIFT_MATCHER = "(?P<hour>\d\d):(?P<minute>\d\d).*(?P<type>Guard #(?P<id>\d+)|falls|wakes)"
def run(raw):
  d = {}
  lines = [line.strip() for line in raw.split("\n")]
  schedule = [re.search(SHIFT_MATCHER, line).groupdict() for line in lines]

  guard_on_duty = None
  for item in schedule:
    id = item["id"]
    behavior = action(item["type"])
    hour = int(item["hour"])
    minute = int(item["minute"])

    if behavior == STARTING_SHIFT:
      if id not in d: d[id] = Guard(id)
      guard_on_duty = d[id]
      guard_on_duty.start_shift(hour, minute)
    elif behavior == FALLING_ALSEEP:
      guard_on_duty.falls_asleep(minute)
    elif behavior == WAKING_UP:
      guard_on_duty.wakes_up(minute)


  sleepiest_guard = max(d.values(), key = lambda g: g.total_time_asleep)

  return int(sleepiest_guard.id) * sleepiest_guard.sleepiest_minute()
