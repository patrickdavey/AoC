from collections import Counter
class Guard(object):
  def __init__(self, id):
    self.id = id
    self.total_time_asleep = 0
    self.last_action_minute = 0
    self.times_asleep = Counter()

  def start_shift(self, hour, minute):
    self.last_action_minute = 0
  def falls_asleep(self, minute):
    self.last_action_minute = minute
  def wakes_up(self, minute):
    for time in range(self.last_action_minute, minute):
      self.times_asleep[time] += 1
    self.total_time_asleep += minute - self.last_action_minute

  def sleepiest_minute(self):
    (minute, _count) = self.times_asleep.most_common(1)[0]
    return minute;
